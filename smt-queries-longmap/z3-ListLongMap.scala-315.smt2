; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5364 () Bool)

(assert start!5364)

(declare-fun b_free!1353 () Bool)

(declare-fun b_next!1353 () Bool)

(assert (=> start!5364 (= b_free!1353 (not b_next!1353))))

(declare-fun tp!5717 () Bool)

(declare-fun b_and!2319 () Bool)

(assert (=> start!5364 (= tp!5717 b_and!2319)))

(declare-fun res!23259 () Bool)

(declare-fun e!24457 () Bool)

(assert (=> start!5364 (=> (not res!23259) (not e!24457))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5364 (= res!23259 (validMask!0 mask!853))))

(assert (=> start!5364 e!24457))

(assert (=> start!5364 true))

(assert (=> start!5364 tp!5717))

(declare-datatypes ((array!2571 0))(
  ( (array!2572 (arr!1229 (Array (_ BitVec 32) (_ BitVec 64))) (size!1336 (_ BitVec 32))) )
))
(declare-fun lt!14419 () array!2571)

(declare-fun b!38511 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2083 0))(
  ( (V!2084 (val!910 Int)) )
))
(declare-fun lt!14423 () V!2083)

(declare-datatypes ((ValueCell!624 0))(
  ( (ValueCellFull!624 (v!1979 V!2083)) (EmptyCell!624) )
))
(declare-datatypes ((array!2573 0))(
  ( (array!2574 (arr!1230 (Array (_ BitVec 32) ValueCell!624)) (size!1337 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!228 0))(
  ( (LongMapFixedSize!229 (defaultEntry!1792 Int) (mask!5113 (_ BitVec 32)) (extraKeys!1683 (_ BitVec 32)) (zeroValue!1710 V!2083) (minValue!1710 V!2083) (_size!163 (_ BitVec 32)) (_keys!3245 array!2571) (_values!1775 array!2573) (_vacant!163 (_ BitVec 32))) )
))
(declare-fun valid!113 (LongMapFixedSize!228) Bool)

(assert (=> b!38511 (= e!24457 (not (valid!113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1044 0))(
  ( (Nil!1041) (Cons!1040 (h!1608 (_ BitVec 64)) (t!3881 List!1044)) )
))
(declare-fun arrayNoDuplicates!0 (array!2571 (_ BitVec 32) List!1044) Bool)

(assert (=> b!38511 (arrayNoDuplicates!0 lt!14419 #b00000000000000000000000000000000 Nil!1041)))

(declare-datatypes ((Unit!961 0))(
  ( (Unit!962) )
))
(declare-fun lt!14422 () Unit!961)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2571 (_ BitVec 32) (_ BitVec 32) List!1044) Unit!961)

(assert (=> b!38511 (= lt!14422 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2571 (_ BitVec 32)) Bool)

(assert (=> b!38511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14419 mask!853)))

(declare-fun lt!14420 () Unit!961)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2571 (_ BitVec 32) (_ BitVec 32)) Unit!961)

(assert (=> b!38511 (= lt!14420 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14419 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2571 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38511 (= (arrayCountValidKeys!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14421 () Unit!961)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2571 (_ BitVec 32) (_ BitVec 32)) Unit!961)

(assert (=> b!38511 (= lt!14421 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38511 (= lt!14419 (array!2572 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!185 (Int (_ BitVec 64)) V!2083)

(assert (=> b!38511 (= lt!14423 (dynLambda!185 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5364 res!23259) b!38511))

(declare-fun b_lambda!2011 () Bool)

(assert (=> (not b_lambda!2011) (not b!38511)))

(declare-fun t!3880 () Bool)

(declare-fun tb!823 () Bool)

(assert (=> (and start!5364 (= defaultEntry!470 defaultEntry!470) t!3880) tb!823))

(declare-fun result!1409 () Bool)

(declare-fun tp_is_empty!1743 () Bool)

(assert (=> tb!823 (= result!1409 tp_is_empty!1743)))

(assert (=> b!38511 t!3880))

(declare-fun b_and!2321 () Bool)

(assert (= b_and!2319 (and (=> t!3880 result!1409) b_and!2321)))

(declare-fun m!31219 () Bool)

(assert (=> start!5364 m!31219))

(declare-fun m!31221 () Bool)

(assert (=> b!38511 m!31221))

(declare-fun m!31223 () Bool)

(assert (=> b!38511 m!31223))

(declare-fun m!31225 () Bool)

(assert (=> b!38511 m!31225))

(declare-fun m!31227 () Bool)

(assert (=> b!38511 m!31227))

(declare-fun m!31229 () Bool)

(assert (=> b!38511 m!31229))

(declare-fun m!31231 () Bool)

(assert (=> b!38511 m!31231))

(declare-fun m!31233 () Bool)

(assert (=> b!38511 m!31233))

(declare-fun m!31235 () Bool)

(assert (=> b!38511 m!31235))

(check-sat (not start!5364) tp_is_empty!1743 b_and!2321 (not b_lambda!2011) (not b_next!1353) (not b!38511))
(check-sat b_and!2321 (not b_next!1353))
(get-model)

(declare-fun b_lambda!2019 () Bool)

(assert (= b_lambda!2011 (or (and start!5364 b_free!1353) b_lambda!2019)))

(check-sat (not start!5364) tp_is_empty!1743 b_and!2321 (not b_lambda!2019) (not b_next!1353) (not b!38511))
(check-sat b_and!2321 (not b_next!1353))
(get-model)

(declare-fun d!6233 () Bool)

(assert (=> d!6233 (= (arrayCountValidKeys!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14441 () Unit!961)

(declare-fun choose!59 (array!2571 (_ BitVec 32) (_ BitVec 32)) Unit!961)

(assert (=> d!6233 (= lt!14441 (choose!59 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6233 (bvslt (size!1336 lt!14419) #b01111111111111111111111111111111)))

(assert (=> d!6233 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14441)))

(declare-fun bs!1594 () Bool)

(assert (= bs!1594 d!6233))

(assert (=> bs!1594 m!31221))

(declare-fun m!31255 () Bool)

(assert (=> bs!1594 m!31255))

(assert (=> b!38511 d!6233))

(declare-fun b!38537 () Bool)

(declare-fun e!24476 () Bool)

(declare-fun e!24477 () Bool)

(assert (=> b!38537 (= e!24476 e!24477)))

(declare-fun lt!14453 () (_ BitVec 64))

(assert (=> b!38537 (= lt!14453 (select (arr!1229 lt!14419) #b00000000000000000000000000000000))))

(declare-fun lt!14452 () Unit!961)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2571 (_ BitVec 64) (_ BitVec 32)) Unit!961)

(assert (=> b!38537 (= lt!14452 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14419 lt!14453 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!38537 (arrayContainsKey!0 lt!14419 lt!14453 #b00000000000000000000000000000000)))

(declare-fun lt!14451 () Unit!961)

(assert (=> b!38537 (= lt!14451 lt!14452)))

(declare-fun res!23273 () Bool)

(declare-datatypes ((SeekEntryResult!166 0))(
  ( (MissingZero!166 (index!2786 (_ BitVec 32))) (Found!166 (index!2787 (_ BitVec 32))) (Intermediate!166 (undefined!978 Bool) (index!2788 (_ BitVec 32)) (x!7602 (_ BitVec 32))) (Undefined!166) (MissingVacant!166 (index!2789 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2571 (_ BitVec 32)) SeekEntryResult!166)

(assert (=> b!38537 (= res!23273 (= (seekEntryOrOpen!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853) (Found!166 #b00000000000000000000000000000000)))))

(assert (=> b!38537 (=> (not res!23273) (not e!24477))))

(declare-fun b!38538 () Bool)

(declare-fun call!2905 () Bool)

(assert (=> b!38538 (= e!24477 call!2905)))

(declare-fun b!38539 () Bool)

(assert (=> b!38539 (= e!24476 call!2905)))

(declare-fun b!38540 () Bool)

(declare-fun e!24475 () Bool)

(assert (=> b!38540 (= e!24475 e!24476)))

(declare-fun c!4417 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!38540 (= c!4417 (validKeyInArray!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun d!6237 () Bool)

(declare-fun res!23274 () Bool)

(assert (=> d!6237 (=> res!23274 e!24475)))

(assert (=> d!6237 (= res!23274 (bvsge #b00000000000000000000000000000000 (size!1336 lt!14419)))))

(assert (=> d!6237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14419 mask!853) e!24475)))

(declare-fun bm!2902 () Bool)

(assert (=> bm!2902 (= call!2905 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14419 mask!853))))

(assert (= (and d!6237 (not res!23274)) b!38540))

(assert (= (and b!38540 c!4417) b!38537))

(assert (= (and b!38540 (not c!4417)) b!38539))

(assert (= (and b!38537 res!23273) b!38538))

(assert (= (or b!38538 b!38539) bm!2902))

(declare-fun m!31259 () Bool)

(assert (=> b!38537 m!31259))

(declare-fun m!31261 () Bool)

(assert (=> b!38537 m!31261))

(declare-fun m!31263 () Bool)

(assert (=> b!38537 m!31263))

(assert (=> b!38537 m!31259))

(declare-fun m!31265 () Bool)

(assert (=> b!38537 m!31265))

(assert (=> b!38540 m!31259))

(assert (=> b!38540 m!31259))

(declare-fun m!31267 () Bool)

(assert (=> b!38540 m!31267))

(declare-fun m!31269 () Bool)

(assert (=> bm!2902 m!31269))

(assert (=> b!38511 d!6237))

(declare-fun b!38570 () Bool)

(declare-fun e!24501 () Bool)

(declare-fun e!24500 () Bool)

(assert (=> b!38570 (= e!24501 e!24500)))

(declare-fun res!23290 () Bool)

(assert (=> b!38570 (=> (not res!23290) (not e!24500))))

(declare-fun e!24498 () Bool)

(assert (=> b!38570 (= res!23290 (not e!24498))))

(declare-fun res!23288 () Bool)

(assert (=> b!38570 (=> (not res!23288) (not e!24498))))

(assert (=> b!38570 (= res!23288 (validKeyInArray!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun b!38571 () Bool)

(declare-fun contains!501 (List!1044 (_ BitVec 64)) Bool)

(assert (=> b!38571 (= e!24498 (contains!501 Nil!1041 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun b!38572 () Bool)

(declare-fun e!24499 () Bool)

(assert (=> b!38572 (= e!24500 e!24499)))

(declare-fun c!4427 () Bool)

(assert (=> b!38572 (= c!4427 (validKeyInArray!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun b!38573 () Bool)

(declare-fun call!2912 () Bool)

(assert (=> b!38573 (= e!24499 call!2912)))

(declare-fun d!6245 () Bool)

(declare-fun res!23289 () Bool)

(assert (=> d!6245 (=> res!23289 e!24501)))

(assert (=> d!6245 (= res!23289 (bvsge #b00000000000000000000000000000000 (size!1336 lt!14419)))))

(assert (=> d!6245 (= (arrayNoDuplicates!0 lt!14419 #b00000000000000000000000000000000 Nil!1041) e!24501)))

(declare-fun bm!2909 () Bool)

(assert (=> bm!2909 (= call!2912 (arrayNoDuplicates!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)))))

(declare-fun b!38574 () Bool)

(assert (=> b!38574 (= e!24499 call!2912)))

(assert (= (and d!6245 (not res!23289)) b!38570))

(assert (= (and b!38570 res!23288) b!38571))

(assert (= (and b!38570 res!23290) b!38572))

(assert (= (and b!38572 c!4427) b!38574))

(assert (= (and b!38572 (not c!4427)) b!38573))

(assert (= (or b!38574 b!38573) bm!2909))

(assert (=> b!38570 m!31259))

(assert (=> b!38570 m!31259))

(assert (=> b!38570 m!31267))

(assert (=> b!38571 m!31259))

(assert (=> b!38571 m!31259))

(declare-fun m!31285 () Bool)

(assert (=> b!38571 m!31285))

(assert (=> b!38572 m!31259))

(assert (=> b!38572 m!31259))

(assert (=> b!38572 m!31267))

(assert (=> bm!2909 m!31259))

(declare-fun m!31287 () Bool)

(assert (=> bm!2909 m!31287))

(assert (=> b!38511 d!6245))

(declare-fun d!6251 () Bool)

(assert (=> d!6251 (arrayNoDuplicates!0 lt!14419 #b00000000000000000000000000000000 Nil!1041)))

(declare-fun lt!14459 () Unit!961)

(declare-fun choose!111 (array!2571 (_ BitVec 32) (_ BitVec 32) List!1044) Unit!961)

(assert (=> d!6251 (= lt!14459 (choose!111 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1041))))

(assert (=> d!6251 (= (size!1336 lt!14419) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6251 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1041) lt!14459)))

(declare-fun bs!1596 () Bool)

(assert (= bs!1596 d!6251))

(assert (=> bs!1596 m!31225))

(declare-fun m!31297 () Bool)

(assert (=> bs!1596 m!31297))

(assert (=> b!38511 d!6251))

(declare-fun bm!2915 () Bool)

(declare-fun call!2918 () (_ BitVec 32))

(assert (=> bm!2915 (= call!2918 (arrayCountValidKeys!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38605 () Bool)

(declare-fun e!24519 () (_ BitVec 32))

(declare-fun e!24520 () (_ BitVec 32))

(assert (=> b!38605 (= e!24519 e!24520)))

(declare-fun c!4436 () Bool)

(assert (=> b!38605 (= c!4436 (validKeyInArray!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun b!38606 () Bool)

(assert (=> b!38606 (= e!24520 (bvadd #b00000000000000000000000000000001 call!2918))))

(declare-fun d!6255 () Bool)

(declare-fun lt!14465 () (_ BitVec 32))

(assert (=> d!6255 (and (bvsge lt!14465 #b00000000000000000000000000000000) (bvsle lt!14465 (bvsub (size!1336 lt!14419) #b00000000000000000000000000000000)))))

(assert (=> d!6255 (= lt!14465 e!24519)))

(declare-fun c!4435 () Bool)

(assert (=> d!6255 (= c!4435 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6255 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1336 lt!14419)))))

(assert (=> d!6255 (= (arrayCountValidKeys!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14465)))

(declare-fun b!38607 () Bool)

(assert (=> b!38607 (= e!24519 #b00000000000000000000000000000000)))

(declare-fun b!38608 () Bool)

(assert (=> b!38608 (= e!24520 call!2918)))

(assert (= (and d!6255 c!4435) b!38607))

(assert (= (and d!6255 (not c!4435)) b!38605))

(assert (= (and b!38605 c!4436) b!38606))

(assert (= (and b!38605 (not c!4436)) b!38608))

(assert (= (or b!38606 b!38608) bm!2915))

(declare-fun m!31305 () Bool)

(assert (=> bm!2915 m!31305))

(assert (=> b!38605 m!31259))

(assert (=> b!38605 m!31259))

(assert (=> b!38605 m!31267))

(assert (=> b!38511 d!6255))

(declare-fun d!6261 () Bool)

(declare-fun res!23326 () Bool)

(declare-fun e!24535 () Bool)

(assert (=> d!6261 (=> (not res!23326) (not e!24535))))

(declare-fun simpleValid!23 (LongMapFixedSize!228) Bool)

(assert (=> d!6261 (= res!23326 (simpleValid!23 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6261 (= (valid!113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24535)))

(declare-fun b!38636 () Bool)

(declare-fun res!23327 () Bool)

(assert (=> b!38636 (=> (not res!23327) (not e!24535))))

(assert (=> b!38636 (= res!23327 (= (arrayCountValidKeys!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (_size!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38637 () Bool)

(declare-fun res!23328 () Bool)

(assert (=> b!38637 (=> (not res!23328) (not e!24535))))

(assert (=> b!38637 (= res!23328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38638 () Bool)

(assert (=> b!38638 (= e!24535 (arrayNoDuplicates!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1041))))

(assert (= (and d!6261 res!23326) b!38636))

(assert (= (and b!38636 res!23327) b!38637))

(assert (= (and b!38637 res!23328) b!38638))

(declare-fun m!31323 () Bool)

(assert (=> d!6261 m!31323))

(declare-fun m!31325 () Bool)

(assert (=> b!38636 m!31325))

(declare-fun m!31327 () Bool)

(assert (=> b!38637 m!31327))

(declare-fun m!31329 () Bool)

(assert (=> b!38638 m!31329))

(assert (=> b!38511 d!6261))

(declare-fun d!6267 () Bool)

(assert (=> d!6267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14419 mask!853)))

(declare-fun lt!14483 () Unit!961)

(declare-fun choose!34 (array!2571 (_ BitVec 32) (_ BitVec 32)) Unit!961)

(assert (=> d!6267 (= lt!14483 (choose!34 lt!14419 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6267 (validMask!0 mask!853)))

(assert (=> d!6267 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14419 mask!853 #b00000000000000000000000000000000) lt!14483)))

(declare-fun bs!1599 () Bool)

(assert (= bs!1599 d!6267))

(assert (=> bs!1599 m!31229))

(declare-fun m!31335 () Bool)

(assert (=> bs!1599 m!31335))

(assert (=> bs!1599 m!31219))

(assert (=> b!38511 d!6267))

(declare-fun d!6273 () Bool)

(assert (=> d!6273 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5364 d!6273))

(check-sat (not b!38540) (not b_next!1353) (not b!38570) (not d!6251) (not b!38636) (not b!38571) (not bm!2909) (not b!38605) (not b!38638) (not b!38572) (not bm!2902) (not d!6261) tp_is_empty!1743 (not d!6233) (not d!6267) b_and!2321 (not b!38537) (not b!38637) (not bm!2915) (not b_lambda!2019))
(check-sat b_and!2321 (not b_next!1353))
(get-model)

(declare-fun b!38663 () Bool)

(declare-fun e!24554 () Bool)

(declare-fun e!24553 () Bool)

(assert (=> b!38663 (= e!24554 e!24553)))

(declare-fun res!23337 () Bool)

(assert (=> b!38663 (=> (not res!23337) (not e!24553))))

(declare-fun e!24551 () Bool)

(assert (=> b!38663 (= res!23337 (not e!24551))))

(declare-fun res!23335 () Bool)

(assert (=> b!38663 (=> (not res!23335) (not e!24551))))

(assert (=> b!38663 (= res!23335 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38664 () Bool)

(assert (=> b!38664 (= e!24551 (contains!501 Nil!1041 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38665 () Bool)

(declare-fun e!24552 () Bool)

(assert (=> b!38665 (= e!24553 e!24552)))

(declare-fun c!4449 () Bool)

(assert (=> b!38665 (= c!4449 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38666 () Bool)

(declare-fun call!2928 () Bool)

(assert (=> b!38666 (= e!24552 call!2928)))

(declare-fun d!6279 () Bool)

(declare-fun res!23336 () Bool)

(assert (=> d!6279 (=> res!23336 e!24554)))

(assert (=> d!6279 (= res!23336 (bvsge #b00000000000000000000000000000000 (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6279 (= (arrayNoDuplicates!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1041) e!24554)))

(declare-fun bm!2925 () Bool)

(assert (=> bm!2925 (= call!2928 (arrayNoDuplicates!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4449 (Cons!1040 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1041) Nil!1041)))))

(declare-fun b!38667 () Bool)

(assert (=> b!38667 (= e!24552 call!2928)))

(assert (= (and d!6279 (not res!23336)) b!38663))

(assert (= (and b!38663 res!23335) b!38664))

(assert (= (and b!38663 res!23337) b!38665))

(assert (= (and b!38665 c!4449) b!38667))

(assert (= (and b!38665 (not c!4449)) b!38666))

(assert (= (or b!38667 b!38666) bm!2925))

(declare-fun m!31351 () Bool)

(assert (=> b!38663 m!31351))

(assert (=> b!38663 m!31351))

(declare-fun m!31353 () Bool)

(assert (=> b!38663 m!31353))

(assert (=> b!38664 m!31351))

(assert (=> b!38664 m!31351))

(declare-fun m!31355 () Bool)

(assert (=> b!38664 m!31355))

(assert (=> b!38665 m!31351))

(assert (=> b!38665 m!31351))

(assert (=> b!38665 m!31353))

(assert (=> bm!2925 m!31351))

(declare-fun m!31357 () Bool)

(assert (=> bm!2925 m!31357))

(assert (=> b!38638 d!6279))

(assert (=> d!6267 d!6237))

(declare-fun d!6281 () Bool)

(assert (=> d!6281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14419 mask!853)))

(assert (=> d!6281 true))

(declare-fun _$30!33 () Unit!961)

(assert (=> d!6281 (= (choose!34 lt!14419 mask!853 #b00000000000000000000000000000000) _$30!33)))

(declare-fun bs!1603 () Bool)

(assert (= bs!1603 d!6281))

(assert (=> bs!1603 m!31229))

(assert (=> d!6267 d!6281))

(assert (=> d!6267 d!6273))

(declare-fun d!6283 () Bool)

(assert (=> d!6283 (= (validKeyInArray!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)) (and (not (= (select (arr!1229 lt!14419) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1229 lt!14419) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38570 d!6283))

(declare-fun b!38668 () Bool)

(declare-fun e!24556 () Bool)

(declare-fun e!24557 () Bool)

(assert (=> b!38668 (= e!24556 e!24557)))

(declare-fun lt!14504 () (_ BitVec 64))

(assert (=> b!38668 (= lt!14504 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!14503 () Unit!961)

(assert (=> b!38668 (= lt!14503 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000))))

(assert (=> b!38668 (arrayContainsKey!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000)))

(declare-fun lt!14502 () Unit!961)

(assert (=> b!38668 (= lt!14502 lt!14503)))

(declare-fun res!23338 () Bool)

(assert (=> b!38668 (= res!23338 (= (seekEntryOrOpen!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!166 #b00000000000000000000000000000000)))))

(assert (=> b!38668 (=> (not res!23338) (not e!24557))))

(declare-fun b!38669 () Bool)

(declare-fun call!2929 () Bool)

(assert (=> b!38669 (= e!24557 call!2929)))

(declare-fun b!38670 () Bool)

(assert (=> b!38670 (= e!24556 call!2929)))

(declare-fun b!38671 () Bool)

(declare-fun e!24555 () Bool)

(assert (=> b!38671 (= e!24555 e!24556)))

(declare-fun c!4450 () Bool)

(assert (=> b!38671 (= c!4450 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun d!6285 () Bool)

(declare-fun res!23339 () Bool)

(assert (=> d!6285 (=> res!23339 e!24555)))

(assert (=> d!6285 (= res!23339 (bvsge #b00000000000000000000000000000000 (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24555)))

(declare-fun bm!2926 () Bool)

(assert (=> bm!2926 (= call!2929 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6285 (not res!23339)) b!38671))

(assert (= (and b!38671 c!4450) b!38668))

(assert (= (and b!38671 (not c!4450)) b!38670))

(assert (= (and b!38668 res!23338) b!38669))

(assert (= (or b!38669 b!38670) bm!2926))

(assert (=> b!38668 m!31351))

(declare-fun m!31359 () Bool)

(assert (=> b!38668 m!31359))

(declare-fun m!31361 () Bool)

(assert (=> b!38668 m!31361))

(assert (=> b!38668 m!31351))

(declare-fun m!31363 () Bool)

(assert (=> b!38668 m!31363))

(assert (=> b!38671 m!31351))

(assert (=> b!38671 m!31351))

(assert (=> b!38671 m!31353))

(declare-fun m!31365 () Bool)

(assert (=> bm!2926 m!31365))

(assert (=> b!38637 d!6285))

(assert (=> b!38572 d!6283))

(declare-fun e!24562 () Bool)

(declare-fun b!38687 () Bool)

(assert (=> b!38687 (= e!24562 (and (bvsge (extraKeys!1683 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (extraKeys!1683 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000011) (bvsge (_vacant!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000)))))

(declare-fun b!38684 () Bool)

(declare-fun res!23350 () Bool)

(assert (=> b!38684 (=> (not res!23350) (not e!24562))))

(assert (=> b!38684 (= res!23350 (and (= (size!1337 (_values!1775 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001)) (= (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1337 (_values!1775 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (_size!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (_size!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001))))))

(declare-fun b!38685 () Bool)

(declare-fun res!23348 () Bool)

(assert (=> b!38685 (=> (not res!23348) (not e!24562))))

(declare-fun size!1351 (LongMapFixedSize!228) (_ BitVec 32))

(assert (=> b!38685 (= res!23348 (bvsge (size!1351 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_size!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun d!6287 () Bool)

(declare-fun res!23351 () Bool)

(assert (=> d!6287 (=> (not res!23351) (not e!24562))))

(assert (=> d!6287 (= res!23351 (validMask!0 (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6287 (= (simpleValid!23 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24562)))

(declare-fun b!38686 () Bool)

(declare-fun res!23349 () Bool)

(assert (=> b!38686 (=> (not res!23349) (not e!24562))))

(assert (=> b!38686 (= res!23349 (= (size!1351 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1683 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!6287 res!23351) b!38684))

(assert (= (and b!38684 res!23350) b!38685))

(assert (= (and b!38685 res!23348) b!38686))

(assert (= (and b!38686 res!23349) b!38687))

(declare-fun m!31373 () Bool)

(assert (=> b!38685 m!31373))

(declare-fun m!31375 () Bool)

(assert (=> d!6287 m!31375))

(assert (=> b!38686 m!31373))

(assert (=> d!6261 d!6287))

(declare-fun d!6293 () Bool)

(declare-fun lt!14511 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!25 (List!1044) (InoxSet (_ BitVec 64)))

(assert (=> d!6293 (= lt!14511 (select (content!25 Nil!1041) (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun e!24574 () Bool)

(assert (=> d!6293 (= lt!14511 e!24574)))

(declare-fun res!23362 () Bool)

(assert (=> d!6293 (=> (not res!23362) (not e!24574))))

(get-info :version)

(assert (=> d!6293 (= res!23362 ((_ is Cons!1040) Nil!1041))))

(assert (=> d!6293 (= (contains!501 Nil!1041 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)) lt!14511)))

(declare-fun b!38698 () Bool)

(declare-fun e!24573 () Bool)

(assert (=> b!38698 (= e!24574 e!24573)))

(declare-fun res!23363 () Bool)

(assert (=> b!38698 (=> res!23363 e!24573)))

(assert (=> b!38698 (= res!23363 (= (h!1608 Nil!1041) (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun b!38699 () Bool)

(assert (=> b!38699 (= e!24573 (contains!501 (t!3881 Nil!1041) (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(assert (= (and d!6293 res!23362) b!38698))

(assert (= (and b!38698 (not res!23363)) b!38699))

(declare-fun m!31383 () Bool)

(assert (=> d!6293 m!31383))

(assert (=> d!6293 m!31259))

(declare-fun m!31385 () Bool)

(assert (=> d!6293 m!31385))

(assert (=> b!38699 m!31259))

(declare-fun m!31387 () Bool)

(assert (=> b!38699 m!31387))

(assert (=> b!38571 d!6293))

(declare-fun bm!2928 () Bool)

(declare-fun call!2931 () (_ BitVec 32))

(assert (=> bm!2928 (= call!2931 (arrayCountValidKeys!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38700 () Bool)

(declare-fun e!24575 () (_ BitVec 32))

(declare-fun e!24576 () (_ BitVec 32))

(assert (=> b!38700 (= e!24575 e!24576)))

(declare-fun c!4454 () Bool)

(assert (=> b!38700 (= c!4454 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38701 () Bool)

(assert (=> b!38701 (= e!24576 (bvadd #b00000000000000000000000000000001 call!2931))))

(declare-fun d!6299 () Bool)

(declare-fun lt!14512 () (_ BitVec 32))

(assert (=> d!6299 (and (bvsge lt!14512 #b00000000000000000000000000000000) (bvsle lt!14512 (bvsub (size!1336 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6299 (= lt!14512 e!24575)))

(declare-fun c!4453 () Bool)

(assert (=> d!6299 (= c!4453 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6299 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1336 lt!14419)))))

(assert (=> d!6299 (= (arrayCountValidKeys!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14512)))

(declare-fun b!38702 () Bool)

(assert (=> b!38702 (= e!24575 #b00000000000000000000000000000000)))

(declare-fun b!38703 () Bool)

(assert (=> b!38703 (= e!24576 call!2931)))

(assert (= (and d!6299 c!4453) b!38702))

(assert (= (and d!6299 (not c!4453)) b!38700))

(assert (= (and b!38700 c!4454) b!38701))

(assert (= (and b!38700 (not c!4454)) b!38703))

(assert (= (or b!38701 b!38703) bm!2928))

(declare-fun m!31389 () Bool)

(assert (=> bm!2928 m!31389))

(declare-fun m!31391 () Bool)

(assert (=> b!38700 m!31391))

(assert (=> b!38700 m!31391))

(declare-fun m!31393 () Bool)

(assert (=> b!38700 m!31393))

(assert (=> bm!2915 d!6299))

(assert (=> d!6233 d!6255))

(declare-fun d!6301 () Bool)

(assert (=> d!6301 (= (arrayCountValidKeys!0 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6301 true))

(declare-fun _$88!19 () Unit!961)

(assert (=> d!6301 (= (choose!59 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!19)))

(declare-fun bs!1605 () Bool)

(assert (= bs!1605 d!6301))

(assert (=> bs!1605 m!31221))

(assert (=> d!6233 d!6301))

(declare-fun d!6305 () Bool)

(assert (=> d!6305 (arrayContainsKey!0 lt!14419 lt!14453 #b00000000000000000000000000000000)))

(declare-fun lt!14520 () Unit!961)

(declare-fun choose!13 (array!2571 (_ BitVec 64) (_ BitVec 32)) Unit!961)

(assert (=> d!6305 (= lt!14520 (choose!13 lt!14419 lt!14453 #b00000000000000000000000000000000))))

(assert (=> d!6305 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6305 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14419 lt!14453 #b00000000000000000000000000000000) lt!14520)))

(declare-fun bs!1606 () Bool)

(assert (= bs!1606 d!6305))

(assert (=> bs!1606 m!31263))

(declare-fun m!31403 () Bool)

(assert (=> bs!1606 m!31403))

(assert (=> b!38537 d!6305))

(declare-fun d!6309 () Bool)

(declare-fun res!23377 () Bool)

(declare-fun e!24588 () Bool)

(assert (=> d!6309 (=> res!23377 e!24588)))

(assert (=> d!6309 (= res!23377 (= (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14453))))

(assert (=> d!6309 (= (arrayContainsKey!0 lt!14419 lt!14453 #b00000000000000000000000000000000) e!24588)))

(declare-fun b!38716 () Bool)

(declare-fun e!24589 () Bool)

(assert (=> b!38716 (= e!24588 e!24589)))

(declare-fun res!23378 () Bool)

(assert (=> b!38716 (=> (not res!23378) (not e!24589))))

(assert (=> b!38716 (= res!23378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(declare-fun b!38717 () Bool)

(assert (=> b!38717 (= e!24589 (arrayContainsKey!0 lt!14419 lt!14453 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6309 (not res!23377)) b!38716))

(assert (= (and b!38716 res!23378) b!38717))

(assert (=> d!6309 m!31259))

(declare-fun m!31407 () Bool)

(assert (=> b!38717 m!31407))

(assert (=> b!38537 d!6309))

(declare-fun b!38759 () Bool)

(declare-fun c!4471 () Bool)

(declare-fun lt!14539 () (_ BitVec 64))

(assert (=> b!38759 (= c!4471 (= lt!14539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24617 () SeekEntryResult!166)

(declare-fun e!24618 () SeekEntryResult!166)

(assert (=> b!38759 (= e!24617 e!24618)))

(declare-fun b!38760 () Bool)

(declare-fun e!24616 () SeekEntryResult!166)

(assert (=> b!38760 (= e!24616 Undefined!166)))

(declare-fun b!38761 () Bool)

(declare-fun lt!14538 () SeekEntryResult!166)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2571 (_ BitVec 32)) SeekEntryResult!166)

(assert (=> b!38761 (= e!24618 (seekKeyOrZeroReturnVacant!0 (x!7602 lt!14538) (index!2788 lt!14538) (index!2788 lt!14538) (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853))))

(declare-fun b!38762 () Bool)

(assert (=> b!38762 (= e!24618 (MissingZero!166 (index!2788 lt!14538)))))

(declare-fun b!38763 () Bool)

(assert (=> b!38763 (= e!24616 e!24617)))

(assert (=> b!38763 (= lt!14539 (select (arr!1229 lt!14419) (index!2788 lt!14538)))))

(declare-fun c!4472 () Bool)

(assert (=> b!38763 (= c!4472 (= lt!14539 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun d!6313 () Bool)

(declare-fun lt!14540 () SeekEntryResult!166)

(assert (=> d!6313 (and (or ((_ is Undefined!166) lt!14540) (not ((_ is Found!166) lt!14540)) (and (bvsge (index!2787 lt!14540) #b00000000000000000000000000000000) (bvslt (index!2787 lt!14540) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14540) ((_ is Found!166) lt!14540) (not ((_ is MissingZero!166) lt!14540)) (and (bvsge (index!2786 lt!14540) #b00000000000000000000000000000000) (bvslt (index!2786 lt!14540) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14540) ((_ is Found!166) lt!14540) ((_ is MissingZero!166) lt!14540) (not ((_ is MissingVacant!166) lt!14540)) (and (bvsge (index!2789 lt!14540) #b00000000000000000000000000000000) (bvslt (index!2789 lt!14540) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14540) (ite ((_ is Found!166) lt!14540) (= (select (arr!1229 lt!14419) (index!2787 lt!14540)) (select (arr!1229 lt!14419) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!166) lt!14540) (= (select (arr!1229 lt!14419) (index!2786 lt!14540)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!166) lt!14540) (= (select (arr!1229 lt!14419) (index!2789 lt!14540)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6313 (= lt!14540 e!24616)))

(declare-fun c!4473 () Bool)

(assert (=> d!6313 (= c!4473 (and ((_ is Intermediate!166) lt!14538) (undefined!978 lt!14538)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2571 (_ BitVec 32)) SeekEntryResult!166)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6313 (= lt!14538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853) (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853))))

(assert (=> d!6313 (validMask!0 mask!853)))

(assert (=> d!6313 (= (seekEntryOrOpen!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853) lt!14540)))

(declare-fun b!38764 () Bool)

(assert (=> b!38764 (= e!24617 (Found!166 (index!2788 lt!14538)))))

(assert (= (and d!6313 c!4473) b!38760))

(assert (= (and d!6313 (not c!4473)) b!38763))

(assert (= (and b!38763 c!4472) b!38764))

(assert (= (and b!38763 (not c!4472)) b!38759))

(assert (= (and b!38759 c!4471) b!38762))

(assert (= (and b!38759 (not c!4471)) b!38761))

(assert (=> b!38761 m!31259))

(declare-fun m!31429 () Bool)

(assert (=> b!38761 m!31429))

(declare-fun m!31435 () Bool)

(assert (=> b!38763 m!31435))

(declare-fun m!31439 () Bool)

(assert (=> d!6313 m!31439))

(assert (=> d!6313 m!31259))

(declare-fun m!31443 () Bool)

(assert (=> d!6313 m!31443))

(declare-fun m!31445 () Bool)

(assert (=> d!6313 m!31445))

(assert (=> d!6313 m!31259))

(assert (=> d!6313 m!31439))

(declare-fun m!31449 () Bool)

(assert (=> d!6313 m!31449))

(declare-fun m!31451 () Bool)

(assert (=> d!6313 m!31451))

(assert (=> d!6313 m!31219))

(assert (=> b!38537 d!6313))

(declare-fun b!38775 () Bool)

(declare-fun e!24628 () Bool)

(declare-fun e!24627 () Bool)

(assert (=> b!38775 (= e!24628 e!24627)))

(declare-fun res!23397 () Bool)

(assert (=> b!38775 (=> (not res!23397) (not e!24627))))

(declare-fun e!24625 () Bool)

(assert (=> b!38775 (= res!23397 (not e!24625))))

(declare-fun res!23395 () Bool)

(assert (=> b!38775 (=> (not res!23395) (not e!24625))))

(assert (=> b!38775 (= res!23395 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38776 () Bool)

(assert (=> b!38776 (= e!24625 (contains!501 (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38777 () Bool)

(declare-fun e!24626 () Bool)

(assert (=> b!38777 (= e!24627 e!24626)))

(declare-fun c!4478 () Bool)

(assert (=> b!38777 (= c!4478 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38778 () Bool)

(declare-fun call!2936 () Bool)

(assert (=> b!38778 (= e!24626 call!2936)))

(declare-fun d!6331 () Bool)

(declare-fun res!23396 () Bool)

(assert (=> d!6331 (=> res!23396 e!24628)))

(assert (=> d!6331 (= res!23396 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(assert (=> d!6331 (= (arrayNoDuplicates!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) e!24628)))

(declare-fun bm!2933 () Bool)

(assert (=> bm!2933 (= call!2936 (arrayNoDuplicates!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4478 (Cons!1040 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041))))))

(declare-fun b!38779 () Bool)

(assert (=> b!38779 (= e!24626 call!2936)))

(assert (= (and d!6331 (not res!23396)) b!38775))

(assert (= (and b!38775 res!23395) b!38776))

(assert (= (and b!38775 res!23397) b!38777))

(assert (= (and b!38777 c!4478) b!38779))

(assert (= (and b!38777 (not c!4478)) b!38778))

(assert (= (or b!38779 b!38778) bm!2933))

(assert (=> b!38775 m!31391))

(assert (=> b!38775 m!31391))

(assert (=> b!38775 m!31393))

(assert (=> b!38776 m!31391))

(assert (=> b!38776 m!31391))

(declare-fun m!31467 () Bool)

(assert (=> b!38776 m!31467))

(assert (=> b!38777 m!31391))

(assert (=> b!38777 m!31391))

(assert (=> b!38777 m!31393))

(assert (=> bm!2933 m!31391))

(declare-fun m!31471 () Bool)

(assert (=> bm!2933 m!31471))

(assert (=> bm!2909 d!6331))

(assert (=> b!38605 d!6283))

(assert (=> b!38540 d!6283))

(assert (=> d!6251 d!6245))

(declare-fun d!6337 () Bool)

(assert (=> d!6337 (arrayNoDuplicates!0 lt!14419 #b00000000000000000000000000000000 Nil!1041)))

(assert (=> d!6337 true))

(declare-fun res!23404 () Unit!961)

(assert (=> d!6337 (= (choose!111 lt!14419 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1041) res!23404)))

(declare-fun bs!1610 () Bool)

(assert (= bs!1610 d!6337))

(assert (=> bs!1610 m!31225))

(assert (=> d!6251 d!6337))

(declare-fun b!38794 () Bool)

(declare-fun e!24642 () Bool)

(declare-fun e!24643 () Bool)

(assert (=> b!38794 (= e!24642 e!24643)))

(declare-fun lt!14552 () (_ BitVec 64))

(assert (=> b!38794 (= lt!14552 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14551 () Unit!961)

(assert (=> b!38794 (= lt!14551 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14419 lt!14552 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38794 (arrayContainsKey!0 lt!14419 lt!14552 #b00000000000000000000000000000000)))

(declare-fun lt!14550 () Unit!961)

(assert (=> b!38794 (= lt!14550 lt!14551)))

(declare-fun res!23411 () Bool)

(assert (=> b!38794 (= res!23411 (= (seekEntryOrOpen!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14419 mask!853) (Found!166 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38794 (=> (not res!23411) (not e!24643))))

(declare-fun b!38795 () Bool)

(declare-fun call!2939 () Bool)

(assert (=> b!38795 (= e!24643 call!2939)))

(declare-fun b!38796 () Bool)

(assert (=> b!38796 (= e!24642 call!2939)))

(declare-fun b!38797 () Bool)

(declare-fun e!24641 () Bool)

(assert (=> b!38797 (= e!24641 e!24642)))

(declare-fun c!4481 () Bool)

(assert (=> b!38797 (= c!4481 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6341 () Bool)

(declare-fun res!23412 () Bool)

(assert (=> d!6341 (=> res!23412 e!24641)))

(assert (=> d!6341 (= res!23412 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(assert (=> d!6341 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14419 mask!853) e!24641)))

(declare-fun bm!2936 () Bool)

(assert (=> bm!2936 (= call!2939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14419 mask!853))))

(assert (= (and d!6341 (not res!23412)) b!38797))

(assert (= (and b!38797 c!4481) b!38794))

(assert (= (and b!38797 (not c!4481)) b!38796))

(assert (= (and b!38794 res!23411) b!38795))

(assert (= (or b!38795 b!38796) bm!2936))

(assert (=> b!38794 m!31391))

(declare-fun m!31479 () Bool)

(assert (=> b!38794 m!31479))

(declare-fun m!31481 () Bool)

(assert (=> b!38794 m!31481))

(assert (=> b!38794 m!31391))

(declare-fun m!31485 () Bool)

(assert (=> b!38794 m!31485))

(assert (=> b!38797 m!31391))

(assert (=> b!38797 m!31391))

(assert (=> b!38797 m!31393))

(declare-fun m!31487 () Bool)

(assert (=> bm!2936 m!31487))

(assert (=> bm!2902 d!6341))

(declare-fun bm!2937 () Bool)

(declare-fun call!2940 () (_ BitVec 32))

(assert (=> bm!2937 (= call!2940 (arrayCountValidKeys!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38800 () Bool)

(declare-fun e!24646 () (_ BitVec 32))

(declare-fun e!24647 () (_ BitVec 32))

(assert (=> b!38800 (= e!24646 e!24647)))

(declare-fun c!4483 () Bool)

(assert (=> b!38800 (= c!4483 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38801 () Bool)

(assert (=> b!38801 (= e!24647 (bvadd #b00000000000000000000000000000001 call!2940))))

(declare-fun lt!14553 () (_ BitVec 32))

(declare-fun d!6345 () Bool)

(assert (=> d!6345 (and (bvsge lt!14553 #b00000000000000000000000000000000) (bvsle lt!14553 (bvsub (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> d!6345 (= lt!14553 e!24646)))

(declare-fun c!4482 () Bool)

(assert (=> d!6345 (= c!4482 (bvsge #b00000000000000000000000000000000 (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6345 (and (bvsle #b00000000000000000000000000000000 (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6345 (= (arrayCountValidKeys!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14553)))

(declare-fun b!38802 () Bool)

(assert (=> b!38802 (= e!24646 #b00000000000000000000000000000000)))

(declare-fun b!38803 () Bool)

(assert (=> b!38803 (= e!24647 call!2940)))

(assert (= (and d!6345 c!4482) b!38802))

(assert (= (and d!6345 (not c!4482)) b!38800))

(assert (= (and b!38800 c!4483) b!38801))

(assert (= (and b!38800 (not c!4483)) b!38803))

(assert (= (or b!38801 b!38803) bm!2937))

(declare-fun m!31491 () Bool)

(assert (=> bm!2937 m!31491))

(assert (=> b!38800 m!31351))

(assert (=> b!38800 m!31351))

(assert (=> b!38800 m!31353))

(assert (=> b!38636 d!6345))

(check-sat (not bm!2928) (not b_next!1353) (not bm!2926) (not d!6287) (not b!38663) (not d!6293) (not d!6281) (not b!38671) (not b!38668) (not bm!2937) (not b!38665) (not b!38700) (not b!38686) (not b!38717) (not b!38800) (not b!38685) (not d!6313) (not bm!2936) (not d!6337) (not b!38794) (not b!38775) (not b!38797) tp_is_empty!1743 b_and!2321 (not b!38761) (not d!6305) (not bm!2925) (not d!6301) (not bm!2933) (not b!38664) (not b_lambda!2019) (not b!38776) (not b!38777) (not b!38699))
(check-sat b_and!2321 (not b_next!1353))
(get-model)

(assert (=> d!6281 d!6237))

(assert (=> d!6305 d!6309))

(declare-fun d!6373 () Bool)

(assert (=> d!6373 (arrayContainsKey!0 lt!14419 lt!14453 #b00000000000000000000000000000000)))

(assert (=> d!6373 true))

(declare-fun _$60!323 () Unit!961)

(assert (=> d!6373 (= (choose!13 lt!14419 lt!14453 #b00000000000000000000000000000000) _$60!323)))

(declare-fun bs!1615 () Bool)

(assert (= bs!1615 d!6373))

(assert (=> bs!1615 m!31263))

(assert (=> d!6305 d!6373))

(declare-fun bm!2943 () Bool)

(declare-fun call!2946 () (_ BitVec 32))

(assert (=> bm!2943 (= call!2946 (arrayCountValidKeys!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38877 () Bool)

(declare-fun e!24681 () (_ BitVec 32))

(declare-fun e!24682 () (_ BitVec 32))

(assert (=> b!38877 (= e!24681 e!24682)))

(declare-fun c!4505 () Bool)

(assert (=> b!38877 (= c!4505 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38878 () Bool)

(assert (=> b!38878 (= e!24682 (bvadd #b00000000000000000000000000000001 call!2946))))

(declare-fun lt!14575 () (_ BitVec 32))

(declare-fun d!6375 () Bool)

(assert (=> d!6375 (and (bvsge lt!14575 #b00000000000000000000000000000000) (bvsle lt!14575 (bvsub (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6375 (= lt!14575 e!24681)))

(declare-fun c!4504 () Bool)

(assert (=> d!6375 (= c!4504 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6375 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6375 (= (arrayCountValidKeys!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14575)))

(declare-fun b!38879 () Bool)

(assert (=> b!38879 (= e!24681 #b00000000000000000000000000000000)))

(declare-fun b!38880 () Bool)

(assert (=> b!38880 (= e!24682 call!2946)))

(assert (= (and d!6375 c!4504) b!38879))

(assert (= (and d!6375 (not c!4504)) b!38877))

(assert (= (and b!38877 c!4505) b!38878))

(assert (= (and b!38877 (not c!4505)) b!38880))

(assert (= (or b!38878 b!38880) bm!2943))

(declare-fun m!31543 () Bool)

(assert (=> bm!2943 m!31543))

(declare-fun m!31545 () Bool)

(assert (=> b!38877 m!31545))

(assert (=> b!38877 m!31545))

(declare-fun m!31547 () Bool)

(assert (=> b!38877 m!31547))

(assert (=> bm!2937 d!6375))

(declare-fun d!6377 () Bool)

(assert (=> d!6377 (= (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38775 d!6377))

(declare-fun d!6379 () Bool)

(assert (=> d!6379 (= (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38663 d!6379))

(declare-fun d!6381 () Bool)

(declare-fun lt!14576 () Bool)

(assert (=> d!6381 (= lt!14576 (select (content!25 (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!24690 () Bool)

(assert (=> d!6381 (= lt!14576 e!24690)))

(declare-fun res!23452 () Bool)

(assert (=> d!6381 (=> (not res!23452) (not e!24690))))

(assert (=> d!6381 (= res!23452 ((_ is Cons!1040) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)))))

(assert (=> d!6381 (= (contains!501 (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!14576)))

(declare-fun b!38889 () Bool)

(declare-fun e!24689 () Bool)

(assert (=> b!38889 (= e!24690 e!24689)))

(declare-fun res!23453 () Bool)

(assert (=> b!38889 (=> res!23453 e!24689)))

(assert (=> b!38889 (= res!23453 (= (h!1608 (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38890 () Bool)

(assert (=> b!38890 (= e!24689 (contains!501 (t!3881 (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6381 res!23452) b!38889))

(assert (= (and b!38889 (not res!23453)) b!38890))

(declare-fun m!31549 () Bool)

(assert (=> d!6381 m!31549))

(assert (=> d!6381 m!31391))

(declare-fun m!31551 () Bool)

(assert (=> d!6381 m!31551))

(assert (=> b!38890 m!31391))

(declare-fun m!31553 () Bool)

(assert (=> b!38890 m!31553))

(assert (=> b!38776 d!6381))

(declare-fun d!6383 () Bool)

(assert (=> d!6383 (arrayContainsKey!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000)))

(declare-fun lt!14577 () Unit!961)

(assert (=> d!6383 (= lt!14577 (choose!13 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000))))

(assert (=> d!6383 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6383 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000) lt!14577)))

(declare-fun bs!1616 () Bool)

(assert (= bs!1616 d!6383))

(assert (=> bs!1616 m!31361))

(declare-fun m!31555 () Bool)

(assert (=> bs!1616 m!31555))

(assert (=> b!38668 d!6383))

(declare-fun d!6385 () Bool)

(declare-fun res!23454 () Bool)

(declare-fun e!24691 () Bool)

(assert (=> d!6385 (=> res!23454 e!24691)))

(assert (=> d!6385 (= res!23454 (= (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) lt!14504))))

(assert (=> d!6385 (= (arrayContainsKey!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000) e!24691)))

(declare-fun b!38891 () Bool)

(declare-fun e!24692 () Bool)

(assert (=> b!38891 (= e!24691 e!24692)))

(declare-fun res!23455 () Bool)

(assert (=> b!38891 (=> (not res!23455) (not e!24692))))

(assert (=> b!38891 (= res!23455 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38892 () Bool)

(assert (=> b!38892 (= e!24692 (arrayContainsKey!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6385 (not res!23454)) b!38891))

(assert (= (and b!38891 res!23455) b!38892))

(assert (=> d!6385 m!31351))

(declare-fun m!31557 () Bool)

(assert (=> b!38892 m!31557))

(assert (=> b!38668 d!6385))

(declare-fun b!38893 () Bool)

(declare-fun c!4508 () Bool)

(declare-fun lt!14579 () (_ BitVec 64))

(assert (=> b!38893 (= c!4508 (= lt!14579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24694 () SeekEntryResult!166)

(declare-fun e!24695 () SeekEntryResult!166)

(assert (=> b!38893 (= e!24694 e!24695)))

(declare-fun b!38894 () Bool)

(declare-fun e!24693 () SeekEntryResult!166)

(assert (=> b!38894 (= e!24693 Undefined!166)))

(declare-fun b!38895 () Bool)

(declare-fun lt!14578 () SeekEntryResult!166)

(assert (=> b!38895 (= e!24695 (seekKeyOrZeroReturnVacant!0 (x!7602 lt!14578) (index!2788 lt!14578) (index!2788 lt!14578) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38896 () Bool)

(assert (=> b!38896 (= e!24695 (MissingZero!166 (index!2788 lt!14578)))))

(declare-fun b!38897 () Bool)

(assert (=> b!38897 (= e!24693 e!24694)))

(assert (=> b!38897 (= lt!14579 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2788 lt!14578)))))

(declare-fun c!4509 () Bool)

(assert (=> b!38897 (= c!4509 (= lt!14579 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun lt!14580 () SeekEntryResult!166)

(declare-fun d!6387 () Bool)

(assert (=> d!6387 (and (or ((_ is Undefined!166) lt!14580) (not ((_ is Found!166) lt!14580)) (and (bvsge (index!2787 lt!14580) #b00000000000000000000000000000000) (bvslt (index!2787 lt!14580) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!166) lt!14580) ((_ is Found!166) lt!14580) (not ((_ is MissingZero!166) lt!14580)) (and (bvsge (index!2786 lt!14580) #b00000000000000000000000000000000) (bvslt (index!2786 lt!14580) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!166) lt!14580) ((_ is Found!166) lt!14580) ((_ is MissingZero!166) lt!14580) (not ((_ is MissingVacant!166) lt!14580)) (and (bvsge (index!2789 lt!14580) #b00000000000000000000000000000000) (bvslt (index!2789 lt!14580) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!166) lt!14580) (ite ((_ is Found!166) lt!14580) (= (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2787 lt!14580)) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!166) lt!14580) (= (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2786 lt!14580)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!166) lt!14580) (= (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2789 lt!14580)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6387 (= lt!14580 e!24693)))

(declare-fun c!4510 () Bool)

(assert (=> d!6387 (= c!4510 (and ((_ is Intermediate!166) lt!14578) (undefined!978 lt!14578)))))

(assert (=> d!6387 (= lt!14578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6387 (validMask!0 (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6387 (= (seekEntryOrOpen!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) lt!14580)))

(declare-fun b!38898 () Bool)

(assert (=> b!38898 (= e!24694 (Found!166 (index!2788 lt!14578)))))

(assert (= (and d!6387 c!4510) b!38894))

(assert (= (and d!6387 (not c!4510)) b!38897))

(assert (= (and b!38897 c!4509) b!38898))

(assert (= (and b!38897 (not c!4509)) b!38893))

(assert (= (and b!38893 c!4508) b!38896))

(assert (= (and b!38893 (not c!4508)) b!38895))

(assert (=> b!38895 m!31351))

(declare-fun m!31559 () Bool)

(assert (=> b!38895 m!31559))

(declare-fun m!31561 () Bool)

(assert (=> b!38897 m!31561))

(declare-fun m!31563 () Bool)

(assert (=> d!6387 m!31563))

(assert (=> d!6387 m!31351))

(declare-fun m!31565 () Bool)

(assert (=> d!6387 m!31565))

(declare-fun m!31567 () Bool)

(assert (=> d!6387 m!31567))

(assert (=> d!6387 m!31351))

(assert (=> d!6387 m!31563))

(declare-fun m!31569 () Bool)

(assert (=> d!6387 m!31569))

(declare-fun m!31571 () Bool)

(assert (=> d!6387 m!31571))

(assert (=> d!6387 m!31375))

(assert (=> b!38668 d!6387))

(assert (=> b!38800 d!6379))

(declare-fun lt!14583 () Bool)

(declare-fun d!6389 () Bool)

(assert (=> d!6389 (= lt!14583 (select (content!25 Nil!1041) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun e!24702 () Bool)

(assert (=> d!6389 (= lt!14583 e!24702)))

(declare-fun res!23459 () Bool)

(assert (=> d!6389 (=> (not res!23459) (not e!24702))))

(assert (=> d!6389 (= res!23459 ((_ is Cons!1040) Nil!1041))))

(assert (=> d!6389 (= (contains!501 Nil!1041 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) lt!14583)))

(declare-fun b!38908 () Bool)

(declare-fun e!24701 () Bool)

(assert (=> b!38908 (= e!24702 e!24701)))

(declare-fun res!23460 () Bool)

(assert (=> b!38908 (=> res!23460 e!24701)))

(assert (=> b!38908 (= res!23460 (= (h!1608 Nil!1041) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38909 () Bool)

(assert (=> b!38909 (= e!24701 (contains!501 (t!3881 Nil!1041) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6389 res!23459) b!38908))

(assert (= (and b!38908 (not res!23460)) b!38909))

(assert (=> d!6389 m!31383))

(assert (=> d!6389 m!31351))

(declare-fun m!31581 () Bool)

(assert (=> d!6389 m!31581))

(assert (=> b!38909 m!31351))

(declare-fun m!31583 () Bool)

(assert (=> b!38909 m!31583))

(assert (=> b!38664 d!6389))

(assert (=> b!38777 d!6377))

(assert (=> b!38671 d!6379))

(declare-fun b!38910 () Bool)

(declare-fun e!24706 () Bool)

(declare-fun e!24705 () Bool)

(assert (=> b!38910 (= e!24706 e!24705)))

(declare-fun res!23464 () Bool)

(assert (=> b!38910 (=> (not res!23464) (not e!24705))))

(declare-fun e!24703 () Bool)

(assert (=> b!38910 (= res!23464 (not e!24703))))

(declare-fun res!23462 () Bool)

(assert (=> b!38910 (=> (not res!23462) (not e!24703))))

(assert (=> b!38910 (= res!23462 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38911 () Bool)

(assert (=> b!38911 (= e!24703 (contains!501 (ite c!4478 (Cons!1040 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38912 () Bool)

(declare-fun e!24704 () Bool)

(assert (=> b!38912 (= e!24705 e!24704)))

(declare-fun c!4514 () Bool)

(assert (=> b!38912 (= c!4514 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38913 () Bool)

(declare-fun call!2947 () Bool)

(assert (=> b!38913 (= e!24704 call!2947)))

(declare-fun d!6393 () Bool)

(declare-fun res!23463 () Bool)

(assert (=> d!6393 (=> res!23463 e!24706)))

(assert (=> d!6393 (= res!23463 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(assert (=> d!6393 (= (arrayNoDuplicates!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4478 (Cons!1040 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041))) e!24706)))

(declare-fun bm!2944 () Bool)

(assert (=> bm!2944 (= call!2947 (arrayNoDuplicates!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4514 (Cons!1040 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4478 (Cons!1040 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041))) (ite c!4478 (Cons!1040 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (ite c!4427 (Cons!1040 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) Nil!1041) Nil!1041)))))))

(declare-fun b!38914 () Bool)

(assert (=> b!38914 (= e!24704 call!2947)))

(assert (= (and d!6393 (not res!23463)) b!38910))

(assert (= (and b!38910 res!23462) b!38911))

(assert (= (and b!38910 res!23464) b!38912))

(assert (= (and b!38912 c!4514) b!38914))

(assert (= (and b!38912 (not c!4514)) b!38913))

(assert (= (or b!38914 b!38913) bm!2944))

(declare-fun m!31585 () Bool)

(assert (=> b!38910 m!31585))

(assert (=> b!38910 m!31585))

(declare-fun m!31587 () Bool)

(assert (=> b!38910 m!31587))

(assert (=> b!38911 m!31585))

(assert (=> b!38911 m!31585))

(declare-fun m!31589 () Bool)

(assert (=> b!38911 m!31589))

(assert (=> b!38912 m!31585))

(assert (=> b!38912 m!31585))

(assert (=> b!38912 m!31587))

(assert (=> bm!2944 m!31585))

(declare-fun m!31591 () Bool)

(assert (=> bm!2944 m!31591))

(assert (=> bm!2933 d!6393))

(declare-fun d!6395 () Bool)

(declare-fun res!23465 () Bool)

(declare-fun e!24707 () Bool)

(assert (=> d!6395 (=> res!23465 e!24707)))

(assert (=> d!6395 (= res!23465 (= (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14453))))

(assert (=> d!6395 (= (arrayContainsKey!0 lt!14419 lt!14453 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!24707)))

(declare-fun b!38915 () Bool)

(declare-fun e!24708 () Bool)

(assert (=> b!38915 (= e!24707 e!24708)))

(declare-fun res!23466 () Bool)

(assert (=> b!38915 (=> (not res!23466) (not e!24708))))

(assert (=> b!38915 (= res!23466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(declare-fun b!38916 () Bool)

(assert (=> b!38916 (= e!24708 (arrayContainsKey!0 lt!14419 lt!14453 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6395 (not res!23465)) b!38915))

(assert (= (and b!38915 res!23466) b!38916))

(assert (=> d!6395 m!31391))

(declare-fun m!31593 () Bool)

(assert (=> b!38916 m!31593))

(assert (=> b!38717 d!6395))

(assert (=> b!38665 d!6379))

(declare-fun b!38917 () Bool)

(declare-fun e!24712 () Bool)

(declare-fun e!24711 () Bool)

(assert (=> b!38917 (= e!24712 e!24711)))

(declare-fun res!23469 () Bool)

(assert (=> b!38917 (=> (not res!23469) (not e!24711))))

(declare-fun e!24709 () Bool)

(assert (=> b!38917 (= res!23469 (not e!24709))))

(declare-fun res!23467 () Bool)

(assert (=> b!38917 (=> (not res!23467) (not e!24709))))

(assert (=> b!38917 (= res!23467 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38918 () Bool)

(assert (=> b!38918 (= e!24709 (contains!501 (ite c!4449 (Cons!1040 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1041) Nil!1041) (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38919 () Bool)

(declare-fun e!24710 () Bool)

(assert (=> b!38919 (= e!24711 e!24710)))

(declare-fun c!4515 () Bool)

(assert (=> b!38919 (= c!4515 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38920 () Bool)

(declare-fun call!2948 () Bool)

(assert (=> b!38920 (= e!24710 call!2948)))

(declare-fun d!6397 () Bool)

(declare-fun res!23468 () Bool)

(assert (=> d!6397 (=> res!23468 e!24712)))

(assert (=> d!6397 (= res!23468 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6397 (= (arrayNoDuplicates!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4449 (Cons!1040 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) e!24712)))

(declare-fun bm!2945 () Bool)

(assert (=> bm!2945 (= call!2948 (arrayNoDuplicates!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4515 (Cons!1040 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4449 (Cons!1040 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1041) Nil!1041)) (ite c!4449 (Cons!1040 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1041) Nil!1041))))))

(declare-fun b!38921 () Bool)

(assert (=> b!38921 (= e!24710 call!2948)))

(assert (= (and d!6397 (not res!23468)) b!38917))

(assert (= (and b!38917 res!23467) b!38918))

(assert (= (and b!38917 res!23469) b!38919))

(assert (= (and b!38919 c!4515) b!38921))

(assert (= (and b!38919 (not c!4515)) b!38920))

(assert (= (or b!38921 b!38920) bm!2945))

(assert (=> b!38917 m!31545))

(assert (=> b!38917 m!31545))

(assert (=> b!38917 m!31547))

(assert (=> b!38918 m!31545))

(assert (=> b!38918 m!31545))

(declare-fun m!31595 () Bool)

(assert (=> b!38918 m!31595))

(assert (=> b!38919 m!31545))

(assert (=> b!38919 m!31545))

(assert (=> b!38919 m!31547))

(assert (=> bm!2945 m!31545))

(declare-fun m!31597 () Bool)

(assert (=> bm!2945 m!31597))

(assert (=> bm!2925 d!6397))

(assert (=> d!6301 d!6255))

(declare-fun d!6399 () Bool)

(assert (=> d!6399 (= (size!1351 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!163 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1683 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!38685 d!6399))

(declare-fun b!38922 () Bool)

(declare-fun e!24714 () Bool)

(declare-fun e!24715 () Bool)

(assert (=> b!38922 (= e!24714 e!24715)))

(declare-fun lt!14590 () (_ BitVec 64))

(assert (=> b!38922 (= lt!14590 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14589 () Unit!961)

(assert (=> b!38922 (= lt!14589 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38922 (arrayContainsKey!0 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14590 #b00000000000000000000000000000000)))

(declare-fun lt!14588 () Unit!961)

(assert (=> b!38922 (= lt!14588 lt!14589)))

(declare-fun res!23470 () Bool)

(assert (=> b!38922 (= res!23470 (= (seekEntryOrOpen!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!166 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38922 (=> (not res!23470) (not e!24715))))

(declare-fun b!38923 () Bool)

(declare-fun call!2949 () Bool)

(assert (=> b!38923 (= e!24715 call!2949)))

(declare-fun b!38924 () Bool)

(assert (=> b!38924 (= e!24714 call!2949)))

(declare-fun b!38925 () Bool)

(declare-fun e!24713 () Bool)

(assert (=> b!38925 (= e!24713 e!24714)))

(declare-fun c!4516 () Bool)

(assert (=> b!38925 (= c!4516 (validKeyInArray!0 (select (arr!1229 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6401 () Bool)

(declare-fun res!23471 () Bool)

(assert (=> d!6401 (=> res!23471 e!24713)))

(assert (=> d!6401 (= res!23471 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6401 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24713)))

(declare-fun bm!2946 () Bool)

(assert (=> bm!2946 (= call!2949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3245 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6401 (not res!23471)) b!38925))

(assert (= (and b!38925 c!4516) b!38922))

(assert (= (and b!38925 (not c!4516)) b!38924))

(assert (= (and b!38922 res!23470) b!38923))

(assert (= (or b!38923 b!38924) bm!2946))

(assert (=> b!38922 m!31545))

(declare-fun m!31599 () Bool)

(assert (=> b!38922 m!31599))

(declare-fun m!31601 () Bool)

(assert (=> b!38922 m!31601))

(assert (=> b!38922 m!31545))

(declare-fun m!31603 () Bool)

(assert (=> b!38922 m!31603))

(assert (=> b!38925 m!31545))

(assert (=> b!38925 m!31545))

(assert (=> b!38925 m!31547))

(declare-fun m!31605 () Bool)

(assert (=> bm!2946 m!31605))

(assert (=> bm!2926 d!6401))

(assert (=> b!38686 d!6399))

(declare-fun d!6407 () Bool)

(assert (=> d!6407 (arrayContainsKey!0 lt!14419 lt!14552 #b00000000000000000000000000000000)))

(declare-fun lt!14593 () Unit!961)

(assert (=> d!6407 (= lt!14593 (choose!13 lt!14419 lt!14552 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6407 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6407 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14419 lt!14552 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14593)))

(declare-fun bs!1617 () Bool)

(assert (= bs!1617 d!6407))

(assert (=> bs!1617 m!31481))

(declare-fun m!31607 () Bool)

(assert (=> bs!1617 m!31607))

(assert (=> b!38794 d!6407))

(declare-fun d!6411 () Bool)

(declare-fun res!23472 () Bool)

(declare-fun e!24716 () Bool)

(assert (=> d!6411 (=> res!23472 e!24716)))

(assert (=> d!6411 (= res!23472 (= (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14552))))

(assert (=> d!6411 (= (arrayContainsKey!0 lt!14419 lt!14552 #b00000000000000000000000000000000) e!24716)))

(declare-fun b!38926 () Bool)

(declare-fun e!24717 () Bool)

(assert (=> b!38926 (= e!24716 e!24717)))

(declare-fun res!23473 () Bool)

(assert (=> b!38926 (=> (not res!23473) (not e!24717))))

(assert (=> b!38926 (= res!23473 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(declare-fun b!38927 () Bool)

(assert (=> b!38927 (= e!24717 (arrayContainsKey!0 lt!14419 lt!14552 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6411 (not res!23472)) b!38926))

(assert (= (and b!38926 res!23473) b!38927))

(assert (=> d!6411 m!31259))

(declare-fun m!31609 () Bool)

(assert (=> b!38927 m!31609))

(assert (=> b!38794 d!6411))

(declare-fun b!38928 () Bool)

(declare-fun c!4517 () Bool)

(declare-fun lt!14595 () (_ BitVec 64))

(assert (=> b!38928 (= c!4517 (= lt!14595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24719 () SeekEntryResult!166)

(declare-fun e!24720 () SeekEntryResult!166)

(assert (=> b!38928 (= e!24719 e!24720)))

(declare-fun b!38929 () Bool)

(declare-fun e!24718 () SeekEntryResult!166)

(assert (=> b!38929 (= e!24718 Undefined!166)))

(declare-fun b!38930 () Bool)

(declare-fun lt!14594 () SeekEntryResult!166)

(assert (=> b!38930 (= e!24720 (seekKeyOrZeroReturnVacant!0 (x!7602 lt!14594) (index!2788 lt!14594) (index!2788 lt!14594) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14419 mask!853))))

(declare-fun b!38931 () Bool)

(assert (=> b!38931 (= e!24720 (MissingZero!166 (index!2788 lt!14594)))))

(declare-fun b!38932 () Bool)

(assert (=> b!38932 (= e!24718 e!24719)))

(assert (=> b!38932 (= lt!14595 (select (arr!1229 lt!14419) (index!2788 lt!14594)))))

(declare-fun c!4518 () Bool)

(assert (=> b!38932 (= c!4518 (= lt!14595 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6413 () Bool)

(declare-fun lt!14596 () SeekEntryResult!166)

(assert (=> d!6413 (and (or ((_ is Undefined!166) lt!14596) (not ((_ is Found!166) lt!14596)) (and (bvsge (index!2787 lt!14596) #b00000000000000000000000000000000) (bvslt (index!2787 lt!14596) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14596) ((_ is Found!166) lt!14596) (not ((_ is MissingZero!166) lt!14596)) (and (bvsge (index!2786 lt!14596) #b00000000000000000000000000000000) (bvslt (index!2786 lt!14596) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14596) ((_ is Found!166) lt!14596) ((_ is MissingZero!166) lt!14596) (not ((_ is MissingVacant!166) lt!14596)) (and (bvsge (index!2789 lt!14596) #b00000000000000000000000000000000) (bvslt (index!2789 lt!14596) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14596) (ite ((_ is Found!166) lt!14596) (= (select (arr!1229 lt!14419) (index!2787 lt!14596)) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!166) lt!14596) (= (select (arr!1229 lt!14419) (index!2786 lt!14596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!166) lt!14596) (= (select (arr!1229 lt!14419) (index!2789 lt!14596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6413 (= lt!14596 e!24718)))

(declare-fun c!4519 () Bool)

(assert (=> d!6413 (= c!4519 (and ((_ is Intermediate!166) lt!14594) (undefined!978 lt!14594)))))

(assert (=> d!6413 (= lt!14594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14419 mask!853))))

(assert (=> d!6413 (validMask!0 mask!853)))

(assert (=> d!6413 (= (seekEntryOrOpen!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14419 mask!853) lt!14596)))

(declare-fun b!38933 () Bool)

(assert (=> b!38933 (= e!24719 (Found!166 (index!2788 lt!14594)))))

(assert (= (and d!6413 c!4519) b!38929))

(assert (= (and d!6413 (not c!4519)) b!38932))

(assert (= (and b!38932 c!4518) b!38933))

(assert (= (and b!38932 (not c!4518)) b!38928))

(assert (= (and b!38928 c!4517) b!38931))

(assert (= (and b!38928 (not c!4517)) b!38930))

(assert (=> b!38930 m!31391))

(declare-fun m!31611 () Bool)

(assert (=> b!38930 m!31611))

(declare-fun m!31613 () Bool)

(assert (=> b!38932 m!31613))

(declare-fun m!31615 () Bool)

(assert (=> d!6413 m!31615))

(assert (=> d!6413 m!31391))

(declare-fun m!31617 () Bool)

(assert (=> d!6413 m!31617))

(declare-fun m!31619 () Bool)

(assert (=> d!6413 m!31619))

(assert (=> d!6413 m!31391))

(assert (=> d!6413 m!31615))

(declare-fun m!31621 () Bool)

(assert (=> d!6413 m!31621))

(declare-fun m!31623 () Bool)

(assert (=> d!6413 m!31623))

(assert (=> d!6413 m!31219))

(assert (=> b!38794 d!6413))

(declare-fun d!6415 () Bool)

(declare-fun lt!14610 () SeekEntryResult!166)

(assert (=> d!6415 (and (or ((_ is Undefined!166) lt!14610) (not ((_ is Found!166) lt!14610)) (and (bvsge (index!2787 lt!14610) #b00000000000000000000000000000000) (bvslt (index!2787 lt!14610) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14610) ((_ is Found!166) lt!14610) (not ((_ is MissingVacant!166) lt!14610)) (not (= (index!2789 lt!14610) (index!2788 lt!14538))) (and (bvsge (index!2789 lt!14610) #b00000000000000000000000000000000) (bvslt (index!2789 lt!14610) (size!1336 lt!14419)))) (or ((_ is Undefined!166) lt!14610) (ite ((_ is Found!166) lt!14610) (= (select (arr!1229 lt!14419) (index!2787 lt!14610)) (select (arr!1229 lt!14419) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!166) lt!14610) (= (index!2789 lt!14610) (index!2788 lt!14538)) (= (select (arr!1229 lt!14419) (index!2789 lt!14610)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!24738 () SeekEntryResult!166)

(assert (=> d!6415 (= lt!14610 e!24738)))

(declare-fun c!4531 () Bool)

(assert (=> d!6415 (= c!4531 (bvsge (x!7602 lt!14538) #b01111111111111111111111111111110))))

(declare-fun lt!14609 () (_ BitVec 64))

(assert (=> d!6415 (= lt!14609 (select (arr!1229 lt!14419) (index!2788 lt!14538)))))

(assert (=> d!6415 (validMask!0 mask!853)))

(assert (=> d!6415 (= (seekKeyOrZeroReturnVacant!0 (x!7602 lt!14538) (index!2788 lt!14538) (index!2788 lt!14538) (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853) lt!14610)))

(declare-fun b!38960 () Bool)

(declare-fun e!24737 () SeekEntryResult!166)

(assert (=> b!38960 (= e!24737 (MissingVacant!166 (index!2788 lt!14538)))))

(declare-fun b!38961 () Bool)

(assert (=> b!38961 (= e!24738 Undefined!166)))

(declare-fun b!38962 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38962 (= e!24737 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7602 lt!14538) #b00000000000000000000000000000001) (nextIndex!0 (index!2788 lt!14538) (x!7602 lt!14538) mask!853) (index!2788 lt!14538) (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853))))

(declare-fun b!38963 () Bool)

(declare-fun c!4532 () Bool)

(assert (=> b!38963 (= c!4532 (= lt!14609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24739 () SeekEntryResult!166)

(assert (=> b!38963 (= e!24739 e!24737)))

(declare-fun b!38964 () Bool)

(assert (=> b!38964 (= e!24738 e!24739)))

(declare-fun c!4530 () Bool)

(assert (=> b!38964 (= c!4530 (= lt!14609 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun b!38965 () Bool)

(assert (=> b!38965 (= e!24739 (Found!166 (index!2788 lt!14538)))))

(assert (= (and d!6415 c!4531) b!38961))

(assert (= (and d!6415 (not c!4531)) b!38964))

(assert (= (and b!38964 c!4530) b!38965))

(assert (= (and b!38964 (not c!4530)) b!38963))

(assert (= (and b!38963 c!4532) b!38960))

(assert (= (and b!38963 (not c!4532)) b!38962))

(declare-fun m!31659 () Bool)

(assert (=> d!6415 m!31659))

(declare-fun m!31661 () Bool)

(assert (=> d!6415 m!31661))

(assert (=> d!6415 m!31435))

(assert (=> d!6415 m!31219))

(declare-fun m!31663 () Bool)

(assert (=> b!38962 m!31663))

(assert (=> b!38962 m!31663))

(assert (=> b!38962 m!31259))

(declare-fun m!31665 () Bool)

(assert (=> b!38962 m!31665))

(assert (=> b!38761 d!6415))

(assert (=> d!6337 d!6245))

(assert (=> b!38797 d!6377))

(declare-fun d!6433 () Bool)

(assert (not d!6433))

(assert (=> b!38699 d!6433))

(declare-fun b!38966 () Bool)

(declare-fun e!24741 () Bool)

(declare-fun e!24742 () Bool)

(assert (=> b!38966 (= e!24741 e!24742)))

(declare-fun lt!14613 () (_ BitVec 64))

(assert (=> b!38966 (= lt!14613 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!14612 () Unit!961)

(assert (=> b!38966 (= lt!14612 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14419 lt!14613 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!38966 (arrayContainsKey!0 lt!14419 lt!14613 #b00000000000000000000000000000000)))

(declare-fun lt!14611 () Unit!961)

(assert (=> b!38966 (= lt!14611 lt!14612)))

(declare-fun res!23480 () Bool)

(assert (=> b!38966 (= res!23480 (= (seekEntryOrOpen!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14419 mask!853) (Found!166 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!38966 (=> (not res!23480) (not e!24742))))

(declare-fun b!38967 () Bool)

(declare-fun call!2951 () Bool)

(assert (=> b!38967 (= e!24742 call!2951)))

(declare-fun b!38968 () Bool)

(assert (=> b!38968 (= e!24741 call!2951)))

(declare-fun b!38969 () Bool)

(declare-fun e!24740 () Bool)

(assert (=> b!38969 (= e!24740 e!24741)))

(declare-fun c!4533 () Bool)

(assert (=> b!38969 (= c!4533 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6435 () Bool)

(declare-fun res!23481 () Bool)

(assert (=> d!6435 (=> res!23481 e!24740)))

(assert (=> d!6435 (= res!23481 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1336 lt!14419)))))

(assert (=> d!6435 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14419 mask!853) e!24740)))

(declare-fun bm!2948 () Bool)

(assert (=> bm!2948 (= call!2951 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14419 mask!853))))

(assert (= (and d!6435 (not res!23481)) b!38969))

(assert (= (and b!38969 c!4533) b!38966))

(assert (= (and b!38969 (not c!4533)) b!38968))

(assert (= (and b!38966 res!23480) b!38967))

(assert (= (or b!38967 b!38968) bm!2948))

(assert (=> b!38966 m!31585))

(declare-fun m!31667 () Bool)

(assert (=> b!38966 m!31667))

(declare-fun m!31669 () Bool)

(assert (=> b!38966 m!31669))

(assert (=> b!38966 m!31585))

(declare-fun m!31671 () Bool)

(assert (=> b!38966 m!31671))

(assert (=> b!38969 m!31585))

(assert (=> b!38969 m!31585))

(assert (=> b!38969 m!31587))

(declare-fun m!31673 () Bool)

(assert (=> bm!2948 m!31673))

(assert (=> bm!2936 d!6435))

(declare-fun bm!2949 () Bool)

(declare-fun call!2952 () (_ BitVec 32))

(assert (=> bm!2949 (= call!2952 (arrayCountValidKeys!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38970 () Bool)

(declare-fun e!24743 () (_ BitVec 32))

(declare-fun e!24744 () (_ BitVec 32))

(assert (=> b!38970 (= e!24743 e!24744)))

(declare-fun c!4535 () Bool)

(assert (=> b!38970 (= c!4535 (validKeyInArray!0 (select (arr!1229 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38971 () Bool)

(assert (=> b!38971 (= e!24744 (bvadd #b00000000000000000000000000000001 call!2952))))

(declare-fun d!6437 () Bool)

(declare-fun lt!14614 () (_ BitVec 32))

(assert (=> d!6437 (and (bvsge lt!14614 #b00000000000000000000000000000000) (bvsle lt!14614 (bvsub (size!1336 lt!14419) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6437 (= lt!14614 e!24743)))

(declare-fun c!4534 () Bool)

(assert (=> d!6437 (= c!4534 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6437 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1336 lt!14419)))))

(assert (=> d!6437 (= (arrayCountValidKeys!0 lt!14419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14614)))

(declare-fun b!38972 () Bool)

(assert (=> b!38972 (= e!24743 #b00000000000000000000000000000000)))

(declare-fun b!38973 () Bool)

(assert (=> b!38973 (= e!24744 call!2952)))

(assert (= (and d!6437 c!4534) b!38972))

(assert (= (and d!6437 (not c!4534)) b!38970))

(assert (= (and b!38970 c!4535) b!38971))

(assert (= (and b!38970 (not c!4535)) b!38973))

(assert (= (or b!38971 b!38973) bm!2949))

(declare-fun m!31675 () Bool)

(assert (=> bm!2949 m!31675))

(assert (=> b!38970 m!31585))

(assert (=> b!38970 m!31585))

(assert (=> b!38970 m!31587))

(assert (=> bm!2928 d!6437))

(declare-fun b!39044 () Bool)

(declare-fun e!24790 () SeekEntryResult!166)

(assert (=> b!39044 (= e!24790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853))))

(declare-fun b!39045 () Bool)

(assert (=> b!39045 (= e!24790 (Intermediate!166 false (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39046 () Bool)

(declare-fun e!24791 () SeekEntryResult!166)

(assert (=> b!39046 (= e!24791 e!24790)))

(declare-fun c!4562 () Bool)

(declare-fun lt!14635 () (_ BitVec 64))

(assert (=> b!39046 (= c!4562 (or (= lt!14635 (select (arr!1229 lt!14419) #b00000000000000000000000000000000)) (= (bvadd lt!14635 lt!14635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39047 () Bool)

(assert (=> b!39047 (= e!24791 (Intermediate!166 true (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39048 () Bool)

(declare-fun lt!14636 () SeekEntryResult!166)

(assert (=> b!39048 (and (bvsge (index!2788 lt!14636) #b00000000000000000000000000000000) (bvslt (index!2788 lt!14636) (size!1336 lt!14419)))))

(declare-fun res!23503 () Bool)

(assert (=> b!39048 (= res!23503 (= (select (arr!1229 lt!14419) (index!2788 lt!14636)) (select (arr!1229 lt!14419) #b00000000000000000000000000000000)))))

(declare-fun e!24792 () Bool)

(assert (=> b!39048 (=> res!23503 e!24792)))

(declare-fun e!24788 () Bool)

(assert (=> b!39048 (= e!24788 e!24792)))

(declare-fun b!39049 () Bool)

(declare-fun e!24789 () Bool)

(assert (=> b!39049 (= e!24789 (bvsge (x!7602 lt!14636) #b01111111111111111111111111111110))))

(declare-fun b!39050 () Bool)

(assert (=> b!39050 (and (bvsge (index!2788 lt!14636) #b00000000000000000000000000000000) (bvslt (index!2788 lt!14636) (size!1336 lt!14419)))))

(assert (=> b!39050 (= e!24792 (= (select (arr!1229 lt!14419) (index!2788 lt!14636)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!6439 () Bool)

(assert (=> d!6439 e!24789))

(declare-fun c!4563 () Bool)

(assert (=> d!6439 (= c!4563 (and ((_ is Intermediate!166) lt!14636) (undefined!978 lt!14636)))))

(assert (=> d!6439 (= lt!14636 e!24791)))

(declare-fun c!4561 () Bool)

(assert (=> d!6439 (= c!4561 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6439 (= lt!14635 (select (arr!1229 lt!14419) (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6439 (validMask!0 mask!853)))

(assert (=> d!6439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853) (select (arr!1229 lt!14419) #b00000000000000000000000000000000) lt!14419 mask!853) lt!14636)))

(declare-fun b!39051 () Bool)

(assert (=> b!39051 (= e!24789 e!24788)))

(declare-fun res!23502 () Bool)

(assert (=> b!39051 (= res!23502 (and ((_ is Intermediate!166) lt!14636) (not (undefined!978 lt!14636)) (bvslt (x!7602 lt!14636) #b01111111111111111111111111111110) (bvsge (x!7602 lt!14636) #b00000000000000000000000000000000) (bvsge (x!7602 lt!14636) #b00000000000000000000000000000000)))))

(assert (=> b!39051 (=> (not res!23502) (not e!24788))))

(declare-fun b!39052 () Bool)

(assert (=> b!39052 (and (bvsge (index!2788 lt!14636) #b00000000000000000000000000000000) (bvslt (index!2788 lt!14636) (size!1336 lt!14419)))))

(declare-fun res!23504 () Bool)

(assert (=> b!39052 (= res!23504 (= (select (arr!1229 lt!14419) (index!2788 lt!14636)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39052 (=> res!23504 e!24792)))

(assert (= (and d!6439 c!4561) b!39047))

(assert (= (and d!6439 (not c!4561)) b!39046))

(assert (= (and b!39046 c!4562) b!39045))

(assert (= (and b!39046 (not c!4562)) b!39044))

(assert (= (and d!6439 c!4563) b!39049))

(assert (= (and d!6439 (not c!4563)) b!39051))

(assert (= (and b!39051 res!23502) b!39048))

(assert (= (and b!39048 (not res!23503)) b!39052))

(assert (= (and b!39052 (not res!23504)) b!39050))

(assert (=> b!39044 m!31439))

(declare-fun m!31735 () Bool)

(assert (=> b!39044 m!31735))

(assert (=> b!39044 m!31735))

(assert (=> b!39044 m!31259))

(declare-fun m!31737 () Bool)

(assert (=> b!39044 m!31737))

(declare-fun m!31739 () Bool)

(assert (=> b!39048 m!31739))

(assert (=> d!6439 m!31439))

(declare-fun m!31741 () Bool)

(assert (=> d!6439 m!31741))

(assert (=> d!6439 m!31219))

(assert (=> b!39050 m!31739))

(assert (=> b!39052 m!31739))

(assert (=> d!6313 d!6439))

(declare-fun d!6463 () Bool)

(declare-fun lt!14643 () (_ BitVec 32))

(declare-fun lt!14642 () (_ BitVec 32))

(assert (=> d!6463 (= lt!14643 (bvmul (bvxor lt!14642 (bvlshr lt!14642 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6463 (= lt!14642 ((_ extract 31 0) (bvand (bvxor (select (arr!1229 lt!14419) #b00000000000000000000000000000000) (bvlshr (select (arr!1229 lt!14419) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6463 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23505 (let ((h!1611 ((_ extract 31 0) (bvand (bvxor (select (arr!1229 lt!14419) #b00000000000000000000000000000000) (bvlshr (select (arr!1229 lt!14419) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7618 (bvmul (bvxor h!1611 (bvlshr h!1611 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7618 (bvlshr x!7618 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23505 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23505 #b00000000000000000000000000000000))))))

(assert (=> d!6463 (= (toIndex!0 (select (arr!1229 lt!14419) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!14643 (bvlshr lt!14643 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6313 d!6463))

(assert (=> d!6313 d!6273))

(declare-fun d!6475 () Bool)

(assert (=> d!6475 (= (content!25 Nil!1041) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!6293 d!6475))

(declare-fun d!6477 () Bool)

(assert (=> d!6477 (= (validMask!0 (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (and (or (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000001111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000011111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000001111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000011111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000001111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000011111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000001111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000011111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000001111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000011111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000001111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000011111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000001111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000011111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000111111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000001111111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000011111111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000111111111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00001111111111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00011111111111111111111111111111) (= (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)) (bvsle (mask!5113 (LongMapFixedSize!229 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14423 lt!14423 #b00000000000000000000000000000000 lt!14419 (array!2574 ((as const (Array (_ BitVec 32) ValueCell!624)) EmptyCell!624) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)))))

(assert (=> d!6287 d!6477))

(assert (=> b!38700 d!6377))

(check-sat (not b!38890) (not d!6413) (not b!38919) (not b!38912) (not b!38895) (not bm!2949) (not bm!2946) (not d!6439) (not d!6389) (not b_lambda!2019) (not bm!2945) (not b!38969) (not bm!2943) (not d!6387) (not b_next!1353) (not d!6381) (not b!39044) (not d!6383) (not b!38916) (not b!38970) (not b!38930) (not d!6407) (not bm!2944) (not b!38922) (not b!38892) (not b!38962) (not bm!2948) (not b!38909) (not b!38917) (not d!6415) tp_is_empty!1743 b_and!2321 (not b!38910) (not b!38918) (not b!38877) (not d!6373) (not b!38925) (not b!38911) (not b!38966) (not b!38927))
(check-sat b_and!2321 (not b_next!1353))
