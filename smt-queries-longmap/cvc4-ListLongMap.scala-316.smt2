; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5504 () Bool)

(assert start!5504)

(declare-fun b_free!1361 () Bool)

(declare-fun b_next!1361 () Bool)

(assert (=> start!5504 (= b_free!1361 (not b_next!1361))))

(declare-fun tp!5729 () Bool)

(declare-fun b_and!2335 () Bool)

(assert (=> start!5504 (= tp!5729 b_and!2335)))

(declare-fun res!23553 () Bool)

(declare-fun e!24868 () Bool)

(assert (=> start!5504 (=> (not res!23553) (not e!24868))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5504 (= res!23553 (validMask!0 mask!853))))

(assert (=> start!5504 e!24868))

(assert (=> start!5504 true))

(assert (=> start!5504 tp!5729))

(declare-fun b!39166 () Bool)

(declare-fun e!24867 () Bool)

(assert (=> b!39166 (= e!24868 (not e!24867))))

(declare-fun res!23552 () Bool)

(assert (=> b!39166 (=> res!23552 e!24867)))

(declare-datatypes ((array!2587 0))(
  ( (array!2588 (arr!1237 (Array (_ BitVec 32) (_ BitVec 64))) (size!1359 (_ BitVec 32))) )
))
(declare-datatypes ((V!2093 0))(
  ( (V!2094 (val!914 Int)) )
))
(declare-datatypes ((ValueCell!628 0))(
  ( (ValueCellFull!628 (v!1986 V!2093)) (EmptyCell!628) )
))
(declare-datatypes ((array!2589 0))(
  ( (array!2590 (arr!1238 (Array (_ BitVec 32) ValueCell!628)) (size!1360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!236 0))(
  ( (LongMapFixedSize!237 (defaultEntry!1796 Int) (mask!5143 (_ BitVec 32)) (extraKeys!1687 (_ BitVec 32)) (zeroValue!1714 V!2093) (minValue!1714 V!2093) (_size!167 (_ BitVec 32)) (_keys!3267 array!2587) (_values!1779 array!2589) (_vacant!167 (_ BitVec 32))) )
))
(declare-fun lt!14731 () LongMapFixedSize!236)

(declare-datatypes ((tuple2!1482 0))(
  ( (tuple2!1483 (_1!752 (_ BitVec 64)) (_2!752 V!2093)) )
))
(declare-datatypes ((List!1050 0))(
  ( (Nil!1047) (Cons!1046 (h!1617 tuple2!1482) (t!3895 List!1050)) )
))
(declare-datatypes ((ListLongMap!1059 0))(
  ( (ListLongMap!1060 (toList!545 List!1050)) )
))
(declare-fun map!686 (LongMapFixedSize!236) ListLongMap!1059)

(assert (=> b!39166 (= res!23552 (= (map!686 lt!14731) (ListLongMap!1060 Nil!1047)))))

(declare-fun lt!14732 () array!2587)

(declare-datatypes ((List!1051 0))(
  ( (Nil!1048) (Cons!1047 (h!1618 (_ BitVec 64)) (t!3896 List!1051)) )
))
(declare-fun arrayNoDuplicates!0 (array!2587 (_ BitVec 32) List!1051) Bool)

(assert (=> b!39166 (arrayNoDuplicates!0 lt!14732 #b00000000000000000000000000000000 Nil!1048)))

(declare-datatypes ((Unit!969 0))(
  ( (Unit!970) )
))
(declare-fun lt!14729 () Unit!969)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2587 (_ BitVec 32) (_ BitVec 32) List!1051) Unit!969)

(assert (=> b!39166 (= lt!14729 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2587 (_ BitVec 32)) Bool)

(assert (=> b!39166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14732 mask!853)))

(declare-fun lt!14728 () Unit!969)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2587 (_ BitVec 32) (_ BitVec 32)) Unit!969)

(assert (=> b!39166 (= lt!14728 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14732 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39166 (= (arrayCountValidKeys!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14727 () Unit!969)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2587 (_ BitVec 32) (_ BitVec 32)) Unit!969)

(assert (=> b!39166 (= lt!14727 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun lt!14730 () V!2093)

(declare-fun defaultEntry!470 () Int)

(assert (=> b!39166 (= lt!14731 (LongMapFixedSize!237 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14730 lt!14730 #b00000000000000000000000000000000 lt!14732 (array!2590 ((as const (Array (_ BitVec 32) ValueCell!628)) EmptyCell!628) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!39166 (= lt!14732 (array!2588 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!189 (Int (_ BitVec 64)) V!2093)

(assert (=> b!39166 (= lt!14730 (dynLambda!189 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39167 () Bool)

(declare-fun valid!117 (LongMapFixedSize!236) Bool)

(assert (=> b!39167 (= e!24867 (valid!117 lt!14731))))

(assert (= (and start!5504 res!23553) b!39166))

(assert (= (and b!39166 (not res!23552)) b!39167))

(declare-fun b_lambda!2025 () Bool)

(assert (=> (not b_lambda!2025) (not b!39166)))

(declare-fun t!3894 () Bool)

(declare-fun tb!831 () Bool)

(assert (=> (and start!5504 (= defaultEntry!470 defaultEntry!470) t!3894) tb!831))

(declare-fun result!1425 () Bool)

(declare-fun tp_is_empty!1751 () Bool)

(assert (=> tb!831 (= result!1425 tp_is_empty!1751)))

(assert (=> b!39166 t!3894))

(declare-fun b_and!2337 () Bool)

(assert (= b_and!2335 (and (=> t!3894 result!1425) b_and!2337)))

(declare-fun m!31883 () Bool)

(assert (=> start!5504 m!31883))

(declare-fun m!31885 () Bool)

(assert (=> b!39166 m!31885))

(declare-fun m!31887 () Bool)

(assert (=> b!39166 m!31887))

(declare-fun m!31889 () Bool)

(assert (=> b!39166 m!31889))

(declare-fun m!31891 () Bool)

(assert (=> b!39166 m!31891))

(declare-fun m!31893 () Bool)

(assert (=> b!39166 m!31893))

(declare-fun m!31895 () Bool)

(assert (=> b!39166 m!31895))

(declare-fun m!31897 () Bool)

(assert (=> b!39166 m!31897))

(declare-fun m!31899 () Bool)

(assert (=> b!39166 m!31899))

(declare-fun m!31901 () Bool)

(assert (=> b!39167 m!31901))

(push 1)

(assert (not b_lambda!2025))

(assert tp_is_empty!1751)

(assert (not b!39166))

(assert (not b!39167))

(assert (not start!5504))

(assert (not b_next!1361))

(assert b_and!2337)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2337)

(assert (not b_next!1361))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2029 () Bool)

(assert (= b_lambda!2025 (or (and start!5504 b_free!1361) b_lambda!2029)))

(push 1)

(assert tp_is_empty!1751)

(assert (not b!39167))

(assert (not start!5504))

(assert (not b_next!1361))

(assert b_and!2337)

(assert (not b!39166))

(assert (not b_lambda!2029))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2337)

(assert (not b_next!1361))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!39189 () Bool)

(declare-fun e!24883 () Bool)

(declare-fun contains!503 (List!1051 (_ BitVec 64)) Bool)

(assert (=> b!39189 (= e!24883 (contains!503 Nil!1048 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun b!39190 () Bool)

(declare-fun e!24882 () Bool)

(declare-fun call!2966 () Bool)

(assert (=> b!39190 (= e!24882 call!2966)))

(declare-fun b!39191 () Bool)

(declare-fun e!24880 () Bool)

(declare-fun e!24881 () Bool)

(assert (=> b!39191 (= e!24880 e!24881)))

(declare-fun res!23569 () Bool)

(assert (=> b!39191 (=> (not res!23569) (not e!24881))))

(assert (=> b!39191 (= res!23569 (not e!24883))))

(declare-fun res!23570 () Bool)

(assert (=> b!39191 (=> (not res!23570) (not e!24883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!39191 (= res!23570 (validKeyInArray!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun d!6523 () Bool)

(declare-fun res!23571 () Bool)

(assert (=> d!6523 (=> res!23571 e!24880)))

(assert (=> d!6523 (= res!23571 (bvsge #b00000000000000000000000000000000 (size!1359 lt!14732)))))

(assert (=> d!6523 (= (arrayNoDuplicates!0 lt!14732 #b00000000000000000000000000000000 Nil!1048) e!24880)))

(declare-fun b!39192 () Bool)

(assert (=> b!39192 (= e!24882 call!2966)))

(declare-fun bm!2963 () Bool)

(declare-fun c!4598 () Bool)

(assert (=> bm!2963 (= call!2966 (arrayNoDuplicates!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)))))

(declare-fun b!39193 () Bool)

(assert (=> b!39193 (= e!24881 e!24882)))

(assert (=> b!39193 (= c!4598 (validKeyInArray!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(assert (= (and d!6523 (not res!23571)) b!39191))

(assert (= (and b!39191 res!23570) b!39189))

(assert (= (and b!39191 res!23569) b!39193))

(assert (= (and b!39193 c!4598) b!39192))

(assert (= (and b!39193 (not c!4598)) b!39190))

(assert (= (or b!39192 b!39190) bm!2963))

(declare-fun m!31911 () Bool)

(assert (=> b!39189 m!31911))

(assert (=> b!39189 m!31911))

(declare-fun m!31913 () Bool)

(assert (=> b!39189 m!31913))

(assert (=> b!39191 m!31911))

(assert (=> b!39191 m!31911))

(declare-fun m!31915 () Bool)

(assert (=> b!39191 m!31915))

(assert (=> bm!2963 m!31911))

(declare-fun m!31917 () Bool)

(assert (=> bm!2963 m!31917))

(assert (=> b!39193 m!31911))

(assert (=> b!39193 m!31911))

(assert (=> b!39193 m!31915))

(assert (=> b!39166 d!6523))

(declare-fun d!6529 () Bool)

(assert (=> d!6529 (= (arrayCountValidKeys!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14737 () Unit!969)

(declare-fun choose!59 (array!2587 (_ BitVec 32) (_ BitVec 32)) Unit!969)

(assert (=> d!6529 (= lt!14737 (choose!59 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6529 (bvslt (size!1359 lt!14732) #b01111111111111111111111111111111)))

(assert (=> d!6529 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14737)))

(declare-fun bs!1627 () Bool)

(assert (= bs!1627 d!6529))

(assert (=> bs!1627 m!31893))

(declare-fun m!31919 () Bool)

(assert (=> bs!1627 m!31919))

(assert (=> b!39166 d!6529))

(declare-fun d!6531 () Bool)

(assert (=> d!6531 (arrayNoDuplicates!0 lt!14732 #b00000000000000000000000000000000 Nil!1048)))

(declare-fun lt!14744 () Unit!969)

(declare-fun choose!111 (array!2587 (_ BitVec 32) (_ BitVec 32) List!1051) Unit!969)

(assert (=> d!6531 (= lt!14744 (choose!111 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1048))))

(assert (=> d!6531 (= (size!1359 lt!14732) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6531 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1048) lt!14744)))

(declare-fun bs!1630 () Bool)

(assert (= bs!1630 d!6531))

(assert (=> bs!1630 m!31885))

(declare-fun m!31925 () Bool)

(assert (=> bs!1630 m!31925))

(assert (=> b!39166 d!6531))

(declare-fun d!6537 () Bool)

(assert (=> d!6537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14732 mask!853)))

(declare-fun lt!14747 () Unit!969)

(declare-fun choose!34 (array!2587 (_ BitVec 32) (_ BitVec 32)) Unit!969)

(assert (=> d!6537 (= lt!14747 (choose!34 lt!14732 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6537 (validMask!0 mask!853)))

(assert (=> d!6537 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14732 mask!853 #b00000000000000000000000000000000) lt!14747)))

(declare-fun bs!1631 () Bool)

(assert (= bs!1631 d!6537))

(assert (=> bs!1631 m!31897))

(declare-fun m!31927 () Bool)

(assert (=> bs!1631 m!31927))

(assert (=> bs!1631 m!31883))

(assert (=> b!39166 d!6537))

(declare-fun d!6541 () Bool)

(declare-fun getCurrentListMap!308 (array!2587 array!2589 (_ BitVec 32) (_ BitVec 32) V!2093 V!2093 (_ BitVec 32) Int) ListLongMap!1059)

(assert (=> d!6541 (= (map!686 lt!14731) (getCurrentListMap!308 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)))))

(declare-fun bs!1632 () Bool)

(assert (= bs!1632 d!6541))

(declare-fun m!31953 () Bool)

(assert (=> bs!1632 m!31953))

(assert (=> b!39166 d!6541))

(declare-fun b!39226 () Bool)

(declare-fun e!24907 () (_ BitVec 32))

(declare-fun call!2975 () (_ BitVec 32))

(assert (=> b!39226 (= e!24907 (bvadd #b00000000000000000000000000000001 call!2975))))

(declare-fun b!39227 () Bool)

(declare-fun e!24906 () (_ BitVec 32))

(assert (=> b!39227 (= e!24906 #b00000000000000000000000000000000)))

(declare-fun b!39228 () Bool)

(assert (=> b!39228 (= e!24906 e!24907)))

(declare-fun c!4610 () Bool)

(assert (=> b!39228 (= c!4610 (validKeyInArray!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun d!6547 () Bool)

(declare-fun lt!14768 () (_ BitVec 32))

(assert (=> d!6547 (and (bvsge lt!14768 #b00000000000000000000000000000000) (bvsle lt!14768 (bvsub (size!1359 lt!14732) #b00000000000000000000000000000000)))))

(assert (=> d!6547 (= lt!14768 e!24906)))

(declare-fun c!4609 () Bool)

(assert (=> d!6547 (= c!4609 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6547 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1359 lt!14732)))))

(assert (=> d!6547 (= (arrayCountValidKeys!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14768)))

(declare-fun bm!2972 () Bool)

(assert (=> bm!2972 (= call!2975 (arrayCountValidKeys!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39229 () Bool)

(assert (=> b!39229 (= e!24907 call!2975)))

(assert (= (and d!6547 c!4609) b!39227))

(assert (= (and d!6547 (not c!4609)) b!39228))

(assert (= (and b!39228 c!4610) b!39226))

(assert (= (and b!39228 (not c!4610)) b!39229))

(assert (= (or b!39226 b!39229) bm!2972))

(assert (=> b!39228 m!31911))

(assert (=> b!39228 m!31911))

(assert (=> b!39228 m!31915))

(declare-fun m!31959 () Bool)

(assert (=> bm!2972 m!31959))

(assert (=> b!39166 d!6547))

(declare-fun d!6553 () Bool)

(declare-fun res!23606 () Bool)

(declare-fun e!24940 () Bool)

(assert (=> d!6553 (=> res!23606 e!24940)))

(assert (=> d!6553 (= res!23606 (bvsge #b00000000000000000000000000000000 (size!1359 lt!14732)))))

(assert (=> d!6553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14732 mask!853) e!24940)))

(declare-fun b!39268 () Bool)

(declare-fun e!24938 () Bool)

(declare-fun e!24939 () Bool)

(assert (=> b!39268 (= e!24938 e!24939)))

(declare-fun lt!14778 () (_ BitVec 64))

(assert (=> b!39268 (= lt!14778 (select (arr!1237 lt!14732) #b00000000000000000000000000000000))))

(declare-fun lt!14780 () Unit!969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2587 (_ BitVec 64) (_ BitVec 32)) Unit!969)

(assert (=> b!39268 (= lt!14780 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14732 lt!14778 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!39268 (arrayContainsKey!0 lt!14732 lt!14778 #b00000000000000000000000000000000)))

(declare-fun lt!14779 () Unit!969)

(assert (=> b!39268 (= lt!14779 lt!14780)))

(declare-fun res!23607 () Bool)

(declare-datatypes ((SeekEntryResult!171 0))(
  ( (MissingZero!171 (index!2806 (_ BitVec 32))) (Found!171 (index!2807 (_ BitVec 32))) (Intermediate!171 (undefined!983 Bool) (index!2808 (_ BitVec 32)) (x!7657 (_ BitVec 32))) (Undefined!171) (MissingVacant!171 (index!2809 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2587 (_ BitVec 32)) SeekEntryResult!171)

(assert (=> b!39268 (= res!23607 (= (seekEntryOrOpen!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853) (Found!171 #b00000000000000000000000000000000)))))

(assert (=> b!39268 (=> (not res!23607) (not e!24939))))

(declare-fun bm!2981 () Bool)

(declare-fun call!2984 () Bool)

(assert (=> bm!2981 (= call!2984 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14732 mask!853))))

(declare-fun b!39269 () Bool)

(assert (=> b!39269 (= e!24939 call!2984)))

(declare-fun b!39270 () Bool)

(assert (=> b!39270 (= e!24938 call!2984)))

(declare-fun b!39271 () Bool)

(assert (=> b!39271 (= e!24940 e!24938)))

(declare-fun c!4619 () Bool)

(assert (=> b!39271 (= c!4619 (validKeyInArray!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(assert (= (and d!6553 (not res!23606)) b!39271))

(assert (= (and b!39271 c!4619) b!39268))

(assert (= (and b!39271 (not c!4619)) b!39270))

(assert (= (and b!39268 res!23607) b!39269))

(assert (= (or b!39269 b!39270) bm!2981))

(assert (=> b!39268 m!31911))

(declare-fun m!31971 () Bool)

(assert (=> b!39268 m!31971))

(declare-fun m!31973 () Bool)

(assert (=> b!39268 m!31973))

(assert (=> b!39268 m!31911))

(declare-fun m!31975 () Bool)

(assert (=> b!39268 m!31975))

(declare-fun m!31977 () Bool)

(assert (=> bm!2981 m!31977))

(assert (=> b!39271 m!31911))

(assert (=> b!39271 m!31911))

(assert (=> b!39271 m!31915))

(assert (=> b!39166 d!6553))

(declare-fun d!6561 () Bool)

(declare-fun res!23614 () Bool)

(declare-fun e!24955 () Bool)

(assert (=> d!6561 (=> (not res!23614) (not e!24955))))

(declare-fun simpleValid!26 (LongMapFixedSize!236) Bool)

(assert (=> d!6561 (= res!23614 (simpleValid!26 lt!14731))))

(assert (=> d!6561 (= (valid!117 lt!14731) e!24955)))

(declare-fun b!39302 () Bool)

(declare-fun res!23615 () Bool)

(assert (=> b!39302 (=> (not res!23615) (not e!24955))))

(assert (=> b!39302 (= res!23615 (= (arrayCountValidKeys!0 (_keys!3267 lt!14731) #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))) (_size!167 lt!14731)))))

(declare-fun b!39303 () Bool)

(declare-fun res!23616 () Bool)

(assert (=> b!39303 (=> (not res!23616) (not e!24955))))

(assert (=> b!39303 (= res!23616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3267 lt!14731) (mask!5143 lt!14731)))))

(declare-fun b!39304 () Bool)

(assert (=> b!39304 (= e!24955 (arrayNoDuplicates!0 (_keys!3267 lt!14731) #b00000000000000000000000000000000 Nil!1048))))

(assert (= (and d!6561 res!23614) b!39302))

(assert (= (and b!39302 res!23615) b!39303))

(assert (= (and b!39303 res!23616) b!39304))

(declare-fun m!31983 () Bool)

(assert (=> d!6561 m!31983))

(declare-fun m!31985 () Bool)

(assert (=> b!39302 m!31985))

(declare-fun m!31987 () Bool)

(assert (=> b!39303 m!31987))

(declare-fun m!31989 () Bool)

(assert (=> b!39304 m!31989))

(assert (=> b!39167 d!6561))

(declare-fun d!6567 () Bool)

(assert (=> d!6567 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5504 d!6567))

(push 1)

(assert (not b!39193))

(assert tp_is_empty!1751)

(assert (not b!39191))

(assert (not b!39302))

(assert (not d!6529))

(assert (not b!39303))

(assert (not d!6561))

(assert (not bm!2981))

(assert (not b!39268))

(assert (not b!39304))

(assert (not d!6537))

(assert (not d!6531))

(assert (not bm!2963))

(assert (not b_next!1361))

(assert b_and!2337)

(assert (not bm!2972))

(assert (not b_lambda!2029))

(assert (not b!39189))

(assert (not d!6541))

(assert (not b!39271))

(assert (not b!39228))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2337)

(assert (not b_next!1361))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6617 () Bool)

(declare-fun res!23678 () Bool)

(declare-fun e!25006 () Bool)

(assert (=> d!6617 (=> res!23678 e!25006)))

(assert (=> d!6617 (= res!23678 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(assert (=> d!6617 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14732 mask!853) e!25006)))

(declare-fun b!39394 () Bool)

(declare-fun e!25004 () Bool)

(declare-fun e!25005 () Bool)

(assert (=> b!39394 (= e!25004 e!25005)))

(declare-fun lt!14819 () (_ BitVec 64))

(assert (=> b!39394 (= lt!14819 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14821 () Unit!969)

(assert (=> b!39394 (= lt!14821 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14732 lt!14819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39394 (arrayContainsKey!0 lt!14732 lt!14819 #b00000000000000000000000000000000)))

(declare-fun lt!14820 () Unit!969)

(assert (=> b!39394 (= lt!14820 lt!14821)))

(declare-fun res!23679 () Bool)

(assert (=> b!39394 (= res!23679 (= (seekEntryOrOpen!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14732 mask!853) (Found!171 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39394 (=> (not res!23679) (not e!25005))))

(declare-fun bm!2994 () Bool)

(declare-fun call!2997 () Bool)

(assert (=> bm!2994 (= call!2997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14732 mask!853))))

(declare-fun b!39395 () Bool)

(assert (=> b!39395 (= e!25005 call!2997)))

(declare-fun b!39396 () Bool)

(assert (=> b!39396 (= e!25004 call!2997)))

(declare-fun b!39397 () Bool)

(assert (=> b!39397 (= e!25006 e!25004)))

(declare-fun c!4649 () Bool)

(assert (=> b!39397 (= c!4649 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6617 (not res!23678)) b!39397))

(assert (= (and b!39397 c!4649) b!39394))

(assert (= (and b!39397 (not c!4649)) b!39396))

(assert (= (and b!39394 res!23679) b!39395))

(assert (= (or b!39395 b!39396) bm!2994))

(declare-fun m!32077 () Bool)

(assert (=> b!39394 m!32077))

(declare-fun m!32079 () Bool)

(assert (=> b!39394 m!32079))

(declare-fun m!32081 () Bool)

(assert (=> b!39394 m!32081))

(assert (=> b!39394 m!32077))

(declare-fun m!32083 () Bool)

(assert (=> b!39394 m!32083))

(declare-fun m!32085 () Bool)

(assert (=> bm!2994 m!32085))

(assert (=> b!39397 m!32077))

(assert (=> b!39397 m!32077))

(declare-fun m!32087 () Bool)

(assert (=> b!39397 m!32087))

(assert (=> bm!2981 d!6617))

(assert (=> d!6529 d!6547))

(declare-fun d!6619 () Bool)

(assert (=> d!6619 (= (arrayCountValidKeys!0 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6619 true))

(declare-fun _$88!31 () Unit!969)

(assert (=> d!6619 (= (choose!59 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!31)))

(declare-fun bs!1645 () Bool)

(assert (= bs!1645 d!6619))

(assert (=> bs!1645 m!31893))

(assert (=> d!6529 d!6619))

(declare-fun b!39407 () Bool)

(declare-fun res!23689 () Bool)

(declare-fun e!25009 () Bool)

(assert (=> b!39407 (=> (not res!23689) (not e!25009))))

(declare-fun size!1375 (LongMapFixedSize!236) (_ BitVec 32))

(assert (=> b!39407 (= res!23689 (bvsge (size!1375 lt!14731) (_size!167 lt!14731)))))

(declare-fun b!39408 () Bool)

(declare-fun res!23688 () Bool)

(assert (=> b!39408 (=> (not res!23688) (not e!25009))))

(assert (=> b!39408 (= res!23688 (= (size!1375 lt!14731) (bvadd (_size!167 lt!14731) (bvsdiv (bvadd (extraKeys!1687 lt!14731) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!39406 () Bool)

(declare-fun res!23690 () Bool)

(assert (=> b!39406 (=> (not res!23690) (not e!25009))))

(assert (=> b!39406 (= res!23690 (and (= (size!1360 (_values!1779 lt!14731)) (bvadd (mask!5143 lt!14731) #b00000000000000000000000000000001)) (= (size!1359 (_keys!3267 lt!14731)) (size!1360 (_values!1779 lt!14731))) (bvsge (_size!167 lt!14731) #b00000000000000000000000000000000) (bvsle (_size!167 lt!14731) (bvadd (mask!5143 lt!14731) #b00000000000000000000000000000001))))))

(declare-fun b!39409 () Bool)

(assert (=> b!39409 (= e!25009 (and (bvsge (extraKeys!1687 lt!14731) #b00000000000000000000000000000000) (bvsle (extraKeys!1687 lt!14731) #b00000000000000000000000000000011) (bvsge (_vacant!167 lt!14731) #b00000000000000000000000000000000)))))

(declare-fun d!6621 () Bool)

(declare-fun res!23691 () Bool)

(assert (=> d!6621 (=> (not res!23691) (not e!25009))))

(assert (=> d!6621 (= res!23691 (validMask!0 (mask!5143 lt!14731)))))

(assert (=> d!6621 (= (simpleValid!26 lt!14731) e!25009)))

(assert (= (and d!6621 res!23691) b!39406))

(assert (= (and b!39406 res!23690) b!39407))

(assert (= (and b!39407 res!23689) b!39408))

(assert (= (and b!39408 res!23688) b!39409))

(declare-fun m!32089 () Bool)

(assert (=> b!39407 m!32089))

(assert (=> b!39408 m!32089))

(declare-fun m!32091 () Bool)

(assert (=> d!6621 m!32091))

(assert (=> d!6561 d!6621))

(declare-fun d!6623 () Bool)

(assert (=> d!6623 (= (validKeyInArray!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)) (and (not (= (select (arr!1237 lt!14732) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1237 lt!14732) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39271 d!6623))

(assert (=> d!6537 d!6553))

(declare-fun d!6625 () Bool)

(assert (=> d!6625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14732 mask!853)))

(assert (=> d!6625 true))

(declare-fun _$30!48 () Unit!969)

(assert (=> d!6625 (= (choose!34 lt!14732 mask!853 #b00000000000000000000000000000000) _$30!48)))

(declare-fun bs!1646 () Bool)

(assert (= bs!1646 d!6625))

(assert (=> bs!1646 m!31897))

(assert (=> d!6537 d!6625))

(assert (=> d!6537 d!6567))

(assert (=> d!6531 d!6523))

(declare-fun d!6627 () Bool)

(assert (=> d!6627 (arrayNoDuplicates!0 lt!14732 #b00000000000000000000000000000000 Nil!1048)))

(assert (=> d!6627 true))

(declare-fun res!23694 () Unit!969)

(assert (=> d!6627 (= (choose!111 lt!14732 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1048) res!23694)))

(declare-fun bs!1647 () Bool)

(assert (= bs!1647 d!6627))

(assert (=> bs!1647 m!31885))

(assert (=> d!6531 d!6627))

(declare-fun b!39410 () Bool)

(declare-fun e!25013 () Bool)

(assert (=> b!39410 (= e!25013 (contains!503 Nil!1048 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun b!39411 () Bool)

(declare-fun e!25012 () Bool)

(declare-fun call!2998 () Bool)

(assert (=> b!39411 (= e!25012 call!2998)))

(declare-fun b!39412 () Bool)

(declare-fun e!25010 () Bool)

(declare-fun e!25011 () Bool)

(assert (=> b!39412 (= e!25010 e!25011)))

(declare-fun res!23695 () Bool)

(assert (=> b!39412 (=> (not res!23695) (not e!25011))))

(assert (=> b!39412 (= res!23695 (not e!25013))))

(declare-fun res!23696 () Bool)

(assert (=> b!39412 (=> (not res!23696) (not e!25013))))

(assert (=> b!39412 (= res!23696 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun d!6629 () Bool)

(declare-fun res!23697 () Bool)

(assert (=> d!6629 (=> res!23697 e!25010)))

(assert (=> d!6629 (= res!23697 (bvsge #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6629 (= (arrayNoDuplicates!0 (_keys!3267 lt!14731) #b00000000000000000000000000000000 Nil!1048) e!25010)))

(declare-fun b!39413 () Bool)

(assert (=> b!39413 (= e!25012 call!2998)))

(declare-fun bm!2995 () Bool)

(declare-fun c!4650 () Bool)

(assert (=> bm!2995 (= call!2998 (arrayNoDuplicates!0 (_keys!3267 lt!14731) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4650 (Cons!1047 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) Nil!1048) Nil!1048)))))

(declare-fun b!39414 () Bool)

(assert (=> b!39414 (= e!25011 e!25012)))

(assert (=> b!39414 (= c!4650 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(assert (= (and d!6629 (not res!23697)) b!39412))

(assert (= (and b!39412 res!23696) b!39410))

(assert (= (and b!39412 res!23695) b!39414))

(assert (= (and b!39414 c!4650) b!39413))

(assert (= (and b!39414 (not c!4650)) b!39411))

(assert (= (or b!39413 b!39411) bm!2995))

(declare-fun m!32093 () Bool)

(assert (=> b!39410 m!32093))

(assert (=> b!39410 m!32093))

(declare-fun m!32095 () Bool)

(assert (=> b!39410 m!32095))

(assert (=> b!39412 m!32093))

(assert (=> b!39412 m!32093))

(declare-fun m!32097 () Bool)

(assert (=> b!39412 m!32097))

(assert (=> bm!2995 m!32093))

(declare-fun m!32099 () Bool)

(assert (=> bm!2995 m!32099))

(assert (=> b!39414 m!32093))

(assert (=> b!39414 m!32093))

(assert (=> b!39414 m!32097))

(assert (=> b!39304 d!6629))

(assert (=> b!39228 d!6623))

(declare-fun d!6631 () Bool)

(declare-fun lt!14824 () Bool)

(declare-fun content!28 (List!1051) (Set (_ BitVec 64)))

(assert (=> d!6631 (= lt!14824 (member (select (arr!1237 lt!14732) #b00000000000000000000000000000000) (content!28 Nil!1048)))))

(declare-fun e!25019 () Bool)

(assert (=> d!6631 (= lt!14824 e!25019)))

(declare-fun res!23702 () Bool)

(assert (=> d!6631 (=> (not res!23702) (not e!25019))))

(assert (=> d!6631 (= res!23702 (is-Cons!1047 Nil!1048))))

(assert (=> d!6631 (= (contains!503 Nil!1048 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)) lt!14824)))

(declare-fun b!39419 () Bool)

(declare-fun e!25018 () Bool)

(assert (=> b!39419 (= e!25019 e!25018)))

(declare-fun res!23703 () Bool)

(assert (=> b!39419 (=> res!23703 e!25018)))

(assert (=> b!39419 (= res!23703 (= (h!1618 Nil!1048) (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun b!39420 () Bool)

(assert (=> b!39420 (= e!25018 (contains!503 (t!3896 Nil!1048) (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(assert (= (and d!6631 res!23702) b!39419))

(assert (= (and b!39419 (not res!23703)) b!39420))

(declare-fun m!32101 () Bool)

(assert (=> d!6631 m!32101))

(assert (=> d!6631 m!31911))

(declare-fun m!32103 () Bool)

(assert (=> d!6631 m!32103))

(assert (=> b!39420 m!31911))

(declare-fun m!32105 () Bool)

(assert (=> b!39420 m!32105))

(assert (=> b!39189 d!6631))

(declare-fun d!6633 () Bool)

(declare-fun res!23704 () Bool)

(declare-fun e!25022 () Bool)

(assert (=> d!6633 (=> res!23704 e!25022)))

(assert (=> d!6633 (= res!23704 (bvsge #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3267 lt!14731) (mask!5143 lt!14731)) e!25022)))

(declare-fun b!39421 () Bool)

(declare-fun e!25020 () Bool)

(declare-fun e!25021 () Bool)

(assert (=> b!39421 (= e!25020 e!25021)))

(declare-fun lt!14825 () (_ BitVec 64))

(assert (=> b!39421 (= lt!14825 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000))))

(declare-fun lt!14827 () Unit!969)

(assert (=> b!39421 (= lt!14827 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3267 lt!14731) lt!14825 #b00000000000000000000000000000000))))

(assert (=> b!39421 (arrayContainsKey!0 (_keys!3267 lt!14731) lt!14825 #b00000000000000000000000000000000)))

(declare-fun lt!14826 () Unit!969)

(assert (=> b!39421 (= lt!14826 lt!14827)))

(declare-fun res!23705 () Bool)

(assert (=> b!39421 (= res!23705 (= (seekEntryOrOpen!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) (_keys!3267 lt!14731) (mask!5143 lt!14731)) (Found!171 #b00000000000000000000000000000000)))))

(assert (=> b!39421 (=> (not res!23705) (not e!25021))))

(declare-fun bm!2996 () Bool)

(declare-fun call!2999 () Bool)

(assert (=> bm!2996 (= call!2999 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3267 lt!14731) (mask!5143 lt!14731)))))

(declare-fun b!39422 () Bool)

(assert (=> b!39422 (= e!25021 call!2999)))

(declare-fun b!39423 () Bool)

(assert (=> b!39423 (= e!25020 call!2999)))

(declare-fun b!39424 () Bool)

(assert (=> b!39424 (= e!25022 e!25020)))

(declare-fun c!4651 () Bool)

(assert (=> b!39424 (= c!4651 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(assert (= (and d!6633 (not res!23704)) b!39424))

(assert (= (and b!39424 c!4651) b!39421))

(assert (= (and b!39424 (not c!4651)) b!39423))

(assert (= (and b!39421 res!23705) b!39422))

(assert (= (or b!39422 b!39423) bm!2996))

(assert (=> b!39421 m!32093))

(declare-fun m!32107 () Bool)

(assert (=> b!39421 m!32107))

(declare-fun m!32109 () Bool)

(assert (=> b!39421 m!32109))

(assert (=> b!39421 m!32093))

(declare-fun m!32111 () Bool)

(assert (=> b!39421 m!32111))

(declare-fun m!32113 () Bool)

(assert (=> bm!2996 m!32113))

(assert (=> b!39424 m!32093))

(assert (=> b!39424 m!32093))

(assert (=> b!39424 m!32097))

(assert (=> b!39303 d!6633))

(declare-fun b!39425 () Bool)

(declare-fun e!25024 () (_ BitVec 32))

(declare-fun call!3000 () (_ BitVec 32))

(assert (=> b!39425 (= e!25024 (bvadd #b00000000000000000000000000000001 call!3000))))

(declare-fun b!39426 () Bool)

(declare-fun e!25023 () (_ BitVec 32))

(assert (=> b!39426 (= e!25023 #b00000000000000000000000000000000)))

(declare-fun b!39427 () Bool)

(assert (=> b!39427 (= e!25023 e!25024)))

(declare-fun c!4653 () Bool)

(assert (=> b!39427 (= c!4653 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6635 () Bool)

(declare-fun lt!14828 () (_ BitVec 32))

(assert (=> d!6635 (and (bvsge lt!14828 #b00000000000000000000000000000000) (bvsle lt!14828 (bvsub (size!1359 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6635 (= lt!14828 e!25023)))

(declare-fun c!4652 () Bool)

(assert (=> d!6635 (= c!4652 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6635 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1359 lt!14732)))))

(assert (=> d!6635 (= (arrayCountValidKeys!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14828)))

(declare-fun bm!2997 () Bool)

(assert (=> bm!2997 (= call!3000 (arrayCountValidKeys!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39428 () Bool)

(assert (=> b!39428 (= e!25024 call!3000)))

(assert (= (and d!6635 c!4652) b!39426))

(assert (= (and d!6635 (not c!4652)) b!39427))

(assert (= (and b!39427 c!4653) b!39425))

(assert (= (and b!39427 (not c!4653)) b!39428))

(assert (= (or b!39425 b!39428) bm!2997))

(assert (=> b!39427 m!32077))

(assert (=> b!39427 m!32077))

(assert (=> b!39427 m!32087))

(declare-fun m!32115 () Bool)

(assert (=> bm!2997 m!32115))

(assert (=> bm!2972 d!6635))

(declare-fun b!39429 () Bool)

(declare-fun e!25026 () (_ BitVec 32))

(declare-fun call!3001 () (_ BitVec 32))

(assert (=> b!39429 (= e!25026 (bvadd #b00000000000000000000000000000001 call!3001))))

(declare-fun b!39430 () Bool)

(declare-fun e!25025 () (_ BitVec 32))

(assert (=> b!39430 (= e!25025 #b00000000000000000000000000000000)))

(declare-fun b!39431 () Bool)

(assert (=> b!39431 (= e!25025 e!25026)))

(declare-fun c!4655 () Bool)

(assert (=> b!39431 (= c!4655 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun d!6637 () Bool)

(declare-fun lt!14829 () (_ BitVec 32))

(assert (=> d!6637 (and (bvsge lt!14829 #b00000000000000000000000000000000) (bvsle lt!14829 (bvsub (size!1359 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(assert (=> d!6637 (= lt!14829 e!25025)))

(declare-fun c!4654 () Bool)

(assert (=> d!6637 (= c!4654 (bvsge #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6637 (and (bvsle #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1359 (_keys!3267 lt!14731)) (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6637 (= (arrayCountValidKeys!0 (_keys!3267 lt!14731) #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))) lt!14829)))

(declare-fun bm!2998 () Bool)

(assert (=> bm!2998 (= call!3001 (arrayCountValidKeys!0 (_keys!3267 lt!14731) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 (_keys!3267 lt!14731))))))

(declare-fun b!39432 () Bool)

(assert (=> b!39432 (= e!25026 call!3001)))

(assert (= (and d!6637 c!4654) b!39430))

(assert (= (and d!6637 (not c!4654)) b!39431))

(assert (= (and b!39431 c!4655) b!39429))

(assert (= (and b!39431 (not c!4655)) b!39432))

(assert (= (or b!39429 b!39432) bm!2998))

(assert (=> b!39431 m!32093))

(assert (=> b!39431 m!32093))

(assert (=> b!39431 m!32097))

(declare-fun m!32117 () Bool)

(assert (=> bm!2998 m!32117))

(assert (=> b!39302 d!6637))

(assert (=> b!39191 d!6623))

(declare-fun b!39647 () Bool)

(declare-fun e!25165 () Bool)

(declare-fun lt!15036 () ListLongMap!1059)

(declare-fun apply!54 (ListLongMap!1059 (_ BitVec 64)) V!2093)

(declare-fun get!691 (ValueCell!628 V!2093) V!2093)

(assert (=> b!39647 (= e!25165 (= (apply!54 lt!15036 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)) (get!691 (select (arr!1238 (_values!1779 lt!14731)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1796 lt!14731) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1360 (_values!1779 lt!14731))))))

(assert (=> b!39647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(declare-fun bm!3059 () Bool)

(declare-fun call!3065 () ListLongMap!1059)

(declare-fun getCurrentListMapNoExtraKeys!32 (array!2587 array!2589 (_ BitVec 32) (_ BitVec 32) V!2093 V!2093 (_ BitVec 32) Int) ListLongMap!1059)

(assert (=> bm!3059 (= call!3065 (getCurrentListMapNoExtraKeys!32 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)))))

(declare-fun b!39648 () Bool)

(declare-fun e!25172 () Bool)

(assert (=> b!39648 (= e!25172 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun call!3063 () ListLongMap!1059)

(declare-fun call!3067 () ListLongMap!1059)

(declare-fun bm!3060 () Bool)

(declare-fun c!4720 () Bool)

(declare-fun c!4723 () Bool)

(declare-fun call!3068 () ListLongMap!1059)

(declare-fun +!63 (ListLongMap!1059 tuple2!1482) ListLongMap!1059)

(assert (=> bm!3060 (= call!3063 (+!63 (ite c!4720 call!3065 (ite c!4723 call!3068 call!3067)) (ite (or c!4720 c!4723) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1714 lt!14731)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1714 lt!14731)))))))

(declare-fun b!39649 () Bool)

(declare-fun e!25173 () Unit!969)

(declare-fun lt!15033 () Unit!969)

(assert (=> b!39649 (= e!25173 lt!15033)))

(declare-fun lt!15031 () ListLongMap!1059)

(assert (=> b!39649 (= lt!15031 (getCurrentListMapNoExtraKeys!32 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)))))

(declare-fun lt!15026 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15035 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15035 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000))))

(declare-fun lt!15030 () Unit!969)

(declare-fun addStillContains!30 (ListLongMap!1059 (_ BitVec 64) V!2093 (_ BitVec 64)) Unit!969)

(assert (=> b!39649 (= lt!15030 (addStillContains!30 lt!15031 lt!15026 (zeroValue!1714 lt!14731) lt!15035))))

(declare-fun contains!508 (ListLongMap!1059 (_ BitVec 64)) Bool)

(assert (=> b!39649 (contains!508 (+!63 lt!15031 (tuple2!1483 lt!15026 (zeroValue!1714 lt!14731))) lt!15035)))

(declare-fun lt!15027 () Unit!969)

(assert (=> b!39649 (= lt!15027 lt!15030)))

(declare-fun lt!15039 () ListLongMap!1059)

(assert (=> b!39649 (= lt!15039 (getCurrentListMapNoExtraKeys!32 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)))))

(declare-fun lt!15034 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15034 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15025 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15025 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000))))

(declare-fun lt!15041 () Unit!969)

(declare-fun addApplyDifferent!30 (ListLongMap!1059 (_ BitVec 64) V!2093 (_ BitVec 64)) Unit!969)

(assert (=> b!39649 (= lt!15041 (addApplyDifferent!30 lt!15039 lt!15034 (minValue!1714 lt!14731) lt!15025))))

(assert (=> b!39649 (= (apply!54 (+!63 lt!15039 (tuple2!1483 lt!15034 (minValue!1714 lt!14731))) lt!15025) (apply!54 lt!15039 lt!15025))))

(declare-fun lt!15024 () Unit!969)

(assert (=> b!39649 (= lt!15024 lt!15041)))

(declare-fun lt!15032 () ListLongMap!1059)

(assert (=> b!39649 (= lt!15032 (getCurrentListMapNoExtraKeys!32 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)))))

(declare-fun lt!15040 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15045 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15045 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000))))

(declare-fun lt!15028 () Unit!969)

(assert (=> b!39649 (= lt!15028 (addApplyDifferent!30 lt!15032 lt!15040 (zeroValue!1714 lt!14731) lt!15045))))

(assert (=> b!39649 (= (apply!54 (+!63 lt!15032 (tuple2!1483 lt!15040 (zeroValue!1714 lt!14731))) lt!15045) (apply!54 lt!15032 lt!15045))))

(declare-fun lt!15038 () Unit!969)

(assert (=> b!39649 (= lt!15038 lt!15028)))

(declare-fun lt!15042 () ListLongMap!1059)

(assert (=> b!39649 (= lt!15042 (getCurrentListMapNoExtraKeys!32 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)))))

(declare-fun lt!15029 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15029 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15043 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15043 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000))))

(assert (=> b!39649 (= lt!15033 (addApplyDifferent!30 lt!15042 lt!15029 (minValue!1714 lt!14731) lt!15043))))

(assert (=> b!39649 (= (apply!54 (+!63 lt!15042 (tuple2!1483 lt!15029 (minValue!1714 lt!14731))) lt!15043) (apply!54 lt!15042 lt!15043))))

(declare-fun bm!3061 () Bool)

(declare-fun call!3064 () ListLongMap!1059)

(assert (=> bm!3061 (= call!3064 call!3063)))

(declare-fun b!39650 () Bool)

(declare-fun e!25167 () Bool)

(assert (=> b!39650 (= e!25167 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun b!39651 () Bool)

(declare-fun e!25174 () ListLongMap!1059)

(declare-fun e!25171 () ListLongMap!1059)

(assert (=> b!39651 (= e!25174 e!25171)))

(assert (=> b!39651 (= c!4723 (and (not (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3062 () Bool)

(declare-fun call!3066 () Bool)

(assert (=> bm!3062 (= call!3066 (contains!508 lt!15036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3063 () Bool)

(assert (=> bm!3063 (= call!3068 call!3065)))

(declare-fun b!39653 () Bool)

(declare-fun e!25163 () Bool)

(assert (=> b!39653 (= e!25163 (= (apply!54 lt!15036 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1714 lt!14731)))))

(declare-fun b!39654 () Bool)

(declare-fun res!23796 () Bool)

(declare-fun e!25168 () Bool)

(assert (=> b!39654 (=> (not res!23796) (not e!25168))))

(declare-fun e!25166 () Bool)

(assert (=> b!39654 (= res!23796 e!25166)))

(declare-fun c!4721 () Bool)

(assert (=> b!39654 (= c!4721 (not (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!39655 () Bool)

(declare-fun e!25169 () ListLongMap!1059)

(assert (=> b!39655 (= e!25169 call!3064)))

(declare-fun b!39656 () Bool)

(assert (=> b!39656 (= e!25169 call!3067)))

(declare-fun b!39657 () Bool)

(assert (=> b!39657 (= e!25166 e!25163)))

(declare-fun res!23804 () Bool)

(assert (=> b!39657 (= res!23804 call!3066)))

(assert (=> b!39657 (=> (not res!23804) (not e!25163))))

(declare-fun b!39658 () Bool)

(declare-fun res!23798 () Bool)

(assert (=> b!39658 (=> (not res!23798) (not e!25168))))

(declare-fun e!25175 () Bool)

(assert (=> b!39658 (= res!23798 e!25175)))

(declare-fun res!23803 () Bool)

(assert (=> b!39658 (=> res!23803 e!25175)))

(assert (=> b!39658 (= res!23803 (not e!25172))))

(declare-fun res!23800 () Bool)

(assert (=> b!39658 (=> (not res!23800) (not e!25172))))

(assert (=> b!39658 (= res!23800 (bvslt #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(declare-fun b!39659 () Bool)

(declare-fun e!25164 () Bool)

(declare-fun e!25170 () Bool)

(assert (=> b!39659 (= e!25164 e!25170)))

(declare-fun res!23802 () Bool)

(declare-fun call!3062 () Bool)

(assert (=> b!39659 (= res!23802 call!3062)))

(assert (=> b!39659 (=> (not res!23802) (not e!25170))))

(declare-fun b!39660 () Bool)

(declare-fun Unit!973 () Unit!969)

(assert (=> b!39660 (= e!25173 Unit!973)))

(declare-fun b!39661 () Bool)

(declare-fun c!4718 () Bool)

(assert (=> b!39661 (= c!4718 (and (not (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!39661 (= e!25171 e!25169)))

(declare-fun b!39662 () Bool)

(assert (=> b!39662 (= e!25168 e!25164)))

(declare-fun c!4722 () Bool)

(assert (=> b!39662 (= c!4722 (not (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!39663 () Bool)

(assert (=> b!39663 (= e!25170 (= (apply!54 lt!15036 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1714 lt!14731)))))

(declare-fun bm!3064 () Bool)

(assert (=> bm!3064 (= call!3067 call!3068)))

(declare-fun b!39664 () Bool)

(assert (=> b!39664 (= e!25174 (+!63 call!3063 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1714 lt!14731))))))

(declare-fun d!6639 () Bool)

(assert (=> d!6639 e!25168))

(declare-fun res!23799 () Bool)

(assert (=> d!6639 (=> (not res!23799) (not e!25168))))

(assert (=> d!6639 (= res!23799 (or (bvsge #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))))

(declare-fun lt!15044 () ListLongMap!1059)

(assert (=> d!6639 (= lt!15036 lt!15044)))

(declare-fun lt!15037 () Unit!969)

(assert (=> d!6639 (= lt!15037 e!25173)))

(declare-fun c!4719 () Bool)

(assert (=> d!6639 (= c!4719 e!25167)))

(declare-fun res!23797 () Bool)

(assert (=> d!6639 (=> (not res!23797) (not e!25167))))

(assert (=> d!6639 (= res!23797 (bvslt #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6639 (= lt!15044 e!25174)))

(assert (=> d!6639 (= c!4720 (and (not (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1687 lt!14731) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!6639 (validMask!0 (mask!5143 lt!14731))))

(assert (=> d!6639 (= (getCurrentListMap!308 (_keys!3267 lt!14731) (_values!1779 lt!14731) (mask!5143 lt!14731) (extraKeys!1687 lt!14731) (zeroValue!1714 lt!14731) (minValue!1714 lt!14731) #b00000000000000000000000000000000 (defaultEntry!1796 lt!14731)) lt!15036)))

(declare-fun b!39652 () Bool)

(assert (=> b!39652 (= e!25166 (not call!3066))))

(declare-fun b!39665 () Bool)

(assert (=> b!39665 (= e!25164 (not call!3062))))

(declare-fun b!39666 () Bool)

(assert (=> b!39666 (= e!25171 call!3064)))

(declare-fun bm!3065 () Bool)

(assert (=> bm!3065 (= call!3062 (contains!508 lt!15036 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39667 () Bool)

(assert (=> b!39667 (= e!25175 e!25165)))

(declare-fun res!23801 () Bool)

(assert (=> b!39667 (=> (not res!23801) (not e!25165))))

(assert (=> b!39667 (= res!23801 (contains!508 lt!15036 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(assert (=> b!39667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1359 (_keys!3267 lt!14731))))))

(assert (= (and d!6639 c!4720) b!39664))

(assert (= (and d!6639 (not c!4720)) b!39651))

(assert (= (and b!39651 c!4723) b!39666))

(assert (= (and b!39651 (not c!4723)) b!39661))

(assert (= (and b!39661 c!4718) b!39655))

(assert (= (and b!39661 (not c!4718)) b!39656))

(assert (= (or b!39655 b!39656) bm!3064))

(assert (= (or b!39666 bm!3064) bm!3063))

(assert (= (or b!39666 b!39655) bm!3061))

(assert (= (or b!39664 bm!3063) bm!3059))

(assert (= (or b!39664 bm!3061) bm!3060))

(assert (= (and d!6639 res!23797) b!39650))

(assert (= (and d!6639 c!4719) b!39649))

(assert (= (and d!6639 (not c!4719)) b!39660))

(assert (= (and d!6639 res!23799) b!39658))

(assert (= (and b!39658 res!23800) b!39648))

(assert (= (and b!39658 (not res!23803)) b!39667))

(assert (= (and b!39667 res!23801) b!39647))

(assert (= (and b!39658 res!23798) b!39654))

(assert (= (and b!39654 c!4721) b!39657))

(assert (= (and b!39654 (not c!4721)) b!39652))

(assert (= (and b!39657 res!23804) b!39653))

(assert (= (or b!39657 b!39652) bm!3062))

(assert (= (and b!39654 res!23796) b!39662))

(assert (= (and b!39662 c!4722) b!39659))

(assert (= (and b!39662 (not c!4722)) b!39665))

(assert (= (and b!39659 res!23802) b!39663))

(assert (= (or b!39659 b!39665) bm!3065))

(declare-fun b_lambda!2037 () Bool)

(assert (=> (not b_lambda!2037) (not b!39647)))

(declare-fun tb!837 () Bool)

(declare-fun t!3902 () Bool)

(assert (=> (and start!5504 (= defaultEntry!470 (defaultEntry!1796 lt!14731)) t!3902) tb!837))

(declare-fun result!1433 () Bool)

(assert (=> tb!837 (= result!1433 tp_is_empty!1751)))

(assert (=> b!39647 t!3902))

(declare-fun b_and!2343 () Bool)

(assert (= b_and!2337 (and (=> t!3902 result!1433) b_and!2343)))

(assert (=> d!6639 m!32091))

(declare-fun m!32281 () Bool)

(assert (=> b!39653 m!32281))

(assert (=> b!39647 m!32093))

(assert (=> b!39647 m!32093))

(declare-fun m!32283 () Bool)

(assert (=> b!39647 m!32283))

(declare-fun m!32285 () Bool)

(assert (=> b!39647 m!32285))

(declare-fun m!32287 () Bool)

(assert (=> b!39647 m!32287))

(assert (=> b!39647 m!32285))

(declare-fun m!32289 () Bool)

(assert (=> b!39647 m!32289))

(assert (=> b!39647 m!32287))

(declare-fun m!32291 () Bool)

(assert (=> b!39664 m!32291))

(declare-fun m!32295 () Bool)

(assert (=> b!39663 m!32295))

(assert (=> b!39667 m!32093))

(assert (=> b!39667 m!32093))

(declare-fun m!32297 () Bool)

(assert (=> b!39667 m!32297))

(declare-fun m!32299 () Bool)

(assert (=> bm!3062 m!32299))

(assert (=> b!39649 m!32093))

(declare-fun m!32301 () Bool)

(assert (=> b!39649 m!32301))

(declare-fun m!32303 () Bool)

(assert (=> b!39649 m!32303))

(declare-fun m!32305 () Bool)

(assert (=> b!39649 m!32305))

(declare-fun m!32307 () Bool)

(assert (=> b!39649 m!32307))

(declare-fun m!32309 () Bool)

(assert (=> b!39649 m!32309))

(declare-fun m!32311 () Bool)

(assert (=> b!39649 m!32311))

(declare-fun m!32313 () Bool)

(assert (=> b!39649 m!32313))

(declare-fun m!32315 () Bool)

(assert (=> b!39649 m!32315))

(declare-fun m!32317 () Bool)

(assert (=> b!39649 m!32317))

(assert (=> b!39649 m!32301))

(declare-fun m!32319 () Bool)

(assert (=> b!39649 m!32319))

(declare-fun m!32321 () Bool)

(assert (=> b!39649 m!32321))

(declare-fun m!32323 () Bool)

(assert (=> b!39649 m!32323))

(declare-fun m!32325 () Bool)

(assert (=> b!39649 m!32325))

(assert (=> b!39649 m!32321))

(declare-fun m!32327 () Bool)

(assert (=> b!39649 m!32327))

(assert (=> b!39649 m!32327))

(declare-fun m!32329 () Bool)

(assert (=> b!39649 m!32329))

(assert (=> b!39649 m!32309))

(declare-fun m!32331 () Bool)

(assert (=> b!39649 m!32331))

(assert (=> b!39648 m!32093))

(assert (=> b!39648 m!32093))

(assert (=> b!39648 m!32097))

(declare-fun m!32333 () Bool)

(assert (=> bm!3060 m!32333))

(assert (=> b!39650 m!32093))

(assert (=> b!39650 m!32093))

(assert (=> b!39650 m!32097))

(declare-fun m!32335 () Bool)

(assert (=> bm!3065 m!32335))

(assert (=> bm!3059 m!32313))

(assert (=> d!6541 d!6639))

(declare-fun b!39678 () Bool)

(declare-fun e!25186 () Bool)

(assert (=> b!39678 (= e!25186 (contains!503 (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048) (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39679 () Bool)

(declare-fun e!25185 () Bool)

(declare-fun call!3071 () Bool)

(assert (=> b!39679 (= e!25185 call!3071)))

(declare-fun b!39680 () Bool)

(declare-fun e!25183 () Bool)

(declare-fun e!25184 () Bool)

(assert (=> b!39680 (= e!25183 e!25184)))

(declare-fun res!23809 () Bool)

(assert (=> b!39680 (=> (not res!23809) (not e!25184))))

(assert (=> b!39680 (= res!23809 (not e!25186))))

(declare-fun res!23810 () Bool)

(assert (=> b!39680 (=> (not res!23810) (not e!25186))))

(assert (=> b!39680 (= res!23810 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6663 () Bool)

(declare-fun res!23811 () Bool)

(assert (=> d!6663 (=> res!23811 e!25183)))

(assert (=> d!6663 (= res!23811 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(assert (=> d!6663 (= (arrayNoDuplicates!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) e!25183)))

(declare-fun b!39681 () Bool)

(assert (=> b!39681 (= e!25185 call!3071)))

(declare-fun bm!3068 () Bool)

(declare-fun c!4727 () Bool)

(assert (=> bm!3068 (= call!3071 (arrayNoDuplicates!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4727 (Cons!1047 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048))))))

(declare-fun b!39682 () Bool)

(assert (=> b!39682 (= e!25184 e!25185)))

(assert (=> b!39682 (= c!4727 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6663 (not res!23811)) b!39680))

(assert (= (and b!39680 res!23810) b!39678))

(assert (= (and b!39680 res!23809) b!39682))

(assert (= (and b!39682 c!4727) b!39681))

(assert (= (and b!39682 (not c!4727)) b!39679))

(assert (= (or b!39681 b!39679) bm!3068))

(assert (=> b!39678 m!32077))

(assert (=> b!39678 m!32077))

(declare-fun m!32337 () Bool)

(assert (=> b!39678 m!32337))

(assert (=> b!39680 m!32077))

(assert (=> b!39680 m!32077))

(assert (=> b!39680 m!32087))

(assert (=> bm!3068 m!32077))

(declare-fun m!32339 () Bool)

(assert (=> bm!3068 m!32339))

(assert (=> b!39682 m!32077))

(assert (=> b!39682 m!32077))

(assert (=> b!39682 m!32087))

(assert (=> bm!2963 d!6663))

(declare-fun d!6665 () Bool)

(assert (=> d!6665 (arrayContainsKey!0 lt!14732 lt!14778 #b00000000000000000000000000000000)))

(declare-fun lt!15053 () Unit!969)

(declare-fun choose!13 (array!2587 (_ BitVec 64) (_ BitVec 32)) Unit!969)

(assert (=> d!6665 (= lt!15053 (choose!13 lt!14732 lt!14778 #b00000000000000000000000000000000))))

(assert (=> d!6665 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6665 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14732 lt!14778 #b00000000000000000000000000000000) lt!15053)))

(declare-fun bs!1650 () Bool)

(assert (= bs!1650 d!6665))

(assert (=> bs!1650 m!31973))

(declare-fun m!32341 () Bool)

(assert (=> bs!1650 m!32341))

(assert (=> b!39268 d!6665))

(declare-fun d!6667 () Bool)

(declare-fun res!23816 () Bool)

(declare-fun e!25191 () Bool)

(assert (=> d!6667 (=> res!23816 e!25191)))

(assert (=> d!6667 (= res!23816 (= (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14778))))

(assert (=> d!6667 (= (arrayContainsKey!0 lt!14732 lt!14778 #b00000000000000000000000000000000) e!25191)))

(declare-fun b!39687 () Bool)

(declare-fun e!25192 () Bool)

(assert (=> b!39687 (= e!25191 e!25192)))

(declare-fun res!23817 () Bool)

(assert (=> b!39687 (=> (not res!23817) (not e!25192))))

(assert (=> b!39687 (= res!23817 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(declare-fun b!39688 () Bool)

(assert (=> b!39688 (= e!25192 (arrayContainsKey!0 lt!14732 lt!14778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6667 (not res!23816)) b!39687))

(assert (= (and b!39687 res!23817) b!39688))

(assert (=> d!6667 m!31911))

(declare-fun m!32343 () Bool)

(assert (=> b!39688 m!32343))

(assert (=> b!39268 d!6667))

(declare-fun b!39701 () Bool)

(declare-fun e!25200 () SeekEntryResult!171)

(declare-fun lt!15061 () SeekEntryResult!171)

(assert (=> b!39701 (= e!25200 (MissingZero!171 (index!2808 lt!15061)))))

(declare-fun d!6669 () Bool)

(declare-fun lt!15062 () SeekEntryResult!171)

(assert (=> d!6669 (and (or (is-Undefined!171 lt!15062) (not (is-Found!171 lt!15062)) (and (bvsge (index!2807 lt!15062) #b00000000000000000000000000000000) (bvslt (index!2807 lt!15062) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15062) (is-Found!171 lt!15062) (not (is-MissingZero!171 lt!15062)) (and (bvsge (index!2806 lt!15062) #b00000000000000000000000000000000) (bvslt (index!2806 lt!15062) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15062) (is-Found!171 lt!15062) (is-MissingZero!171 lt!15062) (not (is-MissingVacant!171 lt!15062)) (and (bvsge (index!2809 lt!15062) #b00000000000000000000000000000000) (bvslt (index!2809 lt!15062) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15062) (ite (is-Found!171 lt!15062) (= (select (arr!1237 lt!14732) (index!2807 lt!15062)) (select (arr!1237 lt!14732) #b00000000000000000000000000000000)) (ite (is-MissingZero!171 lt!15062) (= (select (arr!1237 lt!14732) (index!2806 lt!15062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!171 lt!15062) (= (select (arr!1237 lt!14732) (index!2809 lt!15062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25199 () SeekEntryResult!171)

(assert (=> d!6669 (= lt!15062 e!25199)))

(declare-fun c!4736 () Bool)

(assert (=> d!6669 (= c!4736 (and (is-Intermediate!171 lt!15061) (undefined!983 lt!15061)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2587 (_ BitVec 32)) SeekEntryResult!171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6669 (= lt!15061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853) (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853))))

(assert (=> d!6669 (validMask!0 mask!853)))

(assert (=> d!6669 (= (seekEntryOrOpen!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853) lt!15062)))

(declare-fun b!39702 () Bool)

(declare-fun e!25201 () SeekEntryResult!171)

(assert (=> b!39702 (= e!25201 (Found!171 (index!2808 lt!15061)))))

(declare-fun b!39703 () Bool)

(declare-fun c!4734 () Bool)

(declare-fun lt!15060 () (_ BitVec 64))

(assert (=> b!39703 (= c!4734 (= lt!15060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39703 (= e!25201 e!25200)))

(declare-fun b!39704 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2587 (_ BitVec 32)) SeekEntryResult!171)

(assert (=> b!39704 (= e!25200 (seekKeyOrZeroReturnVacant!0 (x!7657 lt!15061) (index!2808 lt!15061) (index!2808 lt!15061) (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853))))

(declare-fun b!39705 () Bool)

(assert (=> b!39705 (= e!25199 e!25201)))

(assert (=> b!39705 (= lt!15060 (select (arr!1237 lt!14732) (index!2808 lt!15061)))))

(declare-fun c!4735 () Bool)

(assert (=> b!39705 (= c!4735 (= lt!15060 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun b!39706 () Bool)

(assert (=> b!39706 (= e!25199 Undefined!171)))

(assert (= (and d!6669 c!4736) b!39706))

(assert (= (and d!6669 (not c!4736)) b!39705))

(assert (= (and b!39705 c!4735) b!39702))

(assert (= (and b!39705 (not c!4735)) b!39703))

(assert (= (and b!39703 c!4734) b!39701))

(assert (= (and b!39703 (not c!4734)) b!39704))

(declare-fun m!32345 () Bool)

(assert (=> d!6669 m!32345))

(assert (=> d!6669 m!31883))

(declare-fun m!32347 () Bool)

(assert (=> d!6669 m!32347))

(assert (=> d!6669 m!31911))

(declare-fun m!32349 () Bool)

(assert (=> d!6669 m!32349))

(declare-fun m!32351 () Bool)

(assert (=> d!6669 m!32351))

(assert (=> d!6669 m!31911))

(assert (=> d!6669 m!32347))

(declare-fun m!32353 () Bool)

(assert (=> d!6669 m!32353))

(assert (=> b!39704 m!31911))

(declare-fun m!32355 () Bool)

(assert (=> b!39704 m!32355))

(declare-fun m!32357 () Bool)

(assert (=> b!39705 m!32357))

(assert (=> b!39268 d!6669))

(assert (=> b!39193 d!6623))

(push 1)

(assert (not b!39421))

(assert (not b_next!1361))

(assert (not b!39680))

(assert (not b_lambda!2029))

(assert (not d!6669))

(assert (not b!39653))

(assert (not b!39407))

(assert (not b!39688))

(assert (not d!6621))

(assert (not b!39650))

(assert (not b!39412))

(assert (not b!39647))

(assert (not b!39408))

(assert (not d!6665))

(assert tp_is_empty!1751)

(assert (not d!6631))

(assert (not b!39427))

(assert (not d!6627))

(assert (not b!39394))

(assert (not b!39414))

(assert (not d!6639))

(assert (not b!39678))

(assert (not b!39649))

(assert (not b!39410))

(assert (not b!39431))

(assert (not bm!3062))

(assert (not bm!3065))

(assert (not bm!3068))

(assert (not d!6625))

(assert (not bm!2998))

(assert (not b!39682))

(assert b_and!2343)

(assert (not b!39704))

(assert (not b_lambda!2037))

(assert (not bm!2997))

(assert (not b!39648))

(assert (not bm!2996))

(assert (not b!39663))

(assert (not b!39424))

(assert (not bm!3059))

(assert (not d!6619))

(assert (not b!39420))

(assert (not bm!2994))

(assert (not b!39667))

(assert (not b!39664))

(assert (not b!39397))

(assert (not bm!3060))

(assert (not bm!2995))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2343)

(assert (not b_next!1361))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6787 () Bool)

(assert (=> d!6787 (= (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39397 d!6787))

(assert (=> d!6665 d!6667))

(declare-fun d!6789 () Bool)

(assert (=> d!6789 (arrayContainsKey!0 lt!14732 lt!14778 #b00000000000000000000000000000000)))

(assert (=> d!6789 true))

(declare-fun _$60!335 () Unit!969)

(assert (=> d!6789 (= (choose!13 lt!14732 lt!14778 #b00000000000000000000000000000000) _$60!335)))

(declare-fun bs!1665 () Bool)

(assert (= bs!1665 d!6789))

(assert (=> bs!1665 m!31973))

(assert (=> d!6665 d!6789))

(declare-fun d!6791 () Bool)

(assert (=> d!6791 (= (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39414 d!6791))

(declare-fun d!6793 () Bool)

(declare-fun res!23897 () Bool)

(declare-fun e!25330 () Bool)

(assert (=> d!6793 (=> res!23897 e!25330)))

(assert (=> d!6793 (= res!23897 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(assert (=> d!6793 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14732 mask!853) e!25330)))

(declare-fun b!39911 () Bool)

(declare-fun e!25328 () Bool)

(declare-fun e!25329 () Bool)

(assert (=> b!39911 (= e!25328 e!25329)))

(declare-fun lt!15190 () (_ BitVec 64))

(assert (=> b!39911 (= lt!15190 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15192 () Unit!969)

(assert (=> b!39911 (= lt!15192 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14732 lt!15190 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!39911 (arrayContainsKey!0 lt!14732 lt!15190 #b00000000000000000000000000000000)))

(declare-fun lt!15191 () Unit!969)

(assert (=> b!39911 (= lt!15191 lt!15192)))

(declare-fun res!23898 () Bool)

(assert (=> b!39911 (= res!23898 (= (seekEntryOrOpen!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14732 mask!853) (Found!171 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!39911 (=> (not res!23898) (not e!25329))))

(declare-fun bm!3080 () Bool)

(declare-fun call!3083 () Bool)

(assert (=> bm!3080 (= call!3083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14732 mask!853))))

(declare-fun b!39912 () Bool)

(assert (=> b!39912 (= e!25329 call!3083)))

(declare-fun b!39913 () Bool)

(assert (=> b!39913 (= e!25328 call!3083)))

(declare-fun b!39914 () Bool)

(assert (=> b!39914 (= e!25330 e!25328)))

(declare-fun c!4799 () Bool)

(assert (=> b!39914 (= c!4799 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6793 (not res!23897)) b!39914))

(assert (= (and b!39914 c!4799) b!39911))

(assert (= (and b!39914 (not c!4799)) b!39913))

(assert (= (and b!39911 res!23898) b!39912))

(assert (= (or b!39912 b!39913) bm!3080))

(declare-fun m!32667 () Bool)

(assert (=> b!39911 m!32667))

(declare-fun m!32669 () Bool)

(assert (=> b!39911 m!32669))

(declare-fun m!32671 () Bool)

(assert (=> b!39911 m!32671))

(assert (=> b!39911 m!32667))

(declare-fun m!32673 () Bool)

(assert (=> b!39911 m!32673))

(declare-fun m!32675 () Bool)

(assert (=> bm!3080 m!32675))

(assert (=> b!39914 m!32667))

(assert (=> b!39914 m!32667))

(declare-fun m!32677 () Bool)

(assert (=> b!39914 m!32677))

(assert (=> bm!2994 d!6793))

(declare-fun b!39919 () Bool)

(declare-fun e!25338 () Bool)

(assert (=> b!39919 (= e!25338 (contains!503 (ite c!4650 (Cons!1047 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) Nil!1048) Nil!1048) (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39920 () Bool)

(declare-fun e!25337 () Bool)

(declare-fun call!3084 () Bool)

(assert (=> b!39920 (= e!25337 call!3084)))

(declare-fun b!39921 () Bool)

(declare-fun e!25333 () Bool)

(declare-fun e!25334 () Bool)

(assert (=> b!39921 (= e!25333 e!25334)))

(declare-fun res!23899 () Bool)

(assert (=> b!39921 (=> (not res!23899) (not e!25334))))

(assert (=> b!39921 (= res!23899 (not e!25338))))

(declare-fun res!23900 () Bool)

(assert (=> b!39921 (=> (not res!23900) (not e!25338))))

(assert (=> b!39921 (= res!23900 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6795 () Bool)

(declare-fun res!23901 () Bool)

(assert (=> d!6795 (=> res!23901 e!25333)))

(assert (=> d!6795 (= res!23901 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6795 (= (arrayNoDuplicates!0 (_keys!3267 lt!14731) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4650 (Cons!1047 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) e!25333)))

(declare-fun b!39922 () Bool)

(assert (=> b!39922 (= e!25337 call!3084)))

(declare-fun c!4802 () Bool)

(declare-fun bm!3081 () Bool)

(assert (=> bm!3081 (= call!3084 (arrayNoDuplicates!0 (_keys!3267 lt!14731) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4802 (Cons!1047 (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4650 (Cons!1047 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (ite c!4650 (Cons!1047 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) Nil!1048) Nil!1048))))))

(declare-fun b!39923 () Bool)

(assert (=> b!39923 (= e!25334 e!25337)))

(assert (=> b!39923 (= c!4802 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6795 (not res!23901)) b!39921))

(assert (= (and b!39921 res!23900) b!39919))

(assert (= (and b!39921 res!23899) b!39923))

(assert (= (and b!39923 c!4802) b!39922))

(assert (= (and b!39923 (not c!4802)) b!39920))

(assert (= (or b!39922 b!39920) bm!3081))

(declare-fun m!32679 () Bool)

(assert (=> b!39919 m!32679))

(assert (=> b!39919 m!32679))

(declare-fun m!32681 () Bool)

(assert (=> b!39919 m!32681))

(assert (=> b!39921 m!32679))

(assert (=> b!39921 m!32679))

(declare-fun m!32683 () Bool)

(assert (=> b!39921 m!32683))

(assert (=> bm!3081 m!32679))

(declare-fun m!32685 () Bool)

(assert (=> bm!3081 m!32685))

(assert (=> b!39923 m!32679))

(assert (=> b!39923 m!32679))

(assert (=> b!39923 m!32683))

(assert (=> bm!2995 d!6795))

(declare-fun d!6797 () Bool)

(assert (=> d!6797 (arrayContainsKey!0 lt!14732 lt!14819 #b00000000000000000000000000000000)))

(declare-fun lt!15193 () Unit!969)

(assert (=> d!6797 (= lt!15193 (choose!13 lt!14732 lt!14819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6797 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6797 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14732 lt!14819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15193)))

(declare-fun bs!1666 () Bool)

(assert (= bs!1666 d!6797))

(assert (=> bs!1666 m!32081))

(declare-fun m!32687 () Bool)

(assert (=> bs!1666 m!32687))

(assert (=> b!39394 d!6797))

(declare-fun d!6799 () Bool)

(declare-fun res!23908 () Bool)

(declare-fun e!25341 () Bool)

(assert (=> d!6799 (=> res!23908 e!25341)))

(assert (=> d!6799 (= res!23908 (= (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14819))))

(assert (=> d!6799 (= (arrayContainsKey!0 lt!14732 lt!14819 #b00000000000000000000000000000000) e!25341)))

(declare-fun b!39930 () Bool)

(declare-fun e!25342 () Bool)

(assert (=> b!39930 (= e!25341 e!25342)))

(declare-fun res!23909 () Bool)

(assert (=> b!39930 (=> (not res!23909) (not e!25342))))

(assert (=> b!39930 (= res!23909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(declare-fun b!39931 () Bool)

(assert (=> b!39931 (= e!25342 (arrayContainsKey!0 lt!14732 lt!14819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6799 (not res!23908)) b!39930))

(assert (= (and b!39930 res!23909) b!39931))

(assert (=> d!6799 m!31911))

(declare-fun m!32689 () Bool)

(assert (=> b!39931 m!32689))

(assert (=> b!39394 d!6799))

(declare-fun b!39932 () Bool)

(declare-fun e!25344 () SeekEntryResult!171)

(declare-fun lt!15195 () SeekEntryResult!171)

(assert (=> b!39932 (= e!25344 (MissingZero!171 (index!2808 lt!15195)))))

(declare-fun d!6801 () Bool)

(declare-fun lt!15196 () SeekEntryResult!171)

(assert (=> d!6801 (and (or (is-Undefined!171 lt!15196) (not (is-Found!171 lt!15196)) (and (bvsge (index!2807 lt!15196) #b00000000000000000000000000000000) (bvslt (index!2807 lt!15196) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15196) (is-Found!171 lt!15196) (not (is-MissingZero!171 lt!15196)) (and (bvsge (index!2806 lt!15196) #b00000000000000000000000000000000) (bvslt (index!2806 lt!15196) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15196) (is-Found!171 lt!15196) (is-MissingZero!171 lt!15196) (not (is-MissingVacant!171 lt!15196)) (and (bvsge (index!2809 lt!15196) #b00000000000000000000000000000000) (bvslt (index!2809 lt!15196) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15196) (ite (is-Found!171 lt!15196) (= (select (arr!1237 lt!14732) (index!2807 lt!15196)) (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!171 lt!15196) (= (select (arr!1237 lt!14732) (index!2806 lt!15196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!171 lt!15196) (= (select (arr!1237 lt!14732) (index!2809 lt!15196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25343 () SeekEntryResult!171)

(assert (=> d!6801 (= lt!15196 e!25343)))

(declare-fun c!4805 () Bool)

(assert (=> d!6801 (= c!4805 (and (is-Intermediate!171 lt!15195) (undefined!983 lt!15195)))))

(assert (=> d!6801 (= lt!15195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14732 mask!853))))

(assert (=> d!6801 (validMask!0 mask!853)))

(assert (=> d!6801 (= (seekEntryOrOpen!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14732 mask!853) lt!15196)))

(declare-fun b!39933 () Bool)

(declare-fun e!25345 () SeekEntryResult!171)

(assert (=> b!39933 (= e!25345 (Found!171 (index!2808 lt!15195)))))

(declare-fun b!39934 () Bool)

(declare-fun c!4803 () Bool)

(declare-fun lt!15194 () (_ BitVec 64))

(assert (=> b!39934 (= c!4803 (= lt!15194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39934 (= e!25345 e!25344)))

(declare-fun b!39935 () Bool)

(assert (=> b!39935 (= e!25344 (seekKeyOrZeroReturnVacant!0 (x!7657 lt!15195) (index!2808 lt!15195) (index!2808 lt!15195) (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14732 mask!853))))

(declare-fun b!39936 () Bool)

(assert (=> b!39936 (= e!25343 e!25345)))

(assert (=> b!39936 (= lt!15194 (select (arr!1237 lt!14732) (index!2808 lt!15195)))))

(declare-fun c!4804 () Bool)

(assert (=> b!39936 (= c!4804 (= lt!15194 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39937 () Bool)

(assert (=> b!39937 (= e!25343 Undefined!171)))

(assert (= (and d!6801 c!4805) b!39937))

(assert (= (and d!6801 (not c!4805)) b!39936))

(assert (= (and b!39936 c!4804) b!39933))

(assert (= (and b!39936 (not c!4804)) b!39934))

(assert (= (and b!39934 c!4803) b!39932))

(assert (= (and b!39934 (not c!4803)) b!39935))

(declare-fun m!32691 () Bool)

(assert (=> d!6801 m!32691))

(assert (=> d!6801 m!31883))

(declare-fun m!32693 () Bool)

(assert (=> d!6801 m!32693))

(assert (=> d!6801 m!32077))

(declare-fun m!32695 () Bool)

(assert (=> d!6801 m!32695))

(declare-fun m!32697 () Bool)

(assert (=> d!6801 m!32697))

(assert (=> d!6801 m!32077))

(assert (=> d!6801 m!32693))

(declare-fun m!32699 () Bool)

(assert (=> d!6801 m!32699))

(assert (=> b!39935 m!32077))

(declare-fun m!32701 () Bool)

(assert (=> b!39935 m!32701))

(declare-fun m!32703 () Bool)

(assert (=> b!39936 m!32703))

(assert (=> b!39394 d!6801))

(declare-fun b!39978 () Bool)

(declare-fun e!25371 () Bool)

(declare-fun lt!15224 () SeekEntryResult!171)

(assert (=> b!39978 (= e!25371 (bvsge (x!7657 lt!15224) #b01111111111111111111111111111110))))

(declare-fun b!39979 () Bool)

(declare-fun e!25368 () SeekEntryResult!171)

(declare-fun e!25372 () SeekEntryResult!171)

(assert (=> b!39979 (= e!25368 e!25372)))

(declare-fun c!4820 () Bool)

(declare-fun lt!15225 () (_ BitVec 64))

(assert (=> b!39979 (= c!4820 (or (= lt!15225 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)) (= (bvadd lt!15225 lt!15225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39981 () Bool)

(assert (=> b!39981 (= e!25368 (Intermediate!171 true (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39982 () Bool)

(assert (=> b!39982 (and (bvsge (index!2808 lt!15224) #b00000000000000000000000000000000) (bvslt (index!2808 lt!15224) (size!1359 lt!14732)))))

(declare-fun res!23926 () Bool)

(assert (=> b!39982 (= res!23926 (= (select (arr!1237 lt!14732) (index!2808 lt!15224)) (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun e!25370 () Bool)

(assert (=> b!39982 (=> res!23926 e!25370)))

(declare-fun e!25369 () Bool)

(assert (=> b!39982 (= e!25369 e!25370)))

(declare-fun b!39983 () Bool)

(assert (=> b!39983 (and (bvsge (index!2808 lt!15224) #b00000000000000000000000000000000) (bvslt (index!2808 lt!15224) (size!1359 lt!14732)))))

(assert (=> b!39983 (= e!25370 (= (select (arr!1237 lt!14732) (index!2808 lt!15224)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39984 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39984 (= e!25372 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853))))

(declare-fun b!39985 () Bool)

(assert (=> b!39985 (= e!25371 e!25369)))

(declare-fun res!23928 () Bool)

(assert (=> b!39985 (= res!23928 (and (is-Intermediate!171 lt!15224) (not (undefined!983 lt!15224)) (bvslt (x!7657 lt!15224) #b01111111111111111111111111111110) (bvsge (x!7657 lt!15224) #b00000000000000000000000000000000) (bvsge (x!7657 lt!15224) #b00000000000000000000000000000000)))))

(assert (=> b!39985 (=> (not res!23928) (not e!25369))))

(declare-fun b!39986 () Bool)

(assert (=> b!39986 (and (bvsge (index!2808 lt!15224) #b00000000000000000000000000000000) (bvslt (index!2808 lt!15224) (size!1359 lt!14732)))))

(declare-fun res!23927 () Bool)

(assert (=> b!39986 (= res!23927 (= (select (arr!1237 lt!14732) (index!2808 lt!15224)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39986 (=> res!23927 e!25370)))

(declare-fun d!6803 () Bool)

(assert (=> d!6803 e!25371))

(declare-fun c!4818 () Bool)

(assert (=> d!6803 (= c!4818 (and (is-Intermediate!171 lt!15224) (undefined!983 lt!15224)))))

(assert (=> d!6803 (= lt!15224 e!25368)))

(declare-fun c!4819 () Bool)

(assert (=> d!6803 (= c!4819 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6803 (= lt!15225 (select (arr!1237 lt!14732) (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6803 (validMask!0 mask!853)))

(assert (=> d!6803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853) (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853) lt!15224)))

(declare-fun b!39980 () Bool)

(assert (=> b!39980 (= e!25372 (Intermediate!171 false (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!6803 c!4819) b!39981))

(assert (= (and d!6803 (not c!4819)) b!39979))

(assert (= (and b!39979 c!4820) b!39980))

(assert (= (and b!39979 (not c!4820)) b!39984))

(assert (= (and d!6803 c!4818) b!39978))

(assert (= (and d!6803 (not c!4818)) b!39985))

(assert (= (and b!39985 res!23928) b!39982))

(assert (= (and b!39982 (not res!23926)) b!39986))

(assert (= (and b!39986 (not res!23927)) b!39983))

(declare-fun m!32743 () Bool)

(assert (=> b!39986 m!32743))

(assert (=> d!6803 m!32347))

(declare-fun m!32745 () Bool)

(assert (=> d!6803 m!32745))

(assert (=> d!6803 m!31883))

(assert (=> b!39983 m!32743))

(assert (=> b!39984 m!32347))

(declare-fun m!32747 () Bool)

(assert (=> b!39984 m!32747))

(assert (=> b!39984 m!32747))

(assert (=> b!39984 m!31911))

(declare-fun m!32749 () Bool)

(assert (=> b!39984 m!32749))

(assert (=> b!39982 m!32743))

(assert (=> d!6669 d!6803))

(declare-fun d!6825 () Bool)

(declare-fun lt!15237 () (_ BitVec 32))

(declare-fun lt!15236 () (_ BitVec 32))

(assert (=> d!6825 (= lt!15237 (bvmul (bvxor lt!15236 (bvlshr lt!15236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6825 (= lt!15236 ((_ extract 31 0) (bvand (bvxor (select (arr!1237 lt!14732) #b00000000000000000000000000000000) (bvlshr (select (arr!1237 lt!14732) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6825 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23931 (let ((h!1621 ((_ extract 31 0) (bvand (bvxor (select (arr!1237 lt!14732) #b00000000000000000000000000000000) (bvlshr (select (arr!1237 lt!14732) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7681 (bvmul (bvxor h!1621 (bvlshr h!1621 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7681 (bvlshr x!7681 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23931 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23931 #b00000000000000000000000000000000))))))

(assert (=> d!6825 (= (toIndex!0 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15237 (bvlshr lt!15237 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6669 d!6825))

(assert (=> d!6669 d!6567))

(assert (=> b!39412 d!6791))

(assert (=> b!39682 d!6787))

(assert (=> d!6619 d!6547))

(declare-fun d!6829 () Bool)

(declare-fun lt!15239 () Bool)

(assert (=> d!6829 (= lt!15239 (member (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) (content!28 Nil!1048)))))

(declare-fun e!25378 () Bool)

(assert (=> d!6829 (= lt!15239 e!25378)))

(declare-fun res!23935 () Bool)

(assert (=> d!6829 (=> (not res!23935) (not e!25378))))

(assert (=> d!6829 (= res!23935 (is-Cons!1047 Nil!1048))))

(assert (=> d!6829 (= (contains!503 Nil!1048 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)) lt!15239)))

(declare-fun b!39993 () Bool)

(declare-fun e!25377 () Bool)

(assert (=> b!39993 (= e!25378 e!25377)))

(declare-fun res!23936 () Bool)

(assert (=> b!39993 (=> res!23936 e!25377)))

(assert (=> b!39993 (= res!23936 (= (h!1618 Nil!1048) (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun b!39994 () Bool)

(assert (=> b!39994 (= e!25377 (contains!503 (t!3896 Nil!1048) (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(assert (= (and d!6829 res!23935) b!39993))

(assert (= (and b!39993 (not res!23936)) b!39994))

(assert (=> d!6829 m!32101))

(assert (=> d!6829 m!32093))

(declare-fun m!32767 () Bool)

(assert (=> d!6829 m!32767))

(assert (=> b!39994 m!32093))

(declare-fun m!32771 () Bool)

(assert (=> b!39994 m!32771))

(assert (=> b!39410 d!6829))

(assert (=> d!6627 d!6523))

(declare-fun b!40024 () Bool)

(declare-fun c!4831 () Bool)

(declare-fun lt!15271 () (_ BitVec 64))

(assert (=> b!40024 (= c!4831 (= lt!15271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25396 () SeekEntryResult!171)

(declare-fun e!25398 () SeekEntryResult!171)

(assert (=> b!40024 (= e!25396 e!25398)))

(declare-fun b!40025 () Bool)

(declare-fun e!25397 () SeekEntryResult!171)

(assert (=> b!40025 (= e!25397 Undefined!171)))

(declare-fun b!40026 () Bool)

(assert (=> b!40026 (= e!25396 (Found!171 (index!2808 lt!15061)))))

(declare-fun d!6833 () Bool)

(declare-fun lt!15270 () SeekEntryResult!171)

(assert (=> d!6833 (and (or (is-Undefined!171 lt!15270) (not (is-Found!171 lt!15270)) (and (bvsge (index!2807 lt!15270) #b00000000000000000000000000000000) (bvslt (index!2807 lt!15270) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15270) (is-Found!171 lt!15270) (not (is-MissingVacant!171 lt!15270)) (not (= (index!2809 lt!15270) (index!2808 lt!15061))) (and (bvsge (index!2809 lt!15270) #b00000000000000000000000000000000) (bvslt (index!2809 lt!15270) (size!1359 lt!14732)))) (or (is-Undefined!171 lt!15270) (ite (is-Found!171 lt!15270) (= (select (arr!1237 lt!14732) (index!2807 lt!15270)) (select (arr!1237 lt!14732) #b00000000000000000000000000000000)) (and (is-MissingVacant!171 lt!15270) (= (index!2809 lt!15270) (index!2808 lt!15061)) (= (select (arr!1237 lt!14732) (index!2809 lt!15270)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6833 (= lt!15270 e!25397)))

(declare-fun c!4830 () Bool)

(assert (=> d!6833 (= c!4830 (bvsge (x!7657 lt!15061) #b01111111111111111111111111111110))))

(assert (=> d!6833 (= lt!15271 (select (arr!1237 lt!14732) (index!2808 lt!15061)))))

(assert (=> d!6833 (validMask!0 mask!853)))

(assert (=> d!6833 (= (seekKeyOrZeroReturnVacant!0 (x!7657 lt!15061) (index!2808 lt!15061) (index!2808 lt!15061) (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853) lt!15270)))

(declare-fun b!40027 () Bool)

(assert (=> b!40027 (= e!25398 (MissingVacant!171 (index!2808 lt!15061)))))

(declare-fun b!40028 () Bool)

(assert (=> b!40028 (= e!25397 e!25396)))

(declare-fun c!4832 () Bool)

(assert (=> b!40028 (= c!4832 (= lt!15271 (select (arr!1237 lt!14732) #b00000000000000000000000000000000)))))

(declare-fun b!40029 () Bool)

(assert (=> b!40029 (= e!25398 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7657 lt!15061) #b00000000000000000000000000000001) (nextIndex!0 (index!2808 lt!15061) (x!7657 lt!15061) mask!853) (index!2808 lt!15061) (select (arr!1237 lt!14732) #b00000000000000000000000000000000) lt!14732 mask!853))))

(assert (= (and d!6833 c!4830) b!40025))

(assert (= (and d!6833 (not c!4830)) b!40028))

(assert (= (and b!40028 c!4832) b!40026))

(assert (= (and b!40028 (not c!4832)) b!40024))

(assert (= (and b!40024 c!4831) b!40027))

(assert (= (and b!40024 (not c!4831)) b!40029))

(declare-fun m!32843 () Bool)

(assert (=> d!6833 m!32843))

(declare-fun m!32845 () Bool)

(assert (=> d!6833 m!32845))

(assert (=> d!6833 m!32357))

(assert (=> d!6833 m!31883))

(declare-fun m!32847 () Bool)

(assert (=> b!40029 m!32847))

(assert (=> b!40029 m!32847))

(assert (=> b!40029 m!31911))

(declare-fun m!32849 () Bool)

(assert (=> b!40029 m!32849))

(assert (=> b!39704 d!6833))

(assert (=> b!39424 d!6791))

(declare-fun d!6857 () Bool)

(declare-datatypes ((Option!106 0))(
  ( (Some!105 (v!1992 V!2093)) (None!104) )
))
(declare-fun get!698 (Option!106) V!2093)

(declare-fun getValueByKey!100 (List!1050 (_ BitVec 64)) Option!106)

(assert (=> d!6857 (= (apply!54 lt!15036 #b0000000000000000000000000000000000000000000000000000000000000000) (get!698 (getValueByKey!100 (toList!545 lt!15036) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1676 () Bool)

(assert (= bs!1676 d!6857))

(declare-fun m!32851 () Bool)

(assert (=> bs!1676 m!32851))

(assert (=> bs!1676 m!32851))

(declare-fun m!32853 () Bool)

(assert (=> bs!1676 m!32853))

(assert (=> b!39653 d!6857))

(declare-fun d!6859 () Bool)

(declare-fun res!23948 () Bool)

(declare-fun e!25399 () Bool)

(assert (=> d!6859 (=> res!23948 e!25399)))

(assert (=> d!6859 (= res!23948 (= (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14778))))

(assert (=> d!6859 (= (arrayContainsKey!0 lt!14732 lt!14778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25399)))

(declare-fun b!40030 () Bool)

(declare-fun e!25400 () Bool)

(assert (=> b!40030 (= e!25399 e!25400)))

(declare-fun res!23949 () Bool)

(assert (=> b!40030 (=> (not res!23949) (not e!25400))))

(assert (=> b!40030 (= res!23949 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(declare-fun b!40031 () Bool)

(assert (=> b!40031 (= e!25400 (arrayContainsKey!0 lt!14732 lt!14778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6859 (not res!23948)) b!40030))

(assert (= (and b!40030 res!23949) b!40031))

(assert (=> d!6859 m!32077))

(declare-fun m!32855 () Bool)

(assert (=> b!40031 m!32855))

(assert (=> b!39688 d!6859))

(declare-fun b!40032 () Bool)

(declare-fun e!25404 () Bool)

(assert (=> b!40032 (= e!25404 (contains!503 (ite c!4727 (Cons!1047 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40033 () Bool)

(declare-fun e!25403 () Bool)

(declare-fun call!3085 () Bool)

(assert (=> b!40033 (= e!25403 call!3085)))

(declare-fun b!40034 () Bool)

(declare-fun e!25401 () Bool)

(declare-fun e!25402 () Bool)

(assert (=> b!40034 (= e!25401 e!25402)))

(declare-fun res!23950 () Bool)

(assert (=> b!40034 (=> (not res!23950) (not e!25402))))

(assert (=> b!40034 (= res!23950 (not e!25404))))

(declare-fun res!23951 () Bool)

(assert (=> b!40034 (=> (not res!23951) (not e!25404))))

(assert (=> b!40034 (= res!23951 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6861 () Bool)

(declare-fun res!23952 () Bool)

(assert (=> d!6861 (=> res!23952 e!25401)))

(assert (=> d!6861 (= res!23952 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1359 lt!14732)))))

(assert (=> d!6861 (= (arrayNoDuplicates!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4727 (Cons!1047 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048))) e!25401)))

(declare-fun b!40035 () Bool)

(assert (=> b!40035 (= e!25403 call!3085)))

(declare-fun c!4833 () Bool)

(declare-fun bm!3082 () Bool)

(assert (=> bm!3082 (= call!3085 (arrayNoDuplicates!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4833 (Cons!1047 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4727 (Cons!1047 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048))) (ite c!4727 (Cons!1047 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)) (ite c!4598 (Cons!1047 (select (arr!1237 lt!14732) #b00000000000000000000000000000000) Nil!1048) Nil!1048)))))))

(declare-fun b!40036 () Bool)

(assert (=> b!40036 (= e!25402 e!25403)))

(assert (=> b!40036 (= c!4833 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6861 (not res!23952)) b!40034))

(assert (= (and b!40034 res!23951) b!40032))

(assert (= (and b!40034 res!23950) b!40036))

(assert (= (and b!40036 c!4833) b!40035))

(assert (= (and b!40036 (not c!4833)) b!40033))

(assert (= (or b!40035 b!40033) bm!3082))

(assert (=> b!40032 m!32667))

(assert (=> b!40032 m!32667))

(declare-fun m!32857 () Bool)

(assert (=> b!40032 m!32857))

(assert (=> b!40034 m!32667))

(assert (=> b!40034 m!32667))

(assert (=> b!40034 m!32677))

(assert (=> bm!3082 m!32667))

(declare-fun m!32859 () Bool)

(assert (=> bm!3082 m!32859))

(assert (=> b!40036 m!32667))

(assert (=> b!40036 m!32667))

(assert (=> b!40036 m!32677))

(assert (=> bm!3068 d!6861))

(assert (=> b!39680 d!6787))

(declare-fun b!40037 () Bool)

(declare-fun e!25406 () (_ BitVec 32))

(declare-fun call!3086 () (_ BitVec 32))

(assert (=> b!40037 (= e!25406 (bvadd #b00000000000000000000000000000001 call!3086))))

(declare-fun b!40038 () Bool)

(declare-fun e!25405 () (_ BitVec 32))

(assert (=> b!40038 (= e!25405 #b00000000000000000000000000000000)))

(declare-fun b!40039 () Bool)

(assert (=> b!40039 (= e!25405 e!25406)))

(declare-fun c!4835 () Bool)

(assert (=> b!40039 (= c!4835 (validKeyInArray!0 (select (arr!1237 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6863 () Bool)

(declare-fun lt!15272 () (_ BitVec 32))

(assert (=> d!6863 (and (bvsge lt!15272 #b00000000000000000000000000000000) (bvsle lt!15272 (bvsub (size!1359 lt!14732) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6863 (= lt!15272 e!25405)))

(declare-fun c!4834 () Bool)

(assert (=> d!6863 (= c!4834 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6863 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1359 lt!14732)))))

(assert (=> d!6863 (= (arrayCountValidKeys!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15272)))

(declare-fun bm!3083 () Bool)

(assert (=> bm!3083 (= call!3086 (arrayCountValidKeys!0 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40040 () Bool)

(assert (=> b!40040 (= e!25406 call!3086)))

(assert (= (and d!6863 c!4834) b!40038))

(assert (= (and d!6863 (not c!4834)) b!40039))

(assert (= (and b!40039 c!4835) b!40037))

(assert (= (and b!40039 (not c!4835)) b!40040))

(assert (= (or b!40037 b!40040) bm!3083))

(assert (=> b!40039 m!32667))

(assert (=> b!40039 m!32667))

(assert (=> b!40039 m!32677))

(declare-fun m!32861 () Bool)

(assert (=> bm!3083 m!32861))

(assert (=> bm!2997 d!6863))

(declare-fun d!6865 () Bool)

(assert (=> d!6865 (= (size!1375 lt!14731) (bvadd (_size!167 lt!14731) (bvsdiv (bvadd (extraKeys!1687 lt!14731) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!39408 d!6865))

(declare-fun d!6867 () Bool)

(assert (not d!6867))

(assert (=> b!39420 d!6867))

(assert (=> b!39427 d!6787))

(assert (=> b!39407 d!6865))

(declare-fun d!6869 () Bool)

(assert (=> d!6869 (= (validMask!0 (mask!5143 lt!14731)) (and (or (= (mask!5143 lt!14731) #b00000000000000000000000000000111) (= (mask!5143 lt!14731) #b00000000000000000000000000001111) (= (mask!5143 lt!14731) #b00000000000000000000000000011111) (= (mask!5143 lt!14731) #b00000000000000000000000000111111) (= (mask!5143 lt!14731) #b00000000000000000000000001111111) (= (mask!5143 lt!14731) #b00000000000000000000000011111111) (= (mask!5143 lt!14731) #b00000000000000000000000111111111) (= (mask!5143 lt!14731) #b00000000000000000000001111111111) (= (mask!5143 lt!14731) #b00000000000000000000011111111111) (= (mask!5143 lt!14731) #b00000000000000000000111111111111) (= (mask!5143 lt!14731) #b00000000000000000001111111111111) (= (mask!5143 lt!14731) #b00000000000000000011111111111111) (= (mask!5143 lt!14731) #b00000000000000000111111111111111) (= (mask!5143 lt!14731) #b00000000000000001111111111111111) (= (mask!5143 lt!14731) #b00000000000000011111111111111111) (= (mask!5143 lt!14731) #b00000000000000111111111111111111) (= (mask!5143 lt!14731) #b00000000000001111111111111111111) (= (mask!5143 lt!14731) #b00000000000011111111111111111111) (= (mask!5143 lt!14731) #b00000000000111111111111111111111) (= (mask!5143 lt!14731) #b00000000001111111111111111111111) (= (mask!5143 lt!14731) #b00000000011111111111111111111111) (= (mask!5143 lt!14731) #b00000000111111111111111111111111) (= (mask!5143 lt!14731) #b00000001111111111111111111111111) (= (mask!5143 lt!14731) #b00000011111111111111111111111111) (= (mask!5143 lt!14731) #b00000111111111111111111111111111) (= (mask!5143 lt!14731) #b00001111111111111111111111111111) (= (mask!5143 lt!14731) #b00011111111111111111111111111111) (= (mask!5143 lt!14731) #b00111111111111111111111111111111)) (bvsle (mask!5143 lt!14731) #b00111111111111111111111111111111)))))

(assert (=> d!6639 d!6869))

(declare-fun d!6871 () Bool)

(declare-fun res!23953 () Bool)

(declare-fun e!25409 () Bool)

(assert (=> d!6871 (=> res!23953 e!25409)))

(assert (=> d!6871 (= res!23953 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 (_keys!3267 lt!14731))))))

(assert (=> d!6871 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3267 lt!14731) (mask!5143 lt!14731)) e!25409)))

(declare-fun b!40041 () Bool)

(declare-fun e!25407 () Bool)

(declare-fun e!25408 () Bool)

(assert (=> b!40041 (= e!25407 e!25408)))

(declare-fun lt!15273 () (_ BitVec 64))

(assert (=> b!40041 (= lt!15273 (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15275 () Unit!969)

(assert (=> b!40041 (= lt!15275 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3267 lt!14731) lt!15273 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40041 (arrayContainsKey!0 (_keys!3267 lt!14731) lt!15273 #b00000000000000000000000000000000)))

(declare-fun lt!15274 () Unit!969)

(assert (=> b!40041 (= lt!15274 lt!15275)))

(declare-fun res!23954 () Bool)

(assert (=> b!40041 (= res!23954 (= (seekEntryOrOpen!0 (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3267 lt!14731) (mask!5143 lt!14731)) (Found!171 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40041 (=> (not res!23954) (not e!25408))))

(declare-fun bm!3084 () Bool)

(declare-fun call!3087 () Bool)

(assert (=> bm!3084 (= call!3087 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3267 lt!14731) (mask!5143 lt!14731)))))

(declare-fun b!40042 () Bool)

(assert (=> b!40042 (= e!25408 call!3087)))

(declare-fun b!40043 () Bool)

(assert (=> b!40043 (= e!25407 call!3087)))

(declare-fun b!40044 () Bool)

(assert (=> b!40044 (= e!25409 e!25407)))

(declare-fun c!4836 () Bool)

(assert (=> b!40044 (= c!4836 (validKeyInArray!0 (select (arr!1237 (_keys!3267 lt!14731)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6871 (not res!23953)) b!40044))

(assert (= (and b!40044 c!4836) b!40041))

(assert (= (and b!40044 (not c!4836)) b!40043))

(assert (= (and b!40041 res!23954) b!40042))

(assert (= (or b!40042 b!40043) bm!3084))

(assert (=> b!40041 m!32679))

(declare-fun m!32863 () Bool)

(assert (=> b!40041 m!32863))

(declare-fun m!32865 () Bool)

(assert (=> b!40041 m!32865))

(assert (=> b!40041 m!32679))

(declare-fun m!32867 () Bool)

(assert (=> b!40041 m!32867))

(declare-fun m!32869 () Bool)

(assert (=> bm!3084 m!32869))

(assert (=> b!40044 m!32679))

(assert (=> b!40044 m!32679))

(assert (=> b!40044 m!32683))

(assert (=> bm!2996 d!6871))

(declare-fun d!6873 () Bool)

(declare-fun e!25414 () Bool)

(assert (=> d!6873 e!25414))

(declare-fun res!23957 () Bool)

(assert (=> d!6873 (=> res!23957 e!25414)))

(declare-fun lt!15284 () Bool)

(assert (=> d!6873 (= res!23957 (not lt!15284))))

(declare-fun lt!15287 () Bool)

(assert (=> d!6873 (= lt!15284 lt!15287)))

(declare-fun lt!15286 () Unit!969)

(declare-fun e!25415 () Unit!969)

(assert (=> d!6873 (= lt!15286 e!25415)))

(declare-fun c!4839 () Bool)

(assert (=> d!6873 (= c!4839 lt!15287)))

(declare-fun containsKey!68 (List!1050 (_ BitVec 64)) Bool)

(assert (=> d!6873 (= lt!15287 (containsKey!68 (toList!545 lt!15036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6873 (= (contains!508 lt!15036 #b0000000000000000000000000000000000000000000000000000000000000000) lt!15284)))

(declare-fun b!40051 () Bool)

(declare-fun lt!15285 () Unit!969)

(assert (=> b!40051 (= e!25415 lt!15285)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!56 (List!1050 (_ BitVec 64)) Unit!969)

(assert (=> b!40051 (= lt!15285 (lemmaContainsKeyImpliesGetValueByKeyDefined!56 (toList!545 lt!15036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!57 (Option!106) Bool)

(assert (=> b!40051 (isDefined!57 (getValueByKey!100 (toList!545 lt!15036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40052 () Bool)

(declare-fun Unit!980 () Unit!969)

(assert (=> b!40052 (= e!25415 Unit!980)))

(declare-fun b!40053 () Bool)

(assert (=> b!40053 (= e!25414 (isDefined!57 (getValueByKey!100 (toList!545 lt!15036) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6873 c!4839) b!40051))

(assert (= (and d!6873 (not c!4839)) b!40052))

(assert (= (and d!6873 (not res!23957)) b!40053))

(declare-fun m!32871 () Bool)

(assert (=> d!6873 m!32871))

(declare-fun m!32873 () Bool)

(assert (=> b!40051 m!32873))

(assert (=> b!40051 m!32851))

(assert (=> b!40051 m!32851))

(declare-fun m!32875 () Bool)

(assert (=> b!40051 m!32875))

(assert (=> b!40053 m!32851))

(assert (=> b!40053 m!32851))

(assert (=> b!40053 m!32875))

(assert (=> bm!3062 d!6873))

(declare-fun d!6875 () Bool)

(assert (=> d!6875 (arrayContainsKey!0 (_keys!3267 lt!14731) lt!14825 #b00000000000000000000000000000000)))

(declare-fun lt!15288 () Unit!969)

(assert (=> d!6875 (= lt!15288 (choose!13 (_keys!3267 lt!14731) lt!14825 #b00000000000000000000000000000000))))

(assert (=> d!6875 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6875 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3267 lt!14731) lt!14825 #b00000000000000000000000000000000) lt!15288)))

(declare-fun bs!1677 () Bool)

(assert (= bs!1677 d!6875))

(assert (=> bs!1677 m!32109))

(declare-fun m!32877 () Bool)

(assert (=> bs!1677 m!32877))

(assert (=> b!39421 d!6875))

(declare-fun d!6877 () Bool)

(declare-fun res!23958 () Bool)

(declare-fun e!25416 () Bool)

(assert (=> d!6877 (=> res!23958 e!25416)))

(assert (=> d!6877 (= res!23958 (= (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) lt!14825))))

(assert (=> d!6877 (= (arrayContainsKey!0 (_keys!3267 lt!14731) lt!14825 #b00000000000000000000000000000000) e!25416)))

(declare-fun b!40054 () Bool)

(declare-fun e!25417 () Bool)

(assert (=> b!40054 (= e!25416 e!25417)))

(declare-fun res!23959 () Bool)

(assert (=> b!40054 (=> (not res!23959) (not e!25417))))

(assert (=> b!40054 (= res!23959 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1359 (_keys!3267 lt!14731))))))

(declare-fun b!40055 () Bool)

(assert (=> b!40055 (= e!25417 (arrayContainsKey!0 (_keys!3267 lt!14731) lt!14825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6877 (not res!23958)) b!40054))

(assert (= (and b!40054 res!23959) b!40055))

(assert (=> d!6877 m!32093))

(declare-fun m!32879 () Bool)

(assert (=> b!40055 m!32879))

(assert (=> b!39421 d!6877))

(declare-fun b!40056 () Bool)

(declare-fun e!25419 () SeekEntryResult!171)

(declare-fun lt!15290 () SeekEntryResult!171)

(assert (=> b!40056 (= e!25419 (MissingZero!171 (index!2808 lt!15290)))))

(declare-fun d!6879 () Bool)

(declare-fun lt!15291 () SeekEntryResult!171)

(assert (=> d!6879 (and (or (is-Undefined!171 lt!15291) (not (is-Found!171 lt!15291)) (and (bvsge (index!2807 lt!15291) #b00000000000000000000000000000000) (bvslt (index!2807 lt!15291) (size!1359 (_keys!3267 lt!14731))))) (or (is-Undefined!171 lt!15291) (is-Found!171 lt!15291) (not (is-MissingZero!171 lt!15291)) (and (bvsge (index!2806 lt!15291) #b00000000000000000000000000000000) (bvslt (index!2806 lt!15291) (size!1359 (_keys!3267 lt!14731))))) (or (is-Undefined!171 lt!15291) (is-Found!171 lt!15291) (is-MissingZero!171 lt!15291) (not (is-MissingVacant!171 lt!15291)) (and (bvsge (index!2809 lt!15291) #b00000000000000000000000000000000) (bvslt (index!2809 lt!15291) (size!1359 (_keys!3267 lt!14731))))) (or (is-Undefined!171 lt!15291) (ite (is-Found!171 lt!15291) (= (select (arr!1237 (_keys!3267 lt!14731)) (index!2807 lt!15291)) (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)) (ite (is-MissingZero!171 lt!15291) (= (select (arr!1237 (_keys!3267 lt!14731)) (index!2806 lt!15291)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!171 lt!15291) (= (select (arr!1237 (_keys!3267 lt!14731)) (index!2809 lt!15291)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25418 () SeekEntryResult!171)

(assert (=> d!6879 (= lt!15291 e!25418)))

(declare-fun c!4842 () Bool)

(assert (=> d!6879 (= c!4842 (and (is-Intermediate!171 lt!15290) (undefined!983 lt!15290)))))

(assert (=> d!6879 (= lt!15290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) (mask!5143 lt!14731)) (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) (_keys!3267 lt!14731) (mask!5143 lt!14731)))))

(assert (=> d!6879 (validMask!0 (mask!5143 lt!14731))))

(assert (=> d!6879 (= (seekEntryOrOpen!0 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) (_keys!3267 lt!14731) (mask!5143 lt!14731)) lt!15291)))

(declare-fun b!40057 () Bool)

(declare-fun e!25420 () SeekEntryResult!171)

(assert (=> b!40057 (= e!25420 (Found!171 (index!2808 lt!15290)))))

(declare-fun b!40058 () Bool)

(declare-fun c!4840 () Bool)

(declare-fun lt!15289 () (_ BitVec 64))

(assert (=> b!40058 (= c!4840 (= lt!15289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40058 (= e!25420 e!25419)))

(declare-fun b!40059 () Bool)

(assert (=> b!40059 (= e!25419 (seekKeyOrZeroReturnVacant!0 (x!7657 lt!15290) (index!2808 lt!15290) (index!2808 lt!15290) (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000) (_keys!3267 lt!14731) (mask!5143 lt!14731)))))

(declare-fun b!40060 () Bool)

(assert (=> b!40060 (= e!25418 e!25420)))

(assert (=> b!40060 (= lt!15289 (select (arr!1237 (_keys!3267 lt!14731)) (index!2808 lt!15290)))))

(declare-fun c!4841 () Bool)

(assert (=> b!40060 (= c!4841 (= lt!15289 (select (arr!1237 (_keys!3267 lt!14731)) #b00000000000000000000000000000000)))))

(declare-fun b!40061 () Bool)

(assert (=> b!40061 (= e!25418 Undefined!171)))

(assert (= (and d!6879 c!4842) b!40061))

(assert (= (and d!6879 (not c!4842)) b!40060))

(assert (= (and b!40060 c!4841) b!40057))

(assert (= (and b!40060 (not c!4841)) b!40058))

(assert (= (and b!40058 c!4840) b!40056))

(assert (= (and b!40058 (not c!4840)) b!40059))

(declare-fun m!32881 () Bool)

(assert (=> d!6879 m!32881))

(assert (=> d!6879 m!32091))

(declare-fun m!32883 () Bool)

(assert (=> d!6879 m!32883))

(assert (=> d!6879 m!32093))

(declare-fun m!32885 () Bool)

(assert (=> d!6879 m!32885))

(declare-fun m!32887 () Bool)

(assert (=> d!6879 m!32887))

(assert (=> d!6879 m!32093))

(assert (=> d!6879 m!32883))

(declare-fun m!32889 () Bool)

(assert (=> d!6879 m!32889))

(assert (=> b!40059 m!32093))

