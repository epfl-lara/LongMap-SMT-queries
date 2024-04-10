; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5694 () Bool)

(assert start!5694)

(declare-fun b_free!1365 () Bool)

(declare-fun b_next!1365 () Bool)

(assert (=> start!5694 (= b_free!1365 (not b_next!1365))))

(declare-fun tp!5735 () Bool)

(declare-fun b_and!2361 () Bool)

(assert (=> start!5694 (= tp!5735 b_and!2361)))

(declare-fun res!24040 () Bool)

(declare-fun e!25534 () Bool)

(assert (=> start!5694 (=> (not res!24040) (not e!25534))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5694 (= res!24040 (validMask!0 mask!853))))

(assert (=> start!5694 e!25534))

(assert (=> start!5694 true))

(assert (=> start!5694 tp!5735))

(declare-fun b!40252 () Bool)

(declare-fun e!25533 () Bool)

(assert (=> b!40252 (= e!25534 (not e!25533))))

(declare-fun res!24042 () Bool)

(assert (=> b!40252 (=> res!24042 e!25533)))

(declare-datatypes ((V!2099 0))(
  ( (V!2100 (val!916 Int)) )
))
(declare-datatypes ((tuple2!1486 0))(
  ( (tuple2!1487 (_1!754 (_ BitVec 64)) (_2!754 V!2099)) )
))
(declare-datatypes ((List!1054 0))(
  ( (Nil!1051) (Cons!1050 (h!1624 tuple2!1486) (t!3909 List!1054)) )
))
(declare-datatypes ((ListLongMap!1063 0))(
  ( (ListLongMap!1064 (toList!547 List!1054)) )
))
(declare-fun lt!15464 () ListLongMap!1063)

(assert (=> b!40252 (= res!24042 (= lt!15464 (ListLongMap!1064 Nil!1051)))))

(declare-datatypes ((array!2595 0))(
  ( (array!2596 (arr!1241 (Array (_ BitVec 32) (_ BitVec 64))) (size!1378 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!630 0))(
  ( (ValueCellFull!630 (v!1994 V!2099)) (EmptyCell!630) )
))
(declare-datatypes ((array!2597 0))(
  ( (array!2598 (arr!1242 (Array (_ BitVec 32) ValueCell!630)) (size!1379 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!240 0))(
  ( (LongMapFixedSize!241 (defaultEntry!1804 Int) (mask!5177 (_ BitVec 32)) (extraKeys!1695 (_ BitVec 32)) (zeroValue!1722 V!2099) (minValue!1722 V!2099) (_size!169 (_ BitVec 32)) (_keys!3293 array!2595) (_values!1787 array!2597) (_vacant!169 (_ BitVec 32))) )
))
(declare-fun lt!15461 () LongMapFixedSize!240)

(declare-fun map!690 (LongMapFixedSize!240) ListLongMap!1063)

(assert (=> b!40252 (= lt!15464 (map!690 lt!15461))))

(declare-fun lt!15466 () array!2595)

(declare-datatypes ((List!1055 0))(
  ( (Nil!1052) (Cons!1051 (h!1625 (_ BitVec 64)) (t!3910 List!1055)) )
))
(declare-fun arrayNoDuplicates!0 (array!2595 (_ BitVec 32) List!1055) Bool)

(assert (=> b!40252 (arrayNoDuplicates!0 lt!15466 #b00000000000000000000000000000000 Nil!1052)))

(declare-datatypes ((Unit!983 0))(
  ( (Unit!984) )
))
(declare-fun lt!15463 () Unit!983)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2595 (_ BitVec 32) (_ BitVec 32) List!1055) Unit!983)

(assert (=> b!40252 (= lt!15463 (lemmaArrayNoDuplicatesInAll0Array!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2595 (_ BitVec 32)) Bool)

(assert (=> b!40252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15466 mask!853)))

(declare-fun lt!15465 () Unit!983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2595 (_ BitVec 32) (_ BitVec 32)) Unit!983)

(assert (=> b!40252 (= lt!15465 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15466 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40252 (= (arrayCountValidKeys!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15462 () Unit!983)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2595 (_ BitVec 32) (_ BitVec 32)) Unit!983)

(assert (=> b!40252 (= lt!15462 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!15467 () V!2099)

(assert (=> b!40252 (= lt!15461 (LongMapFixedSize!241 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!15467 lt!15467 #b00000000000000000000000000000000 lt!15466 (array!2598 ((as const (Array (_ BitVec 32) ValueCell!630)) EmptyCell!630) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!40252 (= lt!15466 (array!2596 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!191 (Int (_ BitVec 64)) V!2099)

(assert (=> b!40252 (= lt!15467 (dynLambda!191 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40253 () Bool)

(declare-fun res!24041 () Bool)

(assert (=> b!40253 (=> res!24041 e!25533)))

(declare-fun isEmpty!230 (List!1054) Bool)

(assert (=> b!40253 (= res!24041 (isEmpty!230 (toList!547 lt!15464)))))

(declare-fun b!40254 () Bool)

(declare-fun valid!119 (LongMapFixedSize!240) Bool)

(assert (=> b!40254 (= e!25533 (valid!119 lt!15461))))

(assert (= (and start!5694 res!24040) b!40252))

(assert (= (and b!40252 (not res!24042)) b!40253))

(assert (= (and b!40253 (not res!24041)) b!40254))

(declare-fun b_lambda!2059 () Bool)

(assert (=> (not b_lambda!2059) (not b!40252)))

(declare-fun t!3908 () Bool)

(declare-fun tb!841 () Bool)

(assert (=> (and start!5694 (= defaultEntry!470 defaultEntry!470) t!3908) tb!841))

(declare-fun result!1439 () Bool)

(declare-fun tp_is_empty!1755 () Bool)

(assert (=> tb!841 (= result!1439 tp_is_empty!1755)))

(assert (=> b!40252 t!3908))

(declare-fun b_and!2363 () Bool)

(assert (= b_and!2361 (and (=> t!3908 result!1439) b_and!2363)))

(declare-fun m!33203 () Bool)

(assert (=> start!5694 m!33203))

(declare-fun m!33205 () Bool)

(assert (=> b!40252 m!33205))

(declare-fun m!33207 () Bool)

(assert (=> b!40252 m!33207))

(declare-fun m!33209 () Bool)

(assert (=> b!40252 m!33209))

(declare-fun m!33211 () Bool)

(assert (=> b!40252 m!33211))

(declare-fun m!33213 () Bool)

(assert (=> b!40252 m!33213))

(declare-fun m!33215 () Bool)

(assert (=> b!40252 m!33215))

(declare-fun m!33217 () Bool)

(assert (=> b!40252 m!33217))

(declare-fun m!33219 () Bool)

(assert (=> b!40252 m!33219))

(declare-fun m!33221 () Bool)

(assert (=> b!40253 m!33221))

(declare-fun m!33223 () Bool)

(assert (=> b!40254 m!33223))

(check-sat (not b!40254) (not b!40252) (not b_lambda!2059) (not b_next!1365) (not b!40253) (not start!5694) tp_is_empty!1755 b_and!2363)
(check-sat b_and!2363 (not b_next!1365))
(get-model)

(declare-fun b_lambda!2067 () Bool)

(assert (= b_lambda!2059 (or (and start!5694 b_free!1365) b_lambda!2067)))

(check-sat (not b!40254) (not b_next!1365) (not b!40253) (not start!5694) (not b!40252) (not b_lambda!2067) tp_is_empty!1755 b_and!2363)
(check-sat b_and!2363 (not b_next!1365))
(get-model)

(declare-fun b!40306 () Bool)

(declare-fun e!25561 () (_ BitVec 32))

(declare-fun call!3104 () (_ BitVec 32))

(assert (=> b!40306 (= e!25561 (bvadd #b00000000000000000000000000000001 call!3104))))

(declare-fun bm!3101 () Bool)

(assert (=> bm!3101 (= call!3104 (arrayCountValidKeys!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40307 () Bool)

(declare-fun e!25560 () (_ BitVec 32))

(assert (=> b!40307 (= e!25560 e!25561)))

(declare-fun c!4904 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!40307 (= c!4904 (validKeyInArray!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun b!40308 () Bool)

(assert (=> b!40308 (= e!25561 call!3104)))

(declare-fun d!6983 () Bool)

(declare-fun lt!15503 () (_ BitVec 32))

(assert (=> d!6983 (and (bvsge lt!15503 #b00000000000000000000000000000000) (bvsle lt!15503 (bvsub (size!1378 lt!15466) #b00000000000000000000000000000000)))))

(assert (=> d!6983 (= lt!15503 e!25560)))

(declare-fun c!4903 () Bool)

(assert (=> d!6983 (= c!4903 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6983 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1378 lt!15466)))))

(assert (=> d!6983 (= (arrayCountValidKeys!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15503)))

(declare-fun b!40309 () Bool)

(assert (=> b!40309 (= e!25560 #b00000000000000000000000000000000)))

(assert (= (and d!6983 c!4903) b!40309))

(assert (= (and d!6983 (not c!4903)) b!40307))

(assert (= (and b!40307 c!4904) b!40306))

(assert (= (and b!40307 (not c!4904)) b!40308))

(assert (= (or b!40306 b!40308) bm!3101))

(declare-fun m!33265 () Bool)

(assert (=> bm!3101 m!33265))

(declare-fun m!33269 () Bool)

(assert (=> b!40307 m!33269))

(assert (=> b!40307 m!33269))

(declare-fun m!33273 () Bool)

(assert (=> b!40307 m!33273))

(assert (=> b!40252 d!6983))

(declare-fun d!6989 () Bool)

(assert (=> d!6989 (arrayNoDuplicates!0 lt!15466 #b00000000000000000000000000000000 Nil!1052)))

(declare-fun lt!15506 () Unit!983)

(declare-fun choose!111 (array!2595 (_ BitVec 32) (_ BitVec 32) List!1055) Unit!983)

(assert (=> d!6989 (= lt!15506 (choose!111 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1052))))

(assert (=> d!6989 (= (size!1378 lt!15466) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6989 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1052) lt!15506)))

(declare-fun bs!1694 () Bool)

(assert (= bs!1694 d!6989))

(assert (=> bs!1694 m!33213))

(declare-fun m!33283 () Bool)

(assert (=> bs!1694 m!33283))

(assert (=> b!40252 d!6989))

(declare-fun b!40343 () Bool)

(declare-fun e!25588 () Bool)

(declare-fun call!3112 () Bool)

(assert (=> b!40343 (= e!25588 call!3112)))

(declare-fun b!40344 () Bool)

(declare-fun e!25589 () Bool)

(declare-fun contains!512 (List!1055 (_ BitVec 64)) Bool)

(assert (=> b!40344 (= e!25589 (contains!512 Nil!1052 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun b!40345 () Bool)

(declare-fun e!25587 () Bool)

(assert (=> b!40345 (= e!25587 e!25588)))

(declare-fun c!4914 () Bool)

(assert (=> b!40345 (= c!4914 (validKeyInArray!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun b!40346 () Bool)

(assert (=> b!40346 (= e!25588 call!3112)))

(declare-fun b!40347 () Bool)

(declare-fun e!25586 () Bool)

(assert (=> b!40347 (= e!25586 e!25587)))

(declare-fun res!24092 () Bool)

(assert (=> b!40347 (=> (not res!24092) (not e!25587))))

(assert (=> b!40347 (= res!24092 (not e!25589))))

(declare-fun res!24091 () Bool)

(assert (=> b!40347 (=> (not res!24091) (not e!25589))))

(assert (=> b!40347 (= res!24091 (validKeyInArray!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun d!6993 () Bool)

(declare-fun res!24093 () Bool)

(assert (=> d!6993 (=> res!24093 e!25586)))

(assert (=> d!6993 (= res!24093 (bvsge #b00000000000000000000000000000000 (size!1378 lt!15466)))))

(assert (=> d!6993 (= (arrayNoDuplicates!0 lt!15466 #b00000000000000000000000000000000 Nil!1052) e!25586)))

(declare-fun bm!3109 () Bool)

(assert (=> bm!3109 (= call!3112 (arrayNoDuplicates!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)))))

(assert (= (and d!6993 (not res!24093)) b!40347))

(assert (= (and b!40347 res!24091) b!40344))

(assert (= (and b!40347 res!24092) b!40345))

(assert (= (and b!40345 c!4914) b!40343))

(assert (= (and b!40345 (not c!4914)) b!40346))

(assert (= (or b!40343 b!40346) bm!3109))

(assert (=> b!40344 m!33269))

(assert (=> b!40344 m!33269))

(declare-fun m!33295 () Bool)

(assert (=> b!40344 m!33295))

(assert (=> b!40345 m!33269))

(assert (=> b!40345 m!33269))

(assert (=> b!40345 m!33273))

(assert (=> b!40347 m!33269))

(assert (=> b!40347 m!33269))

(assert (=> b!40347 m!33273))

(assert (=> bm!3109 m!33269))

(declare-fun m!33297 () Bool)

(assert (=> bm!3109 m!33297))

(assert (=> b!40252 d!6993))

(declare-fun d!6999 () Bool)

(assert (=> d!6999 (= (arrayCountValidKeys!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15515 () Unit!983)

(declare-fun choose!59 (array!2595 (_ BitVec 32) (_ BitVec 32)) Unit!983)

(assert (=> d!6999 (= lt!15515 (choose!59 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6999 (bvslt (size!1378 lt!15466) #b01111111111111111111111111111111)))

(assert (=> d!6999 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15515)))

(declare-fun bs!1697 () Bool)

(assert (= bs!1697 d!6999))

(assert (=> bs!1697 m!33217))

(declare-fun m!33303 () Bool)

(assert (=> bs!1697 m!33303))

(assert (=> b!40252 d!6999))

(declare-fun d!7005 () Bool)

(declare-fun getCurrentListMap!312 (array!2595 array!2597 (_ BitVec 32) (_ BitVec 32) V!2099 V!2099 (_ BitVec 32) Int) ListLongMap!1063)

(assert (=> d!7005 (= (map!690 lt!15461) (getCurrentListMap!312 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)))))

(declare-fun bs!1700 () Bool)

(assert (= bs!1700 d!7005))

(declare-fun m!33309 () Bool)

(assert (=> bs!1700 m!33309))

(assert (=> b!40252 d!7005))

(declare-fun d!7011 () Bool)

(assert (=> d!7011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15466 mask!853)))

(declare-fun lt!15527 () Unit!983)

(declare-fun choose!34 (array!2595 (_ BitVec 32) (_ BitVec 32)) Unit!983)

(assert (=> d!7011 (= lt!15527 (choose!34 lt!15466 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7011 (validMask!0 mask!853)))

(assert (=> d!7011 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15466 mask!853 #b00000000000000000000000000000000) lt!15527)))

(declare-fun bs!1702 () Bool)

(assert (= bs!1702 d!7011))

(assert (=> bs!1702 m!33207))

(declare-fun m!33315 () Bool)

(assert (=> bs!1702 m!33315))

(assert (=> bs!1702 m!33203))

(assert (=> b!40252 d!7011))

(declare-fun d!7017 () Bool)

(declare-fun res!24113 () Bool)

(declare-fun e!25627 () Bool)

(assert (=> d!7017 (=> res!24113 e!25627)))

(assert (=> d!7017 (= res!24113 (bvsge #b00000000000000000000000000000000 (size!1378 lt!15466)))))

(assert (=> d!7017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15466 mask!853) e!25627)))

(declare-fun b!40399 () Bool)

(declare-fun e!25626 () Bool)

(declare-fun call!3125 () Bool)

(assert (=> b!40399 (= e!25626 call!3125)))

(declare-fun b!40400 () Bool)

(declare-fun e!25625 () Bool)

(assert (=> b!40400 (= e!25625 e!25626)))

(declare-fun lt!15547 () (_ BitVec 64))

(assert (=> b!40400 (= lt!15547 (select (arr!1241 lt!15466) #b00000000000000000000000000000000))))

(declare-fun lt!15548 () Unit!983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2595 (_ BitVec 64) (_ BitVec 32)) Unit!983)

(assert (=> b!40400 (= lt!15548 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15466 lt!15547 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!40400 (arrayContainsKey!0 lt!15466 lt!15547 #b00000000000000000000000000000000)))

(declare-fun lt!15546 () Unit!983)

(assert (=> b!40400 (= lt!15546 lt!15548)))

(declare-fun res!24114 () Bool)

(declare-datatypes ((SeekEntryResult!174 0))(
  ( (MissingZero!174 (index!2818 (_ BitVec 32))) (Found!174 (index!2819 (_ BitVec 32))) (Intermediate!174 (undefined!986 Bool) (index!2820 (_ BitVec 32)) (x!7721 (_ BitVec 32))) (Undefined!174) (MissingVacant!174 (index!2821 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2595 (_ BitVec 32)) SeekEntryResult!174)

(assert (=> b!40400 (= res!24114 (= (seekEntryOrOpen!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853) (Found!174 #b00000000000000000000000000000000)))))

(assert (=> b!40400 (=> (not res!24114) (not e!25626))))

(declare-fun b!40401 () Bool)

(assert (=> b!40401 (= e!25625 call!3125)))

(declare-fun b!40402 () Bool)

(assert (=> b!40402 (= e!25627 e!25625)))

(declare-fun c!4931 () Bool)

(assert (=> b!40402 (= c!4931 (validKeyInArray!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun bm!3122 () Bool)

(assert (=> bm!3122 (= call!3125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15466 mask!853))))

(assert (= (and d!7017 (not res!24113)) b!40402))

(assert (= (and b!40402 c!4931) b!40400))

(assert (= (and b!40402 (not c!4931)) b!40401))

(assert (= (and b!40400 res!24114) b!40399))

(assert (= (or b!40399 b!40401) bm!3122))

(assert (=> b!40400 m!33269))

(declare-fun m!33331 () Bool)

(assert (=> b!40400 m!33331))

(declare-fun m!33333 () Bool)

(assert (=> b!40400 m!33333))

(assert (=> b!40400 m!33269))

(declare-fun m!33335 () Bool)

(assert (=> b!40400 m!33335))

(assert (=> b!40402 m!33269))

(assert (=> b!40402 m!33269))

(assert (=> b!40402 m!33273))

(declare-fun m!33337 () Bool)

(assert (=> bm!3122 m!33337))

(assert (=> b!40252 d!7017))

(declare-fun d!7027 () Bool)

(declare-fun res!24121 () Bool)

(declare-fun e!25630 () Bool)

(assert (=> d!7027 (=> (not res!24121) (not e!25630))))

(declare-fun simpleValid!29 (LongMapFixedSize!240) Bool)

(assert (=> d!7027 (= res!24121 (simpleValid!29 lt!15461))))

(assert (=> d!7027 (= (valid!119 lt!15461) e!25630)))

(declare-fun b!40409 () Bool)

(declare-fun res!24122 () Bool)

(assert (=> b!40409 (=> (not res!24122) (not e!25630))))

(assert (=> b!40409 (= res!24122 (= (arrayCountValidKeys!0 (_keys!3293 lt!15461) #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))) (_size!169 lt!15461)))))

(declare-fun b!40410 () Bool)

(declare-fun res!24123 () Bool)

(assert (=> b!40410 (=> (not res!24123) (not e!25630))))

(assert (=> b!40410 (= res!24123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3293 lt!15461) (mask!5177 lt!15461)))))

(declare-fun b!40411 () Bool)

(assert (=> b!40411 (= e!25630 (arrayNoDuplicates!0 (_keys!3293 lt!15461) #b00000000000000000000000000000000 Nil!1052))))

(assert (= (and d!7027 res!24121) b!40409))

(assert (= (and b!40409 res!24122) b!40410))

(assert (= (and b!40410 res!24123) b!40411))

(declare-fun m!33341 () Bool)

(assert (=> d!7027 m!33341))

(declare-fun m!33343 () Bool)

(assert (=> b!40409 m!33343))

(declare-fun m!33345 () Bool)

(assert (=> b!40410 m!33345))

(declare-fun m!33347 () Bool)

(assert (=> b!40411 m!33347))

(assert (=> b!40254 d!7027))

(declare-fun d!7029 () Bool)

(get-info :version)

(assert (=> d!7029 (= (isEmpty!230 (toList!547 lt!15464)) ((_ is Nil!1051) (toList!547 lt!15464)))))

(assert (=> b!40253 d!7029))

(declare-fun d!7031 () Bool)

(assert (=> d!7031 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5694 d!7031))

(check-sat (not b!40410) (not d!7011) (not d!6999) (not b!40347) (not b!40345) (not bm!3101) (not b_next!1365) (not bm!3122) (not b!40344) (not b!40307) (not d!7005) (not b!40411) (not bm!3109) (not b_lambda!2067) (not d!7027) (not b!40400) (not d!6989) (not b!40409) tp_is_empty!1755 b_and!2363 (not b!40402))
(check-sat b_and!2363 (not b_next!1365))
(get-model)

(declare-fun b!40416 () Bool)

(declare-fun e!25635 () Bool)

(declare-fun call!3127 () Bool)

(assert (=> b!40416 (= e!25635 call!3127)))

(declare-fun b!40417 () Bool)

(declare-fun e!25636 () Bool)

(assert (=> b!40417 (= e!25636 (contains!512 (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40418 () Bool)

(declare-fun e!25634 () Bool)

(assert (=> b!40418 (= e!25634 e!25635)))

(declare-fun c!4934 () Bool)

(assert (=> b!40418 (= c!4934 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40419 () Bool)

(assert (=> b!40419 (= e!25635 call!3127)))

(declare-fun b!40420 () Bool)

(declare-fun e!25633 () Bool)

(assert (=> b!40420 (= e!25633 e!25634)))

(declare-fun res!24125 () Bool)

(assert (=> b!40420 (=> (not res!24125) (not e!25634))))

(assert (=> b!40420 (= res!24125 (not e!25636))))

(declare-fun res!24124 () Bool)

(assert (=> b!40420 (=> (not res!24124) (not e!25636))))

(assert (=> b!40420 (= res!24124 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7035 () Bool)

(declare-fun res!24126 () Bool)

(assert (=> d!7035 (=> res!24126 e!25633)))

(assert (=> d!7035 (= res!24126 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(assert (=> d!7035 (= (arrayNoDuplicates!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) e!25633)))

(declare-fun bm!3124 () Bool)

(assert (=> bm!3124 (= call!3127 (arrayNoDuplicates!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4934 (Cons!1051 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052))))))

(assert (= (and d!7035 (not res!24126)) b!40420))

(assert (= (and b!40420 res!24124) b!40417))

(assert (= (and b!40420 res!24125) b!40418))

(assert (= (and b!40418 c!4934) b!40416))

(assert (= (and b!40418 (not c!4934)) b!40419))

(assert (= (or b!40416 b!40419) bm!3124))

(declare-fun m!33355 () Bool)

(assert (=> b!40417 m!33355))

(assert (=> b!40417 m!33355))

(declare-fun m!33357 () Bool)

(assert (=> b!40417 m!33357))

(assert (=> b!40418 m!33355))

(assert (=> b!40418 m!33355))

(declare-fun m!33359 () Bool)

(assert (=> b!40418 m!33359))

(assert (=> b!40420 m!33355))

(assert (=> b!40420 m!33355))

(assert (=> b!40420 m!33359))

(assert (=> bm!3124 m!33355))

(declare-fun m!33361 () Bool)

(assert (=> bm!3124 m!33361))

(assert (=> bm!3109 d!7035))

(declare-fun b!40522 () Bool)

(declare-fun e!25712 () Bool)

(declare-fun lt!15668 () ListLongMap!1063)

(declare-fun apply!55 (ListLongMap!1063 (_ BitVec 64)) V!2099)

(assert (=> b!40522 (= e!25712 (= (apply!55 lt!15668 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1722 lt!15461)))))

(declare-fun b!40523 () Bool)

(declare-fun e!25702 () Bool)

(assert (=> b!40523 (= e!25702 e!25712)))

(declare-fun res!24181 () Bool)

(declare-fun call!3164 () Bool)

(assert (=> b!40523 (= res!24181 call!3164)))

(assert (=> b!40523 (=> (not res!24181) (not e!25712))))

(declare-fun b!40524 () Bool)

(declare-fun e!25704 () Bool)

(assert (=> b!40524 (= e!25704 (= (apply!55 lt!15668 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1722 lt!15461)))))

(declare-fun b!40525 () Bool)

(declare-fun res!24178 () Bool)

(declare-fun e!25709 () Bool)

(assert (=> b!40525 (=> (not res!24178) (not e!25709))))

(declare-fun e!25707 () Bool)

(assert (=> b!40525 (= res!24178 e!25707)))

(declare-fun c!4966 () Bool)

(assert (=> b!40525 (= c!4966 (not (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!40526 () Bool)

(declare-fun e!25703 () ListLongMap!1063)

(declare-fun e!25714 () ListLongMap!1063)

(assert (=> b!40526 (= e!25703 e!25714)))

(declare-fun c!4967 () Bool)

(assert (=> b!40526 (= c!4967 (and (not (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40527 () Bool)

(declare-fun e!25710 () Bool)

(assert (=> b!40527 (= e!25710 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40528 () Bool)

(declare-fun res!24176 () Bool)

(assert (=> b!40528 (=> (not res!24176) (not e!25709))))

(declare-fun e!25711 () Bool)

(assert (=> b!40528 (= res!24176 e!25711)))

(declare-fun res!24180 () Bool)

(assert (=> b!40528 (=> res!24180 e!25711)))

(declare-fun e!25705 () Bool)

(assert (=> b!40528 (= res!24180 (not e!25705))))

(declare-fun res!24177 () Bool)

(assert (=> b!40528 (=> (not res!24177) (not e!25705))))

(assert (=> b!40528 (= res!24177 (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!40529 () Bool)

(declare-fun c!4963 () Bool)

(assert (=> b!40529 (= c!4963 (and (not (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!25708 () ListLongMap!1063)

(assert (=> b!40529 (= e!25714 e!25708)))

(declare-fun b!40531 () Bool)

(assert (=> b!40531 (= e!25709 e!25702)))

(declare-fun c!4964 () Bool)

(assert (=> b!40531 (= c!4964 (not (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40532 () Bool)

(declare-fun e!25706 () Unit!983)

(declare-fun Unit!987 () Unit!983)

(assert (=> b!40532 (= e!25706 Unit!987)))

(declare-fun call!3163 () ListLongMap!1063)

(declare-fun call!3161 () ListLongMap!1063)

(declare-fun bm!3157 () Bool)

(declare-fun call!3162 () ListLongMap!1063)

(declare-fun c!4965 () Bool)

(declare-fun call!3165 () ListLongMap!1063)

(declare-fun +!64 (ListLongMap!1063 tuple2!1486) ListLongMap!1063)

(assert (=> bm!3157 (= call!3163 (+!64 (ite c!4965 call!3161 (ite c!4967 call!3165 call!3162)) (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))

(declare-fun b!40533 () Bool)

(assert (=> b!40533 (= e!25707 e!25704)))

(declare-fun res!24175 () Bool)

(declare-fun call!3160 () Bool)

(assert (=> b!40533 (= res!24175 call!3160)))

(assert (=> b!40533 (=> (not res!24175) (not e!25704))))

(declare-fun bm!3158 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!33 (array!2595 array!2597 (_ BitVec 32) (_ BitVec 32) V!2099 V!2099 (_ BitVec 32) Int) ListLongMap!1063)

(assert (=> bm!3158 (= call!3161 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)))))

(declare-fun bm!3159 () Bool)

(assert (=> bm!3159 (= call!3165 call!3161)))

(declare-fun b!40534 () Bool)

(declare-fun call!3166 () ListLongMap!1063)

(assert (=> b!40534 (= e!25708 call!3166)))

(declare-fun b!40535 () Bool)

(assert (=> b!40535 (= e!25705 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40536 () Bool)

(assert (=> b!40536 (= e!25707 (not call!3160))))

(declare-fun bm!3160 () Bool)

(declare-fun contains!514 (ListLongMap!1063 (_ BitVec 64)) Bool)

(assert (=> bm!3160 (= call!3160 (contains!514 lt!15668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40537 () Bool)

(assert (=> b!40537 (= e!25703 (+!64 call!3163 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))

(declare-fun d!7039 () Bool)

(assert (=> d!7039 e!25709))

(declare-fun res!24179 () Bool)

(assert (=> d!7039 (=> (not res!24179) (not e!25709))))

(assert (=> d!7039 (= res!24179 (or (bvsge #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))))

(declare-fun lt!15653 () ListLongMap!1063)

(assert (=> d!7039 (= lt!15668 lt!15653)))

(declare-fun lt!15660 () Unit!983)

(assert (=> d!7039 (= lt!15660 e!25706)))

(declare-fun c!4968 () Bool)

(assert (=> d!7039 (= c!4968 e!25710)))

(declare-fun res!24182 () Bool)

(assert (=> d!7039 (=> (not res!24182) (not e!25710))))

(assert (=> d!7039 (= res!24182 (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7039 (= lt!15653 e!25703)))

(assert (=> d!7039 (= c!4965 (and (not (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1695 lt!15461) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7039 (validMask!0 (mask!5177 lt!15461))))

(assert (=> d!7039 (= (getCurrentListMap!312 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)) lt!15668)))

(declare-fun b!40530 () Bool)

(declare-fun e!25713 () Bool)

(assert (=> b!40530 (= e!25711 e!25713)))

(declare-fun res!24183 () Bool)

(assert (=> b!40530 (=> (not res!24183) (not e!25713))))

(assert (=> b!40530 (= res!24183 (contains!514 lt!15668 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (=> b!40530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(declare-fun bm!3161 () Bool)

(assert (=> bm!3161 (= call!3162 call!3165)))

(declare-fun b!40538 () Bool)

(declare-fun lt!15652 () Unit!983)

(assert (=> b!40538 (= e!25706 lt!15652)))

(declare-fun lt!15666 () ListLongMap!1063)

(assert (=> b!40538 (= lt!15666 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)))))

(declare-fun lt!15671 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15659 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15659 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))

(declare-fun lt!15662 () Unit!983)

(declare-fun addStillContains!32 (ListLongMap!1063 (_ BitVec 64) V!2099 (_ BitVec 64)) Unit!983)

(assert (=> b!40538 (= lt!15662 (addStillContains!32 lt!15666 lt!15671 (zeroValue!1722 lt!15461) lt!15659))))

(assert (=> b!40538 (contains!514 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))) lt!15659)))

(declare-fun lt!15669 () Unit!983)

(assert (=> b!40538 (= lt!15669 lt!15662)))

(declare-fun lt!15651 () ListLongMap!1063)

(assert (=> b!40538 (= lt!15651 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)))))

(declare-fun lt!15664 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15664 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15658 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15658 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))

(declare-fun lt!15650 () Unit!983)

(declare-fun addApplyDifferent!32 (ListLongMap!1063 (_ BitVec 64) V!2099 (_ BitVec 64)) Unit!983)

(assert (=> b!40538 (= lt!15650 (addApplyDifferent!32 lt!15651 lt!15664 (minValue!1722 lt!15461) lt!15658))))

(assert (=> b!40538 (= (apply!55 (+!64 lt!15651 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))) lt!15658) (apply!55 lt!15651 lt!15658))))

(declare-fun lt!15657 () Unit!983)

(assert (=> b!40538 (= lt!15657 lt!15650)))

(declare-fun lt!15654 () ListLongMap!1063)

(assert (=> b!40538 (= lt!15654 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)))))

(declare-fun lt!15665 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15663 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15663 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))

(declare-fun lt!15661 () Unit!983)

(assert (=> b!40538 (= lt!15661 (addApplyDifferent!32 lt!15654 lt!15665 (zeroValue!1722 lt!15461) lt!15663))))

(assert (=> b!40538 (= (apply!55 (+!64 lt!15654 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))) lt!15663) (apply!55 lt!15654 lt!15663))))

(declare-fun lt!15667 () Unit!983)

(assert (=> b!40538 (= lt!15667 lt!15661)))

(declare-fun lt!15656 () ListLongMap!1063)

(assert (=> b!40538 (= lt!15656 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)))))

(declare-fun lt!15655 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15655 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15670 () (_ BitVec 64))

(assert (=> b!40538 (= lt!15670 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))

(assert (=> b!40538 (= lt!15652 (addApplyDifferent!32 lt!15656 lt!15655 (minValue!1722 lt!15461) lt!15670))))

(assert (=> b!40538 (= (apply!55 (+!64 lt!15656 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))) lt!15670) (apply!55 lt!15656 lt!15670))))

(declare-fun b!40539 () Bool)

(assert (=> b!40539 (= e!25702 (not call!3164))))

(declare-fun b!40540 () Bool)

(declare-fun get!702 (ValueCell!630 V!2099) V!2099)

(assert (=> b!40540 (= e!25713 (= (apply!55 lt!15668 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) (get!702 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1379 (_values!1787 lt!15461))))))

(assert (=> b!40540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!40541 () Bool)

(assert (=> b!40541 (= e!25708 call!3162)))

(declare-fun b!40542 () Bool)

(assert (=> b!40542 (= e!25714 call!3166)))

(declare-fun bm!3162 () Bool)

(assert (=> bm!3162 (= call!3164 (contains!514 lt!15668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3163 () Bool)

(assert (=> bm!3163 (= call!3166 call!3163)))

(assert (= (and d!7039 c!4965) b!40537))

(assert (= (and d!7039 (not c!4965)) b!40526))

(assert (= (and b!40526 c!4967) b!40542))

(assert (= (and b!40526 (not c!4967)) b!40529))

(assert (= (and b!40529 c!4963) b!40534))

(assert (= (and b!40529 (not c!4963)) b!40541))

(assert (= (or b!40534 b!40541) bm!3161))

(assert (= (or b!40542 bm!3161) bm!3159))

(assert (= (or b!40542 b!40534) bm!3163))

(assert (= (or b!40537 bm!3159) bm!3158))

(assert (= (or b!40537 bm!3163) bm!3157))

(assert (= (and d!7039 res!24182) b!40527))

(assert (= (and d!7039 c!4968) b!40538))

(assert (= (and d!7039 (not c!4968)) b!40532))

(assert (= (and d!7039 res!24179) b!40528))

(assert (= (and b!40528 res!24177) b!40535))

(assert (= (and b!40528 (not res!24180)) b!40530))

(assert (= (and b!40530 res!24183) b!40540))

(assert (= (and b!40528 res!24176) b!40525))

(assert (= (and b!40525 c!4966) b!40533))

(assert (= (and b!40525 (not c!4966)) b!40536))

(assert (= (and b!40533 res!24175) b!40524))

(assert (= (or b!40533 b!40536) bm!3160))

(assert (= (and b!40525 res!24178) b!40531))

(assert (= (and b!40531 c!4964) b!40523))

(assert (= (and b!40531 (not c!4964)) b!40539))

(assert (= (and b!40523 res!24181) b!40522))

(assert (= (or b!40523 b!40539) bm!3162))

(declare-fun b_lambda!2069 () Bool)

(assert (=> (not b_lambda!2069) (not b!40540)))

(declare-fun tb!845 () Bool)

(declare-fun t!3916 () Bool)

(assert (=> (and start!5694 (= defaultEntry!470 (defaultEntry!1804 lt!15461)) t!3916) tb!845))

(declare-fun result!1447 () Bool)

(assert (=> tb!845 (= result!1447 tp_is_empty!1755)))

(assert (=> b!40540 t!3916))

(declare-fun b_and!2369 () Bool)

(assert (= b_and!2363 (and (=> t!3916 result!1447) b_and!2369)))

(declare-fun m!33399 () Bool)

(assert (=> b!40522 m!33399))

(declare-fun m!33401 () Bool)

(assert (=> bm!3160 m!33401))

(declare-fun m!33403 () Bool)

(assert (=> bm!3157 m!33403))

(declare-fun m!33405 () Bool)

(assert (=> b!40530 m!33405))

(assert (=> b!40530 m!33405))

(declare-fun m!33407 () Bool)

(assert (=> b!40530 m!33407))

(assert (=> b!40535 m!33405))

(assert (=> b!40535 m!33405))

(declare-fun m!33409 () Bool)

(assert (=> b!40535 m!33409))

(declare-fun m!33411 () Bool)

(assert (=> bm!3158 m!33411))

(declare-fun m!33413 () Bool)

(assert (=> b!40537 m!33413))

(declare-fun m!33415 () Bool)

(assert (=> b!40524 m!33415))

(declare-fun m!33417 () Bool)

(assert (=> b!40538 m!33417))

(declare-fun m!33419 () Bool)

(assert (=> b!40538 m!33419))

(assert (=> b!40538 m!33411))

(declare-fun m!33421 () Bool)

(assert (=> b!40538 m!33421))

(declare-fun m!33423 () Bool)

(assert (=> b!40538 m!33423))

(declare-fun m!33425 () Bool)

(assert (=> b!40538 m!33425))

(assert (=> b!40538 m!33417))

(declare-fun m!33427 () Bool)

(assert (=> b!40538 m!33427))

(declare-fun m!33429 () Bool)

(assert (=> b!40538 m!33429))

(declare-fun m!33431 () Bool)

(assert (=> b!40538 m!33431))

(declare-fun m!33433 () Bool)

(assert (=> b!40538 m!33433))

(declare-fun m!33435 () Bool)

(assert (=> b!40538 m!33435))

(declare-fun m!33437 () Bool)

(assert (=> b!40538 m!33437))

(assert (=> b!40538 m!33427))

(declare-fun m!33439 () Bool)

(assert (=> b!40538 m!33439))

(declare-fun m!33441 () Bool)

(assert (=> b!40538 m!33441))

(assert (=> b!40538 m!33421))

(declare-fun m!33443 () Bool)

(assert (=> b!40538 m!33443))

(assert (=> b!40538 m!33405))

(assert (=> b!40538 m!33433))

(declare-fun m!33445 () Bool)

(assert (=> b!40538 m!33445))

(declare-fun m!33447 () Bool)

(assert (=> d!7039 m!33447))

(declare-fun m!33449 () Bool)

(assert (=> b!40540 m!33449))

(declare-fun m!33451 () Bool)

(assert (=> b!40540 m!33451))

(declare-fun m!33453 () Bool)

(assert (=> b!40540 m!33453))

(assert (=> b!40540 m!33449))

(assert (=> b!40540 m!33451))

(assert (=> b!40540 m!33405))

(declare-fun m!33455 () Bool)

(assert (=> b!40540 m!33455))

(assert (=> b!40540 m!33405))

(assert (=> b!40527 m!33405))

(assert (=> b!40527 m!33405))

(assert (=> b!40527 m!33409))

(declare-fun m!33457 () Bool)

(assert (=> bm!3162 m!33457))

(assert (=> d!7005 d!7039))

(declare-fun d!7059 () Bool)

(declare-fun res!24193 () Bool)

(declare-fun e!25730 () Bool)

(assert (=> d!7059 (=> res!24193 e!25730)))

(assert (=> d!7059 (= res!24193 (bvsge #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3293 lt!15461) (mask!5177 lt!15461)) e!25730)))

(declare-fun b!40564 () Bool)

(declare-fun e!25729 () Bool)

(declare-fun call!3174 () Bool)

(assert (=> b!40564 (= e!25729 call!3174)))

(declare-fun b!40565 () Bool)

(declare-fun e!25728 () Bool)

(assert (=> b!40565 (= e!25728 e!25729)))

(declare-fun lt!15695 () (_ BitVec 64))

(assert (=> b!40565 (= lt!15695 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))

(declare-fun lt!15696 () Unit!983)

(assert (=> b!40565 (= lt!15696 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3293 lt!15461) lt!15695 #b00000000000000000000000000000000))))

(assert (=> b!40565 (arrayContainsKey!0 (_keys!3293 lt!15461) lt!15695 #b00000000000000000000000000000000)))

(declare-fun lt!15694 () Unit!983)

(assert (=> b!40565 (= lt!15694 lt!15696)))

(declare-fun res!24194 () Bool)

(assert (=> b!40565 (= res!24194 (= (seekEntryOrOpen!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) (_keys!3293 lt!15461) (mask!5177 lt!15461)) (Found!174 #b00000000000000000000000000000000)))))

(assert (=> b!40565 (=> (not res!24194) (not e!25729))))

(declare-fun b!40566 () Bool)

(assert (=> b!40566 (= e!25728 call!3174)))

(declare-fun b!40567 () Bool)

(assert (=> b!40567 (= e!25730 e!25728)))

(declare-fun c!4975 () Bool)

(assert (=> b!40567 (= c!4975 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun bm!3171 () Bool)

(assert (=> bm!3171 (= call!3174 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3293 lt!15461) (mask!5177 lt!15461)))))

(assert (= (and d!7059 (not res!24193)) b!40567))

(assert (= (and b!40567 c!4975) b!40565))

(assert (= (and b!40567 (not c!4975)) b!40566))

(assert (= (and b!40565 res!24194) b!40564))

(assert (= (or b!40564 b!40566) bm!3171))

(assert (=> b!40565 m!33405))

(declare-fun m!33459 () Bool)

(assert (=> b!40565 m!33459))

(declare-fun m!33461 () Bool)

(assert (=> b!40565 m!33461))

(assert (=> b!40565 m!33405))

(declare-fun m!33463 () Bool)

(assert (=> b!40565 m!33463))

(assert (=> b!40567 m!33405))

(assert (=> b!40567 m!33405))

(assert (=> b!40567 m!33409))

(declare-fun m!33465 () Bool)

(assert (=> bm!3171 m!33465))

(assert (=> b!40410 d!7059))

(declare-fun b!40580 () Bool)

(declare-fun e!25739 () Bool)

(declare-fun call!3177 () Bool)

(assert (=> b!40580 (= e!25739 call!3177)))

(declare-fun b!40581 () Bool)

(declare-fun e!25740 () Bool)

(assert (=> b!40581 (= e!25740 (contains!512 Nil!1052 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40582 () Bool)

(declare-fun e!25738 () Bool)

(assert (=> b!40582 (= e!25738 e!25739)))

(declare-fun c!4982 () Bool)

(assert (=> b!40582 (= c!4982 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40583 () Bool)

(assert (=> b!40583 (= e!25739 call!3177)))

(declare-fun b!40584 () Bool)

(declare-fun e!25737 () Bool)

(assert (=> b!40584 (= e!25737 e!25738)))

(declare-fun res!24196 () Bool)

(assert (=> b!40584 (=> (not res!24196) (not e!25738))))

(assert (=> b!40584 (= res!24196 (not e!25740))))

(declare-fun res!24195 () Bool)

(assert (=> b!40584 (=> (not res!24195) (not e!25740))))

(assert (=> b!40584 (= res!24195 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun d!7061 () Bool)

(declare-fun res!24197 () Bool)

(assert (=> d!7061 (=> res!24197 e!25737)))

(assert (=> d!7061 (= res!24197 (bvsge #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7061 (= (arrayNoDuplicates!0 (_keys!3293 lt!15461) #b00000000000000000000000000000000 Nil!1052) e!25737)))

(declare-fun bm!3174 () Bool)

(assert (=> bm!3174 (= call!3177 (arrayNoDuplicates!0 (_keys!3293 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4982 (Cons!1051 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) Nil!1052) Nil!1052)))))

(assert (= (and d!7061 (not res!24197)) b!40584))

(assert (= (and b!40584 res!24195) b!40581))

(assert (= (and b!40584 res!24196) b!40582))

(assert (= (and b!40582 c!4982) b!40580))

(assert (= (and b!40582 (not c!4982)) b!40583))

(assert (= (or b!40580 b!40583) bm!3174))

(assert (=> b!40581 m!33405))

(assert (=> b!40581 m!33405))

(declare-fun m!33493 () Bool)

(assert (=> b!40581 m!33493))

(assert (=> b!40582 m!33405))

(assert (=> b!40582 m!33405))

(assert (=> b!40582 m!33409))

(assert (=> b!40584 m!33405))

(assert (=> b!40584 m!33405))

(assert (=> b!40584 m!33409))

(assert (=> bm!3174 m!33405))

(declare-fun m!33505 () Bool)

(assert (=> bm!3174 m!33505))

(assert (=> b!40411 d!7061))

(assert (=> d!6999 d!6983))

(declare-fun d!7063 () Bool)

(assert (=> d!7063 (= (arrayCountValidKeys!0 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!7063 true))

(declare-fun _$88!43 () Unit!983)

(assert (=> d!7063 (= (choose!59 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!43)))

(declare-fun bs!1708 () Bool)

(assert (= bs!1708 d!7063))

(assert (=> bs!1708 m!33217))

(assert (=> d!6999 d!7063))

(declare-fun b!40624 () Bool)

(declare-fun e!25765 () Bool)

(assert (=> b!40624 (= e!25765 (and (bvsge (extraKeys!1695 lt!15461) #b00000000000000000000000000000000) (bvsle (extraKeys!1695 lt!15461) #b00000000000000000000000000000011) (bvsge (_vacant!169 lt!15461) #b00000000000000000000000000000000)))))

(declare-fun d!7067 () Bool)

(declare-fun res!24229 () Bool)

(assert (=> d!7067 (=> (not res!24229) (not e!25765))))

(assert (=> d!7067 (= res!24229 (validMask!0 (mask!5177 lt!15461)))))

(assert (=> d!7067 (= (simpleValid!29 lt!15461) e!25765)))

(declare-fun b!40622 () Bool)

(declare-fun res!24230 () Bool)

(assert (=> b!40622 (=> (not res!24230) (not e!25765))))

(declare-fun size!1394 (LongMapFixedSize!240) (_ BitVec 32))

(assert (=> b!40622 (= res!24230 (bvsge (size!1394 lt!15461) (_size!169 lt!15461)))))

(declare-fun b!40623 () Bool)

(declare-fun res!24228 () Bool)

(assert (=> b!40623 (=> (not res!24228) (not e!25765))))

(assert (=> b!40623 (= res!24228 (= (size!1394 lt!15461) (bvadd (_size!169 lt!15461) (bvsdiv (bvadd (extraKeys!1695 lt!15461) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!40621 () Bool)

(declare-fun res!24231 () Bool)

(assert (=> b!40621 (=> (not res!24231) (not e!25765))))

(assert (=> b!40621 (= res!24231 (and (= (size!1379 (_values!1787 lt!15461)) (bvadd (mask!5177 lt!15461) #b00000000000000000000000000000001)) (= (size!1378 (_keys!3293 lt!15461)) (size!1379 (_values!1787 lt!15461))) (bvsge (_size!169 lt!15461) #b00000000000000000000000000000000) (bvsle (_size!169 lt!15461) (bvadd (mask!5177 lt!15461) #b00000000000000000000000000000001))))))

(assert (= (and d!7067 res!24229) b!40621))

(assert (= (and b!40621 res!24231) b!40622))

(assert (= (and b!40622 res!24230) b!40623))

(assert (= (and b!40623 res!24228) b!40624))

(assert (=> d!7067 m!33447))

(declare-fun m!33535 () Bool)

(assert (=> b!40622 m!33535))

(assert (=> b!40623 m!33535))

(assert (=> d!7027 d!7067))

(declare-fun d!7075 () Bool)

(declare-fun res!24234 () Bool)

(declare-fun e!25772 () Bool)

(assert (=> d!7075 (=> res!24234 e!25772)))

(assert (=> d!7075 (= res!24234 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(assert (=> d!7075 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15466 mask!853) e!25772)))

(declare-fun b!40633 () Bool)

(declare-fun e!25771 () Bool)

(declare-fun call!3188 () Bool)

(assert (=> b!40633 (= e!25771 call!3188)))

(declare-fun b!40634 () Bool)

(declare-fun e!25770 () Bool)

(assert (=> b!40634 (= e!25770 e!25771)))

(declare-fun lt!15748 () (_ BitVec 64))

(assert (=> b!40634 (= lt!15748 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15749 () Unit!983)

(assert (=> b!40634 (= lt!15749 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15466 lt!15748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40634 (arrayContainsKey!0 lt!15466 lt!15748 #b00000000000000000000000000000000)))

(declare-fun lt!15747 () Unit!983)

(assert (=> b!40634 (= lt!15747 lt!15749)))

(declare-fun res!24235 () Bool)

(assert (=> b!40634 (= res!24235 (= (seekEntryOrOpen!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15466 mask!853) (Found!174 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40634 (=> (not res!24235) (not e!25771))))

(declare-fun b!40635 () Bool)

(assert (=> b!40635 (= e!25770 call!3188)))

(declare-fun b!40636 () Bool)

(assert (=> b!40636 (= e!25772 e!25770)))

(declare-fun c!4989 () Bool)

(assert (=> b!40636 (= c!4989 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3185 () Bool)

(assert (=> bm!3185 (= call!3188 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15466 mask!853))))

(assert (= (and d!7075 (not res!24234)) b!40636))

(assert (= (and b!40636 c!4989) b!40634))

(assert (= (and b!40636 (not c!4989)) b!40635))

(assert (= (and b!40634 res!24235) b!40633))

(assert (= (or b!40633 b!40635) bm!3185))

(assert (=> b!40634 m!33355))

(declare-fun m!33537 () Bool)

(assert (=> b!40634 m!33537))

(declare-fun m!33539 () Bool)

(assert (=> b!40634 m!33539))

(assert (=> b!40634 m!33355))

(declare-fun m!33541 () Bool)

(assert (=> b!40634 m!33541))

(assert (=> b!40636 m!33355))

(assert (=> b!40636 m!33355))

(assert (=> b!40636 m!33359))

(declare-fun m!33543 () Bool)

(assert (=> bm!3185 m!33543))

(assert (=> bm!3122 d!7075))

(declare-fun d!7077 () Bool)

(assert (=> d!7077 (= (validKeyInArray!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)) (and (not (= (select (arr!1241 lt!15466) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1241 lt!15466) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40347 d!7077))

(declare-fun b!40641 () Bool)

(declare-fun e!25778 () (_ BitVec 32))

(declare-fun call!3191 () (_ BitVec 32))

(assert (=> b!40641 (= e!25778 (bvadd #b00000000000000000000000000000001 call!3191))))

(declare-fun bm!3188 () Bool)

(assert (=> bm!3188 (= call!3191 (arrayCountValidKeys!0 (_keys!3293 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!40642 () Bool)

(declare-fun e!25777 () (_ BitVec 32))

(assert (=> b!40642 (= e!25777 e!25778)))

(declare-fun c!4991 () Bool)

(assert (=> b!40642 (= c!4991 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40643 () Bool)

(assert (=> b!40643 (= e!25778 call!3191)))

(declare-fun d!7079 () Bool)

(declare-fun lt!15750 () (_ BitVec 32))

(assert (=> d!7079 (and (bvsge lt!15750 #b00000000000000000000000000000000) (bvsle lt!15750 (bvsub (size!1378 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (=> d!7079 (= lt!15750 e!25777)))

(declare-fun c!4990 () Bool)

(assert (=> d!7079 (= c!4990 (bvsge #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7079 (and (bvsle #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1378 (_keys!3293 lt!15461)) (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7079 (= (arrayCountValidKeys!0 (_keys!3293 lt!15461) #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))) lt!15750)))

(declare-fun b!40644 () Bool)

(assert (=> b!40644 (= e!25777 #b00000000000000000000000000000000)))

(assert (= (and d!7079 c!4990) b!40644))

(assert (= (and d!7079 (not c!4990)) b!40642))

(assert (= (and b!40642 c!4991) b!40641))

(assert (= (and b!40642 (not c!4991)) b!40643))

(assert (= (or b!40641 b!40643) bm!3188))

(declare-fun m!33545 () Bool)

(assert (=> bm!3188 m!33545))

(assert (=> b!40642 m!33405))

(assert (=> b!40642 m!33405))

(assert (=> b!40642 m!33409))

(assert (=> b!40409 d!7079))

(declare-fun d!7081 () Bool)

(assert (=> d!7081 (arrayContainsKey!0 lt!15466 lt!15547 #b00000000000000000000000000000000)))

(declare-fun lt!15753 () Unit!983)

(declare-fun choose!13 (array!2595 (_ BitVec 64) (_ BitVec 32)) Unit!983)

(assert (=> d!7081 (= lt!15753 (choose!13 lt!15466 lt!15547 #b00000000000000000000000000000000))))

(assert (=> d!7081 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7081 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15466 lt!15547 #b00000000000000000000000000000000) lt!15753)))

(declare-fun bs!1710 () Bool)

(assert (= bs!1710 d!7081))

(assert (=> bs!1710 m!33333))

(declare-fun m!33549 () Bool)

(assert (=> bs!1710 m!33549))

(assert (=> b!40400 d!7081))

(declare-fun d!7085 () Bool)

(declare-fun res!24246 () Bool)

(declare-fun e!25785 () Bool)

(assert (=> d!7085 (=> res!24246 e!25785)))

(assert (=> d!7085 (= res!24246 (= (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15547))))

(assert (=> d!7085 (= (arrayContainsKey!0 lt!15466 lt!15547 #b00000000000000000000000000000000) e!25785)))

(declare-fun b!40651 () Bool)

(declare-fun e!25786 () Bool)

(assert (=> b!40651 (= e!25785 e!25786)))

(declare-fun res!24247 () Bool)

(assert (=> b!40651 (=> (not res!24247) (not e!25786))))

(assert (=> b!40651 (= res!24247 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(declare-fun b!40652 () Bool)

(assert (=> b!40652 (= e!25786 (arrayContainsKey!0 lt!15466 lt!15547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7085 (not res!24246)) b!40651))

(assert (= (and b!40651 res!24247) b!40652))

(assert (=> d!7085 m!33269))

(declare-fun m!33551 () Bool)

(assert (=> b!40652 m!33551))

(assert (=> b!40400 d!7085))

(declare-fun b!40736 () Bool)

(declare-fun e!25834 () SeekEntryResult!174)

(declare-fun lt!15795 () SeekEntryResult!174)

(assert (=> b!40736 (= e!25834 (MissingZero!174 (index!2820 lt!15795)))))

(declare-fun b!40737 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2595 (_ BitVec 32)) SeekEntryResult!174)

(assert (=> b!40737 (= e!25834 (seekKeyOrZeroReturnVacant!0 (x!7721 lt!15795) (index!2820 lt!15795) (index!2820 lt!15795) (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853))))

(declare-fun b!40738 () Bool)

(declare-fun c!5018 () Bool)

(declare-fun lt!15797 () (_ BitVec 64))

(assert (=> b!40738 (= c!5018 (= lt!15797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25836 () SeekEntryResult!174)

(assert (=> b!40738 (= e!25836 e!25834)))

(declare-fun d!7087 () Bool)

(declare-fun lt!15796 () SeekEntryResult!174)

(assert (=> d!7087 (and (or ((_ is Undefined!174) lt!15796) (not ((_ is Found!174) lt!15796)) (and (bvsge (index!2819 lt!15796) #b00000000000000000000000000000000) (bvslt (index!2819 lt!15796) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!15796) ((_ is Found!174) lt!15796) (not ((_ is MissingZero!174) lt!15796)) (and (bvsge (index!2818 lt!15796) #b00000000000000000000000000000000) (bvslt (index!2818 lt!15796) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!15796) ((_ is Found!174) lt!15796) ((_ is MissingZero!174) lt!15796) (not ((_ is MissingVacant!174) lt!15796)) (and (bvsge (index!2821 lt!15796) #b00000000000000000000000000000000) (bvslt (index!2821 lt!15796) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!15796) (ite ((_ is Found!174) lt!15796) (= (select (arr!1241 lt!15466) (index!2819 lt!15796)) (select (arr!1241 lt!15466) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!174) lt!15796) (= (select (arr!1241 lt!15466) (index!2818 lt!15796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!174) lt!15796) (= (select (arr!1241 lt!15466) (index!2821 lt!15796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25835 () SeekEntryResult!174)

(assert (=> d!7087 (= lt!15796 e!25835)))

(declare-fun c!5019 () Bool)

(assert (=> d!7087 (= c!5019 (and ((_ is Intermediate!174) lt!15795) (undefined!986 lt!15795)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2595 (_ BitVec 32)) SeekEntryResult!174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!7087 (= lt!15795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853) (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853))))

(assert (=> d!7087 (validMask!0 mask!853)))

(assert (=> d!7087 (= (seekEntryOrOpen!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853) lt!15796)))

(declare-fun b!40739 () Bool)

(assert (=> b!40739 (= e!25836 (Found!174 (index!2820 lt!15795)))))

(declare-fun b!40740 () Bool)

(assert (=> b!40740 (= e!25835 e!25836)))

(assert (=> b!40740 (= lt!15797 (select (arr!1241 lt!15466) (index!2820 lt!15795)))))

(declare-fun c!5017 () Bool)

(assert (=> b!40740 (= c!5017 (= lt!15797 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun b!40741 () Bool)

(assert (=> b!40741 (= e!25835 Undefined!174)))

(assert (= (and d!7087 c!5019) b!40741))

(assert (= (and d!7087 (not c!5019)) b!40740))

(assert (= (and b!40740 c!5017) b!40739))

(assert (= (and b!40740 (not c!5017)) b!40738))

(assert (= (and b!40738 c!5018) b!40736))

(assert (= (and b!40738 (not c!5018)) b!40737))

(assert (=> b!40737 m!33269))

(declare-fun m!33645 () Bool)

(assert (=> b!40737 m!33645))

(declare-fun m!33647 () Bool)

(assert (=> d!7087 m!33647))

(assert (=> d!7087 m!33269))

(declare-fun m!33649 () Bool)

(assert (=> d!7087 m!33649))

(declare-fun m!33651 () Bool)

(assert (=> d!7087 m!33651))

(assert (=> d!7087 m!33203))

(assert (=> d!7087 m!33269))

(assert (=> d!7087 m!33647))

(declare-fun m!33653 () Bool)

(assert (=> d!7087 m!33653))

(declare-fun m!33655 () Bool)

(assert (=> d!7087 m!33655))

(declare-fun m!33657 () Bool)

(assert (=> b!40740 m!33657))

(assert (=> b!40400 d!7087))

(assert (=> d!6989 d!6993))

(declare-fun d!7105 () Bool)

(assert (=> d!7105 (arrayNoDuplicates!0 lt!15466 #b00000000000000000000000000000000 Nil!1052)))

(assert (=> d!7105 true))

(declare-fun res!24286 () Unit!983)

(assert (=> d!7105 (= (choose!111 lt!15466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1052) res!24286)))

(declare-fun bs!1712 () Bool)

(assert (= bs!1712 d!7105))

(assert (=> bs!1712 m!33213))

(assert (=> d!6989 d!7105))

(declare-fun d!7111 () Bool)

(declare-fun lt!15804 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!31 (List!1055) (InoxSet (_ BitVec 64)))

(assert (=> d!7111 (= lt!15804 (select (content!31 Nil!1052) (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun e!25848 () Bool)

(assert (=> d!7111 (= lt!15804 e!25848)))

(declare-fun res!24291 () Bool)

(assert (=> d!7111 (=> (not res!24291) (not e!25848))))

(assert (=> d!7111 (= res!24291 ((_ is Cons!1051) Nil!1052))))

(assert (=> d!7111 (= (contains!512 Nil!1052 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)) lt!15804)))

(declare-fun b!40755 () Bool)

(declare-fun e!25847 () Bool)

(assert (=> b!40755 (= e!25848 e!25847)))

(declare-fun res!24292 () Bool)

(assert (=> b!40755 (=> res!24292 e!25847)))

(assert (=> b!40755 (= res!24292 (= (h!1625 Nil!1052) (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun b!40756 () Bool)

(assert (=> b!40756 (= e!25847 (contains!512 (t!3910 Nil!1052) (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(assert (= (and d!7111 res!24291) b!40755))

(assert (= (and b!40755 (not res!24292)) b!40756))

(declare-fun m!33667 () Bool)

(assert (=> d!7111 m!33667))

(assert (=> d!7111 m!33269))

(declare-fun m!33669 () Bool)

(assert (=> d!7111 m!33669))

(assert (=> b!40756 m!33269))

(declare-fun m!33671 () Bool)

(assert (=> b!40756 m!33671))

(assert (=> b!40344 d!7111))

(assert (=> b!40307 d!7077))

(assert (=> d!7011 d!7017))

(declare-fun d!7117 () Bool)

(assert (=> d!7117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15466 mask!853)))

(assert (=> d!7117 true))

(declare-fun _$30!57 () Unit!983)

(assert (=> d!7117 (= (choose!34 lt!15466 mask!853 #b00000000000000000000000000000000) _$30!57)))

(declare-fun bs!1715 () Bool)

(assert (= bs!1715 d!7117))

(assert (=> bs!1715 m!33207))

(assert (=> d!7011 d!7117))

(assert (=> d!7011 d!7031))

(declare-fun b!40775 () Bool)

(declare-fun e!25859 () (_ BitVec 32))

(declare-fun call!3204 () (_ BitVec 32))

(assert (=> b!40775 (= e!25859 (bvadd #b00000000000000000000000000000001 call!3204))))

(declare-fun bm!3201 () Bool)

(assert (=> bm!3201 (= call!3204 (arrayCountValidKeys!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40776 () Bool)

(declare-fun e!25858 () (_ BitVec 32))

(assert (=> b!40776 (= e!25858 e!25859)))

(declare-fun c!5024 () Bool)

(assert (=> b!40776 (= c!5024 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40777 () Bool)

(assert (=> b!40777 (= e!25859 call!3204)))

(declare-fun d!7121 () Bool)

(declare-fun lt!15805 () (_ BitVec 32))

(assert (=> d!7121 (and (bvsge lt!15805 #b00000000000000000000000000000000) (bvsle lt!15805 (bvsub (size!1378 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7121 (= lt!15805 e!25858)))

(declare-fun c!5023 () Bool)

(assert (=> d!7121 (= c!5023 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7121 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1378 lt!15466)))))

(assert (=> d!7121 (= (arrayCountValidKeys!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15805)))

(declare-fun b!40778 () Bool)

(assert (=> b!40778 (= e!25858 #b00000000000000000000000000000000)))

(assert (= (and d!7121 c!5023) b!40778))

(assert (= (and d!7121 (not c!5023)) b!40776))

(assert (= (and b!40776 c!5024) b!40775))

(assert (= (and b!40776 (not c!5024)) b!40777))

(assert (= (or b!40775 b!40777) bm!3201))

(declare-fun m!33677 () Bool)

(assert (=> bm!3201 m!33677))

(assert (=> b!40776 m!33355))

(assert (=> b!40776 m!33355))

(assert (=> b!40776 m!33359))

(assert (=> bm!3101 d!7121))

(assert (=> b!40402 d!7077))

(assert (=> b!40345 d!7077))

(check-sat (not d!7081) (not b!40622) (not b!40535) (not b_lambda!2067) (not b!40540) (not d!7063) (not b!40417) (not d!7111) (not d!7087) (not b!40530) (not b!40418) (not bm!3158) (not b_lambda!2069) (not b!40524) (not b!40642) (not b!40581) (not b!40567) (not b!40634) (not d!7039) (not b!40582) (not d!7067) (not b!40652) (not b!40527) (not b!40537) (not b!40420) (not bm!3201) tp_is_empty!1755 (not bm!3157) (not bm!3188) (not b!40538) (not b!40522) (not b!40623) (not b_next!1365) (not b!40737) (not b!40756) (not bm!3160) (not b!40565) (not b!40636) (not b!40584) (not bm!3174) (not bm!3162) b_and!2369 (not d!7117) (not d!7105) (not bm!3124) (not bm!3171) (not b!40776) (not bm!3185))
(check-sat b_and!2369 (not b_next!1365))
(get-model)

(declare-fun d!7175 () Bool)

(declare-fun e!25953 () Bool)

(assert (=> d!7175 e!25953))

(declare-fun c!5078 () Bool)

(declare-fun lt!15894 () SeekEntryResult!174)

(assert (=> d!7175 (= c!5078 (and ((_ is Intermediate!174) lt!15894) (undefined!986 lt!15894)))))

(declare-fun e!25954 () SeekEntryResult!174)

(assert (=> d!7175 (= lt!15894 e!25954)))

(declare-fun c!5079 () Bool)

(assert (=> d!7175 (= c!5079 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!15893 () (_ BitVec 64))

(assert (=> d!7175 (= lt!15893 (select (arr!1241 lt!15466) (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!7175 (validMask!0 mask!853)))

(assert (=> d!7175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853) (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853) lt!15894)))

(declare-fun b!40932 () Bool)

(declare-fun e!25955 () SeekEntryResult!174)

(assert (=> b!40932 (= e!25954 e!25955)))

(declare-fun c!5077 () Bool)

(assert (=> b!40932 (= c!5077 (or (= lt!15893 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)) (= (bvadd lt!15893 lt!15893) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40933 () Bool)

(assert (=> b!40933 (= e!25953 (bvsge (x!7721 lt!15894) #b01111111111111111111111111111110))))

(declare-fun b!40934 () Bool)

(declare-fun e!25952 () Bool)

(assert (=> b!40934 (= e!25953 e!25952)))

(declare-fun res!24364 () Bool)

(assert (=> b!40934 (= res!24364 (and ((_ is Intermediate!174) lt!15894) (not (undefined!986 lt!15894)) (bvslt (x!7721 lt!15894) #b01111111111111111111111111111110) (bvsge (x!7721 lt!15894) #b00000000000000000000000000000000) (bvsge (x!7721 lt!15894) #b00000000000000000000000000000000)))))

(assert (=> b!40934 (=> (not res!24364) (not e!25952))))

(declare-fun b!40935 () Bool)

(assert (=> b!40935 (and (bvsge (index!2820 lt!15894) #b00000000000000000000000000000000) (bvslt (index!2820 lt!15894) (size!1378 lt!15466)))))

(declare-fun e!25951 () Bool)

(assert (=> b!40935 (= e!25951 (= (select (arr!1241 lt!15466) (index!2820 lt!15894)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40936 () Bool)

(assert (=> b!40936 (and (bvsge (index!2820 lt!15894) #b00000000000000000000000000000000) (bvslt (index!2820 lt!15894) (size!1378 lt!15466)))))

(declare-fun res!24366 () Bool)

(assert (=> b!40936 (= res!24366 (= (select (arr!1241 lt!15466) (index!2820 lt!15894)) (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(assert (=> b!40936 (=> res!24366 e!25951)))

(assert (=> b!40936 (= e!25952 e!25951)))

(declare-fun b!40937 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40937 (= e!25955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853))))

(declare-fun b!40938 () Bool)

(assert (=> b!40938 (= e!25954 (Intermediate!174 true (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40939 () Bool)

(assert (=> b!40939 (and (bvsge (index!2820 lt!15894) #b00000000000000000000000000000000) (bvslt (index!2820 lt!15894) (size!1378 lt!15466)))))

(declare-fun res!24365 () Bool)

(assert (=> b!40939 (= res!24365 (= (select (arr!1241 lt!15466) (index!2820 lt!15894)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40939 (=> res!24365 e!25951)))

(declare-fun b!40940 () Bool)

(assert (=> b!40940 (= e!25955 (Intermediate!174 false (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!7175 c!5079) b!40938))

(assert (= (and d!7175 (not c!5079)) b!40932))

(assert (= (and b!40932 c!5077) b!40940))

(assert (= (and b!40932 (not c!5077)) b!40937))

(assert (= (and d!7175 c!5078) b!40933))

(assert (= (and d!7175 (not c!5078)) b!40934))

(assert (= (and b!40934 res!24364) b!40936))

(assert (= (and b!40936 (not res!24366)) b!40939))

(assert (= (and b!40939 (not res!24365)) b!40935))

(declare-fun m!33857 () Bool)

(assert (=> b!40936 m!33857))

(assert (=> d!7175 m!33647))

(declare-fun m!33859 () Bool)

(assert (=> d!7175 m!33859))

(assert (=> d!7175 m!33203))

(assert (=> b!40937 m!33647))

(declare-fun m!33861 () Bool)

(assert (=> b!40937 m!33861))

(assert (=> b!40937 m!33861))

(assert (=> b!40937 m!33269))

(declare-fun m!33863 () Bool)

(assert (=> b!40937 m!33863))

(assert (=> b!40935 m!33857))

(assert (=> b!40939 m!33857))

(assert (=> d!7087 d!7175))

(declare-fun d!7191 () Bool)

(declare-fun lt!15900 () (_ BitVec 32))

(declare-fun lt!15899 () (_ BitVec 32))

(assert (=> d!7191 (= lt!15900 (bvmul (bvxor lt!15899 (bvlshr lt!15899 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!7191 (= lt!15899 ((_ extract 31 0) (bvand (bvxor (select (arr!1241 lt!15466) #b00000000000000000000000000000000) (bvlshr (select (arr!1241 lt!15466) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!7191 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!24367 (let ((h!1629 ((_ extract 31 0) (bvand (bvxor (select (arr!1241 lt!15466) #b00000000000000000000000000000000) (bvlshr (select (arr!1241 lt!15466) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7742 (bvmul (bvxor h!1629 (bvlshr h!1629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7742 (bvlshr x!7742 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!24367 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!24367 #b00000000000000000000000000000000))))))

(assert (=> d!7191 (= (toIndex!0 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15900 (bvlshr lt!15900 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!7087 d!7191))

(assert (=> d!7087 d!7031))

(declare-fun d!7193 () Bool)

(assert (=> d!7193 (= (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40636 d!7193))

(declare-fun d!7195 () Bool)

(declare-fun e!25961 () Bool)

(assert (=> d!7195 e!25961))

(declare-fun res!24370 () Bool)

(assert (=> d!7195 (=> res!24370 e!25961)))

(declare-fun lt!15909 () Bool)

(assert (=> d!7195 (= res!24370 (not lt!15909))))

(declare-fun lt!15912 () Bool)

(assert (=> d!7195 (= lt!15909 lt!15912)))

(declare-fun lt!15911 () Unit!983)

(declare-fun e!25960 () Unit!983)

(assert (=> d!7195 (= lt!15911 e!25960)))

(declare-fun c!5082 () Bool)

(assert (=> d!7195 (= c!5082 lt!15912)))

(declare-fun containsKey!69 (List!1054 (_ BitVec 64)) Bool)

(assert (=> d!7195 (= lt!15912 (containsKey!69 (toList!547 lt!15668) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (=> d!7195 (= (contains!514 lt!15668 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) lt!15909)))

(declare-fun b!40947 () Bool)

(declare-fun lt!15910 () Unit!983)

(assert (=> b!40947 (= e!25960 lt!15910)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!57 (List!1054 (_ BitVec 64)) Unit!983)

(assert (=> b!40947 (= lt!15910 (lemmaContainsKeyImpliesGetValueByKeyDefined!57 (toList!547 lt!15668) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Option!108 0))(
  ( (Some!107 (v!2000 V!2099)) (None!106) )
))
(declare-fun isDefined!58 (Option!108) Bool)

(declare-fun getValueByKey!102 (List!1054 (_ BitVec 64)) Option!108)

(assert (=> b!40947 (isDefined!58 (getValueByKey!102 (toList!547 lt!15668) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40948 () Bool)

(declare-fun Unit!990 () Unit!983)

(assert (=> b!40948 (= e!25960 Unit!990)))

(declare-fun b!40949 () Bool)

(assert (=> b!40949 (= e!25961 (isDefined!58 (getValueByKey!102 (toList!547 lt!15668) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))))

(assert (= (and d!7195 c!5082) b!40947))

(assert (= (and d!7195 (not c!5082)) b!40948))

(assert (= (and d!7195 (not res!24370)) b!40949))

(assert (=> d!7195 m!33405))

(declare-fun m!33865 () Bool)

(assert (=> d!7195 m!33865))

(assert (=> b!40947 m!33405))

(declare-fun m!33867 () Bool)

(assert (=> b!40947 m!33867))

(assert (=> b!40947 m!33405))

(declare-fun m!33869 () Bool)

(assert (=> b!40947 m!33869))

(assert (=> b!40947 m!33869))

(declare-fun m!33871 () Bool)

(assert (=> b!40947 m!33871))

(assert (=> b!40949 m!33405))

(assert (=> b!40949 m!33869))

(assert (=> b!40949 m!33869))

(assert (=> b!40949 m!33871))

(assert (=> b!40530 d!7195))

(declare-fun d!7197 () Bool)

(assert (=> d!7197 (= (size!1394 lt!15461) (bvadd (_size!169 lt!15461) (bvsdiv (bvadd (extraKeys!1695 lt!15461) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!40622 d!7197))

(assert (=> d!7081 d!7085))

(declare-fun d!7199 () Bool)

(assert (=> d!7199 (arrayContainsKey!0 lt!15466 lt!15547 #b00000000000000000000000000000000)))

(assert (=> d!7199 true))

(declare-fun _$60!344 () Unit!983)

(assert (=> d!7199 (= (choose!13 lt!15466 lt!15547 #b00000000000000000000000000000000) _$60!344)))

(declare-fun bs!1722 () Bool)

(assert (= bs!1722 d!7199))

(assert (=> bs!1722 m!33333))

(assert (=> d!7081 d!7199))

(declare-fun d!7201 () Bool)

(assert (=> d!7201 (= (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40584 d!7201))

(declare-fun d!7203 () Bool)

(declare-fun e!25963 () Bool)

(assert (=> d!7203 e!25963))

(declare-fun res!24371 () Bool)

(assert (=> d!7203 (=> res!24371 e!25963)))

(declare-fun lt!15913 () Bool)

(assert (=> d!7203 (= res!24371 (not lt!15913))))

(declare-fun lt!15916 () Bool)

(assert (=> d!7203 (= lt!15913 lt!15916)))

(declare-fun lt!15915 () Unit!983)

(declare-fun e!25962 () Unit!983)

(assert (=> d!7203 (= lt!15915 e!25962)))

(declare-fun c!5083 () Bool)

(assert (=> d!7203 (= c!5083 lt!15916)))

(assert (=> d!7203 (= lt!15916 (containsKey!69 (toList!547 lt!15668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7203 (= (contains!514 lt!15668 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15913)))

(declare-fun b!40950 () Bool)

(declare-fun lt!15914 () Unit!983)

(assert (=> b!40950 (= e!25962 lt!15914)))

(assert (=> b!40950 (= lt!15914 (lemmaContainsKeyImpliesGetValueByKeyDefined!57 (toList!547 lt!15668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40950 (isDefined!58 (getValueByKey!102 (toList!547 lt!15668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40951 () Bool)

(declare-fun Unit!991 () Unit!983)

(assert (=> b!40951 (= e!25962 Unit!991)))

(declare-fun b!40952 () Bool)

(assert (=> b!40952 (= e!25963 (isDefined!58 (getValueByKey!102 (toList!547 lt!15668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7203 c!5083) b!40950))

(assert (= (and d!7203 (not c!5083)) b!40951))

(assert (= (and d!7203 (not res!24371)) b!40952))

(declare-fun m!33873 () Bool)

(assert (=> d!7203 m!33873))

(declare-fun m!33875 () Bool)

(assert (=> b!40950 m!33875))

(declare-fun m!33877 () Bool)

(assert (=> b!40950 m!33877))

(assert (=> b!40950 m!33877))

(declare-fun m!33879 () Bool)

(assert (=> b!40950 m!33879))

(assert (=> b!40952 m!33877))

(assert (=> b!40952 m!33877))

(assert (=> b!40952 m!33879))

(assert (=> bm!3162 d!7203))

(assert (=> b!40527 d!7201))

(declare-fun d!7205 () Bool)

(assert (=> d!7205 (arrayContainsKey!0 lt!15466 lt!15748 #b00000000000000000000000000000000)))

(declare-fun lt!15917 () Unit!983)

(assert (=> d!7205 (= lt!15917 (choose!13 lt!15466 lt!15748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!7205 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!7205 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15466 lt!15748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15917)))

(declare-fun bs!1723 () Bool)

(assert (= bs!1723 d!7205))

(assert (=> bs!1723 m!33539))

(declare-fun m!33881 () Bool)

(assert (=> bs!1723 m!33881))

(assert (=> b!40634 d!7205))

(declare-fun d!7207 () Bool)

(declare-fun res!24372 () Bool)

(declare-fun e!25964 () Bool)

(assert (=> d!7207 (=> res!24372 e!25964)))

(assert (=> d!7207 (= res!24372 (= (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15748))))

(assert (=> d!7207 (= (arrayContainsKey!0 lt!15466 lt!15748 #b00000000000000000000000000000000) e!25964)))

(declare-fun b!40953 () Bool)

(declare-fun e!25965 () Bool)

(assert (=> b!40953 (= e!25964 e!25965)))

(declare-fun res!24373 () Bool)

(assert (=> b!40953 (=> (not res!24373) (not e!25965))))

(assert (=> b!40953 (= res!24373 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(declare-fun b!40954 () Bool)

(assert (=> b!40954 (= e!25965 (arrayContainsKey!0 lt!15466 lt!15748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7207 (not res!24372)) b!40953))

(assert (= (and b!40953 res!24373) b!40954))

(assert (=> d!7207 m!33269))

(declare-fun m!33883 () Bool)

(assert (=> b!40954 m!33883))

(assert (=> b!40634 d!7207))

(declare-fun b!40955 () Bool)

(declare-fun e!25966 () SeekEntryResult!174)

(declare-fun lt!15918 () SeekEntryResult!174)

(assert (=> b!40955 (= e!25966 (MissingZero!174 (index!2820 lt!15918)))))

(declare-fun b!40956 () Bool)

(assert (=> b!40956 (= e!25966 (seekKeyOrZeroReturnVacant!0 (x!7721 lt!15918) (index!2820 lt!15918) (index!2820 lt!15918) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15466 mask!853))))

(declare-fun b!40957 () Bool)

(declare-fun c!5085 () Bool)

(declare-fun lt!15920 () (_ BitVec 64))

(assert (=> b!40957 (= c!5085 (= lt!15920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25968 () SeekEntryResult!174)

(assert (=> b!40957 (= e!25968 e!25966)))

(declare-fun d!7209 () Bool)

(declare-fun lt!15919 () SeekEntryResult!174)

(assert (=> d!7209 (and (or ((_ is Undefined!174) lt!15919) (not ((_ is Found!174) lt!15919)) (and (bvsge (index!2819 lt!15919) #b00000000000000000000000000000000) (bvslt (index!2819 lt!15919) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!15919) ((_ is Found!174) lt!15919) (not ((_ is MissingZero!174) lt!15919)) (and (bvsge (index!2818 lt!15919) #b00000000000000000000000000000000) (bvslt (index!2818 lt!15919) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!15919) ((_ is Found!174) lt!15919) ((_ is MissingZero!174) lt!15919) (not ((_ is MissingVacant!174) lt!15919)) (and (bvsge (index!2821 lt!15919) #b00000000000000000000000000000000) (bvslt (index!2821 lt!15919) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!15919) (ite ((_ is Found!174) lt!15919) (= (select (arr!1241 lt!15466) (index!2819 lt!15919)) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!174) lt!15919) (= (select (arr!1241 lt!15466) (index!2818 lt!15919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!174) lt!15919) (= (select (arr!1241 lt!15466) (index!2821 lt!15919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25967 () SeekEntryResult!174)

(assert (=> d!7209 (= lt!15919 e!25967)))

(declare-fun c!5086 () Bool)

(assert (=> d!7209 (= c!5086 (and ((_ is Intermediate!174) lt!15918) (undefined!986 lt!15918)))))

(assert (=> d!7209 (= lt!15918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15466 mask!853))))

(assert (=> d!7209 (validMask!0 mask!853)))

(assert (=> d!7209 (= (seekEntryOrOpen!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15466 mask!853) lt!15919)))

(declare-fun b!40958 () Bool)

(assert (=> b!40958 (= e!25968 (Found!174 (index!2820 lt!15918)))))

(declare-fun b!40959 () Bool)

(assert (=> b!40959 (= e!25967 e!25968)))

(assert (=> b!40959 (= lt!15920 (select (arr!1241 lt!15466) (index!2820 lt!15918)))))

(declare-fun c!5084 () Bool)

(assert (=> b!40959 (= c!5084 (= lt!15920 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40960 () Bool)

(assert (=> b!40960 (= e!25967 Undefined!174)))

(assert (= (and d!7209 c!5086) b!40960))

(assert (= (and d!7209 (not c!5086)) b!40959))

(assert (= (and b!40959 c!5084) b!40958))

(assert (= (and b!40959 (not c!5084)) b!40957))

(assert (= (and b!40957 c!5085) b!40955))

(assert (= (and b!40957 (not c!5085)) b!40956))

(assert (=> b!40956 m!33355))

(declare-fun m!33885 () Bool)

(assert (=> b!40956 m!33885))

(declare-fun m!33887 () Bool)

(assert (=> d!7209 m!33887))

(assert (=> d!7209 m!33355))

(declare-fun m!33889 () Bool)

(assert (=> d!7209 m!33889))

(declare-fun m!33891 () Bool)

(assert (=> d!7209 m!33891))

(assert (=> d!7209 m!33203))

(assert (=> d!7209 m!33355))

(assert (=> d!7209 m!33887))

(declare-fun m!33893 () Bool)

(assert (=> d!7209 m!33893))

(declare-fun m!33895 () Bool)

(assert (=> d!7209 m!33895))

(declare-fun m!33897 () Bool)

(assert (=> b!40959 m!33897))

(assert (=> b!40634 d!7209))

(assert (=> d!7063 d!6983))

(declare-fun b!40961 () Bool)

(declare-fun e!25970 () (_ BitVec 32))

(declare-fun call!3212 () (_ BitVec 32))

(assert (=> b!40961 (= e!25970 (bvadd #b00000000000000000000000000000001 call!3212))))

(declare-fun bm!3209 () Bool)

(assert (=> bm!3209 (= call!3212 (arrayCountValidKeys!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40962 () Bool)

(declare-fun e!25969 () (_ BitVec 32))

(assert (=> b!40962 (= e!25969 e!25970)))

(declare-fun c!5088 () Bool)

(assert (=> b!40962 (= c!5088 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40963 () Bool)

(assert (=> b!40963 (= e!25970 call!3212)))

(declare-fun d!7211 () Bool)

(declare-fun lt!15921 () (_ BitVec 32))

(assert (=> d!7211 (and (bvsge lt!15921 #b00000000000000000000000000000000) (bvsle lt!15921 (bvsub (size!1378 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!7211 (= lt!15921 e!25969)))

(declare-fun c!5087 () Bool)

(assert (=> d!7211 (= c!5087 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7211 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1378 lt!15466)))))

(assert (=> d!7211 (= (arrayCountValidKeys!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15921)))

(declare-fun b!40964 () Bool)

(assert (=> b!40964 (= e!25969 #b00000000000000000000000000000000)))

(assert (= (and d!7211 c!5087) b!40964))

(assert (= (and d!7211 (not c!5087)) b!40962))

(assert (= (and b!40962 c!5088) b!40961))

(assert (= (and b!40962 (not c!5088)) b!40963))

(assert (= (or b!40961 b!40963) bm!3209))

(declare-fun m!33899 () Bool)

(assert (=> bm!3209 m!33899))

(declare-fun m!33901 () Bool)

(assert (=> b!40962 m!33901))

(assert (=> b!40962 m!33901))

(declare-fun m!33903 () Bool)

(assert (=> b!40962 m!33903))

(assert (=> bm!3201 d!7211))

(declare-fun d!7213 () Bool)

(assert (=> d!7213 (= (validMask!0 (mask!5177 lt!15461)) (and (or (= (mask!5177 lt!15461) #b00000000000000000000000000000111) (= (mask!5177 lt!15461) #b00000000000000000000000000001111) (= (mask!5177 lt!15461) #b00000000000000000000000000011111) (= (mask!5177 lt!15461) #b00000000000000000000000000111111) (= (mask!5177 lt!15461) #b00000000000000000000000001111111) (= (mask!5177 lt!15461) #b00000000000000000000000011111111) (= (mask!5177 lt!15461) #b00000000000000000000000111111111) (= (mask!5177 lt!15461) #b00000000000000000000001111111111) (= (mask!5177 lt!15461) #b00000000000000000000011111111111) (= (mask!5177 lt!15461) #b00000000000000000000111111111111) (= (mask!5177 lt!15461) #b00000000000000000001111111111111) (= (mask!5177 lt!15461) #b00000000000000000011111111111111) (= (mask!5177 lt!15461) #b00000000000000000111111111111111) (= (mask!5177 lt!15461) #b00000000000000001111111111111111) (= (mask!5177 lt!15461) #b00000000000000011111111111111111) (= (mask!5177 lt!15461) #b00000000000000111111111111111111) (= (mask!5177 lt!15461) #b00000000000001111111111111111111) (= (mask!5177 lt!15461) #b00000000000011111111111111111111) (= (mask!5177 lt!15461) #b00000000000111111111111111111111) (= (mask!5177 lt!15461) #b00000000001111111111111111111111) (= (mask!5177 lt!15461) #b00000000011111111111111111111111) (= (mask!5177 lt!15461) #b00000000111111111111111111111111) (= (mask!5177 lt!15461) #b00000001111111111111111111111111) (= (mask!5177 lt!15461) #b00000011111111111111111111111111) (= (mask!5177 lt!15461) #b00000111111111111111111111111111) (= (mask!5177 lt!15461) #b00001111111111111111111111111111) (= (mask!5177 lt!15461) #b00011111111111111111111111111111) (= (mask!5177 lt!15461) #b00111111111111111111111111111111)) (bvsle (mask!5177 lt!15461) #b00111111111111111111111111111111)))))

(assert (=> d!7067 d!7213))

(assert (=> d!7105 d!6993))

(declare-fun d!7215 () Bool)

(declare-fun lt!15922 () Bool)

(assert (=> d!7215 (= lt!15922 (select (content!31 Nil!1052) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun e!25972 () Bool)

(assert (=> d!7215 (= lt!15922 e!25972)))

(declare-fun res!24374 () Bool)

(assert (=> d!7215 (=> (not res!24374) (not e!25972))))

(assert (=> d!7215 (= res!24374 ((_ is Cons!1051) Nil!1052))))

(assert (=> d!7215 (= (contains!512 Nil!1052 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) lt!15922)))

(declare-fun b!40965 () Bool)

(declare-fun e!25971 () Bool)

(assert (=> b!40965 (= e!25972 e!25971)))

(declare-fun res!24375 () Bool)

(assert (=> b!40965 (=> res!24375 e!25971)))

(assert (=> b!40965 (= res!24375 (= (h!1625 Nil!1052) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!40966 () Bool)

(assert (=> b!40966 (= e!25971 (contains!512 (t!3910 Nil!1052) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (= (and d!7215 res!24374) b!40965))

(assert (= (and b!40965 (not res!24375)) b!40966))

(assert (=> d!7215 m!33667))

(assert (=> d!7215 m!33405))

(declare-fun m!33905 () Bool)

(assert (=> d!7215 m!33905))

(assert (=> b!40966 m!33405))

(declare-fun m!33907 () Bool)

(assert (=> b!40966 m!33907))

(assert (=> b!40581 d!7215))

(declare-fun d!7217 () Bool)

(declare-fun get!705 (Option!108) V!2099)

(assert (=> d!7217 (= (apply!55 lt!15668 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) (get!705 (getValueByKey!102 (toList!547 lt!15668) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))))

(declare-fun bs!1724 () Bool)

(assert (= bs!1724 d!7217))

(assert (=> bs!1724 m!33405))

(assert (=> bs!1724 m!33869))

(assert (=> bs!1724 m!33869))

(declare-fun m!33909 () Bool)

(assert (=> bs!1724 m!33909))

(assert (=> b!40540 d!7217))

(declare-fun d!7219 () Bool)

(declare-fun c!5095 () Bool)

(assert (=> d!7219 (= c!5095 ((_ is ValueCellFull!630) (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun e!25981 () V!2099)

(assert (=> d!7219 (= (get!702 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000)) e!25981)))

(declare-fun b!40981 () Bool)

(declare-fun get!706 (ValueCell!630 V!2099) V!2099)

(assert (=> b!40981 (= e!25981 (get!706 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40982 () Bool)

(declare-fun get!707 (ValueCell!630 V!2099) V!2099)

(assert (=> b!40982 (= e!25981 (get!707 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7219 c!5095) b!40981))

(assert (= (and d!7219 (not c!5095)) b!40982))

(assert (=> b!40981 m!33449))

(assert (=> b!40981 m!33451))

(declare-fun m!33911 () Bool)

(assert (=> b!40981 m!33911))

(assert (=> b!40982 m!33449))

(assert (=> b!40982 m!33451))

(declare-fun m!33913 () Bool)

(assert (=> b!40982 m!33913))

(assert (=> b!40540 d!7219))

(declare-fun d!7221 () Bool)

(assert (=> d!7221 (= (apply!55 lt!15668 #b0000000000000000000000000000000000000000000000000000000000000000) (get!705 (getValueByKey!102 (toList!547 lt!15668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1725 () Bool)

(assert (= bs!1725 d!7221))

(declare-fun m!33915 () Bool)

(assert (=> bs!1725 m!33915))

(assert (=> bs!1725 m!33915))

(declare-fun m!33917 () Bool)

(assert (=> bs!1725 m!33917))

(assert (=> b!40524 d!7221))

(declare-fun d!7223 () Bool)

(declare-fun res!24384 () Bool)

(declare-fun e!25990 () Bool)

(assert (=> d!7223 (=> res!24384 e!25990)))

(assert (=> d!7223 (= res!24384 (= (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15547))))

(assert (=> d!7223 (= (arrayContainsKey!0 lt!15466 lt!15547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25990)))

(declare-fun b!40997 () Bool)

(declare-fun e!25991 () Bool)

(assert (=> b!40997 (= e!25990 e!25991)))

(declare-fun res!24385 () Bool)

(assert (=> b!40997 (=> (not res!24385) (not e!25991))))

(assert (=> b!40997 (= res!24385 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(declare-fun b!40998 () Bool)

(assert (=> b!40998 (= e!25991 (arrayContainsKey!0 lt!15466 lt!15547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!7223 (not res!24384)) b!40997))

(assert (= (and b!40997 res!24385) b!40998))

(assert (=> d!7223 m!33355))

(declare-fun m!33919 () Bool)

(assert (=> b!40998 m!33919))

(assert (=> b!40652 d!7223))

(assert (=> b!40582 d!7201))

(declare-fun b!40999 () Bool)

(declare-fun e!25994 () Bool)

(declare-fun call!3215 () Bool)

(assert (=> b!40999 (= e!25994 call!3215)))

(declare-fun b!41000 () Bool)

(declare-fun e!25995 () Bool)

(assert (=> b!41000 (= e!25995 (contains!512 (ite c!4982 (Cons!1051 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) Nil!1052) Nil!1052) (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41001 () Bool)

(declare-fun e!25993 () Bool)

(assert (=> b!41001 (= e!25993 e!25994)))

(declare-fun c!5100 () Bool)

(assert (=> b!41001 (= c!5100 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41002 () Bool)

(assert (=> b!41002 (= e!25994 call!3215)))

(declare-fun b!41003 () Bool)

(declare-fun e!25992 () Bool)

(assert (=> b!41003 (= e!25992 e!25993)))

(declare-fun res!24387 () Bool)

(assert (=> b!41003 (=> (not res!24387) (not e!25993))))

(assert (=> b!41003 (= res!24387 (not e!25995))))

(declare-fun res!24386 () Bool)

(assert (=> b!41003 (=> (not res!24386) (not e!25995))))

(assert (=> b!41003 (= res!24386 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7225 () Bool)

(declare-fun res!24388 () Bool)

(assert (=> d!7225 (=> res!24388 e!25992)))

(assert (=> d!7225 (= res!24388 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7225 (= (arrayNoDuplicates!0 (_keys!3293 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4982 (Cons!1051 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) e!25992)))

(declare-fun bm!3212 () Bool)

(assert (=> bm!3212 (= call!3215 (arrayNoDuplicates!0 (_keys!3293 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5100 (Cons!1051 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4982 (Cons!1051 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (ite c!4982 (Cons!1051 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) Nil!1052) Nil!1052))))))

(assert (= (and d!7225 (not res!24388)) b!41003))

(assert (= (and b!41003 res!24386) b!41000))

(assert (= (and b!41003 res!24387) b!41001))

(assert (= (and b!41001 c!5100) b!40999))

(assert (= (and b!41001 (not c!5100)) b!41002))

(assert (= (or b!40999 b!41002) bm!3212))

(declare-fun m!33921 () Bool)

(assert (=> b!41000 m!33921))

(assert (=> b!41000 m!33921))

(declare-fun m!33923 () Bool)

(assert (=> b!41000 m!33923))

(assert (=> b!41001 m!33921))

(assert (=> b!41001 m!33921))

(declare-fun m!33925 () Bool)

(assert (=> b!41001 m!33925))

(assert (=> b!41003 m!33921))

(assert (=> b!41003 m!33921))

(assert (=> b!41003 m!33925))

(assert (=> bm!3212 m!33921))

(declare-fun m!33927 () Bool)

(assert (=> bm!3212 m!33927))

(assert (=> bm!3174 d!7225))

(declare-fun d!7227 () Bool)

(assert (=> d!7227 (= (apply!55 lt!15651 lt!15658) (get!705 (getValueByKey!102 (toList!547 lt!15651) lt!15658)))))

(declare-fun bs!1726 () Bool)

(assert (= bs!1726 d!7227))

(declare-fun m!33929 () Bool)

(assert (=> bs!1726 m!33929))

(assert (=> bs!1726 m!33929))

(declare-fun m!33931 () Bool)

(assert (=> bs!1726 m!33931))

(assert (=> b!40538 d!7227))

(declare-fun b!41072 () Bool)

(declare-fun e!26040 () Bool)

(assert (=> b!41072 (= e!26040 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (=> b!41072 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!41073 () Bool)

(declare-fun e!26039 () Bool)

(declare-fun e!26038 () Bool)

(assert (=> b!41073 (= e!26039 e!26038)))

(assert (=> b!41073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(declare-fun res!24419 () Bool)

(declare-fun lt!15992 () ListLongMap!1063)

(assert (=> b!41073 (= res!24419 (contains!514 lt!15992 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (=> b!41073 (=> (not res!24419) (not e!26038))))

(declare-fun b!41074 () Bool)

(declare-fun e!26042 () Bool)

(assert (=> b!41074 (= e!26042 (= lt!15992 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1804 lt!15461))))))

(declare-fun b!41075 () Bool)

(declare-fun res!24416 () Bool)

(declare-fun e!26041 () Bool)

(assert (=> b!41075 (=> (not res!24416) (not e!26041))))

(assert (=> b!41075 (= res!24416 (not (contains!514 lt!15992 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!41076 () Bool)

(declare-fun isEmpty!232 (ListLongMap!1063) Bool)

(assert (=> b!41076 (= e!26042 (isEmpty!232 lt!15992))))

(declare-fun b!41077 () Bool)

(assert (=> b!41077 (= e!26041 e!26039)))

(declare-fun c!5121 () Bool)

(assert (=> b!41077 (= c!5121 e!26040)))

(declare-fun res!24417 () Bool)

(assert (=> b!41077 (=> (not res!24417) (not e!26040))))

(assert (=> b!41077 (= res!24417 (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!41078 () Bool)

(assert (=> b!41078 (= e!26039 e!26042)))

(declare-fun c!5122 () Bool)

(assert (=> b!41078 (= c!5122 (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!41079 () Bool)

(declare-fun e!26036 () ListLongMap!1063)

(declare-fun call!3220 () ListLongMap!1063)

(assert (=> b!41079 (= e!26036 call!3220)))

(declare-fun d!7229 () Bool)

(assert (=> d!7229 e!26041))

(declare-fun res!24418 () Bool)

(assert (=> d!7229 (=> (not res!24418) (not e!26041))))

(assert (=> d!7229 (= res!24418 (not (contains!514 lt!15992 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!26037 () ListLongMap!1063)

(assert (=> d!7229 (= lt!15992 e!26037)))

(declare-fun c!5120 () Bool)

(assert (=> d!7229 (= c!5120 (bvsge #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7229 (validMask!0 (mask!5177 lt!15461))))

(assert (=> d!7229 (= (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) #b00000000000000000000000000000000 (defaultEntry!1804 lt!15461)) lt!15992)))

(declare-fun b!41071 () Bool)

(assert (=> b!41071 (= e!26037 (ListLongMap!1064 Nil!1051))))

(declare-fun bm!3217 () Bool)

(assert (=> bm!3217 (= call!3220 (getCurrentListMapNoExtraKeys!33 (_keys!3293 lt!15461) (_values!1787 lt!15461) (mask!5177 lt!15461) (extraKeys!1695 lt!15461) (zeroValue!1722 lt!15461) (minValue!1722 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1804 lt!15461)))))

(declare-fun b!41080 () Bool)

(assert (=> b!41080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1378 (_keys!3293 lt!15461))))))

(assert (=> b!41080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1379 (_values!1787 lt!15461))))))

(assert (=> b!41080 (= e!26038 (= (apply!55 lt!15992 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) (get!702 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!41081 () Bool)

(declare-fun lt!15991 () Unit!983)

(declare-fun lt!15994 () Unit!983)

(assert (=> b!41081 (= lt!15991 lt!15994)))

(declare-fun lt!15990 () ListLongMap!1063)

(declare-fun lt!15988 () (_ BitVec 64))

(declare-fun lt!15993 () V!2099)

(declare-fun lt!15989 () (_ BitVec 64))

(assert (=> b!41081 (not (contains!514 (+!64 lt!15990 (tuple2!1487 lt!15989 lt!15993)) lt!15988))))

(declare-fun addStillNotContains!7 (ListLongMap!1063 (_ BitVec 64) V!2099 (_ BitVec 64)) Unit!983)

(assert (=> b!41081 (= lt!15994 (addStillNotContains!7 lt!15990 lt!15989 lt!15993 lt!15988))))

(assert (=> b!41081 (= lt!15988 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!41081 (= lt!15993 (get!702 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41081 (= lt!15989 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000))))

(assert (=> b!41081 (= lt!15990 call!3220)))

(assert (=> b!41081 (= e!26036 (+!64 call!3220 (tuple2!1487 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) (get!702 (select (arr!1242 (_values!1787 lt!15461)) #b00000000000000000000000000000000) (dynLambda!191 (defaultEntry!1804 lt!15461) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!41082 () Bool)

(assert (=> b!41082 (= e!26037 e!26036)))

(declare-fun c!5123 () Bool)

(assert (=> b!41082 (= c!5123 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(assert (= (and d!7229 c!5120) b!41071))

(assert (= (and d!7229 (not c!5120)) b!41082))

(assert (= (and b!41082 c!5123) b!41081))

(assert (= (and b!41082 (not c!5123)) b!41079))

(assert (= (or b!41081 b!41079) bm!3217))

(assert (= (and d!7229 res!24418) b!41075))

(assert (= (and b!41075 res!24416) b!41077))

(assert (= (and b!41077 res!24417) b!41072))

(assert (= (and b!41077 c!5121) b!41073))

(assert (= (and b!41077 (not c!5121)) b!41078))

(assert (= (and b!41073 res!24419) b!41080))

(assert (= (and b!41078 c!5122) b!41074))

(assert (= (and b!41078 (not c!5122)) b!41076))

(declare-fun b_lambda!2081 () Bool)

(assert (=> (not b_lambda!2081) (not b!41080)))

(assert (=> b!41080 t!3916))

(declare-fun b_and!2379 () Bool)

(assert (= b_and!2369 (and (=> t!3916 result!1447) b_and!2379)))

(declare-fun b_lambda!2083 () Bool)

(assert (=> (not b_lambda!2083) (not b!41081)))

(assert (=> b!41081 t!3916))

(declare-fun b_and!2381 () Bool)

(assert (= b_and!2379 (and (=> t!3916 result!1447) b_and!2381)))

(declare-fun m!34053 () Bool)

(assert (=> b!41074 m!34053))

(assert (=> bm!3217 m!34053))

(assert (=> b!41081 m!33451))

(declare-fun m!34055 () Bool)

(assert (=> b!41081 m!34055))

(assert (=> b!41081 m!33449))

(assert (=> b!41081 m!33451))

(assert (=> b!41081 m!33453))

(assert (=> b!41081 m!33449))

(declare-fun m!34057 () Bool)

(assert (=> b!41081 m!34057))

(assert (=> b!41081 m!34055))

(declare-fun m!34059 () Bool)

(assert (=> b!41081 m!34059))

(assert (=> b!41081 m!33405))

(declare-fun m!34061 () Bool)

(assert (=> b!41081 m!34061))

(declare-fun m!34063 () Bool)

(assert (=> b!41076 m!34063))

(declare-fun m!34065 () Bool)

(assert (=> b!41075 m!34065))

(assert (=> b!41073 m!33405))

(assert (=> b!41073 m!33405))

(declare-fun m!34067 () Bool)

(assert (=> b!41073 m!34067))

(assert (=> b!41082 m!33405))

(assert (=> b!41082 m!33405))

(assert (=> b!41082 m!33409))

(declare-fun m!34069 () Bool)

(assert (=> d!7229 m!34069))

(assert (=> d!7229 m!33447))

(assert (=> b!41080 m!33451))

(assert (=> b!41080 m!33449))

(assert (=> b!41080 m!33405))

(assert (=> b!41080 m!33449))

(assert (=> b!41080 m!33451))

(assert (=> b!41080 m!33453))

(assert (=> b!41080 m!33405))

(declare-fun m!34071 () Bool)

(assert (=> b!41080 m!34071))

(assert (=> b!41072 m!33405))

(assert (=> b!41072 m!33405))

(assert (=> b!41072 m!33409))

(assert (=> b!40538 d!7229))

(declare-fun d!7273 () Bool)

(declare-fun e!26045 () Bool)

(assert (=> d!7273 e!26045))

(declare-fun res!24425 () Bool)

(assert (=> d!7273 (=> (not res!24425) (not e!26045))))

(declare-fun lt!16005 () ListLongMap!1063)

(assert (=> d!7273 (= res!24425 (contains!514 lt!16005 (_1!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))))))

(declare-fun lt!16003 () List!1054)

(assert (=> d!7273 (= lt!16005 (ListLongMap!1064 lt!16003))))

(declare-fun lt!16006 () Unit!983)

(declare-fun lt!16004 () Unit!983)

(assert (=> d!7273 (= lt!16006 lt!16004)))

(assert (=> d!7273 (= (getValueByKey!102 lt!16003 (_1!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!26 (List!1054 (_ BitVec 64) V!2099) Unit!983)

(assert (=> d!7273 (= lt!16004 (lemmaContainsTupThenGetReturnValue!26 lt!16003 (_1!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))))))

(declare-fun insertStrictlySorted!23 (List!1054 (_ BitVec 64) V!2099) List!1054)

(assert (=> d!7273 (= lt!16003 (insertStrictlySorted!23 (toList!547 lt!15654) (_1!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))))))

(assert (=> d!7273 (= (+!64 lt!15654 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))) lt!16005)))

(declare-fun b!41087 () Bool)

(declare-fun res!24424 () Bool)

(assert (=> b!41087 (=> (not res!24424) (not e!26045))))

(assert (=> b!41087 (= res!24424 (= (getValueByKey!102 (toList!547 lt!16005) (_1!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))))))))

(declare-fun b!41088 () Bool)

(declare-fun contains!518 (List!1054 tuple2!1486) Bool)

(assert (=> b!41088 (= e!26045 (contains!518 (toList!547 lt!16005) (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))))))

(assert (= (and d!7273 res!24425) b!41087))

(assert (= (and b!41087 res!24424) b!41088))

(declare-fun m!34073 () Bool)

(assert (=> d!7273 m!34073))

(declare-fun m!34075 () Bool)

(assert (=> d!7273 m!34075))

(declare-fun m!34077 () Bool)

(assert (=> d!7273 m!34077))

(declare-fun m!34079 () Bool)

(assert (=> d!7273 m!34079))

(declare-fun m!34081 () Bool)

(assert (=> b!41087 m!34081))

(declare-fun m!34083 () Bool)

(assert (=> b!41088 m!34083))

(assert (=> b!40538 d!7273))

(declare-fun d!7275 () Bool)

(assert (=> d!7275 (= (apply!55 (+!64 lt!15654 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))) lt!15663) (get!705 (getValueByKey!102 (toList!547 (+!64 lt!15654 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461)))) lt!15663)))))

(declare-fun bs!1735 () Bool)

(assert (= bs!1735 d!7275))

(declare-fun m!34085 () Bool)

(assert (=> bs!1735 m!34085))

(assert (=> bs!1735 m!34085))

(declare-fun m!34087 () Bool)

(assert (=> bs!1735 m!34087))

(assert (=> b!40538 d!7275))

(declare-fun d!7277 () Bool)

(assert (=> d!7277 (= (apply!55 lt!15654 lt!15663) (get!705 (getValueByKey!102 (toList!547 lt!15654) lt!15663)))))

(declare-fun bs!1736 () Bool)

(assert (= bs!1736 d!7277))

(declare-fun m!34089 () Bool)

(assert (=> bs!1736 m!34089))

(assert (=> bs!1736 m!34089))

(declare-fun m!34091 () Bool)

(assert (=> bs!1736 m!34091))

(assert (=> b!40538 d!7277))

(declare-fun d!7279 () Bool)

(assert (=> d!7279 (= (apply!55 (+!64 lt!15654 (tuple2!1487 lt!15665 (zeroValue!1722 lt!15461))) lt!15663) (apply!55 lt!15654 lt!15663))))

(declare-fun lt!16009 () Unit!983)

(declare-fun choose!246 (ListLongMap!1063 (_ BitVec 64) V!2099 (_ BitVec 64)) Unit!983)

(assert (=> d!7279 (= lt!16009 (choose!246 lt!15654 lt!15665 (zeroValue!1722 lt!15461) lt!15663))))

(declare-fun e!26048 () Bool)

(assert (=> d!7279 e!26048))

(declare-fun res!24428 () Bool)

(assert (=> d!7279 (=> (not res!24428) (not e!26048))))

(assert (=> d!7279 (= res!24428 (contains!514 lt!15654 lt!15663))))

(assert (=> d!7279 (= (addApplyDifferent!32 lt!15654 lt!15665 (zeroValue!1722 lt!15461) lt!15663) lt!16009)))

(declare-fun b!41092 () Bool)

(assert (=> b!41092 (= e!26048 (not (= lt!15663 lt!15665)))))

(assert (= (and d!7279 res!24428) b!41092))

(assert (=> d!7279 m!33421))

(assert (=> d!7279 m!33421))

(assert (=> d!7279 m!33443))

(declare-fun m!34093 () Bool)

(assert (=> d!7279 m!34093))

(declare-fun m!34095 () Bool)

(assert (=> d!7279 m!34095))

(assert (=> d!7279 m!33429))

(assert (=> b!40538 d!7279))

(declare-fun d!7281 () Bool)

(assert (=> d!7281 (= (apply!55 lt!15656 lt!15670) (get!705 (getValueByKey!102 (toList!547 lt!15656) lt!15670)))))

(declare-fun bs!1737 () Bool)

(assert (= bs!1737 d!7281))

(declare-fun m!34097 () Bool)

(assert (=> bs!1737 m!34097))

(assert (=> bs!1737 m!34097))

(declare-fun m!34099 () Bool)

(assert (=> bs!1737 m!34099))

(assert (=> b!40538 d!7281))

(declare-fun d!7283 () Bool)

(assert (=> d!7283 (= (apply!55 (+!64 lt!15651 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))) lt!15658) (apply!55 lt!15651 lt!15658))))

(declare-fun lt!16010 () Unit!983)

(assert (=> d!7283 (= lt!16010 (choose!246 lt!15651 lt!15664 (minValue!1722 lt!15461) lt!15658))))

(declare-fun e!26049 () Bool)

(assert (=> d!7283 e!26049))

(declare-fun res!24429 () Bool)

(assert (=> d!7283 (=> (not res!24429) (not e!26049))))

(assert (=> d!7283 (= res!24429 (contains!514 lt!15651 lt!15658))))

(assert (=> d!7283 (= (addApplyDifferent!32 lt!15651 lt!15664 (minValue!1722 lt!15461) lt!15658) lt!16010)))

(declare-fun b!41093 () Bool)

(assert (=> b!41093 (= e!26049 (not (= lt!15658 lt!15664)))))

(assert (= (and d!7283 res!24429) b!41093))

(assert (=> d!7283 m!33417))

(assert (=> d!7283 m!33417))

(assert (=> d!7283 m!33419))

(declare-fun m!34101 () Bool)

(assert (=> d!7283 m!34101))

(declare-fun m!34103 () Bool)

(assert (=> d!7283 m!34103))

(assert (=> d!7283 m!33423))

(assert (=> b!40538 d!7283))

(declare-fun d!7285 () Bool)

(assert (=> d!7285 (contains!514 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))) lt!15659)))

(declare-fun lt!16013 () Unit!983)

(declare-fun choose!248 (ListLongMap!1063 (_ BitVec 64) V!2099 (_ BitVec 64)) Unit!983)

(assert (=> d!7285 (= lt!16013 (choose!248 lt!15666 lt!15671 (zeroValue!1722 lt!15461) lt!15659))))

(assert (=> d!7285 (contains!514 lt!15666 lt!15659)))

(assert (=> d!7285 (= (addStillContains!32 lt!15666 lt!15671 (zeroValue!1722 lt!15461) lt!15659) lt!16013)))

(declare-fun bs!1738 () Bool)

(assert (= bs!1738 d!7285))

(assert (=> bs!1738 m!33433))

(assert (=> bs!1738 m!33433))

(assert (=> bs!1738 m!33445))

(declare-fun m!34105 () Bool)

(assert (=> bs!1738 m!34105))

(declare-fun m!34107 () Bool)

(assert (=> bs!1738 m!34107))

(assert (=> b!40538 d!7285))

(declare-fun d!7287 () Bool)

(declare-fun e!26050 () Bool)

(assert (=> d!7287 e!26050))

(declare-fun res!24431 () Bool)

(assert (=> d!7287 (=> (not res!24431) (not e!26050))))

(declare-fun lt!16016 () ListLongMap!1063)

(assert (=> d!7287 (= res!24431 (contains!514 lt!16016 (_1!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))))))

(declare-fun lt!16014 () List!1054)

(assert (=> d!7287 (= lt!16016 (ListLongMap!1064 lt!16014))))

(declare-fun lt!16017 () Unit!983)

(declare-fun lt!16015 () Unit!983)

(assert (=> d!7287 (= lt!16017 lt!16015)))

(assert (=> d!7287 (= (getValueByKey!102 lt!16014 (_1!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))))))

(assert (=> d!7287 (= lt!16015 (lemmaContainsTupThenGetReturnValue!26 lt!16014 (_1!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))))))

(assert (=> d!7287 (= lt!16014 (insertStrictlySorted!23 (toList!547 lt!15666) (_1!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))))))

(assert (=> d!7287 (= (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))) lt!16016)))

(declare-fun b!41095 () Bool)

(declare-fun res!24430 () Bool)

(assert (=> b!41095 (=> (not res!24430) (not e!26050))))

(assert (=> b!41095 (= res!24430 (= (getValueByKey!102 (toList!547 lt!16016) (_1!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))))))))

(declare-fun b!41096 () Bool)

(assert (=> b!41096 (= e!26050 (contains!518 (toList!547 lt!16016) (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))))))

(assert (= (and d!7287 res!24431) b!41095))

(assert (= (and b!41095 res!24430) b!41096))

(declare-fun m!34109 () Bool)

(assert (=> d!7287 m!34109))

(declare-fun m!34111 () Bool)

(assert (=> d!7287 m!34111))

(declare-fun m!34113 () Bool)

(assert (=> d!7287 m!34113))

(declare-fun m!34115 () Bool)

(assert (=> d!7287 m!34115))

(declare-fun m!34117 () Bool)

(assert (=> b!41095 m!34117))

(declare-fun m!34119 () Bool)

(assert (=> b!41096 m!34119))

(assert (=> b!40538 d!7287))

(declare-fun d!7289 () Bool)

(declare-fun e!26051 () Bool)

(assert (=> d!7289 e!26051))

(declare-fun res!24433 () Bool)

(assert (=> d!7289 (=> (not res!24433) (not e!26051))))

(declare-fun lt!16020 () ListLongMap!1063)

(assert (=> d!7289 (= res!24433 (contains!514 lt!16020 (_1!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))))))

(declare-fun lt!16018 () List!1054)

(assert (=> d!7289 (= lt!16020 (ListLongMap!1064 lt!16018))))

(declare-fun lt!16021 () Unit!983)

(declare-fun lt!16019 () Unit!983)

(assert (=> d!7289 (= lt!16021 lt!16019)))

(assert (=> d!7289 (= (getValueByKey!102 lt!16018 (_1!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))))))

(assert (=> d!7289 (= lt!16019 (lemmaContainsTupThenGetReturnValue!26 lt!16018 (_1!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))))))

(assert (=> d!7289 (= lt!16018 (insertStrictlySorted!23 (toList!547 lt!15656) (_1!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))))))

(assert (=> d!7289 (= (+!64 lt!15656 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))) lt!16020)))

(declare-fun b!41097 () Bool)

(declare-fun res!24432 () Bool)

(assert (=> b!41097 (=> (not res!24432) (not e!26051))))

(assert (=> b!41097 (= res!24432 (= (getValueByKey!102 (toList!547 lt!16020) (_1!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))))))))

(declare-fun b!41098 () Bool)

(assert (=> b!41098 (= e!26051 (contains!518 (toList!547 lt!16020) (tuple2!1487 lt!15655 (minValue!1722 lt!15461))))))

(assert (= (and d!7289 res!24433) b!41097))

(assert (= (and b!41097 res!24432) b!41098))

(declare-fun m!34121 () Bool)

(assert (=> d!7289 m!34121))

(declare-fun m!34123 () Bool)

(assert (=> d!7289 m!34123))

(declare-fun m!34125 () Bool)

(assert (=> d!7289 m!34125))

(declare-fun m!34127 () Bool)

(assert (=> d!7289 m!34127))

(declare-fun m!34129 () Bool)

(assert (=> b!41097 m!34129))

(declare-fun m!34131 () Bool)

(assert (=> b!41098 m!34131))

(assert (=> b!40538 d!7289))

(declare-fun d!7291 () Bool)

(declare-fun e!26053 () Bool)

(assert (=> d!7291 e!26053))

(declare-fun res!24434 () Bool)

(assert (=> d!7291 (=> res!24434 e!26053)))

(declare-fun lt!16022 () Bool)

(assert (=> d!7291 (= res!24434 (not lt!16022))))

(declare-fun lt!16025 () Bool)

(assert (=> d!7291 (= lt!16022 lt!16025)))

(declare-fun lt!16024 () Unit!983)

(declare-fun e!26052 () Unit!983)

(assert (=> d!7291 (= lt!16024 e!26052)))

(declare-fun c!5124 () Bool)

(assert (=> d!7291 (= c!5124 lt!16025)))

(assert (=> d!7291 (= lt!16025 (containsKey!69 (toList!547 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))) lt!15659))))

(assert (=> d!7291 (= (contains!514 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461))) lt!15659) lt!16022)))

(declare-fun b!41099 () Bool)

(declare-fun lt!16023 () Unit!983)

(assert (=> b!41099 (= e!26052 lt!16023)))

(assert (=> b!41099 (= lt!16023 (lemmaContainsKeyImpliesGetValueByKeyDefined!57 (toList!547 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))) lt!15659))))

(assert (=> b!41099 (isDefined!58 (getValueByKey!102 (toList!547 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))) lt!15659))))

(declare-fun b!41100 () Bool)

(declare-fun Unit!994 () Unit!983)

(assert (=> b!41100 (= e!26052 Unit!994)))

(declare-fun b!41101 () Bool)

(assert (=> b!41101 (= e!26053 (isDefined!58 (getValueByKey!102 (toList!547 (+!64 lt!15666 (tuple2!1487 lt!15671 (zeroValue!1722 lt!15461)))) lt!15659)))))

(assert (= (and d!7291 c!5124) b!41099))

(assert (= (and d!7291 (not c!5124)) b!41100))

(assert (= (and d!7291 (not res!24434)) b!41101))

(declare-fun m!34133 () Bool)

(assert (=> d!7291 m!34133))

(declare-fun m!34135 () Bool)

(assert (=> b!41099 m!34135))

(declare-fun m!34137 () Bool)

(assert (=> b!41099 m!34137))

(assert (=> b!41099 m!34137))

(declare-fun m!34139 () Bool)

(assert (=> b!41099 m!34139))

(assert (=> b!41101 m!34137))

(assert (=> b!41101 m!34137))

(assert (=> b!41101 m!34139))

(assert (=> b!40538 d!7291))

(declare-fun d!7293 () Bool)

(assert (=> d!7293 (= (apply!55 (+!64 lt!15651 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))) lt!15658) (get!705 (getValueByKey!102 (toList!547 (+!64 lt!15651 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))) lt!15658)))))

(declare-fun bs!1739 () Bool)

(assert (= bs!1739 d!7293))

(declare-fun m!34141 () Bool)

(assert (=> bs!1739 m!34141))

(assert (=> bs!1739 m!34141))

(declare-fun m!34143 () Bool)

(assert (=> bs!1739 m!34143))

(assert (=> b!40538 d!7293))

(declare-fun d!7295 () Bool)

(assert (=> d!7295 (= (apply!55 (+!64 lt!15656 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))) lt!15670) (apply!55 lt!15656 lt!15670))))

(declare-fun lt!16036 () Unit!983)

(assert (=> d!7295 (= lt!16036 (choose!246 lt!15656 lt!15655 (minValue!1722 lt!15461) lt!15670))))

(declare-fun e!26058 () Bool)

(assert (=> d!7295 e!26058))

(declare-fun res!24435 () Bool)

(assert (=> d!7295 (=> (not res!24435) (not e!26058))))

(assert (=> d!7295 (= res!24435 (contains!514 lt!15656 lt!15670))))

(assert (=> d!7295 (= (addApplyDifferent!32 lt!15656 lt!15655 (minValue!1722 lt!15461) lt!15670) lt!16036)))

(declare-fun b!41110 () Bool)

(assert (=> b!41110 (= e!26058 (not (= lt!15670 lt!15655)))))

(assert (= (and d!7295 res!24435) b!41110))

(assert (=> d!7295 m!33427))

(assert (=> d!7295 m!33427))

(assert (=> d!7295 m!33439))

(declare-fun m!34145 () Bool)

(assert (=> d!7295 m!34145))

(declare-fun m!34147 () Bool)

(assert (=> d!7295 m!34147))

(assert (=> d!7295 m!33425))

(assert (=> b!40538 d!7295))

(declare-fun d!7297 () Bool)

(assert (=> d!7297 (= (apply!55 (+!64 lt!15656 (tuple2!1487 lt!15655 (minValue!1722 lt!15461))) lt!15670) (get!705 (getValueByKey!102 (toList!547 (+!64 lt!15656 (tuple2!1487 lt!15655 (minValue!1722 lt!15461)))) lt!15670)))))

(declare-fun bs!1740 () Bool)

(assert (= bs!1740 d!7297))

(declare-fun m!34149 () Bool)

(assert (=> bs!1740 m!34149))

(assert (=> bs!1740 m!34149))

(declare-fun m!34151 () Bool)

(assert (=> bs!1740 m!34151))

(assert (=> b!40538 d!7297))

(declare-fun d!7299 () Bool)

(declare-fun e!26059 () Bool)

(assert (=> d!7299 e!26059))

(declare-fun res!24437 () Bool)

(assert (=> d!7299 (=> (not res!24437) (not e!26059))))

(declare-fun lt!16043 () ListLongMap!1063)

(assert (=> d!7299 (= res!24437 (contains!514 lt!16043 (_1!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))))))

(declare-fun lt!16041 () List!1054)

(assert (=> d!7299 (= lt!16043 (ListLongMap!1064 lt!16041))))

(declare-fun lt!16044 () Unit!983)

(declare-fun lt!16042 () Unit!983)

(assert (=> d!7299 (= lt!16044 lt!16042)))

(assert (=> d!7299 (= (getValueByKey!102 lt!16041 (_1!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))))))

(assert (=> d!7299 (= lt!16042 (lemmaContainsTupThenGetReturnValue!26 lt!16041 (_1!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))))))

(assert (=> d!7299 (= lt!16041 (insertStrictlySorted!23 (toList!547 lt!15651) (_1!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))) (_2!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))))))

(assert (=> d!7299 (= (+!64 lt!15651 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))) lt!16043)))

(declare-fun b!41111 () Bool)

(declare-fun res!24436 () Bool)

(assert (=> b!41111 (=> (not res!24436) (not e!26059))))

(assert (=> b!41111 (= res!24436 (= (getValueByKey!102 (toList!547 lt!16043) (_1!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 lt!15664 (minValue!1722 lt!15461))))))))

(declare-fun b!41112 () Bool)

(assert (=> b!41112 (= e!26059 (contains!518 (toList!547 lt!16043) (tuple2!1487 lt!15664 (minValue!1722 lt!15461))))))

(assert (= (and d!7299 res!24437) b!41111))

(assert (= (and b!41111 res!24436) b!41112))

(declare-fun m!34153 () Bool)

(assert (=> d!7299 m!34153))

(declare-fun m!34155 () Bool)

(assert (=> d!7299 m!34155))

(declare-fun m!34157 () Bool)

(assert (=> d!7299 m!34157))

(declare-fun m!34159 () Bool)

(assert (=> d!7299 m!34159))

(declare-fun m!34161 () Bool)

(assert (=> b!41111 m!34161))

(declare-fun m!34163 () Bool)

(assert (=> b!41112 m!34163))

(assert (=> b!40538 d!7299))

(declare-fun b!41153 () Bool)

(declare-fun e!26084 () SeekEntryResult!174)

(declare-fun e!26085 () SeekEntryResult!174)

(assert (=> b!41153 (= e!26084 e!26085)))

(declare-fun c!5143 () Bool)

(declare-fun lt!16056 () (_ BitVec 64))

(assert (=> b!41153 (= c!5143 (= lt!16056 (select (arr!1241 lt!15466) #b00000000000000000000000000000000)))))

(declare-fun b!41154 () Bool)

(declare-fun e!26083 () SeekEntryResult!174)

(assert (=> b!41154 (= e!26083 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7721 lt!15795) #b00000000000000000000000000000001) (nextIndex!0 (index!2820 lt!15795) (x!7721 lt!15795) mask!853) (index!2820 lt!15795) (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853))))

(declare-fun b!41155 () Bool)

(assert (=> b!41155 (= e!26083 (MissingVacant!174 (index!2820 lt!15795)))))

(declare-fun d!7301 () Bool)

(declare-fun lt!16057 () SeekEntryResult!174)

(assert (=> d!7301 (and (or ((_ is Undefined!174) lt!16057) (not ((_ is Found!174) lt!16057)) (and (bvsge (index!2819 lt!16057) #b00000000000000000000000000000000) (bvslt (index!2819 lt!16057) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!16057) ((_ is Found!174) lt!16057) (not ((_ is MissingVacant!174) lt!16057)) (not (= (index!2821 lt!16057) (index!2820 lt!15795))) (and (bvsge (index!2821 lt!16057) #b00000000000000000000000000000000) (bvslt (index!2821 lt!16057) (size!1378 lt!15466)))) (or ((_ is Undefined!174) lt!16057) (ite ((_ is Found!174) lt!16057) (= (select (arr!1241 lt!15466) (index!2819 lt!16057)) (select (arr!1241 lt!15466) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!174) lt!16057) (= (index!2821 lt!16057) (index!2820 lt!15795)) (= (select (arr!1241 lt!15466) (index!2821 lt!16057)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!7301 (= lt!16057 e!26084)))

(declare-fun c!5144 () Bool)

(assert (=> d!7301 (= c!5144 (bvsge (x!7721 lt!15795) #b01111111111111111111111111111110))))

(assert (=> d!7301 (= lt!16056 (select (arr!1241 lt!15466) (index!2820 lt!15795)))))

(assert (=> d!7301 (validMask!0 mask!853)))

(assert (=> d!7301 (= (seekKeyOrZeroReturnVacant!0 (x!7721 lt!15795) (index!2820 lt!15795) (index!2820 lt!15795) (select (arr!1241 lt!15466) #b00000000000000000000000000000000) lt!15466 mask!853) lt!16057)))

(declare-fun b!41156 () Bool)

(assert (=> b!41156 (= e!26085 (Found!174 (index!2820 lt!15795)))))

(declare-fun b!41157 () Bool)

(declare-fun c!5145 () Bool)

(assert (=> b!41157 (= c!5145 (= lt!16056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41157 (= e!26085 e!26083)))

(declare-fun b!41158 () Bool)

(assert (=> b!41158 (= e!26084 Undefined!174)))

(assert (= (and d!7301 c!5144) b!41158))

(assert (= (and d!7301 (not c!5144)) b!41153))

(assert (= (and b!41153 c!5143) b!41156))

(assert (= (and b!41153 (not c!5143)) b!41157))

(assert (= (and b!41157 c!5145) b!41155))

(assert (= (and b!41157 (not c!5145)) b!41154))

(declare-fun m!34185 () Bool)

(assert (=> b!41154 m!34185))

(assert (=> b!41154 m!34185))

(assert (=> b!41154 m!33269))

(declare-fun m!34187 () Bool)

(assert (=> b!41154 m!34187))

(declare-fun m!34189 () Bool)

(assert (=> d!7301 m!34189))

(declare-fun m!34191 () Bool)

(assert (=> d!7301 m!34191))

(assert (=> d!7301 m!33657))

(assert (=> d!7301 m!33203))

(assert (=> b!40737 d!7301))

(declare-fun d!7305 () Bool)

(assert (=> d!7305 (= (apply!55 lt!15668 #b1000000000000000000000000000000000000000000000000000000000000000) (get!705 (getValueByKey!102 (toList!547 lt!15668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1741 () Bool)

(assert (= bs!1741 d!7305))

(assert (=> bs!1741 m!33877))

(assert (=> bs!1741 m!33877))

(declare-fun m!34193 () Bool)

(assert (=> bs!1741 m!34193))

(assert (=> b!40522 d!7305))

(assert (=> d!7117 d!7017))

(assert (=> b!40776 d!7193))

(assert (=> b!40420 d!7193))

(declare-fun d!7307 () Bool)

(declare-fun res!24450 () Bool)

(declare-fun e!26088 () Bool)

(assert (=> d!7307 (=> res!24450 e!26088)))

(assert (=> d!7307 (= res!24450 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7307 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3293 lt!15461) (mask!5177 lt!15461)) e!26088)))

(declare-fun b!41159 () Bool)

(declare-fun e!26087 () Bool)

(declare-fun call!3224 () Bool)

(assert (=> b!41159 (= e!26087 call!3224)))

(declare-fun b!41160 () Bool)

(declare-fun e!26086 () Bool)

(assert (=> b!41160 (= e!26086 e!26087)))

(declare-fun lt!16059 () (_ BitVec 64))

(assert (=> b!41160 (= lt!16059 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!16060 () Unit!983)

(assert (=> b!41160 (= lt!16060 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3293 lt!15461) lt!16059 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!41160 (arrayContainsKey!0 (_keys!3293 lt!15461) lt!16059 #b00000000000000000000000000000000)))

(declare-fun lt!16058 () Unit!983)

(assert (=> b!41160 (= lt!16058 lt!16060)))

(declare-fun res!24451 () Bool)

(assert (=> b!41160 (= res!24451 (= (seekEntryOrOpen!0 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3293 lt!15461) (mask!5177 lt!15461)) (Found!174 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!41160 (=> (not res!24451) (not e!26087))))

(declare-fun b!41161 () Bool)

(assert (=> b!41161 (= e!26086 call!3224)))

(declare-fun b!41162 () Bool)

(assert (=> b!41162 (= e!26088 e!26086)))

(declare-fun c!5146 () Bool)

(assert (=> b!41162 (= c!5146 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3221 () Bool)

(assert (=> bm!3221 (= call!3224 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3293 lt!15461) (mask!5177 lt!15461)))))

(assert (= (and d!7307 (not res!24450)) b!41162))

(assert (= (and b!41162 c!5146) b!41160))

(assert (= (and b!41162 (not c!5146)) b!41161))

(assert (= (and b!41160 res!24451) b!41159))

(assert (= (or b!41159 b!41161) bm!3221))

(assert (=> b!41160 m!33921))

(declare-fun m!34195 () Bool)

(assert (=> b!41160 m!34195))

(declare-fun m!34197 () Bool)

(assert (=> b!41160 m!34197))

(assert (=> b!41160 m!33921))

(declare-fun m!34199 () Bool)

(assert (=> b!41160 m!34199))

(assert (=> b!41162 m!33921))

(assert (=> b!41162 m!33921))

(assert (=> b!41162 m!33925))

(declare-fun m!34201 () Bool)

(assert (=> bm!3221 m!34201))

(assert (=> bm!3171 d!7307))

(declare-fun d!7309 () Bool)

(declare-fun e!26090 () Bool)

(assert (=> d!7309 e!26090))

(declare-fun res!24452 () Bool)

(assert (=> d!7309 (=> res!24452 e!26090)))

(declare-fun lt!16061 () Bool)

(assert (=> d!7309 (= res!24452 (not lt!16061))))

(declare-fun lt!16064 () Bool)

(assert (=> d!7309 (= lt!16061 lt!16064)))

(declare-fun lt!16063 () Unit!983)

(declare-fun e!26089 () Unit!983)

(assert (=> d!7309 (= lt!16063 e!26089)))

(declare-fun c!5147 () Bool)

(assert (=> d!7309 (= c!5147 lt!16064)))

(assert (=> d!7309 (= lt!16064 (containsKey!69 (toList!547 lt!15668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7309 (= (contains!514 lt!15668 #b0000000000000000000000000000000000000000000000000000000000000000) lt!16061)))

(declare-fun b!41163 () Bool)

(declare-fun lt!16062 () Unit!983)

(assert (=> b!41163 (= e!26089 lt!16062)))

(assert (=> b!41163 (= lt!16062 (lemmaContainsKeyImpliesGetValueByKeyDefined!57 (toList!547 lt!15668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41163 (isDefined!58 (getValueByKey!102 (toList!547 lt!15668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41164 () Bool)

(declare-fun Unit!997 () Unit!983)

(assert (=> b!41164 (= e!26089 Unit!997)))

(declare-fun b!41165 () Bool)

(assert (=> b!41165 (= e!26090 (isDefined!58 (getValueByKey!102 (toList!547 lt!15668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7309 c!5147) b!41163))

(assert (= (and d!7309 (not c!5147)) b!41164))

(assert (= (and d!7309 (not res!24452)) b!41165))

(declare-fun m!34203 () Bool)

(assert (=> d!7309 m!34203))

(declare-fun m!34205 () Bool)

(assert (=> b!41163 m!34205))

(assert (=> b!41163 m!33915))

(assert (=> b!41163 m!33915))

(declare-fun m!34207 () Bool)

(assert (=> b!41163 m!34207))

(assert (=> b!41165 m!33915))

(assert (=> b!41165 m!33915))

(assert (=> b!41165 m!34207))

(assert (=> bm!3160 d!7309))

(declare-fun d!7311 () Bool)

(declare-fun e!26091 () Bool)

(assert (=> d!7311 e!26091))

(declare-fun res!24454 () Bool)

(assert (=> d!7311 (=> (not res!24454) (not e!26091))))

(declare-fun lt!16067 () ListLongMap!1063)

(assert (=> d!7311 (= res!24454 (contains!514 lt!16067 (_1!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))

(declare-fun lt!16065 () List!1054)

(assert (=> d!7311 (= lt!16067 (ListLongMap!1064 lt!16065))))

(declare-fun lt!16068 () Unit!983)

(declare-fun lt!16066 () Unit!983)

(assert (=> d!7311 (= lt!16068 lt!16066)))

(assert (=> d!7311 (= (getValueByKey!102 lt!16065 (_1!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))

(assert (=> d!7311 (= lt!16066 (lemmaContainsTupThenGetReturnValue!26 lt!16065 (_1!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))) (_2!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))

(assert (=> d!7311 (= lt!16065 (insertStrictlySorted!23 (toList!547 call!3163) (_1!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))) (_2!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))

(assert (=> d!7311 (= (+!64 call!3163 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))) lt!16067)))

(declare-fun b!41166 () Bool)

(declare-fun res!24453 () Bool)

(assert (=> b!41166 (=> (not res!24453) (not e!26091))))

(assert (=> b!41166 (= res!24453 (= (getValueByKey!102 (toList!547 lt!16067) (_1!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))) (Some!107 (_2!754 (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))))

(declare-fun b!41167 () Bool)

(assert (=> b!41167 (= e!26091 (contains!518 (toList!547 lt!16067) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))

(assert (= (and d!7311 res!24454) b!41166))

(assert (= (and b!41166 res!24453) b!41167))

(declare-fun m!34209 () Bool)

(assert (=> d!7311 m!34209))

(declare-fun m!34211 () Bool)

(assert (=> d!7311 m!34211))

(declare-fun m!34213 () Bool)

(assert (=> d!7311 m!34213))

(declare-fun m!34215 () Bool)

(assert (=> d!7311 m!34215))

(declare-fun m!34217 () Bool)

(assert (=> b!41166 m!34217))

(declare-fun m!34219 () Bool)

(assert (=> b!41167 m!34219))

(assert (=> b!40537 d!7311))

(declare-fun d!7313 () Bool)

(declare-fun lt!16077 () Bool)

(assert (=> d!7313 (= lt!16077 (select (content!31 (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!26093 () Bool)

(assert (=> d!7313 (= lt!16077 e!26093)))

(declare-fun res!24455 () Bool)

(assert (=> d!7313 (=> (not res!24455) (not e!26093))))

(assert (=> d!7313 (= res!24455 ((_ is Cons!1051) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)))))

(assert (=> d!7313 (= (contains!512 (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!16077)))

(declare-fun b!41168 () Bool)

(declare-fun e!26092 () Bool)

(assert (=> b!41168 (= e!26093 e!26092)))

(declare-fun res!24456 () Bool)

(assert (=> b!41168 (=> res!24456 e!26092)))

(assert (=> b!41168 (= res!24456 (= (h!1625 (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41169 () Bool)

(assert (=> b!41169 (= e!26092 (contains!512 (t!3910 (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7313 res!24455) b!41168))

(assert (= (and b!41168 (not res!24456)) b!41169))

(declare-fun m!34221 () Bool)

(assert (=> d!7313 m!34221))

(assert (=> d!7313 m!33355))

(declare-fun m!34223 () Bool)

(assert (=> d!7313 m!34223))

(assert (=> b!41169 m!33355))

(declare-fun m!34225 () Bool)

(assert (=> b!41169 m!34225))

(assert (=> b!40417 d!7313))

(declare-fun d!7315 () Bool)

(assert (=> d!7315 (= (content!31 Nil!1052) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!7111 d!7315))

(assert (=> b!40418 d!7193))

(assert (=> d!7039 d!7213))

(declare-fun d!7317 () Bool)

(assert (not d!7317))

(assert (=> b!40756 d!7317))

(assert (=> b!40567 d!7201))

(assert (=> b!40535 d!7201))

(declare-fun b!41174 () Bool)

(declare-fun e!26098 () Bool)

(declare-fun call!3225 () Bool)

(assert (=> b!41174 (= e!26098 call!3225)))

(declare-fun b!41175 () Bool)

(declare-fun e!26099 () Bool)

(assert (=> b!41175 (= e!26099 (contains!512 (ite c!4934 (Cons!1051 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!41176 () Bool)

(declare-fun e!26097 () Bool)

(assert (=> b!41176 (= e!26097 e!26098)))

(declare-fun c!5148 () Bool)

(assert (=> b!41176 (= c!5148 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!41177 () Bool)

(assert (=> b!41177 (= e!26098 call!3225)))

(declare-fun b!41178 () Bool)

(declare-fun e!26096 () Bool)

(assert (=> b!41178 (= e!26096 e!26097)))

(declare-fun res!24462 () Bool)

(assert (=> b!41178 (=> (not res!24462) (not e!26097))))

(assert (=> b!41178 (= res!24462 (not e!26099))))

(declare-fun res!24461 () Bool)

(assert (=> b!41178 (=> (not res!24461) (not e!26099))))

(assert (=> b!41178 (= res!24461 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!7319 () Bool)

(declare-fun res!24463 () Bool)

(assert (=> d!7319 (=> res!24463 e!26096)))

(assert (=> d!7319 (= res!24463 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(assert (=> d!7319 (= (arrayNoDuplicates!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4934 (Cons!1051 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052))) e!26096)))

(declare-fun bm!3222 () Bool)

(assert (=> bm!3222 (= call!3225 (arrayNoDuplicates!0 lt!15466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5148 (Cons!1051 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4934 (Cons!1051 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052))) (ite c!4934 (Cons!1051 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)) (ite c!4914 (Cons!1051 (select (arr!1241 lt!15466) #b00000000000000000000000000000000) Nil!1052) Nil!1052)))))))

(assert (= (and d!7319 (not res!24463)) b!41178))

(assert (= (and b!41178 res!24461) b!41175))

(assert (= (and b!41178 res!24462) b!41176))

(assert (= (and b!41176 c!5148) b!41174))

(assert (= (and b!41176 (not c!5148)) b!41177))

(assert (= (or b!41174 b!41177) bm!3222))

(assert (=> b!41175 m!33901))

(assert (=> b!41175 m!33901))

(declare-fun m!34227 () Bool)

(assert (=> b!41175 m!34227))

(assert (=> b!41176 m!33901))

(assert (=> b!41176 m!33901))

(assert (=> b!41176 m!33903))

(assert (=> b!41178 m!33901))

(assert (=> b!41178 m!33901))

(assert (=> b!41178 m!33903))

(assert (=> bm!3222 m!33901))

(declare-fun m!34231 () Bool)

(assert (=> bm!3222 m!34231))

(assert (=> bm!3124 d!7319))

(assert (=> bm!3158 d!7229))

(declare-fun d!7321 () Bool)

(assert (=> d!7321 (arrayContainsKey!0 (_keys!3293 lt!15461) lt!15695 #b00000000000000000000000000000000)))

(declare-fun lt!16082 () Unit!983)

(assert (=> d!7321 (= lt!16082 (choose!13 (_keys!3293 lt!15461) lt!15695 #b00000000000000000000000000000000))))

(assert (=> d!7321 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7321 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3293 lt!15461) lt!15695 #b00000000000000000000000000000000) lt!16082)))

(declare-fun bs!1742 () Bool)

(assert (= bs!1742 d!7321))

(assert (=> bs!1742 m!33461))

(declare-fun m!34243 () Bool)

(assert (=> bs!1742 m!34243))

(assert (=> b!40565 d!7321))

(declare-fun d!7325 () Bool)

(declare-fun res!24468 () Bool)

(declare-fun e!26105 () Bool)

(assert (=> d!7325 (=> res!24468 e!26105)))

(assert (=> d!7325 (= res!24468 (= (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) lt!15695))))

(assert (=> d!7325 (= (arrayContainsKey!0 (_keys!3293 lt!15461) lt!15695 #b00000000000000000000000000000000) e!26105)))

(declare-fun b!41184 () Bool)

(declare-fun e!26106 () Bool)

(assert (=> b!41184 (= e!26105 e!26106)))

(declare-fun res!24470 () Bool)

(assert (=> b!41184 (=> (not res!24470) (not e!26106))))

(assert (=> b!41184 (= res!24470 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!41186 () Bool)

(assert (=> b!41186 (= e!26106 (arrayContainsKey!0 (_keys!3293 lt!15461) lt!15695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7325 (not res!24468)) b!41184))

(assert (= (and b!41184 res!24470) b!41186))

(assert (=> d!7325 m!33405))

(declare-fun m!34245 () Bool)

(assert (=> b!41186 m!34245))

(assert (=> b!40565 d!7325))

(declare-fun b!41188 () Bool)

(declare-fun e!26107 () SeekEntryResult!174)

(declare-fun lt!16083 () SeekEntryResult!174)

(assert (=> b!41188 (= e!26107 (MissingZero!174 (index!2820 lt!16083)))))

(declare-fun b!41189 () Bool)

(assert (=> b!41189 (= e!26107 (seekKeyOrZeroReturnVacant!0 (x!7721 lt!16083) (index!2820 lt!16083) (index!2820 lt!16083) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) (_keys!3293 lt!15461) (mask!5177 lt!15461)))))

(declare-fun b!41190 () Bool)

(declare-fun c!5151 () Bool)

(declare-fun lt!16085 () (_ BitVec 64))

(assert (=> b!41190 (= c!5151 (= lt!16085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26109 () SeekEntryResult!174)

(assert (=> b!41190 (= e!26109 e!26107)))

(declare-fun d!7327 () Bool)

(declare-fun lt!16084 () SeekEntryResult!174)

(assert (=> d!7327 (and (or ((_ is Undefined!174) lt!16084) (not ((_ is Found!174) lt!16084)) (and (bvsge (index!2819 lt!16084) #b00000000000000000000000000000000) (bvslt (index!2819 lt!16084) (size!1378 (_keys!3293 lt!15461))))) (or ((_ is Undefined!174) lt!16084) ((_ is Found!174) lt!16084) (not ((_ is MissingZero!174) lt!16084)) (and (bvsge (index!2818 lt!16084) #b00000000000000000000000000000000) (bvslt (index!2818 lt!16084) (size!1378 (_keys!3293 lt!15461))))) (or ((_ is Undefined!174) lt!16084) ((_ is Found!174) lt!16084) ((_ is MissingZero!174) lt!16084) (not ((_ is MissingVacant!174) lt!16084)) (and (bvsge (index!2821 lt!16084) #b00000000000000000000000000000000) (bvslt (index!2821 lt!16084) (size!1378 (_keys!3293 lt!15461))))) (or ((_ is Undefined!174) lt!16084) (ite ((_ is Found!174) lt!16084) (= (select (arr!1241 (_keys!3293 lt!15461)) (index!2819 lt!16084)) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!174) lt!16084) (= (select (arr!1241 (_keys!3293 lt!15461)) (index!2818 lt!16084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!174) lt!16084) (= (select (arr!1241 (_keys!3293 lt!15461)) (index!2821 lt!16084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!26108 () SeekEntryResult!174)

(assert (=> d!7327 (= lt!16084 e!26108)))

(declare-fun c!5152 () Bool)

(assert (=> d!7327 (= c!5152 (and ((_ is Intermediate!174) lt!16083) (undefined!986 lt!16083)))))

(assert (=> d!7327 (= lt!16083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) (mask!5177 lt!15461)) (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) (_keys!3293 lt!15461) (mask!5177 lt!15461)))))

(assert (=> d!7327 (validMask!0 (mask!5177 lt!15461))))

(assert (=> d!7327 (= (seekEntryOrOpen!0 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000) (_keys!3293 lt!15461) (mask!5177 lt!15461)) lt!16084)))

(declare-fun b!41191 () Bool)

(assert (=> b!41191 (= e!26109 (Found!174 (index!2820 lt!16083)))))

(declare-fun b!41192 () Bool)

(assert (=> b!41192 (= e!26108 e!26109)))

(assert (=> b!41192 (= lt!16085 (select (arr!1241 (_keys!3293 lt!15461)) (index!2820 lt!16083)))))

(declare-fun c!5150 () Bool)

(assert (=> b!41192 (= c!5150 (= lt!16085 (select (arr!1241 (_keys!3293 lt!15461)) #b00000000000000000000000000000000)))))

(declare-fun b!41193 () Bool)

(assert (=> b!41193 (= e!26108 Undefined!174)))

(assert (= (and d!7327 c!5152) b!41193))

(assert (= (and d!7327 (not c!5152)) b!41192))

(assert (= (and b!41192 c!5150) b!41191))

(assert (= (and b!41192 (not c!5150)) b!41190))

(assert (= (and b!41190 c!5151) b!41188))

(assert (= (and b!41190 (not c!5151)) b!41189))

(assert (=> b!41189 m!33405))

(declare-fun m!34255 () Bool)

(assert (=> b!41189 m!34255))

(declare-fun m!34257 () Bool)

(assert (=> d!7327 m!34257))

(assert (=> d!7327 m!33405))

(declare-fun m!34259 () Bool)

(assert (=> d!7327 m!34259))

(declare-fun m!34261 () Bool)

(assert (=> d!7327 m!34261))

(assert (=> d!7327 m!33447))

(assert (=> d!7327 m!33405))

(assert (=> d!7327 m!34257))

(declare-fun m!34263 () Bool)

(assert (=> d!7327 m!34263))

(declare-fun m!34265 () Bool)

(assert (=> d!7327 m!34265))

(declare-fun m!34267 () Bool)

(assert (=> b!41192 m!34267))

(assert (=> b!40565 d!7327))

(declare-fun d!7331 () Bool)

(declare-fun res!24471 () Bool)

(declare-fun e!26114 () Bool)

(assert (=> d!7331 (=> res!24471 e!26114)))

(assert (=> d!7331 (= res!24471 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1378 lt!15466)))))

(assert (=> d!7331 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15466 mask!853) e!26114)))

(declare-fun b!41198 () Bool)

(declare-fun e!26113 () Bool)

(declare-fun call!3228 () Bool)

(assert (=> b!41198 (= e!26113 call!3228)))

(declare-fun b!41199 () Bool)

(declare-fun e!26112 () Bool)

(assert (=> b!41199 (= e!26112 e!26113)))

(declare-fun lt!16088 () (_ BitVec 64))

(assert (=> b!41199 (= lt!16088 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!16089 () Unit!983)

(assert (=> b!41199 (= lt!16089 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15466 lt!16088 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!41199 (arrayContainsKey!0 lt!15466 lt!16088 #b00000000000000000000000000000000)))

(declare-fun lt!16087 () Unit!983)

(assert (=> b!41199 (= lt!16087 lt!16089)))

(declare-fun res!24472 () Bool)

(assert (=> b!41199 (= res!24472 (= (seekEntryOrOpen!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!15466 mask!853) (Found!174 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!41199 (=> (not res!24472) (not e!26113))))

(declare-fun b!41200 () Bool)

(assert (=> b!41200 (= e!26112 call!3228)))

(declare-fun b!41201 () Bool)

(assert (=> b!41201 (= e!26114 e!26112)))

(declare-fun c!5155 () Bool)

(assert (=> b!41201 (= c!5155 (validKeyInArray!0 (select (arr!1241 lt!15466) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3225 () Bool)

(assert (=> bm!3225 (= call!3228 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15466 mask!853))))

(assert (= (and d!7331 (not res!24471)) b!41201))

(assert (= (and b!41201 c!5155) b!41199))

(assert (= (and b!41201 (not c!5155)) b!41200))

(assert (= (and b!41199 res!24472) b!41198))

(assert (= (or b!41198 b!41200) bm!3225))

(assert (=> b!41199 m!33901))

(declare-fun m!34271 () Bool)

(assert (=> b!41199 m!34271))

(declare-fun m!34273 () Bool)

(assert (=> b!41199 m!34273))

(assert (=> b!41199 m!33901))

(declare-fun m!34275 () Bool)

(assert (=> b!41199 m!34275))

(assert (=> b!41201 m!33901))

(assert (=> b!41201 m!33901))

(assert (=> b!41201 m!33903))

(declare-fun m!34277 () Bool)

(assert (=> bm!3225 m!34277))

(assert (=> bm!3185 d!7331))

(assert (=> b!40623 d!7197))

(declare-fun b!41202 () Bool)

(declare-fun e!26116 () (_ BitVec 32))

(declare-fun call!3229 () (_ BitVec 32))

(assert (=> b!41202 (= e!26116 (bvadd #b00000000000000000000000000000001 call!3229))))

(declare-fun bm!3226 () Bool)

(assert (=> bm!3226 (= call!3229 (arrayCountValidKeys!0 (_keys!3293 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))))))

(declare-fun b!41203 () Bool)

(declare-fun e!26115 () (_ BitVec 32))

(assert (=> b!41203 (= e!26115 e!26116)))

(declare-fun c!5157 () Bool)

(assert (=> b!41203 (= c!5157 (validKeyInArray!0 (select (arr!1241 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41204 () Bool)

(assert (=> b!41204 (= e!26116 call!3229)))

(declare-fun d!7337 () Bool)

(declare-fun lt!16090 () (_ BitVec 32))

(assert (=> d!7337 (and (bvsge lt!16090 #b00000000000000000000000000000000) (bvsle lt!16090 (bvsub (size!1378 (_keys!3293 lt!15461)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7337 (= lt!16090 e!26115)))

(declare-fun c!5156 () Bool)

(assert (=> d!7337 (= c!5156 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7337 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1378 (_keys!3293 lt!15461)) (size!1378 (_keys!3293 lt!15461))))))

(assert (=> d!7337 (= (arrayCountValidKeys!0 (_keys!3293 lt!15461) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1378 (_keys!3293 lt!15461))) lt!16090)))

(declare-fun b!41205 () Bool)

(assert (=> b!41205 (= e!26115 #b00000000000000000000000000000000)))

(assert (= (and d!7337 c!5156) b!41205))

(assert (= (and d!7337 (not c!5156)) b!41203))

(assert (= (and b!41203 c!5157) b!41202))

(assert (= (and b!41203 (not c!5157)) b!41204))

(assert (= (or b!41202 b!41204) bm!3226))

(declare-fun m!34279 () Bool)

(assert (=> bm!3226 m!34279))

(assert (=> b!41203 m!33921))

(assert (=> b!41203 m!33921))

(assert (=> b!41203 m!33925))

(assert (=> bm!3188 d!7337))

(declare-fun d!7339 () Bool)

(declare-fun e!26117 () Bool)

(assert (=> d!7339 e!26117))

(declare-fun res!24474 () Bool)

(assert (=> d!7339 (=> (not res!24474) (not e!26117))))

(declare-fun lt!16093 () ListLongMap!1063)

(assert (=> d!7339 (= res!24474 (contains!514 lt!16093 (_1!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))))

(declare-fun lt!16091 () List!1054)

(assert (=> d!7339 (= lt!16093 (ListLongMap!1064 lt!16091))))

(declare-fun lt!16094 () Unit!983)

(declare-fun lt!16092 () Unit!983)

(assert (=> d!7339 (= lt!16094 lt!16092)))

(assert (=> d!7339 (= (getValueByKey!102 lt!16091 (_1!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))) (Some!107 (_2!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))))

(assert (=> d!7339 (= lt!16092 (lemmaContainsTupThenGetReturnValue!26 lt!16091 (_1!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))) (_2!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))))

(assert (=> d!7339 (= lt!16091 (insertStrictlySorted!23 (toList!547 (ite c!4965 call!3161 (ite c!4967 call!3165 call!3162))) (_1!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))) (_2!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))))))

(assert (=> d!7339 (= (+!64 (ite c!4965 call!3161 (ite c!4967 call!3165 call!3162)) (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))) lt!16093)))

(declare-fun b!41206 () Bool)

(declare-fun res!24473 () Bool)

(assert (=> b!41206 (=> (not res!24473) (not e!26117))))

(assert (=> b!41206 (= res!24473 (= (getValueByKey!102 (toList!547 lt!16093) (_1!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461))))) (Some!107 (_2!754 (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))))

(declare-fun b!41207 () Bool)

(assert (=> b!41207 (= e!26117 (contains!518 (toList!547 lt!16093) (ite (or c!4965 c!4967) (tuple2!1487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1722 lt!15461)) (tuple2!1487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1722 lt!15461)))))))

(assert (= (and d!7339 res!24474) b!41206))

(assert (= (and b!41206 res!24473) b!41207))

(declare-fun m!34285 () Bool)

(assert (=> d!7339 m!34285))

(declare-fun m!34287 () Bool)

(assert (=> d!7339 m!34287))

(declare-fun m!34289 () Bool)

(assert (=> d!7339 m!34289))

(declare-fun m!34291 () Bool)

(assert (=> d!7339 m!34291))

(declare-fun m!34293 () Bool)

(assert (=> b!41206 m!34293))

(declare-fun m!34295 () Bool)

(assert (=> b!41207 m!34295))

(assert (=> bm!3157 d!7339))

(assert (=> b!40642 d!7201))

(declare-fun b_lambda!2089 () Bool)

(assert (= b_lambda!2069 (or (and start!5694 b_free!1365 (= defaultEntry!470 (defaultEntry!1804 lt!15461))) b_lambda!2089)))

(check-sat (not b!41167) (not d!7287) (not d!7229) (not b!41072) (not d!7227) (not b!41169) (not b!40981) (not b!41207) (not bm!3212) (not b!41095) (not b!40937) (not d!7199) (not d!7309) (not d!7203) (not d!7289) (not b!40956) (not b_lambda!2083) (not bm!3225) (not b!41082) (not b!41111) (not d!7311) (not b!40950) (not b!41073) (not b!41088) (not b!41176) (not b!41166) (not b!41199) (not b!40998) (not d!7339) (not b!40952) (not bm!3221) (not b_lambda!2067) (not d!7301) (not b!41163) (not b!41203) (not b!40949) (not b!41175) (not b!41081) (not d!7277) (not bm!3209) (not d!7195) (not b!40947) (not b!41096) (not b!41098) (not b!41154) (not d!7281) (not bm!3226) (not b!40962) (not d!7275) (not b!41099) (not b!41162) (not b!41101) (not b!41160) (not d!7279) (not b!41080) (not b!41178) (not b!41201) (not b!41001) (not d!7205) (not b!41189) (not d!7321) (not b!41075) (not d!7217) (not b!40954) (not d!7297) tp_is_empty!1755 (not d!7215) (not b!41076) (not d!7299) (not b!41074) (not d!7305) (not b!41112) (not d!7285) (not b!41003) (not b!40982) (not b_next!1365) (not d!7327) (not d!7175) (not d!7313) (not b!41087) (not bm!3217) (not b!41186) (not d!7273) (not d!7295) (not b_lambda!2089) (not bm!3222) (not b!41097) (not d!7221) (not b!41165) (not d!7293) (not b!40966) (not b!41000) (not b_lambda!2081) (not d!7283) b_and!2381 (not b!41206) (not d!7291) (not d!7209))
(check-sat b_and!2381 (not b_next!1365))
