; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5500 () Bool)

(assert start!5500)

(declare-fun b_free!1357 () Bool)

(declare-fun b_next!1357 () Bool)

(assert (=> start!5500 (= b_free!1357 (not b_next!1357))))

(declare-fun tp!5723 () Bool)

(declare-fun b_and!2327 () Bool)

(assert (=> start!5500 (= tp!5723 b_and!2327)))

(declare-fun res!23541 () Bool)

(declare-fun e!24856 () Bool)

(assert (=> start!5500 (=> (not res!23541) (not e!24856))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5500 (= res!23541 (validMask!0 mask!853))))

(assert (=> start!5500 e!24856))

(assert (=> start!5500 true))

(assert (=> start!5500 tp!5723))

(declare-fun b!39150 () Bool)

(declare-fun e!24855 () Bool)

(assert (=> b!39150 (= e!24856 (not e!24855))))

(declare-fun res!23540 () Bool)

(assert (=> b!39150 (=> res!23540 e!24855)))

(declare-datatypes ((array!2579 0))(
  ( (array!2580 (arr!1233 (Array (_ BitVec 32) (_ BitVec 64))) (size!1355 (_ BitVec 32))) )
))
(declare-datatypes ((V!2089 0))(
  ( (V!2090 (val!912 Int)) )
))
(declare-datatypes ((ValueCell!626 0))(
  ( (ValueCellFull!626 (v!1984 V!2089)) (EmptyCell!626) )
))
(declare-datatypes ((array!2581 0))(
  ( (array!2582 (arr!1234 (Array (_ BitVec 32) ValueCell!626)) (size!1356 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!232 0))(
  ( (LongMapFixedSize!233 (defaultEntry!1794 Int) (mask!5141 (_ BitVec 32)) (extraKeys!1685 (_ BitVec 32)) (zeroValue!1712 V!2089) (minValue!1712 V!2089) (_size!165 (_ BitVec 32)) (_keys!3265 array!2579) (_values!1777 array!2581) (_vacant!165 (_ BitVec 32))) )
))
(declare-fun lt!14691 () LongMapFixedSize!232)

(declare-datatypes ((tuple2!1478 0))(
  ( (tuple2!1479 (_1!750 (_ BitVec 64)) (_2!750 V!2089)) )
))
(declare-datatypes ((List!1046 0))(
  ( (Nil!1043) (Cons!1042 (h!1613 tuple2!1478) (t!3887 List!1046)) )
))
(declare-datatypes ((ListLongMap!1055 0))(
  ( (ListLongMap!1056 (toList!543 List!1046)) )
))
(declare-fun map!684 (LongMapFixedSize!232) ListLongMap!1055)

(assert (=> b!39150 (= res!23540 (= (map!684 lt!14691) (ListLongMap!1056 Nil!1043)))))

(declare-fun lt!14692 () array!2579)

(declare-datatypes ((List!1047 0))(
  ( (Nil!1044) (Cons!1043 (h!1614 (_ BitVec 64)) (t!3888 List!1047)) )
))
(declare-fun arrayNoDuplicates!0 (array!2579 (_ BitVec 32) List!1047) Bool)

(assert (=> b!39150 (arrayNoDuplicates!0 lt!14692 #b00000000000000000000000000000000 Nil!1044)))

(declare-datatypes ((Unit!965 0))(
  ( (Unit!966) )
))
(declare-fun lt!14694 () Unit!965)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2579 (_ BitVec 32) (_ BitVec 32) List!1047) Unit!965)

(assert (=> b!39150 (= lt!14694 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2579 (_ BitVec 32)) Bool)

(assert (=> b!39150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14692 mask!853)))

(declare-fun lt!14696 () Unit!965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2579 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> b!39150 (= lt!14696 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14692 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2579 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39150 (= (arrayCountValidKeys!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14695 () Unit!965)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2579 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> b!39150 (= lt!14695 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!14693 () V!2089)

(assert (=> b!39150 (= lt!14691 (LongMapFixedSize!233 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14693 lt!14693 #b00000000000000000000000000000000 lt!14692 (array!2582 ((as const (Array (_ BitVec 32) ValueCell!626)) EmptyCell!626) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!39150 (= lt!14692 (array!2580 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!187 (Int (_ BitVec 64)) V!2089)

(assert (=> b!39150 (= lt!14693 (dynLambda!187 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39151 () Bool)

(declare-fun valid!115 (LongMapFixedSize!232) Bool)

(assert (=> b!39151 (= e!24855 (valid!115 lt!14691))))

(assert (= (and start!5500 res!23541) b!39150))

(assert (= (and b!39150 (not res!23540)) b!39151))

(declare-fun b_lambda!2021 () Bool)

(assert (=> (not b_lambda!2021) (not b!39150)))

(declare-fun t!3886 () Bool)

(declare-fun tb!827 () Bool)

(assert (=> (and start!5500 (= defaultEntry!470 defaultEntry!470) t!3886) tb!827))

(declare-fun result!1417 () Bool)

(declare-fun tp_is_empty!1747 () Bool)

(assert (=> tb!827 (= result!1417 tp_is_empty!1747)))

(assert (=> b!39150 t!3886))

(declare-fun b_and!2329 () Bool)

(assert (= b_and!2327 (and (=> t!3886 result!1417) b_and!2329)))

(declare-fun m!31843 () Bool)

(assert (=> start!5500 m!31843))

(declare-fun m!31845 () Bool)

(assert (=> b!39150 m!31845))

(declare-fun m!31847 () Bool)

(assert (=> b!39150 m!31847))

(declare-fun m!31849 () Bool)

(assert (=> b!39150 m!31849))

(declare-fun m!31851 () Bool)

(assert (=> b!39150 m!31851))

(declare-fun m!31853 () Bool)

(assert (=> b!39150 m!31853))

(declare-fun m!31855 () Bool)

(assert (=> b!39150 m!31855))

(declare-fun m!31857 () Bool)

(assert (=> b!39150 m!31857))

(declare-fun m!31859 () Bool)

(assert (=> b!39150 m!31859))

(declare-fun m!31861 () Bool)

(assert (=> b!39151 m!31861))

(push 1)

(assert b_and!2329)

(assert (not b_next!1357))

(assert (not b_lambda!2021))

(assert (not b!39151))

(assert (not start!5500))

(assert tp_is_empty!1747)

(assert (not b!39150))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2329)

(assert (not b_next!1357))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2027 () Bool)

(assert (= b_lambda!2021 (or (and start!5500 b_free!1357) b_lambda!2027)))

(push 1)

(assert b_and!2329)

(assert (not b_next!1357))

(assert (not b!39151))

(assert (not start!5500))

(assert tp_is_empty!1747)

(assert (not b_lambda!2027))

(assert (not b!39150))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2329)

(assert (not b_next!1357))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6521 () Bool)

(declare-fun res!23562 () Bool)

(declare-fun e!24873 () Bool)

(assert (=> d!6521 (=> (not res!23562) (not e!24873))))

(declare-fun simpleValid!24 (LongMapFixedSize!232) Bool)

(assert (=> d!6521 (= res!23562 (simpleValid!24 lt!14691))))

(assert (=> d!6521 (= (valid!115 lt!14691) e!24873)))

(declare-fun b!39178 () Bool)

(declare-fun res!23563 () Bool)

(assert (=> b!39178 (=> (not res!23563) (not e!24873))))

(assert (=> b!39178 (= res!23563 (= (arrayCountValidKeys!0 (_keys!3265 lt!14691) #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))) (_size!165 lt!14691)))))

(declare-fun b!39179 () Bool)

(declare-fun res!23564 () Bool)

(assert (=> b!39179 (=> (not res!23564) (not e!24873))))

(assert (=> b!39179 (= res!23564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3265 lt!14691) (mask!5141 lt!14691)))))

(declare-fun b!39180 () Bool)

(assert (=> b!39180 (= e!24873 (arrayNoDuplicates!0 (_keys!3265 lt!14691) #b00000000000000000000000000000000 Nil!1044))))

(assert (= (and d!6521 res!23562) b!39178))

(assert (= (and b!39178 res!23563) b!39179))

(assert (= (and b!39179 res!23564) b!39180))

(declare-fun m!31903 () Bool)

(assert (=> d!6521 m!31903))

(declare-fun m!31905 () Bool)

(assert (=> b!39178 m!31905))

(declare-fun m!31907 () Bool)

(assert (=> b!39179 m!31907))

(declare-fun m!31909 () Bool)

(assert (=> b!39180 m!31909))

(assert (=> b!39151 d!6521))

(declare-fun d!6525 () Bool)

(assert (=> d!6525 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5500 d!6525))

(declare-fun d!6539 () Bool)

(declare-fun res!23582 () Bool)

(declare-fun e!24900 () Bool)

(assert (=> d!6539 (=> res!23582 e!24900)))

(assert (=> d!6539 (= res!23582 (bvsge #b00000000000000000000000000000000 (size!1355 lt!14692)))))

(assert (=> d!6539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14692 mask!853) e!24900)))

(declare-fun bm!2969 () Bool)

(declare-fun call!2972 () Bool)

(assert (=> bm!2969 (= call!2972 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14692 mask!853))))

(declare-fun b!39214 () Bool)

(declare-fun e!24901 () Bool)

(assert (=> b!39214 (= e!24901 call!2972)))

(declare-fun b!39215 () Bool)

(declare-fun e!24899 () Bool)

(assert (=> b!39215 (= e!24899 call!2972)))

(declare-fun b!39216 () Bool)

(assert (=> b!39216 (= e!24900 e!24899)))

(declare-fun c!4604 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!39216 (= c!4604 (validKeyInArray!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun b!39217 () Bool)

(assert (=> b!39217 (= e!24899 e!24901)))

(declare-fun lt!14764 () (_ BitVec 64))

(assert (=> b!39217 (= lt!14764 (select (arr!1233 lt!14692) #b00000000000000000000000000000000))))

(declare-fun lt!14765 () Unit!965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2579 (_ BitVec 64) (_ BitVec 32)) Unit!965)

(assert (=> b!39217 (= lt!14765 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14692 lt!14764 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!39217 (arrayContainsKey!0 lt!14692 lt!14764 #b00000000000000000000000000000000)))

(declare-fun lt!14763 () Unit!965)

(assert (=> b!39217 (= lt!14763 lt!14765)))

(declare-fun res!23583 () Bool)

(declare-datatypes ((SeekEntryResult!169 0))(
  ( (MissingZero!169 (index!2798 (_ BitVec 32))) (Found!169 (index!2799 (_ BitVec 32))) (Intermediate!169 (undefined!981 Bool) (index!2800 (_ BitVec 32)) (x!7655 (_ BitVec 32))) (Undefined!169) (MissingVacant!169 (index!2801 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2579 (_ BitVec 32)) SeekEntryResult!169)

(assert (=> b!39217 (= res!23583 (= (seekEntryOrOpen!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853) (Found!169 #b00000000000000000000000000000000)))))

(assert (=> b!39217 (=> (not res!23583) (not e!24901))))

(assert (= (and d!6539 (not res!23582)) b!39216))

(assert (= (and b!39216 c!4604) b!39217))

(assert (= (and b!39216 (not c!4604)) b!39215))

(assert (= (and b!39217 res!23583) b!39214))

(assert (= (or b!39214 b!39215) bm!2969))

(declare-fun m!31941 () Bool)

(assert (=> bm!2969 m!31941))

(declare-fun m!31943 () Bool)

(assert (=> b!39216 m!31943))

(assert (=> b!39216 m!31943))

(declare-fun m!31945 () Bool)

(assert (=> b!39216 m!31945))

(assert (=> b!39217 m!31943))

(declare-fun m!31947 () Bool)

(assert (=> b!39217 m!31947))

(declare-fun m!31949 () Bool)

(assert (=> b!39217 m!31949))

(assert (=> b!39217 m!31943))

(declare-fun m!31951 () Bool)

(assert (=> b!39217 m!31951))

(assert (=> b!39150 d!6539))

(declare-fun d!6545 () Bool)

(declare-fun getCurrentListMap!307 (array!2579 array!2581 (_ BitVec 32) (_ BitVec 32) V!2089 V!2089 (_ BitVec 32) Int) ListLongMap!1055)

(assert (=> d!6545 (= (map!684 lt!14691) (getCurrentListMap!307 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)))))

(declare-fun bs!1634 () Bool)

(assert (= bs!1634 d!6545))

(declare-fun m!31957 () Bool)

(assert (=> bs!1634 m!31957))

(assert (=> b!39150 d!6545))

(declare-fun d!6551 () Bool)

(assert (=> d!6551 (arrayNoDuplicates!0 lt!14692 #b00000000000000000000000000000000 Nil!1044)))

(declare-fun lt!14771 () Unit!965)

(declare-fun choose!111 (array!2579 (_ BitVec 32) (_ BitVec 32) List!1047) Unit!965)

(assert (=> d!6551 (= lt!14771 (choose!111 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1044))))

(assert (=> d!6551 (= (size!1355 lt!14692) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6551 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1044) lt!14771)))

(declare-fun bs!1635 () Bool)

(assert (= bs!1635 d!6551))

(assert (=> bs!1635 m!31849))

(declare-fun m!31961 () Bool)

(assert (=> bs!1635 m!31961))

(assert (=> b!39150 d!6551))

(declare-fun b!39263 () Bool)

(declare-fun e!24937 () Bool)

(declare-fun call!2983 () Bool)

(assert (=> b!39263 (= e!24937 call!2983)))

(declare-fun d!6555 () Bool)

(declare-fun res!23603 () Bool)

(declare-fun e!24935 () Bool)

(assert (=> d!6555 (=> res!23603 e!24935)))

(assert (=> d!6555 (= res!23603 (bvsge #b00000000000000000000000000000000 (size!1355 lt!14692)))))

(assert (=> d!6555 (= (arrayNoDuplicates!0 lt!14692 #b00000000000000000000000000000000 Nil!1044) e!24935)))

(declare-fun b!39264 () Bool)

(declare-fun e!24934 () Bool)

(assert (=> b!39264 (= e!24934 e!24937)))

(declare-fun c!4618 () Bool)

(assert (=> b!39264 (= c!4618 (validKeyInArray!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun b!39265 () Bool)

(assert (=> b!39265 (= e!24935 e!24934)))

(declare-fun res!23604 () Bool)

(assert (=> b!39265 (=> (not res!23604) (not e!24934))))

(declare-fun e!24936 () Bool)

(assert (=> b!39265 (= res!23604 (not e!24936))))

(declare-fun res!23605 () Bool)

(assert (=> b!39265 (=> (not res!23605) (not e!24936))))

(assert (=> b!39265 (= res!23605 (validKeyInArray!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun b!39266 () Bool)

(assert (=> b!39266 (= e!24937 call!2983)))

(declare-fun b!39267 () Bool)

(declare-fun contains!504 (List!1047 (_ BitVec 64)) Bool)

(assert (=> b!39267 (= e!24936 (contains!504 Nil!1044 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun bm!2980 () Bool)

(assert (=> bm!2980 (= call!2983 (arrayNoDuplicates!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)))))

(assert (= (and d!6555 (not res!23603)) b!39265))

(assert (= (and b!39265 res!23605) b!39267))

(assert (= (and b!39265 res!23604) b!39264))

(assert (= (and b!39264 c!4618) b!39266))

(assert (= (and b!39264 (not c!4618)) b!39263))

(assert (= (or b!39266 b!39263) bm!2980))

(assert (=> b!39264 m!31943))

(assert (=> b!39264 m!31943))

(assert (=> b!39264 m!31945))

(assert (=> b!39265 m!31943))

(assert (=> b!39265 m!31943))

(assert (=> b!39265 m!31945))

(assert (=> b!39267 m!31943))

(assert (=> b!39267 m!31943))

(declare-fun m!31967 () Bool)

(assert (=> b!39267 m!31967))

(assert (=> bm!2980 m!31943))

(declare-fun m!31969 () Bool)

(assert (=> bm!2980 m!31969))

(assert (=> b!39150 d!6555))

(declare-fun d!6559 () Bool)

(declare-fun lt!14786 () (_ BitVec 32))

(assert (=> d!6559 (and (bvsge lt!14786 #b00000000000000000000000000000000) (bvsle lt!14786 (bvsub (size!1355 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun e!24953 () (_ BitVec 32))

(assert (=> d!6559 (= lt!14786 e!24953)))

(declare-fun c!4630 () Bool)

(assert (=> d!6559 (= c!4630 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6559 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1355 lt!14692)))))

(assert (=> d!6559 (= (arrayCountValidKeys!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14786)))

(declare-fun b!39298 () Bool)

(assert (=> b!39298 (= e!24953 #b00000000000000000000000000000000)))

(declare-fun b!39299 () Bool)

(declare-fun e!24954 () (_ BitVec 32))

(assert (=> b!39299 (= e!24953 e!24954)))

(declare-fun c!4631 () Bool)

(assert (=> b!39299 (= c!4631 (validKeyInArray!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun bm!2987 () Bool)

(declare-fun call!2990 () (_ BitVec 32))

(assert (=> bm!2987 (= call!2990 (arrayCountValidKeys!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39300 () Bool)

(assert (=> b!39300 (= e!24954 call!2990)))

(declare-fun b!39301 () Bool)

(assert (=> b!39301 (= e!24954 (bvadd #b00000000000000000000000000000001 call!2990))))

(assert (= (and d!6559 c!4630) b!39298))

(assert (= (and d!6559 (not c!4630)) b!39299))

(assert (= (and b!39299 c!4631) b!39301))

(assert (= (and b!39299 (not c!4631)) b!39300))

(assert (= (or b!39301 b!39300) bm!2987))

(assert (=> b!39299 m!31943))

(assert (=> b!39299 m!31943))

(assert (=> b!39299 m!31945))

(declare-fun m!31981 () Bool)

(assert (=> bm!2987 m!31981))

(assert (=> b!39150 d!6559))

(declare-fun d!6565 () Bool)

(assert (=> d!6565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14692 mask!853)))

(declare-fun lt!14792 () Unit!965)

(declare-fun choose!34 (array!2579 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> d!6565 (= lt!14792 (choose!34 lt!14692 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6565 (validMask!0 mask!853)))

(assert (=> d!6565 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14692 mask!853 #b00000000000000000000000000000000) lt!14792)))

(declare-fun bs!1637 () Bool)

(assert (= bs!1637 d!6565))

(assert (=> bs!1637 m!31859))

(declare-fun m!31993 () Bool)

(assert (=> bs!1637 m!31993))

(assert (=> bs!1637 m!31843))

(assert (=> b!39150 d!6565))

(declare-fun d!6571 () Bool)

(assert (=> d!6571 (= (arrayCountValidKeys!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14795 () Unit!965)

(declare-fun choose!59 (array!2579 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> d!6571 (= lt!14795 (choose!59 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6571 (bvslt (size!1355 lt!14692) #b01111111111111111111111111111111)))

(assert (=> d!6571 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14795)))

(declare-fun bs!1638 () Bool)

(assert (= bs!1638 d!6571))

(assert (=> bs!1638 m!31857))

(declare-fun m!31995 () Bool)

(assert (=> bs!1638 m!31995))

(assert (=> b!39150 d!6571))

(push 1)

(assert b_and!2329)

(assert (not b!39178))

(assert (not bm!2987))

(assert (not b!39216))

(assert (not d!6565))

(assert (not b!39299))

(assert (not b!39264))

(assert (not b!39179))

(assert tp_is_empty!1747)

(assert (not b_lambda!2027))

(assert (not b!39180))

(assert (not d!6551))

(assert (not bm!2980))

(assert (not b!39267))

(assert (not d!6571))

(assert (not b_next!1357))

(assert (not b!39217))

(assert (not bm!2969))

(assert (not b!39265))

(assert (not d!6521))

(assert (not d!6545))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2329)

(assert (not b_next!1357))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6575 () Bool)

(declare-fun res!23626 () Bool)

(declare-fun e!24960 () Bool)

(assert (=> d!6575 (=> res!23626 e!24960)))

(assert (=> d!6575 (= res!23626 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(assert (=> d!6575 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14692 mask!853) e!24960)))

(declare-fun bm!2988 () Bool)

(declare-fun call!2991 () Bool)

(assert (=> bm!2988 (= call!2991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14692 mask!853))))

(declare-fun b!39314 () Bool)

(declare-fun e!24961 () Bool)

(assert (=> b!39314 (= e!24961 call!2991)))

(declare-fun b!39315 () Bool)

(declare-fun e!24959 () Bool)

(assert (=> b!39315 (= e!24959 call!2991)))

(declare-fun b!39316 () Bool)

(assert (=> b!39316 (= e!24960 e!24959)))

(declare-fun c!4632 () Bool)

(assert (=> b!39316 (= c!4632 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39317 () Bool)

(assert (=> b!39317 (= e!24959 e!24961)))

(declare-fun lt!14797 () (_ BitVec 64))

(assert (=> b!39317 (= lt!14797 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14798 () Unit!965)

(assert (=> b!39317 (= lt!14798 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14692 lt!14797 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39317 (arrayContainsKey!0 lt!14692 lt!14797 #b00000000000000000000000000000000)))

(declare-fun lt!14796 () Unit!965)

(assert (=> b!39317 (= lt!14796 lt!14798)))

(declare-fun res!23627 () Bool)

(assert (=> b!39317 (= res!23627 (= (seekEntryOrOpen!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14692 mask!853) (Found!169 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39317 (=> (not res!23627) (not e!24961))))

(assert (= (and d!6575 (not res!23626)) b!39316))

(assert (= (and b!39316 c!4632) b!39317))

(assert (= (and b!39316 (not c!4632)) b!39315))

(assert (= (and b!39317 res!23627) b!39314))

(assert (= (or b!39314 b!39315) bm!2988))

(declare-fun m!32005 () Bool)

(assert (=> bm!2988 m!32005))

(declare-fun m!32007 () Bool)

(assert (=> b!39316 m!32007))

(assert (=> b!39316 m!32007))

(declare-fun m!32009 () Bool)

(assert (=> b!39316 m!32009))

(assert (=> b!39317 m!32007))

(declare-fun m!32011 () Bool)

(assert (=> b!39317 m!32011))

(declare-fun m!32013 () Bool)

(assert (=> b!39317 m!32013))

(assert (=> b!39317 m!32007))

(declare-fun m!32015 () Bool)

(assert (=> b!39317 m!32015))

(assert (=> bm!2969 d!6575))

(declare-fun d!6577 () Bool)

(declare-fun res!23628 () Bool)

(declare-fun e!24963 () Bool)

(assert (=> d!6577 (=> res!23628 e!24963)))

(assert (=> d!6577 (= res!23628 (bvsge #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3265 lt!14691) (mask!5141 lt!14691)) e!24963)))

(declare-fun bm!2989 () Bool)

(declare-fun call!2992 () Bool)

(assert (=> bm!2989 (= call!2992 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3265 lt!14691) (mask!5141 lt!14691)))))

(declare-fun b!39318 () Bool)

(declare-fun e!24964 () Bool)

(assert (=> b!39318 (= e!24964 call!2992)))

(declare-fun b!39319 () Bool)

(declare-fun e!24962 () Bool)

(assert (=> b!39319 (= e!24962 call!2992)))

(declare-fun b!39320 () Bool)

(assert (=> b!39320 (= e!24963 e!24962)))

(declare-fun c!4633 () Bool)

(assert (=> b!39320 (= c!4633 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39321 () Bool)

(assert (=> b!39321 (= e!24962 e!24964)))

(declare-fun lt!14800 () (_ BitVec 64))

(assert (=> b!39321 (= lt!14800 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))

(declare-fun lt!14801 () Unit!965)

(assert (=> b!39321 (= lt!14801 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3265 lt!14691) lt!14800 #b00000000000000000000000000000000))))

(assert (=> b!39321 (arrayContainsKey!0 (_keys!3265 lt!14691) lt!14800 #b00000000000000000000000000000000)))

(declare-fun lt!14799 () Unit!965)

(assert (=> b!39321 (= lt!14799 lt!14801)))

(declare-fun res!23629 () Bool)

(assert (=> b!39321 (= res!23629 (= (seekEntryOrOpen!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (_keys!3265 lt!14691) (mask!5141 lt!14691)) (Found!169 #b00000000000000000000000000000000)))))

(assert (=> b!39321 (=> (not res!23629) (not e!24964))))

(assert (= (and d!6577 (not res!23628)) b!39320))

(assert (= (and b!39320 c!4633) b!39321))

(assert (= (and b!39320 (not c!4633)) b!39319))

(assert (= (and b!39321 res!23629) b!39318))

(assert (= (or b!39318 b!39319) bm!2989))

(declare-fun m!32017 () Bool)

(assert (=> bm!2989 m!32017))

(declare-fun m!32019 () Bool)

(assert (=> b!39320 m!32019))

(assert (=> b!39320 m!32019))

(declare-fun m!32021 () Bool)

(assert (=> b!39320 m!32021))

(assert (=> b!39321 m!32019))

(declare-fun m!32023 () Bool)

(assert (=> b!39321 m!32023))

(declare-fun m!32025 () Bool)

(assert (=> b!39321 m!32025))

(assert (=> b!39321 m!32019))

(declare-fun m!32027 () Bool)

(assert (=> b!39321 m!32027))

(assert (=> b!39179 d!6577))

(assert (=> d!6571 d!6559))

(declare-fun d!6579 () Bool)

(assert (=> d!6579 (= (arrayCountValidKeys!0 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6579 true))

(declare-fun _$88!28 () Unit!965)

(assert (=> d!6579 (= (choose!59 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!28)))

(declare-fun bs!1639 () Bool)

(assert (= bs!1639 d!6579))

(assert (=> bs!1639 m!31857))

(assert (=> d!6571 d!6579))

(assert (=> d!6565 d!6539))

(declare-fun d!6581 () Bool)

(assert (=> d!6581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14692 mask!853)))

(assert (=> d!6581 true))

(declare-fun _$30!42 () Unit!965)

(assert (=> d!6581 (= (choose!34 lt!14692 mask!853 #b00000000000000000000000000000000) _$30!42)))

(declare-fun bs!1640 () Bool)

(assert (= bs!1640 d!6581))

(assert (=> bs!1640 m!31859))

(assert (=> d!6565 d!6581))

(assert (=> d!6565 d!6525))

(declare-fun b!39326 () Bool)

(declare-fun e!24970 () Bool)

(declare-fun call!2994 () Bool)

(assert (=> b!39326 (= e!24970 call!2994)))

(declare-fun d!6585 () Bool)

(declare-fun res!23630 () Bool)

(declare-fun e!24968 () Bool)

(assert (=> d!6585 (=> res!23630 e!24968)))

(assert (=> d!6585 (= res!23630 (bvsge #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6585 (= (arrayNoDuplicates!0 (_keys!3265 lt!14691) #b00000000000000000000000000000000 Nil!1044) e!24968)))

(declare-fun b!39327 () Bool)

(declare-fun e!24967 () Bool)

(assert (=> b!39327 (= e!24967 e!24970)))

(declare-fun c!4636 () Bool)

(assert (=> b!39327 (= c!4636 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39328 () Bool)

(assert (=> b!39328 (= e!24968 e!24967)))

(declare-fun res!23631 () Bool)

(assert (=> b!39328 (=> (not res!23631) (not e!24967))))

(declare-fun e!24969 () Bool)

(assert (=> b!39328 (= res!23631 (not e!24969))))

(declare-fun res!23632 () Bool)

(assert (=> b!39328 (=> (not res!23632) (not e!24969))))

(assert (=> b!39328 (= res!23632 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39329 () Bool)

(assert (=> b!39329 (= e!24970 call!2994)))

(declare-fun b!39330 () Bool)

(assert (=> b!39330 (= e!24969 (contains!504 Nil!1044 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun bm!2991 () Bool)

(assert (=> bm!2991 (= call!2994 (arrayNoDuplicates!0 (_keys!3265 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4636 (Cons!1043 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) Nil!1044) Nil!1044)))))

(assert (= (and d!6585 (not res!23630)) b!39328))

(assert (= (and b!39328 res!23632) b!39330))

(assert (= (and b!39328 res!23631) b!39327))

(assert (= (and b!39327 c!4636) b!39329))

(assert (= (and b!39327 (not c!4636)) b!39326))

(assert (= (or b!39329 b!39326) bm!2991))

(assert (=> b!39327 m!32019))

(assert (=> b!39327 m!32019))

(assert (=> b!39327 m!32021))

(assert (=> b!39328 m!32019))

(assert (=> b!39328 m!32019))

(assert (=> b!39328 m!32021))

(assert (=> b!39330 m!32019))

(assert (=> b!39330 m!32019))

(declare-fun m!32035 () Bool)

(assert (=> b!39330 m!32035))

(assert (=> bm!2991 m!32019))

(declare-fun m!32037 () Bool)

(assert (=> bm!2991 m!32037))

(assert (=> b!39180 d!6585))

(declare-fun d!6589 () Bool)

(assert (=> d!6589 (= (validKeyInArray!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)) (and (not (= (select (arr!1233 lt!14692) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1233 lt!14692) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39264 d!6589))

(declare-fun d!6591 () Bool)

(declare-fun res!23644 () Bool)

(declare-fun e!24973 () Bool)

(assert (=> d!6591 (=> (not res!23644) (not e!24973))))

(assert (=> d!6591 (= res!23644 (validMask!0 (mask!5141 lt!14691)))))

(assert (=> d!6591 (= (simpleValid!24 lt!14691) e!24973)))

(declare-fun b!39339 () Bool)

(declare-fun res!23647 () Bool)

(assert (=> b!39339 (=> (not res!23647) (not e!24973))))

(assert (=> b!39339 (= res!23647 (and (= (size!1356 (_values!1777 lt!14691)) (bvadd (mask!5141 lt!14691) #b00000000000000000000000000000001)) (= (size!1355 (_keys!3265 lt!14691)) (size!1356 (_values!1777 lt!14691))) (bvsge (_size!165 lt!14691) #b00000000000000000000000000000000) (bvsle (_size!165 lt!14691) (bvadd (mask!5141 lt!14691) #b00000000000000000000000000000001))))))

(declare-fun b!39340 () Bool)

(declare-fun res!23645 () Bool)

(assert (=> b!39340 (=> (not res!23645) (not e!24973))))

(declare-fun size!1373 (LongMapFixedSize!232) (_ BitVec 32))

(assert (=> b!39340 (= res!23645 (bvsge (size!1373 lt!14691) (_size!165 lt!14691)))))

(declare-fun b!39342 () Bool)

(assert (=> b!39342 (= e!24973 (and (bvsge (extraKeys!1685 lt!14691) #b00000000000000000000000000000000) (bvsle (extraKeys!1685 lt!14691) #b00000000000000000000000000000011) (bvsge (_vacant!165 lt!14691) #b00000000000000000000000000000000)))))

(declare-fun b!39341 () Bool)

(declare-fun res!23646 () Bool)

(assert (=> b!39341 (=> (not res!23646) (not e!24973))))

(assert (=> b!39341 (= res!23646 (= (size!1373 lt!14691) (bvadd (_size!165 lt!14691) (bvsdiv (bvadd (extraKeys!1685 lt!14691) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!6591 res!23644) b!39339))

(assert (= (and b!39339 res!23647) b!39340))

(assert (= (and b!39340 res!23645) b!39341))

(assert (= (and b!39341 res!23646) b!39342))

(declare-fun m!32039 () Bool)

(assert (=> d!6591 m!32039))

(declare-fun m!32041 () Bool)

(assert (=> b!39340 m!32041))

(assert (=> b!39341 m!32041))

(assert (=> d!6521 d!6591))

(assert (=> b!39265 d!6589))

(assert (=> b!39216 d!6589))

(declare-fun d!6597 () Bool)

(assert (=> d!6597 (arrayContainsKey!0 lt!14692 lt!14764 #b00000000000000000000000000000000)))

(declare-fun lt!14805 () Unit!965)

(declare-fun choose!13 (array!2579 (_ BitVec 64) (_ BitVec 32)) Unit!965)

(assert (=> d!6597 (= lt!14805 (choose!13 lt!14692 lt!14764 #b00000000000000000000000000000000))))

(assert (=> d!6597 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6597 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14692 lt!14764 #b00000000000000000000000000000000) lt!14805)))

(declare-fun bs!1643 () Bool)

(assert (= bs!1643 d!6597))

(assert (=> bs!1643 m!31949))

(declare-fun m!32043 () Bool)

(assert (=> bs!1643 m!32043))

(assert (=> b!39217 d!6597))

(declare-fun d!6601 () Bool)

(declare-fun res!23652 () Bool)

(declare-fun e!24978 () Bool)

(assert (=> d!6601 (=> res!23652 e!24978)))

(assert (=> d!6601 (= res!23652 (= (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14764))))

(assert (=> d!6601 (= (arrayContainsKey!0 lt!14692 lt!14764 #b00000000000000000000000000000000) e!24978)))

(declare-fun b!39347 () Bool)

(declare-fun e!24979 () Bool)

(assert (=> b!39347 (= e!24978 e!24979)))

(declare-fun res!23653 () Bool)

(assert (=> b!39347 (=> (not res!23653) (not e!24979))))

(assert (=> b!39347 (= res!23653 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(declare-fun b!39348 () Bool)

(assert (=> b!39348 (= e!24979 (arrayContainsKey!0 lt!14692 lt!14764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6601 (not res!23652)) b!39347))

(assert (= (and b!39347 res!23653) b!39348))

(assert (=> d!6601 m!31943))

(declare-fun m!32045 () Bool)

(assert (=> b!39348 m!32045))

(assert (=> b!39217 d!6601))

(declare-fun b!39373 () Bool)

(declare-fun e!24991 () SeekEntryResult!169)

(declare-fun e!24989 () SeekEntryResult!169)

(assert (=> b!39373 (= e!24991 e!24989)))

(declare-fun lt!14814 () (_ BitVec 64))

(declare-fun lt!14812 () SeekEntryResult!169)

(assert (=> b!39373 (= lt!14814 (select (arr!1233 lt!14692) (index!2800 lt!14812)))))

(declare-fun c!4644 () Bool)

(assert (=> b!39373 (= c!4644 (= lt!14814 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun b!39374 () Bool)

(declare-fun c!4643 () Bool)

(assert (=> b!39374 (= c!4643 (= lt!14814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24990 () SeekEntryResult!169)

(assert (=> b!39374 (= e!24989 e!24990)))

(declare-fun b!39375 () Bool)

(assert (=> b!39375 (= e!24990 (MissingZero!169 (index!2800 lt!14812)))))

(declare-fun b!39376 () Bool)

(assert (=> b!39376 (= e!24991 Undefined!169)))

(declare-fun d!6603 () Bool)

(declare-fun lt!14813 () SeekEntryResult!169)

(assert (=> d!6603 (and (or (is-Undefined!169 lt!14813) (not (is-Found!169 lt!14813)) (and (bvsge (index!2799 lt!14813) #b00000000000000000000000000000000) (bvslt (index!2799 lt!14813) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!14813) (is-Found!169 lt!14813) (not (is-MissingZero!169 lt!14813)) (and (bvsge (index!2798 lt!14813) #b00000000000000000000000000000000) (bvslt (index!2798 lt!14813) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!14813) (is-Found!169 lt!14813) (is-MissingZero!169 lt!14813) (not (is-MissingVacant!169 lt!14813)) (and (bvsge (index!2801 lt!14813) #b00000000000000000000000000000000) (bvslt (index!2801 lt!14813) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!14813) (ite (is-Found!169 lt!14813) (= (select (arr!1233 lt!14692) (index!2799 lt!14813)) (select (arr!1233 lt!14692) #b00000000000000000000000000000000)) (ite (is-MissingZero!169 lt!14813) (= (select (arr!1233 lt!14692) (index!2798 lt!14813)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!169 lt!14813) (= (select (arr!1233 lt!14692) (index!2801 lt!14813)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6603 (= lt!14813 e!24991)))

(declare-fun c!4645 () Bool)

(assert (=> d!6603 (= c!4645 (and (is-Intermediate!169 lt!14812) (undefined!981 lt!14812)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2579 (_ BitVec 32)) SeekEntryResult!169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6603 (= lt!14812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853) (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853))))

(assert (=> d!6603 (validMask!0 mask!853)))

(assert (=> d!6603 (= (seekEntryOrOpen!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853) lt!14813)))

(declare-fun b!39377 () Bool)

(assert (=> b!39377 (= e!24989 (Found!169 (index!2800 lt!14812)))))

(declare-fun b!39378 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2579 (_ BitVec 32)) SeekEntryResult!169)

(assert (=> b!39378 (= e!24990 (seekKeyOrZeroReturnVacant!0 (x!7655 lt!14812) (index!2800 lt!14812) (index!2800 lt!14812) (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853))))

(assert (= (and d!6603 c!4645) b!39376))

(assert (= (and d!6603 (not c!4645)) b!39373))

(assert (= (and b!39373 c!4644) b!39377))

(assert (= (and b!39373 (not c!4644)) b!39374))

(assert (= (and b!39374 c!4643) b!39375))

(assert (= (and b!39374 (not c!4643)) b!39378))

(declare-fun m!32051 () Bool)

(assert (=> b!39373 m!32051))

(declare-fun m!32053 () Bool)

(assert (=> d!6603 m!32053))

(assert (=> d!6603 m!31943))

(declare-fun m!32055 () Bool)

(assert (=> d!6603 m!32055))

(assert (=> d!6603 m!31943))

(assert (=> d!6603 m!32053))

(declare-fun m!32057 () Bool)

(assert (=> d!6603 m!32057))

(declare-fun m!32059 () Bool)

(assert (=> d!6603 m!32059))

(declare-fun m!32061 () Bool)

(assert (=> d!6603 m!32061))

(assert (=> d!6603 m!31843))

(assert (=> b!39378 m!31943))

(declare-fun m!32063 () Bool)

(assert (=> b!39378 m!32063))

(assert (=> b!39217 d!6603))

(declare-fun d!6607 () Bool)

(declare-fun lt!14817 () Bool)

(declare-fun content!27 (List!1047) (Set (_ BitVec 64)))

(assert (=> d!6607 (= lt!14817 (set.member (select (arr!1233 lt!14692) #b00000000000000000000000000000000) (content!27 Nil!1044)))))

(declare-fun e!24996 () Bool)

(assert (=> d!6607 (= lt!14817 e!24996)))

(declare-fun res!23670 () Bool)

(assert (=> d!6607 (=> (not res!23670) (not e!24996))))

(assert (=> d!6607 (= res!23670 (is-Cons!1043 Nil!1044))))

(assert (=> d!6607 (= (contains!504 Nil!1044 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)) lt!14817)))

(declare-fun b!39383 () Bool)

(declare-fun e!24997 () Bool)

(assert (=> b!39383 (= e!24996 e!24997)))

(declare-fun res!23671 () Bool)

(assert (=> b!39383 (=> res!23671 e!24997)))

(assert (=> b!39383 (= res!23671 (= (h!1614 Nil!1044) (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun b!39384 () Bool)

(assert (=> b!39384 (= e!24997 (contains!504 (t!3888 Nil!1044) (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(assert (= (and d!6607 res!23670) b!39383))

(assert (= (and b!39383 (not res!23671)) b!39384))

(declare-fun m!32065 () Bool)

(assert (=> d!6607 m!32065))

(assert (=> d!6607 m!31943))

(declare-fun m!32067 () Bool)

(assert (=> d!6607 m!32067))

(assert (=> b!39384 m!31943))

(declare-fun m!32069 () Bool)

(assert (=> b!39384 m!32069))

(assert (=> b!39267 d!6607))

(declare-fun b!39385 () Bool)

(declare-fun e!25001 () Bool)

(declare-fun call!2995 () Bool)

(assert (=> b!39385 (= e!25001 call!2995)))

(declare-fun d!6609 () Bool)

(declare-fun res!23672 () Bool)

(declare-fun e!24999 () Bool)

(assert (=> d!6609 (=> res!23672 e!24999)))

(assert (=> d!6609 (= res!23672 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(assert (=> d!6609 (= (arrayNoDuplicates!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) e!24999)))

(declare-fun b!39386 () Bool)

(declare-fun e!24998 () Bool)

(assert (=> b!39386 (= e!24998 e!25001)))

(declare-fun c!4646 () Bool)

(assert (=> b!39386 (= c!4646 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39387 () Bool)

(assert (=> b!39387 (= e!24999 e!24998)))

(declare-fun res!23673 () Bool)

(assert (=> b!39387 (=> (not res!23673) (not e!24998))))

(declare-fun e!25000 () Bool)

(assert (=> b!39387 (= res!23673 (not e!25000))))

(declare-fun res!23674 () Bool)

(assert (=> b!39387 (=> (not res!23674) (not e!25000))))

(assert (=> b!39387 (= res!23674 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39388 () Bool)

(assert (=> b!39388 (= e!25001 call!2995)))

(declare-fun b!39389 () Bool)

(assert (=> b!39389 (= e!25000 (contains!504 (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2992 () Bool)

(assert (=> bm!2992 (= call!2995 (arrayNoDuplicates!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4646 (Cons!1043 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044))))))

(assert (= (and d!6609 (not res!23672)) b!39387))

(assert (= (and b!39387 res!23674) b!39389))

(assert (= (and b!39387 res!23673) b!39386))

(assert (= (and b!39386 c!4646) b!39388))

(assert (= (and b!39386 (not c!4646)) b!39385))

(assert (= (or b!39388 b!39385) bm!2992))

(assert (=> b!39386 m!32007))

(assert (=> b!39386 m!32007))

(assert (=> b!39386 m!32009))

(assert (=> b!39387 m!32007))

(assert (=> b!39387 m!32007))

(assert (=> b!39387 m!32009))

(assert (=> b!39389 m!32007))

(assert (=> b!39389 m!32007))

(declare-fun m!32071 () Bool)

(assert (=> b!39389 m!32071))

(assert (=> bm!2992 m!32007))

(declare-fun m!32073 () Bool)

(assert (=> bm!2992 m!32073))

(assert (=> bm!2980 d!6609))

(assert (=> d!6551 d!6555))

(declare-fun d!6611 () Bool)

(assert (=> d!6611 (arrayNoDuplicates!0 lt!14692 #b00000000000000000000000000000000 Nil!1044)))

(assert (=> d!6611 true))

(declare-fun res!23677 () Unit!965)

(assert (=> d!6611 (= (choose!111 lt!14692 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1044) res!23677)))

(declare-fun bs!1644 () Bool)

(assert (= bs!1644 d!6611))

(assert (=> bs!1644 m!31849))

(assert (=> d!6551 d!6611))

(declare-fun d!6613 () Bool)

(declare-fun lt!14818 () (_ BitVec 32))

(assert (=> d!6613 (and (bvsge lt!14818 #b00000000000000000000000000000000) (bvsle lt!14818 (bvsub (size!1355 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25002 () (_ BitVec 32))

(assert (=> d!6613 (= lt!14818 e!25002)))

(declare-fun c!4647 () Bool)

(assert (=> d!6613 (= c!4647 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6613 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1355 lt!14692)))))

(assert (=> d!6613 (= (arrayCountValidKeys!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14818)))

(declare-fun b!39390 () Bool)

(assert (=> b!39390 (= e!25002 #b00000000000000000000000000000000)))

(declare-fun b!39391 () Bool)

(declare-fun e!25003 () (_ BitVec 32))

(assert (=> b!39391 (= e!25002 e!25003)))

(declare-fun c!4648 () Bool)

(assert (=> b!39391 (= c!4648 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2993 () Bool)

(declare-fun call!2996 () (_ BitVec 32))

(assert (=> bm!2993 (= call!2996 (arrayCountValidKeys!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39392 () Bool)

(assert (=> b!39392 (= e!25003 call!2996)))

(declare-fun b!39393 () Bool)

(assert (=> b!39393 (= e!25003 (bvadd #b00000000000000000000000000000001 call!2996))))

(assert (= (and d!6613 c!4647) b!39390))

(assert (= (and d!6613 (not c!4647)) b!39391))

(assert (= (and b!39391 c!4648) b!39393))

(assert (= (and b!39391 (not c!4648)) b!39392))

(assert (= (or b!39393 b!39392) bm!2993))

(assert (=> b!39391 m!32007))

(assert (=> b!39391 m!32007))

(assert (=> b!39391 m!32009))

(declare-fun m!32075 () Bool)

(assert (=> bm!2993 m!32075))

(assert (=> bm!2987 d!6613))

(assert (=> b!39299 d!6589))

(declare-fun bm!3037 () Bool)

(declare-fun call!3044 () Bool)

(declare-fun lt!14952 () ListLongMap!1055)

(declare-fun contains!507 (ListLongMap!1055 (_ BitVec 64)) Bool)

(assert (=> bm!3037 (= call!3044 (contains!507 lt!14952 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39552 () Bool)

(declare-fun e!25104 () Bool)

(declare-fun e!25103 () Bool)

(assert (=> b!39552 (= e!25104 e!25103)))

(declare-fun res!23759 () Bool)

(declare-fun call!3045 () Bool)

(assert (=> b!39552 (= res!23759 call!3045)))

(assert (=> b!39552 (=> (not res!23759) (not e!25103))))

(declare-fun b!39553 () Bool)

(declare-fun e!25106 () Bool)

(assert (=> b!39553 (= e!25106 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39554 () Bool)

(declare-fun e!25108 () ListLongMap!1055)

(declare-fun call!3043 () ListLongMap!1055)

(assert (=> b!39554 (= e!25108 call!3043)))

(declare-fun b!39555 () Bool)

(declare-fun e!25105 () Bool)

(declare-fun apply!53 (ListLongMap!1055 (_ BitVec 64)) V!2089)

(declare-fun get!690 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39555 (= e!25105 (= (apply!53 lt!14952 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) (get!690 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1356 (_values!1777 lt!14691))))))

(assert (=> b!39555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(declare-fun b!39556 () Bool)

(declare-fun e!25115 () Bool)

(assert (=> b!39556 (= e!25115 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun bm!3038 () Bool)

(assert (=> bm!3038 (= call!3045 (contains!507 lt!14952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39557 () Bool)

(declare-fun e!25109 () Unit!965)

(declare-fun Unit!972 () Unit!965)

(assert (=> b!39557 (= e!25109 Unit!972)))

(declare-fun d!6615 () Bool)

(declare-fun e!25110 () Bool)

(assert (=> d!6615 e!25110))

(declare-fun res!23761 () Bool)

(assert (=> d!6615 (=> (not res!23761) (not e!25110))))

(assert (=> d!6615 (= res!23761 (or (bvsge #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))))

(declare-fun lt!14961 () ListLongMap!1055)

(assert (=> d!6615 (= lt!14952 lt!14961)))

(declare-fun lt!14946 () Unit!965)

(assert (=> d!6615 (= lt!14946 e!25109)))

(declare-fun c!4693 () Bool)

(assert (=> d!6615 (= c!4693 e!25106)))

(declare-fun res!23760 () Bool)

(assert (=> d!6615 (=> (not res!23760) (not e!25106))))

(assert (=> d!6615 (= res!23760 (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(declare-fun e!25112 () ListLongMap!1055)

(assert (=> d!6615 (= lt!14961 e!25112)))

(declare-fun c!4694 () Bool)

(assert (=> d!6615 (= c!4694 (and (not (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!6615 (validMask!0 (mask!5141 lt!14691))))

(assert (=> d!6615 (= (getCurrentListMap!307 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)) lt!14952)))

(declare-fun bm!3039 () Bool)

(declare-fun call!3042 () ListLongMap!1055)

(declare-fun call!3041 () ListLongMap!1055)

(assert (=> bm!3039 (= call!3042 call!3041)))

(declare-fun b!39558 () Bool)

(declare-fun e!25114 () Bool)

(assert (=> b!39558 (= e!25114 e!25105)))

(declare-fun res!23766 () Bool)

(assert (=> b!39558 (=> (not res!23766) (not e!25105))))

(assert (=> b!39558 (= res!23766 (contains!507 lt!14952 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(assert (=> b!39558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(declare-fun b!39559 () Bool)

(declare-fun e!25107 () Bool)

(declare-fun e!25111 () Bool)

(assert (=> b!39559 (= e!25107 e!25111)))

(declare-fun res!23762 () Bool)

(assert (=> b!39559 (= res!23762 call!3044)))

(assert (=> b!39559 (=> (not res!23762) (not e!25111))))

(declare-fun b!39560 () Bool)

(assert (=> b!39560 (= e!25111 (= (apply!53 lt!14952 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1712 lt!14691)))))

(declare-fun b!39561 () Bool)

(declare-fun e!25113 () ListLongMap!1055)

(assert (=> b!39561 (= e!25113 call!3043)))

(declare-fun bm!3040 () Bool)

(declare-fun call!3046 () ListLongMap!1055)

(assert (=> bm!3040 (= call!3041 call!3046)))

(declare-fun b!39562 () Bool)

(declare-fun call!3040 () ListLongMap!1055)

(declare-fun +!62 (ListLongMap!1055 tuple2!1478) ListLongMap!1055)

(assert (=> b!39562 (= e!25112 (+!62 call!3040 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))

(declare-fun b!39563 () Bool)

(assert (=> b!39563 (= e!25110 e!25107)))

(declare-fun c!4690 () Bool)

(assert (=> b!39563 (= c!4690 (not (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!39564 () Bool)

(assert (=> b!39564 (= e!25104 (not call!3045))))

(declare-fun b!39565 () Bool)

(assert (=> b!39565 (= e!25112 e!25108)))

(declare-fun c!4691 () Bool)

(assert (=> b!39565 (= c!4691 (and (not (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!39566 () Bool)

(declare-fun lt!14957 () Unit!965)

(assert (=> b!39566 (= e!25109 lt!14957)))

(declare-fun lt!14943 () ListLongMap!1055)

(declare-fun getCurrentListMapNoExtraKeys!31 (array!2579 array!2581 (_ BitVec 32) (_ BitVec 32) V!2089 V!2089 (_ BitVec 32) Int) ListLongMap!1055)

(assert (=> b!39566 (= lt!14943 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)))))

(declare-fun lt!14960 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14954 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14954 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))

(declare-fun lt!14962 () Unit!965)

(declare-fun addStillContains!29 (ListLongMap!1055 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!965)

(assert (=> b!39566 (= lt!14962 (addStillContains!29 lt!14943 lt!14960 (zeroValue!1712 lt!14691) lt!14954))))

(assert (=> b!39566 (contains!507 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))) lt!14954)))

(declare-fun lt!14944 () Unit!965)

(assert (=> b!39566 (= lt!14944 lt!14962)))

(declare-fun lt!14958 () ListLongMap!1055)

(assert (=> b!39566 (= lt!14958 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)))))

(declare-fun lt!14959 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14959 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14956 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14956 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))

(declare-fun lt!14949 () Unit!965)

(declare-fun addApplyDifferent!29 (ListLongMap!1055 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!965)

(assert (=> b!39566 (= lt!14949 (addApplyDifferent!29 lt!14958 lt!14959 (minValue!1712 lt!14691) lt!14956))))

(assert (=> b!39566 (= (apply!53 (+!62 lt!14958 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))) lt!14956) (apply!53 lt!14958 lt!14956))))

(declare-fun lt!14964 () Unit!965)

(assert (=> b!39566 (= lt!14964 lt!14949)))

(declare-fun lt!14953 () ListLongMap!1055)

(assert (=> b!39566 (= lt!14953 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)))))

(declare-fun lt!14963 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14955 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14955 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))

(declare-fun lt!14945 () Unit!965)

(assert (=> b!39566 (= lt!14945 (addApplyDifferent!29 lt!14953 lt!14963 (zeroValue!1712 lt!14691) lt!14955))))

(assert (=> b!39566 (= (apply!53 (+!62 lt!14953 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))) lt!14955) (apply!53 lt!14953 lt!14955))))

(declare-fun lt!14948 () Unit!965)

(assert (=> b!39566 (= lt!14948 lt!14945)))

(declare-fun lt!14947 () ListLongMap!1055)

(assert (=> b!39566 (= lt!14947 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)))))

(declare-fun lt!14950 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14950 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14951 () (_ BitVec 64))

(assert (=> b!39566 (= lt!14951 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))

(assert (=> b!39566 (= lt!14957 (addApplyDifferent!29 lt!14947 lt!14950 (minValue!1712 lt!14691) lt!14951))))

(assert (=> b!39566 (= (apply!53 (+!62 lt!14947 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))) lt!14951) (apply!53 lt!14947 lt!14951))))

(declare-fun bm!3041 () Bool)

(assert (=> bm!3041 (= call!3040 (+!62 (ite c!4694 call!3046 (ite c!4691 call!3041 call!3042)) (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))

(declare-fun b!39567 () Bool)

(assert (=> b!39567 (= e!25103 (= (apply!53 lt!14952 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1712 lt!14691)))))

(declare-fun b!39568 () Bool)

(assert (=> b!39568 (= e!25113 call!3042)))

(declare-fun bm!3042 () Bool)

(assert (=> bm!3042 (= call!3043 call!3040)))

(declare-fun b!39569 () Bool)

(declare-fun res!23764 () Bool)

(assert (=> b!39569 (=> (not res!23764) (not e!25110))))

(assert (=> b!39569 (= res!23764 e!25114)))

(declare-fun res!23767 () Bool)

(assert (=> b!39569 (=> res!23767 e!25114)))

(assert (=> b!39569 (= res!23767 (not e!25115))))

(declare-fun res!23763 () Bool)

(assert (=> b!39569 (=> (not res!23763) (not e!25115))))

(assert (=> b!39569 (= res!23763 (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(declare-fun bm!3043 () Bool)

(assert (=> bm!3043 (= call!3046 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)))))

(declare-fun b!39570 () Bool)

(assert (=> b!39570 (= e!25107 (not call!3044))))

(declare-fun b!39571 () Bool)

(declare-fun c!4689 () Bool)

(assert (=> b!39571 (= c!4689 (and (not (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!39571 (= e!25108 e!25113)))

(declare-fun b!39572 () Bool)

(declare-fun res!23765 () Bool)

(assert (=> b!39572 (=> (not res!23765) (not e!25110))))

(assert (=> b!39572 (= res!23765 e!25104)))

(declare-fun c!4692 () Bool)

(assert (=> b!39572 (= c!4692 (not (= (bvand (extraKeys!1685 lt!14691) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!6615 c!4694) b!39562))

(assert (= (and d!6615 (not c!4694)) b!39565))

(assert (= (and b!39565 c!4691) b!39554))

(assert (= (and b!39565 (not c!4691)) b!39571))

(assert (= (and b!39571 c!4689) b!39561))

(assert (= (and b!39571 (not c!4689)) b!39568))

(assert (= (or b!39561 b!39568) bm!3039))

(assert (= (or b!39554 bm!3039) bm!3040))

(assert (= (or b!39554 b!39561) bm!3042))

(assert (= (or b!39562 bm!3040) bm!3043))

(assert (= (or b!39562 bm!3042) bm!3041))

(assert (= (and d!6615 res!23760) b!39553))

(assert (= (and d!6615 c!4693) b!39566))

(assert (= (and d!6615 (not c!4693)) b!39557))

(assert (= (and d!6615 res!23761) b!39569))

(assert (= (and b!39569 res!23763) b!39556))

(assert (= (and b!39569 (not res!23767)) b!39558))

(assert (= (and b!39558 res!23766) b!39555))

(assert (= (and b!39569 res!23764) b!39572))

(assert (= (and b!39572 c!4692) b!39552))

(assert (= (and b!39572 (not c!4692)) b!39564))

(assert (= (and b!39552 res!23759) b!39567))

(assert (= (or b!39552 b!39564) bm!3038))

(assert (= (and b!39572 res!23765) b!39563))

(assert (= (and b!39563 c!4690) b!39559))

(assert (= (and b!39563 (not c!4690)) b!39570))

(assert (= (and b!39559 res!23762) b!39560))

(assert (= (or b!39559 b!39570) bm!3037))

(declare-fun b_lambda!2035 () Bool)

(assert (=> (not b_lambda!2035) (not b!39555)))

(declare-fun tb!835 () Bool)

(declare-fun t!3900 () Bool)

(assert (=> (and start!5500 (= defaultEntry!470 (defaultEntry!1794 lt!14691)) t!3900) tb!835))

(declare-fun result!1431 () Bool)

(assert (=> tb!835 (= result!1431 tp_is_empty!1747)))

(assert (=> b!39555 t!3900))

(declare-fun b_and!2341 () Bool)

(assert (= b_and!2329 (and (=> t!3900 result!1431) b_and!2341)))

(assert (=> b!39558 m!32019))

(assert (=> b!39558 m!32019))

(declare-fun m!32195 () Bool)

(assert (=> b!39558 m!32195))

(declare-fun m!32197 () Bool)

(assert (=> b!39566 m!32197))

(declare-fun m!32199 () Bool)

(assert (=> b!39566 m!32199))

(declare-fun m!32201 () Bool)

(assert (=> b!39566 m!32201))

(declare-fun m!32203 () Bool)

(assert (=> b!39566 m!32203))

(assert (=> b!39566 m!32019))

(declare-fun m!32205 () Bool)

(assert (=> b!39566 m!32205))

(declare-fun m!32207 () Bool)

(assert (=> b!39566 m!32207))

(declare-fun m!32209 () Bool)

(assert (=> b!39566 m!32209))

(declare-fun m!32211 () Bool)

(assert (=> b!39566 m!32211))

(assert (=> b!39566 m!32197))

(declare-fun m!32213 () Bool)

(assert (=> b!39566 m!32213))

(declare-fun m!32215 () Bool)

(assert (=> b!39566 m!32215))

(declare-fun m!32217 () Bool)

(assert (=> b!39566 m!32217))

(declare-fun m!32219 () Bool)

(assert (=> b!39566 m!32219))

(declare-fun m!32221 () Bool)

(assert (=> b!39566 m!32221))

(declare-fun m!32223 () Bool)

(assert (=> b!39566 m!32223))

(assert (=> b!39566 m!32201))

(assert (=> b!39566 m!32211))

(declare-fun m!32225 () Bool)

(assert (=> b!39566 m!32225))

(declare-fun m!32227 () Bool)

(assert (=> b!39566 m!32227))

(assert (=> b!39566 m!32217))

(declare-fun m!32229 () Bool)

(assert (=> bm!3037 m!32229))

(declare-fun m!32231 () Bool)

(assert (=> b!39555 m!32231))

(assert (=> b!39555 m!32019))

(assert (=> b!39555 m!32231))

(declare-fun m!32233 () Bool)

(assert (=> b!39555 m!32233))

(declare-fun m!32235 () Bool)

(assert (=> b!39555 m!32235))

(assert (=> b!39555 m!32233))

(assert (=> b!39555 m!32019))

(declare-fun m!32237 () Bool)

(assert (=> b!39555 m!32237))

(declare-fun m!32239 () Bool)

(assert (=> bm!3038 m!32239))

(declare-fun m!32241 () Bool)

(assert (=> b!39562 m!32241))

(declare-fun m!32243 () Bool)

(assert (=> b!39567 m!32243))

(declare-fun m!32245 () Bool)

(assert (=> b!39560 m!32245))

(declare-fun m!32247 () Bool)

(assert (=> bm!3041 m!32247))

(assert (=> b!39553 m!32019))

(assert (=> b!39553 m!32019))

(assert (=> b!39553 m!32021))

(assert (=> b!39556 m!32019))

(assert (=> b!39556 m!32019))

(assert (=> b!39556 m!32021))

(assert (=> bm!3043 m!32227))

(assert (=> d!6615 m!32039))

(assert (=> d!6545 d!6615))

(declare-fun d!6653 () Bool)

(declare-fun lt!14968 () (_ BitVec 32))

(assert (=> d!6653 (and (bvsge lt!14968 #b00000000000000000000000000000000) (bvsle lt!14968 (bvsub (size!1355 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun e!25120 () (_ BitVec 32))

(assert (=> d!6653 (= lt!14968 e!25120)))

(declare-fun c!4695 () Bool)

(assert (=> d!6653 (= c!4695 (bvsge #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6653 (and (bvsle #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1355 (_keys!3265 lt!14691)) (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6653 (= (arrayCountValidKeys!0 (_keys!3265 lt!14691) #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))) lt!14968)))

(declare-fun b!39577 () Bool)

(assert (=> b!39577 (= e!25120 #b00000000000000000000000000000000)))

(declare-fun b!39578 () Bool)

(declare-fun e!25121 () (_ BitVec 32))

(assert (=> b!39578 (= e!25120 e!25121)))

(declare-fun c!4696 () Bool)

(assert (=> b!39578 (= c!4696 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun bm!3044 () Bool)

(declare-fun call!3047 () (_ BitVec 32))

(assert (=> bm!3044 (= call!3047 (arrayCountValidKeys!0 (_keys!3265 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))))))

(declare-fun b!39579 () Bool)

(assert (=> b!39579 (= e!25121 call!3047)))

(declare-fun b!39580 () Bool)

(assert (=> b!39580 (= e!25121 (bvadd #b00000000000000000000000000000001 call!3047))))

(assert (= (and d!6653 c!4695) b!39577))

(assert (= (and d!6653 (not c!4695)) b!39578))

(assert (= (and b!39578 c!4696) b!39580))

(assert (= (and b!39578 (not c!4696)) b!39579))

(assert (= (or b!39580 b!39579) bm!3044))

(assert (=> b!39578 m!32019))

(assert (=> b!39578 m!32019))

(assert (=> b!39578 m!32021))

(declare-fun m!32249 () Bool)

(assert (=> bm!3044 m!32249))

(assert (=> b!39178 d!6653))

(push 1)

(assert (not bm!2993))

(assert (not b!39578))

(assert (not bm!3041))

(assert (not b!39566))

(assert (not b!39348))

(assert (not b!39321))

(assert (not b!39391))

(assert (not b_lambda!2027))

(assert (not d!6579))

(assert (not d!6591))

(assert (not d!6615))

(assert (not bm!3038))

(assert (not b!39341))

(assert (not bm!3043))

(assert (not b_next!1357))

(assert (not d!6597))

(assert (not b_lambda!2035))

(assert (not b!39327))

(assert (not d!6581))

(assert (not bm!2992))

(assert (not b!39555))

(assert (not b!39560))

(assert (not b!39316))

(assert (not d!6603))

(assert (not b!39556))

(assert (not b!39328))

(assert (not b!39384))

(assert (not b!39387))

(assert (not b!39386))

(assert (not b!39562))

(assert (not b!39340))

(assert (not b!39567))

(assert (not bm!3037))

(assert (not b!39553))

(assert (not b!39330))

(assert (not bm!2991))

(assert tp_is_empty!1747)

(assert (not bm!2989))

(assert (not b!39378))

(assert (not d!6611))

(assert (not b!39558))

(assert (not b!39389))

(assert b_and!2341)

(assert (not bm!3044))

(assert (not bm!2988))

(assert (not b!39317))

(assert (not b!39320))

(assert (not d!6607))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2341)

(assert (not b_next!1357))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6671 () Bool)

(declare-fun e!25207 () Bool)

(assert (=> d!6671 e!25207))

(declare-fun res!23820 () Bool)

(assert (=> d!6671 (=> res!23820 e!25207)))

(declare-fun lt!15071 () Bool)

(assert (=> d!6671 (= res!23820 (not lt!15071))))

(declare-fun lt!15074 () Bool)

(assert (=> d!6671 (= lt!15071 lt!15074)))

(declare-fun lt!15073 () Unit!965)

(declare-fun e!25206 () Unit!965)

(assert (=> d!6671 (= lt!15073 e!25206)))

(declare-fun c!4739 () Bool)

(assert (=> d!6671 (= c!4739 lt!15074)))

(declare-fun containsKey!66 (List!1046 (_ BitVec 64)) Bool)

(assert (=> d!6671 (= lt!15074 (containsKey!66 (toList!543 lt!14952) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6671 (= (contains!507 lt!14952 #b0000000000000000000000000000000000000000000000000000000000000000) lt!15071)))

(declare-fun b!39713 () Bool)

(declare-fun lt!15072 () Unit!965)

(assert (=> b!39713 (= e!25206 lt!15072)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!54 (List!1046 (_ BitVec 64)) Unit!965)

(assert (=> b!39713 (= lt!15072 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!543 lt!14952) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!104 0))(
  ( (Some!103 (v!1990 V!2089)) (None!102) )
))
(declare-fun isDefined!55 (Option!104) Bool)

(declare-fun getValueByKey!98 (List!1046 (_ BitVec 64)) Option!104)

(assert (=> b!39713 (isDefined!55 (getValueByKey!98 (toList!543 lt!14952) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39714 () Bool)

(declare-fun Unit!974 () Unit!965)

(assert (=> b!39714 (= e!25206 Unit!974)))

(declare-fun b!39715 () Bool)

(assert (=> b!39715 (= e!25207 (isDefined!55 (getValueByKey!98 (toList!543 lt!14952) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6671 c!4739) b!39713))

(assert (= (and d!6671 (not c!4739)) b!39714))

(assert (= (and d!6671 (not res!23820)) b!39715))

(declare-fun m!32359 () Bool)

(assert (=> d!6671 m!32359))

(declare-fun m!32361 () Bool)

(assert (=> b!39713 m!32361))

(declare-fun m!32363 () Bool)

(assert (=> b!39713 m!32363))

(assert (=> b!39713 m!32363))

(declare-fun m!32365 () Bool)

(assert (=> b!39713 m!32365))

(assert (=> b!39715 m!32363))

(assert (=> b!39715 m!32363))

(assert (=> b!39715 m!32365))

(assert (=> bm!3038 d!6671))

(declare-fun d!6673 () Bool)

(assert (=> d!6673 (= (validMask!0 (mask!5141 lt!14691)) (and (or (= (mask!5141 lt!14691) #b00000000000000000000000000000111) (= (mask!5141 lt!14691) #b00000000000000000000000000001111) (= (mask!5141 lt!14691) #b00000000000000000000000000011111) (= (mask!5141 lt!14691) #b00000000000000000000000000111111) (= (mask!5141 lt!14691) #b00000000000000000000000001111111) (= (mask!5141 lt!14691) #b00000000000000000000000011111111) (= (mask!5141 lt!14691) #b00000000000000000000000111111111) (= (mask!5141 lt!14691) #b00000000000000000000001111111111) (= (mask!5141 lt!14691) #b00000000000000000000011111111111) (= (mask!5141 lt!14691) #b00000000000000000000111111111111) (= (mask!5141 lt!14691) #b00000000000000000001111111111111) (= (mask!5141 lt!14691) #b00000000000000000011111111111111) (= (mask!5141 lt!14691) #b00000000000000000111111111111111) (= (mask!5141 lt!14691) #b00000000000000001111111111111111) (= (mask!5141 lt!14691) #b00000000000000011111111111111111) (= (mask!5141 lt!14691) #b00000000000000111111111111111111) (= (mask!5141 lt!14691) #b00000000000001111111111111111111) (= (mask!5141 lt!14691) #b00000000000011111111111111111111) (= (mask!5141 lt!14691) #b00000000000111111111111111111111) (= (mask!5141 lt!14691) #b00000000001111111111111111111111) (= (mask!5141 lt!14691) #b00000000011111111111111111111111) (= (mask!5141 lt!14691) #b00000000111111111111111111111111) (= (mask!5141 lt!14691) #b00000001111111111111111111111111) (= (mask!5141 lt!14691) #b00000011111111111111111111111111) (= (mask!5141 lt!14691) #b00000111111111111111111111111111) (= (mask!5141 lt!14691) #b00001111111111111111111111111111) (= (mask!5141 lt!14691) #b00011111111111111111111111111111) (= (mask!5141 lt!14691) #b00111111111111111111111111111111)) (bvsle (mask!5141 lt!14691) #b00111111111111111111111111111111)))))

(assert (=> d!6615 d!6673))

(declare-fun d!6675 () Bool)

(declare-fun res!23821 () Bool)

(declare-fun e!25209 () Bool)

(assert (=> d!6675 (=> res!23821 e!25209)))

(assert (=> d!6675 (= res!23821 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6675 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3265 lt!14691) (mask!5141 lt!14691)) e!25209)))

(declare-fun bm!3069 () Bool)

(declare-fun call!3072 () Bool)

(assert (=> bm!3069 (= call!3072 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3265 lt!14691) (mask!5141 lt!14691)))))

(declare-fun b!39716 () Bool)

(declare-fun e!25210 () Bool)

(assert (=> b!39716 (= e!25210 call!3072)))

(declare-fun b!39717 () Bool)

(declare-fun e!25208 () Bool)

(assert (=> b!39717 (= e!25208 call!3072)))

(declare-fun b!39718 () Bool)

(assert (=> b!39718 (= e!25209 e!25208)))

(declare-fun c!4740 () Bool)

(assert (=> b!39718 (= c!4740 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39719 () Bool)

(assert (=> b!39719 (= e!25208 e!25210)))

(declare-fun lt!15076 () (_ BitVec 64))

(assert (=> b!39719 (= lt!15076 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15077 () Unit!965)

(assert (=> b!39719 (= lt!15077 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3265 lt!14691) lt!15076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39719 (arrayContainsKey!0 (_keys!3265 lt!14691) lt!15076 #b00000000000000000000000000000000)))

(declare-fun lt!15075 () Unit!965)

(assert (=> b!39719 (= lt!15075 lt!15077)))

(declare-fun res!23822 () Bool)

(assert (=> b!39719 (= res!23822 (= (seekEntryOrOpen!0 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3265 lt!14691) (mask!5141 lt!14691)) (Found!169 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39719 (=> (not res!23822) (not e!25210))))

(assert (= (and d!6675 (not res!23821)) b!39718))

(assert (= (and b!39718 c!4740) b!39719))

(assert (= (and b!39718 (not c!4740)) b!39717))

(assert (= (and b!39719 res!23822) b!39716))

(assert (= (or b!39716 b!39717) bm!3069))

(declare-fun m!32367 () Bool)

(assert (=> bm!3069 m!32367))

(declare-fun m!32369 () Bool)

(assert (=> b!39718 m!32369))

(assert (=> b!39718 m!32369))

(declare-fun m!32371 () Bool)

(assert (=> b!39718 m!32371))

(assert (=> b!39719 m!32369))

(declare-fun m!32373 () Bool)

(assert (=> b!39719 m!32373))

(declare-fun m!32375 () Bool)

(assert (=> b!39719 m!32375))

(assert (=> b!39719 m!32369))

(declare-fun m!32377 () Bool)

(assert (=> b!39719 m!32377))

(assert (=> bm!2989 d!6675))

(declare-fun d!6677 () Bool)

(assert (=> d!6677 (= (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39556 d!6677))

(declare-fun d!6679 () Bool)

(declare-fun get!692 (Option!104) V!2089)

(assert (=> d!6679 (= (apply!53 lt!14952 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) (get!692 (getValueByKey!98 (toList!543 lt!14952) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))))

(declare-fun bs!1651 () Bool)

(assert (= bs!1651 d!6679))

(assert (=> bs!1651 m!32019))

(declare-fun m!32379 () Bool)

(assert (=> bs!1651 m!32379))

(assert (=> bs!1651 m!32379))

(declare-fun m!32381 () Bool)

(assert (=> bs!1651 m!32381))

(assert (=> b!39555 d!6679))

(declare-fun d!6681 () Bool)

(declare-fun c!4743 () Bool)

(assert (=> d!6681 (= c!4743 (is-ValueCellFull!626 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun e!25213 () V!2089)

(assert (=> d!6681 (= (get!690 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000)) e!25213)))

(declare-fun b!39724 () Bool)

(declare-fun get!693 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39724 (= e!25213 (get!693 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39725 () Bool)

(declare-fun get!694 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39725 (= e!25213 (get!694 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6681 c!4743) b!39724))

(assert (= (and d!6681 (not c!4743)) b!39725))

(assert (=> b!39724 m!32231))

(assert (=> b!39724 m!32233))

(declare-fun m!32383 () Bool)

(assert (=> b!39724 m!32383))

(assert (=> b!39725 m!32231))

(assert (=> b!39725 m!32233))

(declare-fun m!32385 () Bool)

(assert (=> b!39725 m!32385))

(assert (=> b!39555 d!6681))

(declare-fun b!39750 () Bool)

(declare-fun e!25234 () Bool)

(assert (=> b!39750 (= e!25234 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(assert (=> b!39750 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!39751 () Bool)

(declare-fun e!25229 () Bool)

(declare-fun e!25231 () Bool)

(assert (=> b!39751 (= e!25229 e!25231)))

(declare-fun c!4753 () Bool)

(assert (=> b!39751 (= c!4753 e!25234)))

(declare-fun res!23831 () Bool)

(assert (=> b!39751 (=> (not res!23831) (not e!25234))))

(assert (=> b!39751 (= res!23831 (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(declare-fun b!39753 () Bool)

(assert (=> b!39753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(assert (=> b!39753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1356 (_values!1777 lt!14691))))))

(declare-fun e!25233 () Bool)

(declare-fun lt!15092 () ListLongMap!1055)

(assert (=> b!39753 (= e!25233 (= (apply!53 lt!15092 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) (get!690 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!39754 () Bool)

(declare-fun lt!15096 () Unit!965)

(declare-fun lt!15098 () Unit!965)

(assert (=> b!39754 (= lt!15096 lt!15098)))

(declare-fun lt!15093 () ListLongMap!1055)

(declare-fun lt!15097 () V!2089)

(declare-fun lt!15094 () (_ BitVec 64))

(declare-fun lt!15095 () (_ BitVec 64))

(assert (=> b!39754 (not (contains!507 (+!62 lt!15093 (tuple2!1479 lt!15095 lt!15097)) lt!15094))))

(declare-fun addStillNotContains!4 (ListLongMap!1055 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!965)

(assert (=> b!39754 (= lt!15098 (addStillNotContains!4 lt!15093 lt!15095 lt!15097 lt!15094))))

(assert (=> b!39754 (= lt!15094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!39754 (= lt!15097 (get!690 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39754 (= lt!15095 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))

(declare-fun call!3075 () ListLongMap!1055)

(assert (=> b!39754 (= lt!15093 call!3075)))

(declare-fun e!25232 () ListLongMap!1055)

(assert (=> b!39754 (= e!25232 (+!62 call!3075 (tuple2!1479 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (get!690 (select (arr!1234 (_values!1777 lt!14691)) #b00000000000000000000000000000000) (dynLambda!187 (defaultEntry!1794 lt!14691) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!39755 () Bool)

(declare-fun e!25230 () Bool)

(assert (=> b!39755 (= e!25230 (= lt!15092 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1794 lt!14691))))))

(declare-fun b!39756 () Bool)

(assert (=> b!39756 (= e!25232 call!3075)))

(declare-fun d!6683 () Bool)

(assert (=> d!6683 e!25229))

(declare-fun res!23832 () Bool)

(assert (=> d!6683 (=> (not res!23832) (not e!25229))))

(assert (=> d!6683 (= res!23832 (not (contains!507 lt!15092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!25228 () ListLongMap!1055)

(assert (=> d!6683 (= lt!15092 e!25228)))

(declare-fun c!4752 () Bool)

(assert (=> d!6683 (= c!4752 (bvsge #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6683 (validMask!0 (mask!5141 lt!14691))))

(assert (=> d!6683 (= (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14691)) lt!15092)))

(declare-fun b!39752 () Bool)

(assert (=> b!39752 (= e!25231 e!25233)))

(assert (=> b!39752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(declare-fun res!23833 () Bool)

(assert (=> b!39752 (= res!23833 (contains!507 lt!15092 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(assert (=> b!39752 (=> (not res!23833) (not e!25233))))

(declare-fun bm!3072 () Bool)

(assert (=> bm!3072 (= call!3075 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14691) (_values!1777 lt!14691) (mask!5141 lt!14691) (extraKeys!1685 lt!14691) (zeroValue!1712 lt!14691) (minValue!1712 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1794 lt!14691)))))

(declare-fun b!39757 () Bool)

(assert (=> b!39757 (= e!25228 e!25232)))

(declare-fun c!4754 () Bool)

(assert (=> b!39757 (= c!4754 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39758 () Bool)

(declare-fun isEmpty!227 (ListLongMap!1055) Bool)

(assert (=> b!39758 (= e!25230 (isEmpty!227 lt!15092))))

(declare-fun b!39759 () Bool)

(assert (=> b!39759 (= e!25228 (ListLongMap!1056 Nil!1043))))

(declare-fun b!39760 () Bool)

(declare-fun res!23834 () Bool)

(assert (=> b!39760 (=> (not res!23834) (not e!25229))))

(assert (=> b!39760 (= res!23834 (not (contains!507 lt!15092 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39761 () Bool)

(assert (=> b!39761 (= e!25231 e!25230)))

(declare-fun c!4755 () Bool)

(assert (=> b!39761 (= c!4755 (bvslt #b00000000000000000000000000000000 (size!1355 (_keys!3265 lt!14691))))))

(assert (= (and d!6683 c!4752) b!39759))

(assert (= (and d!6683 (not c!4752)) b!39757))

(assert (= (and b!39757 c!4754) b!39754))

(assert (= (and b!39757 (not c!4754)) b!39756))

(assert (= (or b!39754 b!39756) bm!3072))

(assert (= (and d!6683 res!23832) b!39760))

(assert (= (and b!39760 res!23834) b!39751))

(assert (= (and b!39751 res!23831) b!39750))

(assert (= (and b!39751 c!4753) b!39752))

(assert (= (and b!39751 (not c!4753)) b!39761))

(assert (= (and b!39752 res!23833) b!39753))

(assert (= (and b!39761 c!4755) b!39755))

(assert (= (and b!39761 (not c!4755)) b!39758))

(declare-fun b_lambda!2039 () Bool)

(assert (=> (not b_lambda!2039) (not b!39753)))

(assert (=> b!39753 t!3900))

(declare-fun b_and!2345 () Bool)

(assert (= b_and!2341 (and (=> t!3900 result!1431) b_and!2345)))

(declare-fun b_lambda!2041 () Bool)

(assert (=> (not b_lambda!2041) (not b!39754)))

(assert (=> b!39754 t!3900))

(declare-fun b_and!2347 () Bool)

(assert (= b_and!2345 (and (=> t!3900 result!1431) b_and!2347)))

(declare-fun m!32387 () Bool)

(assert (=> bm!3072 m!32387))

(assert (=> b!39752 m!32019))

(assert (=> b!39752 m!32019))

(declare-fun m!32389 () Bool)

(assert (=> b!39752 m!32389))

(assert (=> b!39757 m!32019))

(assert (=> b!39757 m!32019))

(assert (=> b!39757 m!32021))

(assert (=> b!39755 m!32387))

(assert (=> b!39753 m!32231))

(assert (=> b!39753 m!32019))

(assert (=> b!39753 m!32019))

(declare-fun m!32391 () Bool)

(assert (=> b!39753 m!32391))

(assert (=> b!39753 m!32231))

(assert (=> b!39753 m!32233))

(assert (=> b!39753 m!32235))

(assert (=> b!39753 m!32233))

(declare-fun m!32393 () Bool)

(assert (=> b!39760 m!32393))

(assert (=> b!39754 m!32019))

(declare-fun m!32395 () Bool)

(assert (=> b!39754 m!32395))

(declare-fun m!32397 () Bool)

(assert (=> b!39754 m!32397))

(declare-fun m!32399 () Bool)

(assert (=> b!39754 m!32399))

(declare-fun m!32401 () Bool)

(assert (=> b!39754 m!32401))

(assert (=> b!39754 m!32231))

(assert (=> b!39754 m!32397))

(assert (=> b!39754 m!32231))

(assert (=> b!39754 m!32233))

(assert (=> b!39754 m!32235))

(assert (=> b!39754 m!32233))

(declare-fun m!32403 () Bool)

(assert (=> d!6683 m!32403))

(assert (=> d!6683 m!32039))

(assert (=> b!39750 m!32019))

(assert (=> b!39750 m!32019))

(assert (=> b!39750 m!32021))

(declare-fun m!32405 () Bool)

(assert (=> b!39758 m!32405))

(assert (=> bm!3043 d!6683))

(assert (=> b!39553 d!6677))

(assert (=> d!6579 d!6559))

(assert (=> d!6591 d!6673))

(declare-fun d!6685 () Bool)

(assert (=> d!6685 (arrayContainsKey!0 lt!14692 lt!14797 #b00000000000000000000000000000000)))

(declare-fun lt!15099 () Unit!965)

(assert (=> d!6685 (= lt!15099 (choose!13 lt!14692 lt!14797 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6685 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14692 lt!14797 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15099)))

(declare-fun bs!1652 () Bool)

(assert (= bs!1652 d!6685))

(assert (=> bs!1652 m!32013))

(declare-fun m!32407 () Bool)

(assert (=> bs!1652 m!32407))

(assert (=> b!39317 d!6685))

(declare-fun d!6687 () Bool)

(declare-fun res!23835 () Bool)

(declare-fun e!25235 () Bool)

(assert (=> d!6687 (=> res!23835 e!25235)))

(assert (=> d!6687 (= res!23835 (= (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14797))))

(assert (=> d!6687 (= (arrayContainsKey!0 lt!14692 lt!14797 #b00000000000000000000000000000000) e!25235)))

(declare-fun b!39762 () Bool)

(declare-fun e!25236 () Bool)

(assert (=> b!39762 (= e!25235 e!25236)))

(declare-fun res!23836 () Bool)

(assert (=> b!39762 (=> (not res!23836) (not e!25236))))

(assert (=> b!39762 (= res!23836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(declare-fun b!39763 () Bool)

(assert (=> b!39763 (= e!25236 (arrayContainsKey!0 lt!14692 lt!14797 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6687 (not res!23835)) b!39762))

(assert (= (and b!39762 res!23836) b!39763))

(assert (=> d!6687 m!31943))

(declare-fun m!32409 () Bool)

(assert (=> b!39763 m!32409))

(assert (=> b!39317 d!6687))

(declare-fun b!39764 () Bool)

(declare-fun e!25239 () SeekEntryResult!169)

(declare-fun e!25237 () SeekEntryResult!169)

(assert (=> b!39764 (= e!25239 e!25237)))

(declare-fun lt!15102 () (_ BitVec 64))

(declare-fun lt!15100 () SeekEntryResult!169)

(assert (=> b!39764 (= lt!15102 (select (arr!1233 lt!14692) (index!2800 lt!15100)))))

(declare-fun c!4757 () Bool)

(assert (=> b!39764 (= c!4757 (= lt!15102 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39765 () Bool)

(declare-fun c!4756 () Bool)

(assert (=> b!39765 (= c!4756 (= lt!15102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25238 () SeekEntryResult!169)

(assert (=> b!39765 (= e!25237 e!25238)))

(declare-fun b!39766 () Bool)

(assert (=> b!39766 (= e!25238 (MissingZero!169 (index!2800 lt!15100)))))

(declare-fun b!39767 () Bool)

(assert (=> b!39767 (= e!25239 Undefined!169)))

(declare-fun d!6689 () Bool)

(declare-fun lt!15101 () SeekEntryResult!169)

(assert (=> d!6689 (and (or (is-Undefined!169 lt!15101) (not (is-Found!169 lt!15101)) (and (bvsge (index!2799 lt!15101) #b00000000000000000000000000000000) (bvslt (index!2799 lt!15101) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!15101) (is-Found!169 lt!15101) (not (is-MissingZero!169 lt!15101)) (and (bvsge (index!2798 lt!15101) #b00000000000000000000000000000000) (bvslt (index!2798 lt!15101) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!15101) (is-Found!169 lt!15101) (is-MissingZero!169 lt!15101) (not (is-MissingVacant!169 lt!15101)) (and (bvsge (index!2801 lt!15101) #b00000000000000000000000000000000) (bvslt (index!2801 lt!15101) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!15101) (ite (is-Found!169 lt!15101) (= (select (arr!1233 lt!14692) (index!2799 lt!15101)) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!169 lt!15101) (= (select (arr!1233 lt!14692) (index!2798 lt!15101)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!169 lt!15101) (= (select (arr!1233 lt!14692) (index!2801 lt!15101)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6689 (= lt!15101 e!25239)))

(declare-fun c!4758 () Bool)

(assert (=> d!6689 (= c!4758 (and (is-Intermediate!169 lt!15100) (undefined!981 lt!15100)))))

(assert (=> d!6689 (= lt!15100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14692 mask!853))))

(assert (=> d!6689 (validMask!0 mask!853)))

(assert (=> d!6689 (= (seekEntryOrOpen!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14692 mask!853) lt!15101)))

(declare-fun b!39768 () Bool)

(assert (=> b!39768 (= e!25237 (Found!169 (index!2800 lt!15100)))))

(declare-fun b!39769 () Bool)

(assert (=> b!39769 (= e!25238 (seekKeyOrZeroReturnVacant!0 (x!7655 lt!15100) (index!2800 lt!15100) (index!2800 lt!15100) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14692 mask!853))))

(assert (= (and d!6689 c!4758) b!39767))

(assert (= (and d!6689 (not c!4758)) b!39764))

(assert (= (and b!39764 c!4757) b!39768))

(assert (= (and b!39764 (not c!4757)) b!39765))

(assert (= (and b!39765 c!4756) b!39766))

(assert (= (and b!39765 (not c!4756)) b!39769))

(declare-fun m!32411 () Bool)

(assert (=> b!39764 m!32411))

(declare-fun m!32413 () Bool)

(assert (=> d!6689 m!32413))

(assert (=> d!6689 m!32007))

(declare-fun m!32415 () Bool)

(assert (=> d!6689 m!32415))

(assert (=> d!6689 m!32007))

(assert (=> d!6689 m!32413))

(declare-fun m!32417 () Bool)

(assert (=> d!6689 m!32417))

(declare-fun m!32419 () Bool)

(assert (=> d!6689 m!32419))

(declare-fun m!32421 () Bool)

(assert (=> d!6689 m!32421))

(assert (=> d!6689 m!31843))

(assert (=> b!39769 m!32007))

(declare-fun m!32423 () Bool)

(assert (=> b!39769 m!32423))

(assert (=> b!39317 d!6689))

(declare-fun d!6691 () Bool)

(declare-fun e!25241 () Bool)

(assert (=> d!6691 e!25241))

(declare-fun res!23837 () Bool)

(assert (=> d!6691 (=> res!23837 e!25241)))

(declare-fun lt!15103 () Bool)

(assert (=> d!6691 (= res!23837 (not lt!15103))))

(declare-fun lt!15106 () Bool)

(assert (=> d!6691 (= lt!15103 lt!15106)))

(declare-fun lt!15105 () Unit!965)

(declare-fun e!25240 () Unit!965)

(assert (=> d!6691 (= lt!15105 e!25240)))

(declare-fun c!4759 () Bool)

(assert (=> d!6691 (= c!4759 lt!15106)))

(assert (=> d!6691 (= lt!15106 (containsKey!66 (toList!543 lt!14952) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6691 (= (contains!507 lt!14952 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15103)))

(declare-fun b!39770 () Bool)

(declare-fun lt!15104 () Unit!965)

(assert (=> b!39770 (= e!25240 lt!15104)))

(assert (=> b!39770 (= lt!15104 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!543 lt!14952) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39770 (isDefined!55 (getValueByKey!98 (toList!543 lt!14952) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39771 () Bool)

(declare-fun Unit!975 () Unit!965)

(assert (=> b!39771 (= e!25240 Unit!975)))

(declare-fun b!39772 () Bool)

(assert (=> b!39772 (= e!25241 (isDefined!55 (getValueByKey!98 (toList!543 lt!14952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6691 c!4759) b!39770))

(assert (= (and d!6691 (not c!4759)) b!39771))

(assert (= (and d!6691 (not res!23837)) b!39772))

(declare-fun m!32425 () Bool)

(assert (=> d!6691 m!32425))

(declare-fun m!32427 () Bool)

(assert (=> b!39770 m!32427))

(declare-fun m!32429 () Bool)

(assert (=> b!39770 m!32429))

(assert (=> b!39770 m!32429))

(declare-fun m!32431 () Bool)

(assert (=> b!39770 m!32431))

(assert (=> b!39772 m!32429))

(assert (=> b!39772 m!32429))

(assert (=> b!39772 m!32431))

(assert (=> bm!3037 d!6691))

(assert (=> d!6611 d!6555))

(declare-fun d!6693 () Bool)

(assert (=> d!6693 (= (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39316 d!6693))

(declare-fun d!6695 () Bool)

(declare-fun lt!15107 () (_ BitVec 32))

(assert (=> d!6695 (and (bvsge lt!15107 #b00000000000000000000000000000000) (bvsle lt!15107 (bvsub (size!1355 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun e!25242 () (_ BitVec 32))

(assert (=> d!6695 (= lt!15107 e!25242)))

(declare-fun c!4760 () Bool)

(assert (=> d!6695 (= c!4760 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6695 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1355 lt!14692)))))

(assert (=> d!6695 (= (arrayCountValidKeys!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15107)))

(declare-fun b!39773 () Bool)

(assert (=> b!39773 (= e!25242 #b00000000000000000000000000000000)))

(declare-fun b!39774 () Bool)

(declare-fun e!25243 () (_ BitVec 32))

(assert (=> b!39774 (= e!25242 e!25243)))

(declare-fun c!4761 () Bool)

(assert (=> b!39774 (= c!4761 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3073 () Bool)

(declare-fun call!3076 () (_ BitVec 32))

(assert (=> bm!3073 (= call!3076 (arrayCountValidKeys!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39775 () Bool)

(assert (=> b!39775 (= e!25243 call!3076)))

(declare-fun b!39776 () Bool)

(assert (=> b!39776 (= e!25243 (bvadd #b00000000000000000000000000000001 call!3076))))

(assert (= (and d!6695 c!4760) b!39773))

(assert (= (and d!6695 (not c!4760)) b!39774))

(assert (= (and b!39774 c!4761) b!39776))

(assert (= (and b!39774 (not c!4761)) b!39775))

(assert (= (or b!39776 b!39775) bm!3073))

(declare-fun m!32433 () Bool)

(assert (=> b!39774 m!32433))

(assert (=> b!39774 m!32433))

(declare-fun m!32435 () Bool)

(assert (=> b!39774 m!32435))

(declare-fun m!32437 () Bool)

(assert (=> bm!3073 m!32437))

(assert (=> bm!2993 d!6695))

(declare-fun d!6697 () Bool)

(assert (=> d!6697 (= (apply!53 lt!14952 #b0000000000000000000000000000000000000000000000000000000000000000) (get!692 (getValueByKey!98 (toList!543 lt!14952) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1653 () Bool)

(assert (= bs!1653 d!6697))

(assert (=> bs!1653 m!32363))

(assert (=> bs!1653 m!32363))

(declare-fun m!32439 () Bool)

(assert (=> bs!1653 m!32439))

(assert (=> b!39567 d!6697))

(assert (=> b!39391 d!6693))

(declare-fun d!6699 () Bool)

(declare-fun e!25246 () Bool)

(assert (=> d!6699 e!25246))

(declare-fun res!23843 () Bool)

(assert (=> d!6699 (=> (not res!23843) (not e!25246))))

(declare-fun lt!15117 () ListLongMap!1055)

(assert (=> d!6699 (= res!23843 (contains!507 lt!15117 (_1!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))))

(declare-fun lt!15118 () List!1046)

(assert (=> d!6699 (= lt!15117 (ListLongMap!1056 lt!15118))))

(declare-fun lt!15116 () Unit!965)

(declare-fun lt!15119 () Unit!965)

(assert (=> d!6699 (= lt!15116 lt!15119)))

(assert (=> d!6699 (= (getValueByKey!98 lt!15118 (_1!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))) (Some!103 (_2!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!23 (List!1046 (_ BitVec 64) V!2089) Unit!965)

(assert (=> d!6699 (= lt!15119 (lemmaContainsTupThenGetReturnValue!23 lt!15118 (_1!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))) (_2!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))))

(declare-fun insertStrictlySorted!20 (List!1046 (_ BitVec 64) V!2089) List!1046)

(assert (=> d!6699 (= lt!15118 (insertStrictlySorted!20 (toList!543 (ite c!4694 call!3046 (ite c!4691 call!3041 call!3042))) (_1!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))) (_2!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))))

(assert (=> d!6699 (= (+!62 (ite c!4694 call!3046 (ite c!4691 call!3041 call!3042)) (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))) lt!15117)))

(declare-fun b!39781 () Bool)

(declare-fun res!23842 () Bool)

(assert (=> b!39781 (=> (not res!23842) (not e!25246))))

(assert (=> b!39781 (= res!23842 (= (getValueByKey!98 (toList!543 lt!15117) (_1!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))) (Some!103 (_2!750 (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))))

(declare-fun b!39782 () Bool)

(declare-fun contains!509 (List!1046 tuple2!1478) Bool)

(assert (=> b!39782 (= e!25246 (contains!509 (toList!543 lt!15117) (ite (or c!4694 c!4691) (tuple2!1479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14691)) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))

(assert (= (and d!6699 res!23843) b!39781))

(assert (= (and b!39781 res!23842) b!39782))

(declare-fun m!32441 () Bool)

(assert (=> d!6699 m!32441))

(declare-fun m!32443 () Bool)

(assert (=> d!6699 m!32443))

(declare-fun m!32445 () Bool)

(assert (=> d!6699 m!32445))

(declare-fun m!32447 () Bool)

(assert (=> d!6699 m!32447))

(declare-fun m!32449 () Bool)

(assert (=> b!39781 m!32449))

(declare-fun m!32451 () Bool)

(assert (=> b!39782 m!32451))

(assert (=> bm!3041 d!6699))

(declare-fun d!6701 () Bool)

(declare-fun res!23844 () Bool)

(declare-fun e!25248 () Bool)

(assert (=> d!6701 (=> res!23844 e!25248)))

(assert (=> d!6701 (= res!23844 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(assert (=> d!6701 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14692 mask!853) e!25248)))

(declare-fun bm!3074 () Bool)

(declare-fun call!3077 () Bool)

(assert (=> bm!3074 (= call!3077 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14692 mask!853))))

(declare-fun b!39783 () Bool)

(declare-fun e!25249 () Bool)

(assert (=> b!39783 (= e!25249 call!3077)))

(declare-fun b!39784 () Bool)

(declare-fun e!25247 () Bool)

(assert (=> b!39784 (= e!25247 call!3077)))

(declare-fun b!39785 () Bool)

(assert (=> b!39785 (= e!25248 e!25247)))

(declare-fun c!4762 () Bool)

(assert (=> b!39785 (= c!4762 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39786 () Bool)

(assert (=> b!39786 (= e!25247 e!25249)))

(declare-fun lt!15121 () (_ BitVec 64))

(assert (=> b!39786 (= lt!15121 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15122 () Unit!965)

(assert (=> b!39786 (= lt!15122 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14692 lt!15121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!39786 (arrayContainsKey!0 lt!14692 lt!15121 #b00000000000000000000000000000000)))

(declare-fun lt!15120 () Unit!965)

(assert (=> b!39786 (= lt!15120 lt!15122)))

(declare-fun res!23845 () Bool)

(assert (=> b!39786 (= res!23845 (= (seekEntryOrOpen!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14692 mask!853) (Found!169 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!39786 (=> (not res!23845) (not e!25249))))

(assert (= (and d!6701 (not res!23844)) b!39785))

(assert (= (and b!39785 c!4762) b!39786))

(assert (= (and b!39785 (not c!4762)) b!39784))

(assert (= (and b!39786 res!23845) b!39783))

(assert (= (or b!39783 b!39784) bm!3074))

(declare-fun m!32453 () Bool)

(assert (=> bm!3074 m!32453))

(assert (=> b!39785 m!32433))

(assert (=> b!39785 m!32433))

(assert (=> b!39785 m!32435))

(assert (=> b!39786 m!32433))

(declare-fun m!32455 () Bool)

(assert (=> b!39786 m!32455))

(declare-fun m!32457 () Bool)

(assert (=> b!39786 m!32457))

(assert (=> b!39786 m!32433))

(declare-fun m!32459 () Bool)

(assert (=> b!39786 m!32459))

(assert (=> bm!2988 d!6701))

(declare-fun d!6703 () Bool)

(assert (=> d!6703 (= (apply!53 lt!14947 lt!14951) (get!692 (getValueByKey!98 (toList!543 lt!14947) lt!14951)))))

(declare-fun bs!1654 () Bool)

(assert (= bs!1654 d!6703))

(declare-fun m!32461 () Bool)

(assert (=> bs!1654 m!32461))

(assert (=> bs!1654 m!32461))

(declare-fun m!32463 () Bool)

(assert (=> bs!1654 m!32463))

(assert (=> b!39566 d!6703))

(declare-fun d!6705 () Bool)

(assert (=> d!6705 (= (apply!53 (+!62 lt!14953 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))) lt!14955) (get!692 (getValueByKey!98 (toList!543 (+!62 lt!14953 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))) lt!14955)))))

(declare-fun bs!1655 () Bool)

(assert (= bs!1655 d!6705))

(declare-fun m!32465 () Bool)

(assert (=> bs!1655 m!32465))

(assert (=> bs!1655 m!32465))

(declare-fun m!32467 () Bool)

(assert (=> bs!1655 m!32467))

(assert (=> b!39566 d!6705))

(declare-fun d!6707 () Bool)

(assert (=> d!6707 (contains!507 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))) lt!14954)))

(declare-fun lt!15125 () Unit!965)

(declare-fun choose!242 (ListLongMap!1055 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!965)

(assert (=> d!6707 (= lt!15125 (choose!242 lt!14943 lt!14960 (zeroValue!1712 lt!14691) lt!14954))))

(assert (=> d!6707 (contains!507 lt!14943 lt!14954)))

(assert (=> d!6707 (= (addStillContains!29 lt!14943 lt!14960 (zeroValue!1712 lt!14691) lt!14954) lt!15125)))

(declare-fun bs!1656 () Bool)

(assert (= bs!1656 d!6707))

(assert (=> bs!1656 m!32201))

(assert (=> bs!1656 m!32201))

(assert (=> bs!1656 m!32203))

(declare-fun m!32469 () Bool)

(assert (=> bs!1656 m!32469))

(declare-fun m!32471 () Bool)

(assert (=> bs!1656 m!32471))

(assert (=> b!39566 d!6707))

(declare-fun d!6709 () Bool)

(assert (=> d!6709 (= (apply!53 (+!62 lt!14958 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))) lt!14956) (apply!53 lt!14958 lt!14956))))

(declare-fun lt!15128 () Unit!965)

(declare-fun choose!243 (ListLongMap!1055 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!965)

(assert (=> d!6709 (= lt!15128 (choose!243 lt!14958 lt!14959 (minValue!1712 lt!14691) lt!14956))))

(declare-fun e!25252 () Bool)

(assert (=> d!6709 e!25252))

(declare-fun res!23848 () Bool)

(assert (=> d!6709 (=> (not res!23848) (not e!25252))))

(assert (=> d!6709 (= res!23848 (contains!507 lt!14958 lt!14956))))

(assert (=> d!6709 (= (addApplyDifferent!29 lt!14958 lt!14959 (minValue!1712 lt!14691) lt!14956) lt!15128)))

(declare-fun b!39791 () Bool)

(assert (=> b!39791 (= e!25252 (not (= lt!14956 lt!14959)))))

(assert (= (and d!6709 res!23848) b!39791))

(assert (=> d!6709 m!32197))

(assert (=> d!6709 m!32213))

(assert (=> d!6709 m!32197))

(declare-fun m!32473 () Bool)

(assert (=> d!6709 m!32473))

(assert (=> d!6709 m!32199))

(declare-fun m!32475 () Bool)

(assert (=> d!6709 m!32475))

(assert (=> b!39566 d!6709))

(declare-fun d!6711 () Bool)

(assert (=> d!6711 (= (apply!53 lt!14958 lt!14956) (get!692 (getValueByKey!98 (toList!543 lt!14958) lt!14956)))))

(declare-fun bs!1657 () Bool)

(assert (= bs!1657 d!6711))

(declare-fun m!32477 () Bool)

(assert (=> bs!1657 m!32477))

(assert (=> bs!1657 m!32477))

(declare-fun m!32479 () Bool)

(assert (=> bs!1657 m!32479))

(assert (=> b!39566 d!6711))

(declare-fun d!6713 () Bool)

(assert (=> d!6713 (= (apply!53 (+!62 lt!14958 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))) lt!14956) (get!692 (getValueByKey!98 (toList!543 (+!62 lt!14958 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))) lt!14956)))))

(declare-fun bs!1658 () Bool)

(assert (= bs!1658 d!6713))

(declare-fun m!32481 () Bool)

(assert (=> bs!1658 m!32481))

(assert (=> bs!1658 m!32481))

(declare-fun m!32483 () Bool)

(assert (=> bs!1658 m!32483))

(assert (=> b!39566 d!6713))

(declare-fun d!6715 () Bool)

(assert (=> d!6715 (= (apply!53 (+!62 lt!14947 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))) lt!14951) (get!692 (getValueByKey!98 (toList!543 (+!62 lt!14947 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))) lt!14951)))))

(declare-fun bs!1659 () Bool)

(assert (= bs!1659 d!6715))

(declare-fun m!32485 () Bool)

(assert (=> bs!1659 m!32485))

(assert (=> bs!1659 m!32485))

(declare-fun m!32487 () Bool)

(assert (=> bs!1659 m!32487))

(assert (=> b!39566 d!6715))

(declare-fun d!6717 () Bool)

(declare-fun e!25253 () Bool)

(assert (=> d!6717 e!25253))

(declare-fun res!23850 () Bool)

(assert (=> d!6717 (=> (not res!23850) (not e!25253))))

(declare-fun lt!15130 () ListLongMap!1055)

(assert (=> d!6717 (= res!23850 (contains!507 lt!15130 (_1!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))))))

(declare-fun lt!15131 () List!1046)

(assert (=> d!6717 (= lt!15130 (ListLongMap!1056 lt!15131))))

(declare-fun lt!15129 () Unit!965)

(declare-fun lt!15132 () Unit!965)

(assert (=> d!6717 (= lt!15129 lt!15132)))

(assert (=> d!6717 (= (getValueByKey!98 lt!15131 (_1!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))))))

(assert (=> d!6717 (= lt!15132 (lemmaContainsTupThenGetReturnValue!23 lt!15131 (_1!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))))))

(assert (=> d!6717 (= lt!15131 (insertStrictlySorted!20 (toList!543 lt!14943) (_1!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))))))

(assert (=> d!6717 (= (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))) lt!15130)))

(declare-fun b!39792 () Bool)

(declare-fun res!23849 () Bool)

(assert (=> b!39792 (=> (not res!23849) (not e!25253))))

(assert (=> b!39792 (= res!23849 (= (getValueByKey!98 (toList!543 lt!15130) (_1!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))))))))

(declare-fun b!39793 () Bool)

(assert (=> b!39793 (= e!25253 (contains!509 (toList!543 lt!15130) (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))))))

(assert (= (and d!6717 res!23850) b!39792))

(assert (= (and b!39792 res!23849) b!39793))

(declare-fun m!32489 () Bool)

(assert (=> d!6717 m!32489))

(declare-fun m!32491 () Bool)

(assert (=> d!6717 m!32491))

(declare-fun m!32493 () Bool)

(assert (=> d!6717 m!32493))

(declare-fun m!32495 () Bool)

(assert (=> d!6717 m!32495))

(declare-fun m!32497 () Bool)

(assert (=> b!39792 m!32497))

(declare-fun m!32499 () Bool)

(assert (=> b!39793 m!32499))

(assert (=> b!39566 d!6717))

(declare-fun d!6719 () Bool)

(declare-fun e!25254 () Bool)

(assert (=> d!6719 e!25254))

(declare-fun res!23852 () Bool)

(assert (=> d!6719 (=> (not res!23852) (not e!25254))))

(declare-fun lt!15134 () ListLongMap!1055)

(assert (=> d!6719 (= res!23852 (contains!507 lt!15134 (_1!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))))))

(declare-fun lt!15135 () List!1046)

(assert (=> d!6719 (= lt!15134 (ListLongMap!1056 lt!15135))))

(declare-fun lt!15133 () Unit!965)

(declare-fun lt!15136 () Unit!965)

(assert (=> d!6719 (= lt!15133 lt!15136)))

(assert (=> d!6719 (= (getValueByKey!98 lt!15135 (_1!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))))))

(assert (=> d!6719 (= lt!15136 (lemmaContainsTupThenGetReturnValue!23 lt!15135 (_1!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))))))

(assert (=> d!6719 (= lt!15135 (insertStrictlySorted!20 (toList!543 lt!14947) (_1!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))))))

(assert (=> d!6719 (= (+!62 lt!14947 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))) lt!15134)))

(declare-fun b!39794 () Bool)

(declare-fun res!23851 () Bool)

(assert (=> b!39794 (=> (not res!23851) (not e!25254))))

(assert (=> b!39794 (= res!23851 (= (getValueByKey!98 (toList!543 lt!15134) (_1!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))))))))

(declare-fun b!39795 () Bool)

(assert (=> b!39795 (= e!25254 (contains!509 (toList!543 lt!15134) (tuple2!1479 lt!14950 (minValue!1712 lt!14691))))))

(assert (= (and d!6719 res!23852) b!39794))

(assert (= (and b!39794 res!23851) b!39795))

(declare-fun m!32501 () Bool)

(assert (=> d!6719 m!32501))

(declare-fun m!32503 () Bool)

(assert (=> d!6719 m!32503))

(declare-fun m!32505 () Bool)

(assert (=> d!6719 m!32505))

(declare-fun m!32507 () Bool)

(assert (=> d!6719 m!32507))

(declare-fun m!32509 () Bool)

(assert (=> b!39794 m!32509))

(declare-fun m!32511 () Bool)

(assert (=> b!39795 m!32511))

(assert (=> b!39566 d!6719))

(declare-fun d!6721 () Bool)

(assert (=> d!6721 (= (apply!53 lt!14953 lt!14955) (get!692 (getValueByKey!98 (toList!543 lt!14953) lt!14955)))))

(declare-fun bs!1660 () Bool)

(assert (= bs!1660 d!6721))

(declare-fun m!32513 () Bool)

(assert (=> bs!1660 m!32513))

(assert (=> bs!1660 m!32513))

(declare-fun m!32515 () Bool)

(assert (=> bs!1660 m!32515))

(assert (=> b!39566 d!6721))

(declare-fun d!6723 () Bool)

(assert (=> d!6723 (= (apply!53 (+!62 lt!14947 (tuple2!1479 lt!14950 (minValue!1712 lt!14691))) lt!14951) (apply!53 lt!14947 lt!14951))))

(declare-fun lt!15137 () Unit!965)

(assert (=> d!6723 (= lt!15137 (choose!243 lt!14947 lt!14950 (minValue!1712 lt!14691) lt!14951))))

(declare-fun e!25255 () Bool)

(assert (=> d!6723 e!25255))

(declare-fun res!23853 () Bool)

(assert (=> d!6723 (=> (not res!23853) (not e!25255))))

(assert (=> d!6723 (= res!23853 (contains!507 lt!14947 lt!14951))))

(assert (=> d!6723 (= (addApplyDifferent!29 lt!14947 lt!14950 (minValue!1712 lt!14691) lt!14951) lt!15137)))

(declare-fun b!39796 () Bool)

(assert (=> b!39796 (= e!25255 (not (= lt!14951 lt!14950)))))

(assert (= (and d!6723 res!23853) b!39796))

(assert (=> d!6723 m!32211))

(assert (=> d!6723 m!32225))

(assert (=> d!6723 m!32211))

(declare-fun m!32517 () Bool)

(assert (=> d!6723 m!32517))

(assert (=> d!6723 m!32221))

(declare-fun m!32519 () Bool)

(assert (=> d!6723 m!32519))

(assert (=> b!39566 d!6723))

(declare-fun d!6725 () Bool)

(declare-fun e!25256 () Bool)

(assert (=> d!6725 e!25256))

(declare-fun res!23855 () Bool)

(assert (=> d!6725 (=> (not res!23855) (not e!25256))))

(declare-fun lt!15139 () ListLongMap!1055)

(assert (=> d!6725 (= res!23855 (contains!507 lt!15139 (_1!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))))))

(declare-fun lt!15140 () List!1046)

(assert (=> d!6725 (= lt!15139 (ListLongMap!1056 lt!15140))))

(declare-fun lt!15138 () Unit!965)

(declare-fun lt!15141 () Unit!965)

(assert (=> d!6725 (= lt!15138 lt!15141)))

(assert (=> d!6725 (= (getValueByKey!98 lt!15140 (_1!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))))))

(assert (=> d!6725 (= lt!15141 (lemmaContainsTupThenGetReturnValue!23 lt!15140 (_1!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))))))

(assert (=> d!6725 (= lt!15140 (insertStrictlySorted!20 (toList!543 lt!14958) (_1!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))))))

(assert (=> d!6725 (= (+!62 lt!14958 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))) lt!15139)))

(declare-fun b!39797 () Bool)

(declare-fun res!23854 () Bool)

(assert (=> b!39797 (=> (not res!23854) (not e!25256))))

(assert (=> b!39797 (= res!23854 (= (getValueByKey!98 (toList!543 lt!15139) (_1!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14959 (minValue!1712 lt!14691))))))))

(declare-fun b!39798 () Bool)

(assert (=> b!39798 (= e!25256 (contains!509 (toList!543 lt!15139) (tuple2!1479 lt!14959 (minValue!1712 lt!14691))))))

(assert (= (and d!6725 res!23855) b!39797))

(assert (= (and b!39797 res!23854) b!39798))

(declare-fun m!32521 () Bool)

(assert (=> d!6725 m!32521))

(declare-fun m!32523 () Bool)

(assert (=> d!6725 m!32523))

(declare-fun m!32525 () Bool)

(assert (=> d!6725 m!32525))

(declare-fun m!32527 () Bool)

(assert (=> d!6725 m!32527))

(declare-fun m!32529 () Bool)

(assert (=> b!39797 m!32529))

(declare-fun m!32531 () Bool)

(assert (=> b!39798 m!32531))

(assert (=> b!39566 d!6725))

(declare-fun d!6727 () Bool)

(declare-fun e!25257 () Bool)

(assert (=> d!6727 e!25257))

(declare-fun res!23857 () Bool)

(assert (=> d!6727 (=> (not res!23857) (not e!25257))))

(declare-fun lt!15143 () ListLongMap!1055)

(assert (=> d!6727 (= res!23857 (contains!507 lt!15143 (_1!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))))))

(declare-fun lt!15144 () List!1046)

(assert (=> d!6727 (= lt!15143 (ListLongMap!1056 lt!15144))))

(declare-fun lt!15142 () Unit!965)

(declare-fun lt!15145 () Unit!965)

(assert (=> d!6727 (= lt!15142 lt!15145)))

(assert (=> d!6727 (= (getValueByKey!98 lt!15144 (_1!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))))))

(assert (=> d!6727 (= lt!15145 (lemmaContainsTupThenGetReturnValue!23 lt!15144 (_1!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))))))

(assert (=> d!6727 (= lt!15144 (insertStrictlySorted!20 (toList!543 lt!14953) (_1!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))) (_2!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))))))

(assert (=> d!6727 (= (+!62 lt!14953 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))) lt!15143)))

(declare-fun b!39799 () Bool)

(declare-fun res!23856 () Bool)

(assert (=> b!39799 (=> (not res!23856) (not e!25257))))

(assert (=> b!39799 (= res!23856 (= (getValueByKey!98 (toList!543 lt!15143) (_1!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))))))))

(declare-fun b!39800 () Bool)

(assert (=> b!39800 (= e!25257 (contains!509 (toList!543 lt!15143) (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))))))

(assert (= (and d!6727 res!23857) b!39799))

(assert (= (and b!39799 res!23856) b!39800))

(declare-fun m!32533 () Bool)

(assert (=> d!6727 m!32533))

(declare-fun m!32535 () Bool)

(assert (=> d!6727 m!32535))

(declare-fun m!32537 () Bool)

(assert (=> d!6727 m!32537))

(declare-fun m!32539 () Bool)

(assert (=> d!6727 m!32539))

(declare-fun m!32541 () Bool)

(assert (=> b!39799 m!32541))

(declare-fun m!32543 () Bool)

(assert (=> b!39800 m!32543))

(assert (=> b!39566 d!6727))

(declare-fun d!6729 () Bool)

(declare-fun e!25259 () Bool)

(assert (=> d!6729 e!25259))

(declare-fun res!23858 () Bool)

(assert (=> d!6729 (=> res!23858 e!25259)))

(declare-fun lt!15146 () Bool)

(assert (=> d!6729 (= res!23858 (not lt!15146))))

(declare-fun lt!15149 () Bool)

(assert (=> d!6729 (= lt!15146 lt!15149)))

(declare-fun lt!15148 () Unit!965)

(declare-fun e!25258 () Unit!965)

(assert (=> d!6729 (= lt!15148 e!25258)))

(declare-fun c!4763 () Bool)

(assert (=> d!6729 (= c!4763 lt!15149)))

(assert (=> d!6729 (= lt!15149 (containsKey!66 (toList!543 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))) lt!14954))))

(assert (=> d!6729 (= (contains!507 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691))) lt!14954) lt!15146)))

(declare-fun b!39801 () Bool)

(declare-fun lt!15147 () Unit!965)

(assert (=> b!39801 (= e!25258 lt!15147)))

(assert (=> b!39801 (= lt!15147 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!543 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))) lt!14954))))

(assert (=> b!39801 (isDefined!55 (getValueByKey!98 (toList!543 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))) lt!14954))))

(declare-fun b!39802 () Bool)

(declare-fun Unit!976 () Unit!965)

(assert (=> b!39802 (= e!25258 Unit!976)))

(declare-fun b!39803 () Bool)

(assert (=> b!39803 (= e!25259 (isDefined!55 (getValueByKey!98 (toList!543 (+!62 lt!14943 (tuple2!1479 lt!14960 (zeroValue!1712 lt!14691)))) lt!14954)))))

(assert (= (and d!6729 c!4763) b!39801))

(assert (= (and d!6729 (not c!4763)) b!39802))

(assert (= (and d!6729 (not res!23858)) b!39803))

(declare-fun m!32545 () Bool)

(assert (=> d!6729 m!32545))

(declare-fun m!32547 () Bool)

(assert (=> b!39801 m!32547))

(declare-fun m!32549 () Bool)

(assert (=> b!39801 m!32549))

(assert (=> b!39801 m!32549))

(declare-fun m!32551 () Bool)

(assert (=> b!39801 m!32551))

(assert (=> b!39803 m!32549))

(assert (=> b!39803 m!32549))

(assert (=> b!39803 m!32551))

(assert (=> b!39566 d!6729))

(declare-fun d!6731 () Bool)

(assert (=> d!6731 (= (apply!53 (+!62 lt!14953 (tuple2!1479 lt!14963 (zeroValue!1712 lt!14691))) lt!14955) (apply!53 lt!14953 lt!14955))))

(declare-fun lt!15150 () Unit!965)

(assert (=> d!6731 (= lt!15150 (choose!243 lt!14953 lt!14963 (zeroValue!1712 lt!14691) lt!14955))))

(declare-fun e!25260 () Bool)

(assert (=> d!6731 e!25260))

(declare-fun res!23859 () Bool)

(assert (=> d!6731 (=> (not res!23859) (not e!25260))))

(assert (=> d!6731 (= res!23859 (contains!507 lt!14953 lt!14955))))

(assert (=> d!6731 (= (addApplyDifferent!29 lt!14953 lt!14963 (zeroValue!1712 lt!14691) lt!14955) lt!15150)))

(declare-fun b!39804 () Bool)

(assert (=> b!39804 (= e!25260 (not (= lt!14955 lt!14963)))))

(assert (= (and d!6731 res!23859) b!39804))

(assert (=> d!6731 m!32217))

(assert (=> d!6731 m!32219))

(assert (=> d!6731 m!32217))

(declare-fun m!32553 () Bool)

(assert (=> d!6731 m!32553))

(assert (=> d!6731 m!32215))

(declare-fun m!32555 () Bool)

(assert (=> d!6731 m!32555))

(assert (=> b!39566 d!6731))

(assert (=> b!39566 d!6683))

(declare-fun d!6733 () Bool)

(assert (=> d!6733 (= (size!1373 lt!14691) (bvadd (_size!165 lt!14691) (bvsdiv (bvadd (extraKeys!1685 lt!14691) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!39341 d!6733))

(assert (=> b!39340 d!6733))

(declare-fun b!39805 () Bool)

(declare-fun e!25264 () Bool)

(declare-fun call!3078 () Bool)

(assert (=> b!39805 (= e!25264 call!3078)))

(declare-fun d!6735 () Bool)

(declare-fun res!23860 () Bool)

(declare-fun e!25262 () Bool)

(assert (=> d!6735 (=> res!23860 e!25262)))

(assert (=> d!6735 (= res!23860 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6735 (= (arrayNoDuplicates!0 (_keys!3265 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4636 (Cons!1043 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) e!25262)))

(declare-fun b!39806 () Bool)

(declare-fun e!25261 () Bool)

(assert (=> b!39806 (= e!25261 e!25264)))

(declare-fun c!4764 () Bool)

(assert (=> b!39806 (= c!4764 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39807 () Bool)

(assert (=> b!39807 (= e!25262 e!25261)))

(declare-fun res!23861 () Bool)

(assert (=> b!39807 (=> (not res!23861) (not e!25261))))

(declare-fun e!25263 () Bool)

(assert (=> b!39807 (= res!23861 (not e!25263))))

(declare-fun res!23862 () Bool)

(assert (=> b!39807 (=> (not res!23862) (not e!25263))))

(assert (=> b!39807 (= res!23862 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39808 () Bool)

(assert (=> b!39808 (= e!25264 call!3078)))

(declare-fun b!39809 () Bool)

(assert (=> b!39809 (= e!25263 (contains!504 (ite c!4636 (Cons!1043 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) Nil!1044) Nil!1044) (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3075 () Bool)

(assert (=> bm!3075 (= call!3078 (arrayNoDuplicates!0 (_keys!3265 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4764 (Cons!1043 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4636 (Cons!1043 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (ite c!4636 (Cons!1043 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) Nil!1044) Nil!1044))))))

(assert (= (and d!6735 (not res!23860)) b!39807))

(assert (= (and b!39807 res!23862) b!39809))

(assert (= (and b!39807 res!23861) b!39806))

(assert (= (and b!39806 c!4764) b!39808))

(assert (= (and b!39806 (not c!4764)) b!39805))

(assert (= (or b!39808 b!39805) bm!3075))

(assert (=> b!39806 m!32369))

(assert (=> b!39806 m!32369))

(assert (=> b!39806 m!32371))

(assert (=> b!39807 m!32369))

(assert (=> b!39807 m!32369))

(assert (=> b!39807 m!32371))

(assert (=> b!39809 m!32369))

(assert (=> b!39809 m!32369))

(declare-fun m!32557 () Bool)

(assert (=> b!39809 m!32557))

(assert (=> bm!3075 m!32369))

(declare-fun m!32559 () Bool)

(assert (=> bm!3075 m!32559))

(assert (=> bm!2991 d!6735))

(assert (=> d!6581 d!6539))

(declare-fun d!6737 () Bool)

(declare-fun lt!15151 () Bool)

(assert (=> d!6737 (= lt!15151 (set.member (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (content!27 Nil!1044)))))

(declare-fun e!25265 () Bool)

(assert (=> d!6737 (= lt!15151 e!25265)))

(declare-fun res!23863 () Bool)

(assert (=> d!6737 (=> (not res!23863) (not e!25265))))

(assert (=> d!6737 (= res!23863 (is-Cons!1043 Nil!1044))))

(assert (=> d!6737 (= (contains!504 Nil!1044 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) lt!15151)))

(declare-fun b!39810 () Bool)

(declare-fun e!25266 () Bool)

(assert (=> b!39810 (= e!25265 e!25266)))

(declare-fun res!23864 () Bool)

(assert (=> b!39810 (=> res!23864 e!25266)))

(assert (=> b!39810 (= res!23864 (= (h!1614 Nil!1044) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39811 () Bool)

(assert (=> b!39811 (= e!25266 (contains!504 (t!3888 Nil!1044) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(assert (= (and d!6737 res!23863) b!39810))

(assert (= (and b!39810 (not res!23864)) b!39811))

(assert (=> d!6737 m!32065))

(assert (=> d!6737 m!32019))

(declare-fun m!32561 () Bool)

(assert (=> d!6737 m!32561))

(assert (=> b!39811 m!32019))

(declare-fun m!32563 () Bool)

(assert (=> b!39811 m!32563))

(assert (=> b!39330 d!6737))

(declare-fun b!39825 () Bool)

(declare-fun c!4772 () Bool)

(declare-fun lt!15156 () (_ BitVec 64))

(assert (=> b!39825 (= c!4772 (= lt!15156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25275 () SeekEntryResult!169)

(declare-fun e!25274 () SeekEntryResult!169)

(assert (=> b!39825 (= e!25275 e!25274)))

(declare-fun b!39826 () Bool)

(assert (=> b!39826 (= e!25275 (Found!169 (index!2800 lt!14812)))))

(declare-fun b!39827 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39827 (= e!25274 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7655 lt!14812) #b00000000000000000000000000000001) (nextIndex!0 (index!2800 lt!14812) (x!7655 lt!14812) mask!853) (index!2800 lt!14812) (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853))))

(declare-fun b!39828 () Bool)

(assert (=> b!39828 (= e!25274 (MissingVacant!169 (index!2800 lt!14812)))))

(declare-fun b!39829 () Bool)

(declare-fun e!25273 () SeekEntryResult!169)

(assert (=> b!39829 (= e!25273 e!25275)))

(declare-fun c!4773 () Bool)

(assert (=> b!39829 (= c!4773 (= lt!15156 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(declare-fun d!6739 () Bool)

(declare-fun lt!15157 () SeekEntryResult!169)

(assert (=> d!6739 (and (or (is-Undefined!169 lt!15157) (not (is-Found!169 lt!15157)) (and (bvsge (index!2799 lt!15157) #b00000000000000000000000000000000) (bvslt (index!2799 lt!15157) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!15157) (is-Found!169 lt!15157) (not (is-MissingVacant!169 lt!15157)) (not (= (index!2801 lt!15157) (index!2800 lt!14812))) (and (bvsge (index!2801 lt!15157) #b00000000000000000000000000000000) (bvslt (index!2801 lt!15157) (size!1355 lt!14692)))) (or (is-Undefined!169 lt!15157) (ite (is-Found!169 lt!15157) (= (select (arr!1233 lt!14692) (index!2799 lt!15157)) (select (arr!1233 lt!14692) #b00000000000000000000000000000000)) (and (is-MissingVacant!169 lt!15157) (= (index!2801 lt!15157) (index!2800 lt!14812)) (= (select (arr!1233 lt!14692) (index!2801 lt!15157)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6739 (= lt!15157 e!25273)))

(declare-fun c!4771 () Bool)

(assert (=> d!6739 (= c!4771 (bvsge (x!7655 lt!14812) #b01111111111111111111111111111110))))

(assert (=> d!6739 (= lt!15156 (select (arr!1233 lt!14692) (index!2800 lt!14812)))))

(assert (=> d!6739 (validMask!0 mask!853)))

(assert (=> d!6739 (= (seekKeyOrZeroReturnVacant!0 (x!7655 lt!14812) (index!2800 lt!14812) (index!2800 lt!14812) (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853) lt!15157)))

(declare-fun b!39824 () Bool)

(assert (=> b!39824 (= e!25273 Undefined!169)))

(assert (= (and d!6739 c!4771) b!39824))

(assert (= (and d!6739 (not c!4771)) b!39829))

(assert (= (and b!39829 c!4773) b!39826))

(assert (= (and b!39829 (not c!4773)) b!39825))

(assert (= (and b!39825 c!4772) b!39828))

(assert (= (and b!39825 (not c!4772)) b!39827))

(declare-fun m!32565 () Bool)

(assert (=> b!39827 m!32565))

(assert (=> b!39827 m!32565))

(assert (=> b!39827 m!31943))

(declare-fun m!32567 () Bool)

(assert (=> b!39827 m!32567))

(declare-fun m!32569 () Bool)

(assert (=> d!6739 m!32569))

(declare-fun m!32571 () Bool)

(assert (=> d!6739 m!32571))

(assert (=> d!6739 m!32051))

(assert (=> d!6739 m!31843))

(assert (=> b!39378 d!6739))

(declare-fun b!39830 () Bool)

(declare-fun e!25279 () Bool)

(declare-fun call!3079 () Bool)

(assert (=> b!39830 (= e!25279 call!3079)))

(declare-fun d!6741 () Bool)

(declare-fun res!23865 () Bool)

(declare-fun e!25277 () Bool)

(assert (=> d!6741 (=> res!23865 e!25277)))

(assert (=> d!6741 (= res!23865 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(assert (=> d!6741 (= (arrayNoDuplicates!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4646 (Cons!1043 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044))) e!25277)))

(declare-fun b!39831 () Bool)

(declare-fun e!25276 () Bool)

(assert (=> b!39831 (= e!25276 e!25279)))

(declare-fun c!4774 () Bool)

(assert (=> b!39831 (= c!4774 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39832 () Bool)

(assert (=> b!39832 (= e!25277 e!25276)))

(declare-fun res!23866 () Bool)

(assert (=> b!39832 (=> (not res!23866) (not e!25276))))

(declare-fun e!25278 () Bool)

(assert (=> b!39832 (= res!23866 (not e!25278))))

(declare-fun res!23867 () Bool)

(assert (=> b!39832 (=> (not res!23867) (not e!25278))))

(assert (=> b!39832 (= res!23867 (validKeyInArray!0 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39833 () Bool)

(assert (=> b!39833 (= e!25279 call!3079)))

(declare-fun b!39834 () Bool)

(assert (=> b!39834 (= e!25278 (contains!504 (ite c!4646 (Cons!1043 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3076 () Bool)

(assert (=> bm!3076 (= call!3079 (arrayNoDuplicates!0 lt!14692 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4774 (Cons!1043 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4646 (Cons!1043 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044))) (ite c!4646 (Cons!1043 (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)))))))

(assert (= (and d!6741 (not res!23865)) b!39832))

(assert (= (and b!39832 res!23867) b!39834))

(assert (= (and b!39832 res!23866) b!39831))

(assert (= (and b!39831 c!4774) b!39833))

(assert (= (and b!39831 (not c!4774)) b!39830))

(assert (= (or b!39833 b!39830) bm!3076))

(assert (=> b!39831 m!32433))

(assert (=> b!39831 m!32433))

(assert (=> b!39831 m!32435))

(assert (=> b!39832 m!32433))

(assert (=> b!39832 m!32433))

(assert (=> b!39832 m!32435))

(assert (=> b!39834 m!32433))

(assert (=> b!39834 m!32433))

(declare-fun m!32573 () Bool)

(assert (=> b!39834 m!32573))

(assert (=> bm!3076 m!32433))

(declare-fun m!32575 () Bool)

(assert (=> bm!3076 m!32575))

(assert (=> bm!2992 d!6741))

(declare-fun d!6743 () Bool)

(declare-fun lt!15158 () Bool)

(assert (=> d!6743 (= lt!15158 (set.member (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (content!27 (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044))))))

(declare-fun e!25280 () Bool)

(assert (=> d!6743 (= lt!15158 e!25280)))

(declare-fun res!23868 () Bool)

(assert (=> d!6743 (=> (not res!23868) (not e!25280))))

(assert (=> d!6743 (= res!23868 (is-Cons!1043 (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)))))

(assert (=> d!6743 (= (contains!504 (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15158)))

(declare-fun b!39835 () Bool)

(declare-fun e!25281 () Bool)

(assert (=> b!39835 (= e!25280 e!25281)))

(declare-fun res!23869 () Bool)

(assert (=> b!39835 (=> res!23869 e!25281)))

(assert (=> b!39835 (= res!23869 (= (h!1614 (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39836 () Bool)

(assert (=> b!39836 (= e!25281 (contains!504 (t!3888 (ite c!4618 (Cons!1043 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) Nil!1044) Nil!1044)) (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6743 res!23868) b!39835))

(assert (= (and b!39835 (not res!23869)) b!39836))

(declare-fun m!32577 () Bool)

(assert (=> d!6743 m!32577))

(assert (=> d!6743 m!32007))

(declare-fun m!32579 () Bool)

(assert (=> d!6743 m!32579))

(assert (=> b!39836 m!32007))

(declare-fun m!32581 () Bool)

(assert (=> b!39836 m!32581))

(assert (=> b!39389 d!6743))

(declare-fun d!6745 () Bool)

(declare-fun e!25282 () Bool)

(assert (=> d!6745 e!25282))

(declare-fun res!23871 () Bool)

(assert (=> d!6745 (=> (not res!23871) (not e!25282))))

(declare-fun lt!15160 () ListLongMap!1055)

(assert (=> d!6745 (= res!23871 (contains!507 lt!15160 (_1!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))

(declare-fun lt!15161 () List!1046)

(assert (=> d!6745 (= lt!15160 (ListLongMap!1056 lt!15161))))

(declare-fun lt!15159 () Unit!965)

(declare-fun lt!15162 () Unit!965)

(assert (=> d!6745 (= lt!15159 lt!15162)))

(assert (=> d!6745 (= (getValueByKey!98 lt!15161 (_1!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))

(assert (=> d!6745 (= lt!15162 (lemmaContainsTupThenGetReturnValue!23 lt!15161 (_1!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))) (_2!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))

(assert (=> d!6745 (= lt!15161 (insertStrictlySorted!20 (toList!543 call!3040) (_1!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))) (_2!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))))))

(assert (=> d!6745 (= (+!62 call!3040 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))) lt!15160)))

(declare-fun b!39837 () Bool)

(declare-fun res!23870 () Bool)

(assert (=> b!39837 (=> (not res!23870) (not e!25282))))

(assert (=> b!39837 (= res!23870 (= (getValueByKey!98 (toList!543 lt!15160) (_1!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691)))) (Some!103 (_2!750 (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))))

(declare-fun b!39838 () Bool)

(assert (=> b!39838 (= e!25282 (contains!509 (toList!543 lt!15160) (tuple2!1479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14691))))))

(assert (= (and d!6745 res!23871) b!39837))

(assert (= (and b!39837 res!23870) b!39838))

(declare-fun m!32583 () Bool)

(assert (=> d!6745 m!32583))

(declare-fun m!32585 () Bool)

(assert (=> d!6745 m!32585))

(declare-fun m!32587 () Bool)

(assert (=> d!6745 m!32587))

(declare-fun m!32589 () Bool)

(assert (=> d!6745 m!32589))

(declare-fun m!32591 () Bool)

(assert (=> b!39837 m!32591))

(declare-fun m!32593 () Bool)

(assert (=> b!39838 m!32593))

(assert (=> b!39562 d!6745))

(declare-fun d!6747 () Bool)

(assert (not d!6747))

(assert (=> b!39384 d!6747))

(assert (=> b!39328 d!6677))

(assert (=> b!39327 d!6677))

(assert (=> b!39387 d!6693))

(declare-fun b!39857 () Bool)

(declare-fun e!25294 () SeekEntryResult!169)

(declare-fun e!25296 () SeekEntryResult!169)

(assert (=> b!39857 (= e!25294 e!25296)))

(declare-fun c!4782 () Bool)

(declare-fun lt!15168 () (_ BitVec 64))

(assert (=> b!39857 (= c!4782 (or (= lt!15168 (select (arr!1233 lt!14692) #b00000000000000000000000000000000)) (= (bvadd lt!15168 lt!15168) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39858 () Bool)

(declare-fun lt!15167 () SeekEntryResult!169)

(assert (=> b!39858 (and (bvsge (index!2800 lt!15167) #b00000000000000000000000000000000) (bvslt (index!2800 lt!15167) (size!1355 lt!14692)))))

(declare-fun e!25297 () Bool)

(assert (=> b!39858 (= e!25297 (= (select (arr!1233 lt!14692) (index!2800 lt!15167)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39859 () Bool)

(assert (=> b!39859 (and (bvsge (index!2800 lt!15167) #b00000000000000000000000000000000) (bvslt (index!2800 lt!15167) (size!1355 lt!14692)))))

(declare-fun res!23879 () Bool)

(assert (=> b!39859 (= res!23879 (= (select (arr!1233 lt!14692) (index!2800 lt!15167)) (select (arr!1233 lt!14692) #b00000000000000000000000000000000)))))

(assert (=> b!39859 (=> res!23879 e!25297)))

(declare-fun e!25293 () Bool)

(assert (=> b!39859 (= e!25293 e!25297)))

(declare-fun b!39860 () Bool)

(assert (=> b!39860 (and (bvsge (index!2800 lt!15167) #b00000000000000000000000000000000) (bvslt (index!2800 lt!15167) (size!1355 lt!14692)))))

(declare-fun res!23880 () Bool)

(assert (=> b!39860 (= res!23880 (= (select (arr!1233 lt!14692) (index!2800 lt!15167)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39860 (=> res!23880 e!25297)))

(declare-fun b!39861 () Bool)

(declare-fun e!25295 () Bool)

(assert (=> b!39861 (= e!25295 (bvsge (x!7655 lt!15167) #b01111111111111111111111111111110))))

(declare-fun b!39862 () Bool)

(assert (=> b!39862 (= e!25294 (Intermediate!169 true (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun d!6749 () Bool)

(assert (=> d!6749 e!25295))

(declare-fun c!4781 () Bool)

(assert (=> d!6749 (= c!4781 (and (is-Intermediate!169 lt!15167) (undefined!981 lt!15167)))))

(assert (=> d!6749 (= lt!15167 e!25294)))

(declare-fun c!4783 () Bool)

(assert (=> d!6749 (= c!4783 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6749 (= lt!15168 (select (arr!1233 lt!14692) (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6749 (validMask!0 mask!853)))

(assert (=> d!6749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853) (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853) lt!15167)))

(declare-fun b!39863 () Bool)

(assert (=> b!39863 (= e!25296 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1233 lt!14692) #b00000000000000000000000000000000) lt!14692 mask!853))))

(declare-fun b!39864 () Bool)

(assert (=> b!39864 (= e!25295 e!25293)))

(declare-fun res!23878 () Bool)

(assert (=> b!39864 (= res!23878 (and (is-Intermediate!169 lt!15167) (not (undefined!981 lt!15167)) (bvslt (x!7655 lt!15167) #b01111111111111111111111111111110) (bvsge (x!7655 lt!15167) #b00000000000000000000000000000000) (bvsge (x!7655 lt!15167) #b00000000000000000000000000000000)))))

(assert (=> b!39864 (=> (not res!23878) (not e!25293))))

(declare-fun b!39865 () Bool)

(assert (=> b!39865 (= e!25296 (Intermediate!169 false (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!6749 c!4783) b!39862))

(assert (= (and d!6749 (not c!4783)) b!39857))

(assert (= (and b!39857 c!4782) b!39865))

(assert (= (and b!39857 (not c!4782)) b!39863))

(assert (= (and d!6749 c!4781) b!39861))

(assert (= (and d!6749 (not c!4781)) b!39864))

(assert (= (and b!39864 res!23878) b!39859))

(assert (= (and b!39859 (not res!23879)) b!39860))

(assert (= (and b!39860 (not res!23880)) b!39858))

(declare-fun m!32595 () Bool)

(assert (=> b!39858 m!32595))

(assert (=> b!39860 m!32595))

(assert (=> b!39859 m!32595))

(assert (=> b!39863 m!32053))

(declare-fun m!32597 () Bool)

(assert (=> b!39863 m!32597))

(assert (=> b!39863 m!32597))

(assert (=> b!39863 m!31943))

(declare-fun m!32599 () Bool)

(assert (=> b!39863 m!32599))

(assert (=> d!6749 m!32053))

(declare-fun m!32601 () Bool)

(assert (=> d!6749 m!32601))

(assert (=> d!6749 m!31843))

(assert (=> d!6603 d!6749))

(declare-fun d!6751 () Bool)

(declare-fun lt!15174 () (_ BitVec 32))

(declare-fun lt!15173 () (_ BitVec 32))

(assert (=> d!6751 (= lt!15174 (bvmul (bvxor lt!15173 (bvlshr lt!15173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6751 (= lt!15173 ((_ extract 31 0) (bvand (bvxor (select (arr!1233 lt!14692) #b00000000000000000000000000000000) (bvlshr (select (arr!1233 lt!14692) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6751 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23881 (let ((h!1619 ((_ extract 31 0) (bvand (bvxor (select (arr!1233 lt!14692) #b00000000000000000000000000000000) (bvlshr (select (arr!1233 lt!14692) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7671 (bvmul (bvxor h!1619 (bvlshr h!1619 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7671 (bvlshr x!7671 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23881 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23881 #b00000000000000000000000000000000))))))

(assert (=> d!6751 (= (toIndex!0 (select (arr!1233 lt!14692) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15174 (bvlshr lt!15174 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6603 d!6751))

(assert (=> d!6603 d!6525))

(assert (=> b!39386 d!6693))

(declare-fun d!6753 () Bool)

(assert (=> d!6753 (= (apply!53 lt!14952 #b1000000000000000000000000000000000000000000000000000000000000000) (get!692 (getValueByKey!98 (toList!543 lt!14952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1661 () Bool)

(assert (= bs!1661 d!6753))

(assert (=> bs!1661 m!32429))

(assert (=> bs!1661 m!32429))

(declare-fun m!32603 () Bool)

(assert (=> bs!1661 m!32603))

(assert (=> b!39560 d!6753))

(assert (=> d!6597 d!6601))

(declare-fun d!6755 () Bool)

(assert (=> d!6755 (arrayContainsKey!0 lt!14692 lt!14764 #b00000000000000000000000000000000)))

(assert (=> d!6755 true))

(declare-fun _$60!332 () Unit!965)

(assert (=> d!6755 (= (choose!13 lt!14692 lt!14764 #b00000000000000000000000000000000) _$60!332)))

(declare-fun bs!1662 () Bool)

(assert (= bs!1662 d!6755))

(assert (=> bs!1662 m!31949))

(assert (=> d!6597 d!6755))

(declare-fun d!6759 () Bool)

(declare-fun lt!15176 () (_ BitVec 32))

(assert (=> d!6759 (and (bvsge lt!15176 #b00000000000000000000000000000000) (bvsle lt!15176 (bvsub (size!1355 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25300 () (_ BitVec 32))

(assert (=> d!6759 (= lt!15176 e!25300)))

(declare-fun c!4784 () Bool)

(assert (=> d!6759 (= c!4784 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6759 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1355 (_keys!3265 lt!14691)) (size!1355 (_keys!3265 lt!14691))))))

(assert (=> d!6759 (= (arrayCountValidKeys!0 (_keys!3265 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))) lt!15176)))

(declare-fun b!39868 () Bool)

(assert (=> b!39868 (= e!25300 #b00000000000000000000000000000000)))

(declare-fun b!39869 () Bool)

(declare-fun e!25301 () (_ BitVec 32))

(assert (=> b!39869 (= e!25300 e!25301)))

(declare-fun c!4785 () Bool)

(assert (=> b!39869 (= c!4785 (validKeyInArray!0 (select (arr!1233 (_keys!3265 lt!14691)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3077 () Bool)

(declare-fun call!3080 () (_ BitVec 32))

(assert (=> bm!3077 (= call!3080 (arrayCountValidKeys!0 (_keys!3265 lt!14691) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))))))

(declare-fun b!39870 () Bool)

(assert (=> b!39870 (= e!25301 call!3080)))

(declare-fun b!39871 () Bool)

(assert (=> b!39871 (= e!25301 (bvadd #b00000000000000000000000000000001 call!3080))))

(assert (= (and d!6759 c!4784) b!39868))

(assert (= (and d!6759 (not c!4784)) b!39869))

(assert (= (and b!39869 c!4785) b!39871))

(assert (= (and b!39869 (not c!4785)) b!39870))

(assert (= (or b!39871 b!39870) bm!3077))

(assert (=> b!39869 m!32369))

(assert (=> b!39869 m!32369))

(assert (=> b!39869 m!32371))

(declare-fun m!32609 () Bool)

(assert (=> bm!3077 m!32609))

(assert (=> bm!3044 d!6759))

(declare-fun d!6763 () Bool)

(assert (=> d!6763 (= (content!27 Nil!1044) (as set.empty (Set (_ BitVec 64))))))

(assert (=> d!6607 d!6763))

(declare-fun d!6767 () Bool)

(assert (=> d!6767 (arrayContainsKey!0 (_keys!3265 lt!14691) lt!14800 #b00000000000000000000000000000000)))

(declare-fun lt!15178 () Unit!965)

(assert (=> d!6767 (= lt!15178 (choose!13 (_keys!3265 lt!14691) lt!14800 #b00000000000000000000000000000000))))

(assert (=> d!6767 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6767 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3265 lt!14691) lt!14800 #b00000000000000000000000000000000) lt!15178)))

(declare-fun bs!1663 () Bool)

(assert (= bs!1663 d!6767))

(assert (=> bs!1663 m!32025))

(declare-fun m!32617 () Bool)

(assert (=> bs!1663 m!32617))

(assert (=> b!39321 d!6767))

(declare-fun d!6769 () Bool)

(declare-fun res!23889 () Bool)

(declare-fun e!25308 () Bool)

(assert (=> d!6769 (=> res!23889 e!25308)))

(assert (=> d!6769 (= res!23889 (= (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) lt!14800))))

(assert (=> d!6769 (= (arrayContainsKey!0 (_keys!3265 lt!14691) lt!14800 #b00000000000000000000000000000000) e!25308)))

(declare-fun b!39879 () Bool)

(declare-fun e!25309 () Bool)

(assert (=> b!39879 (= e!25308 e!25309)))

(declare-fun res!23890 () Bool)

(assert (=> b!39879 (=> (not res!23890) (not e!25309))))

(assert (=> b!39879 (= res!23890 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1355 (_keys!3265 lt!14691))))))

(declare-fun b!39880 () Bool)

(assert (=> b!39880 (= e!25309 (arrayContainsKey!0 (_keys!3265 lt!14691) lt!14800 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6769 (not res!23889)) b!39879))

(assert (= (and b!39879 res!23890) b!39880))

(assert (=> d!6769 m!32019))

(declare-fun m!32621 () Bool)

(assert (=> b!39880 m!32621))

(assert (=> b!39321 d!6769))

(declare-fun b!39881 () Bool)

(declare-fun e!25312 () SeekEntryResult!169)

(declare-fun e!25310 () SeekEntryResult!169)

(assert (=> b!39881 (= e!25312 e!25310)))

(declare-fun lt!15181 () (_ BitVec 64))

(declare-fun lt!15179 () SeekEntryResult!169)

(assert (=> b!39881 (= lt!15181 (select (arr!1233 (_keys!3265 lt!14691)) (index!2800 lt!15179)))))

(declare-fun c!4788 () Bool)

(assert (=> b!39881 (= c!4788 (= lt!15181 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39882 () Bool)

(declare-fun c!4787 () Bool)

(assert (=> b!39882 (= c!4787 (= lt!15181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25311 () SeekEntryResult!169)

(assert (=> b!39882 (= e!25310 e!25311)))

(declare-fun b!39883 () Bool)

(assert (=> b!39883 (= e!25311 (MissingZero!169 (index!2800 lt!15179)))))

(declare-fun b!39884 () Bool)

(assert (=> b!39884 (= e!25312 Undefined!169)))

(declare-fun d!6771 () Bool)

(declare-fun lt!15180 () SeekEntryResult!169)

(assert (=> d!6771 (and (or (is-Undefined!169 lt!15180) (not (is-Found!169 lt!15180)) (and (bvsge (index!2799 lt!15180) #b00000000000000000000000000000000) (bvslt (index!2799 lt!15180) (size!1355 (_keys!3265 lt!14691))))) (or (is-Undefined!169 lt!15180) (is-Found!169 lt!15180) (not (is-MissingZero!169 lt!15180)) (and (bvsge (index!2798 lt!15180) #b00000000000000000000000000000000) (bvslt (index!2798 lt!15180) (size!1355 (_keys!3265 lt!14691))))) (or (is-Undefined!169 lt!15180) (is-Found!169 lt!15180) (is-MissingZero!169 lt!15180) (not (is-MissingVacant!169 lt!15180)) (and (bvsge (index!2801 lt!15180) #b00000000000000000000000000000000) (bvslt (index!2801 lt!15180) (size!1355 (_keys!3265 lt!14691))))) (or (is-Undefined!169 lt!15180) (ite (is-Found!169 lt!15180) (= (select (arr!1233 (_keys!3265 lt!14691)) (index!2799 lt!15180)) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) (ite (is-MissingZero!169 lt!15180) (= (select (arr!1233 (_keys!3265 lt!14691)) (index!2798 lt!15180)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!169 lt!15180) (= (select (arr!1233 (_keys!3265 lt!14691)) (index!2801 lt!15180)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6771 (= lt!15180 e!25312)))

(declare-fun c!4789 () Bool)

(assert (=> d!6771 (= c!4789 (and (is-Intermediate!169 lt!15179) (undefined!981 lt!15179)))))

(assert (=> d!6771 (= lt!15179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (mask!5141 lt!14691)) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (_keys!3265 lt!14691) (mask!5141 lt!14691)))))

(assert (=> d!6771 (validMask!0 (mask!5141 lt!14691))))

(assert (=> d!6771 (= (seekEntryOrOpen!0 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (_keys!3265 lt!14691) (mask!5141 lt!14691)) lt!15180)))

(declare-fun b!39885 () Bool)

(assert (=> b!39885 (= e!25310 (Found!169 (index!2800 lt!15179)))))

(declare-fun b!39886 () Bool)

(assert (=> b!39886 (= e!25311 (seekKeyOrZeroReturnVacant!0 (x!7655 lt!15179) (index!2800 lt!15179) (index!2800 lt!15179) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000) (_keys!3265 lt!14691) (mask!5141 lt!14691)))))

(assert (= (and d!6771 c!4789) b!39884))

(assert (= (and d!6771 (not c!4789)) b!39881))

(assert (= (and b!39881 c!4788) b!39885))

(assert (= (and b!39881 (not c!4788)) b!39882))

(assert (= (and b!39882 c!4787) b!39883))

(assert (= (and b!39882 (not c!4787)) b!39886))

(declare-fun m!32629 () Bool)

(assert (=> b!39881 m!32629))

(declare-fun m!32631 () Bool)

(assert (=> d!6771 m!32631))

(assert (=> d!6771 m!32019))

(declare-fun m!32633 () Bool)

(assert (=> d!6771 m!32633))

(assert (=> d!6771 m!32019))

(assert (=> d!6771 m!32631))

(declare-fun m!32635 () Bool)

(assert (=> d!6771 m!32635))

(declare-fun m!32637 () Bool)

(assert (=> d!6771 m!32637))

(declare-fun m!32639 () Bool)

(assert (=> d!6771 m!32639))

(assert (=> d!6771 m!32039))

(assert (=> b!39886 m!32019))

(declare-fun m!32641 () Bool)

(assert (=> b!39886 m!32641))

(assert (=> b!39321 d!6771))

(assert (=> b!39578 d!6677))

(declare-fun d!6775 () Bool)

(declare-fun e!25318 () Bool)

(assert (=> d!6775 e!25318))

(declare-fun res!23894 () Bool)

(assert (=> d!6775 (=> res!23894 e!25318)))

(declare-fun lt!15182 () Bool)

(assert (=> d!6775 (= res!23894 (not lt!15182))))

(declare-fun lt!15185 () Bool)

(assert (=> d!6775 (= lt!15182 lt!15185)))

(declare-fun lt!15184 () Unit!965)

(declare-fun e!25317 () Unit!965)

(assert (=> d!6775 (= lt!15184 e!25317)))

(declare-fun c!4791 () Bool)

(assert (=> d!6775 (= c!4791 lt!15185)))

(assert (=> d!6775 (= lt!15185 (containsKey!66 (toList!543 lt!14952) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(assert (=> d!6775 (= (contains!507 lt!14952 (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)) lt!15182)))

(declare-fun b!39892 () Bool)

(declare-fun lt!15183 () Unit!965)

(assert (=> b!39892 (= e!25317 lt!15183)))

(assert (=> b!39892 (= lt!15183 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!543 lt!14952) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(assert (=> b!39892 (isDefined!55 (getValueByKey!98 (toList!543 lt!14952) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000)))))

(declare-fun b!39893 () Bool)

(declare-fun Unit!977 () Unit!965)

(assert (=> b!39893 (= e!25317 Unit!977)))

(declare-fun b!39894 () Bool)

(assert (=> b!39894 (= e!25318 (isDefined!55 (getValueByKey!98 (toList!543 lt!14952) (select (arr!1233 (_keys!3265 lt!14691)) #b00000000000000000000000000000000))))))

(assert (= (and d!6775 c!4791) b!39892))

(assert (= (and d!6775 (not c!4791)) b!39893))

(assert (= (and d!6775 (not res!23894)) b!39894))

(assert (=> d!6775 m!32019))

(declare-fun m!32643 () Bool)

(assert (=> d!6775 m!32643))

(assert (=> b!39892 m!32019))

(declare-fun m!32645 () Bool)

(assert (=> b!39892 m!32645))

(assert (=> b!39892 m!32019))

(assert (=> b!39892 m!32379))

(assert (=> b!39892 m!32379))

(declare-fun m!32647 () Bool)

(assert (=> b!39892 m!32647))

(assert (=> b!39894 m!32019))

(assert (=> b!39894 m!32379))

(assert (=> b!39894 m!32379))

(assert (=> b!39894 m!32647))

(assert (=> b!39558 d!6775))

(declare-fun d!6777 () Bool)

(declare-fun res!23895 () Bool)

(declare-fun e!25319 () Bool)

(assert (=> d!6777 (=> res!23895 e!25319)))

(assert (=> d!6777 (= res!23895 (= (select (arr!1233 lt!14692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14764))))

(assert (=> d!6777 (= (arrayContainsKey!0 lt!14692 lt!14764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25319)))

(declare-fun b!39895 () Bool)

(declare-fun e!25320 () Bool)

(assert (=> b!39895 (= e!25319 e!25320)))

(declare-fun res!23896 () Bool)

(assert (=> b!39895 (=> (not res!23896) (not e!25320))))

(assert (=> b!39895 (= res!23896 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1355 lt!14692)))))

(declare-fun b!39896 () Bool)

(assert (=> b!39896 (= e!25320 (arrayContainsKey!0 lt!14692 lt!14764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6777 (not res!23895)) b!39895))

(assert (= (and b!39895 res!23896) b!39896))

(assert (=> d!6777 m!32007))

(declare-fun m!32653 () Bool)

(assert (=> b!39896 m!32653))

(assert (=> b!39348 d!6777))

(assert (=> b!39320 d!6677))

(declare-fun b_lambda!2043 () Bool)

(assert (= b_lambda!2035 (or (and start!5500 b_free!1357 (= defaultEntry!470 (defaultEntry!1794 lt!14691))) b_lambda!2043)))

(push 1)

(assert (not b!39894))

(assert (not b!39832))

(assert (not d!6713))

(assert (not b!39763))

(assert (not d!6703))

(assert (not b!39800))

(assert (not b_next!1357))

(assert (not b!39774))

(assert (not d!6709))

(assert (not b!39892))

(assert (not b!39896))

(assert (not d!6737))

(assert (not b!39793))

(assert (not b!39719))

(assert (not b!39757))

(assert (not d!6725))

(assert (not b!39827))

(assert (not b!39806))

(assert (not b!39801))

(assert (not b!39799))

(assert (not d!6775))

(assert (not b!39785))

(assert (not bm!3074))

(assert (not b!39782))

(assert (not d!6679))

(assert (not d!6699))

(assert (not b!39792))

(assert (not d!6755))

(assert (not b!39880))

(assert (not d!6729))

(assert (not bm!3075))

(assert (not bm!3073))

(assert (not d!6671))

(assert (not b!39753))

(assert (not b_lambda!2043))

(assert (not b!39836))

(assert (not b!39786))

(assert (not d!6683))

(assert (not b!39838))

(assert (not b!39770))

(assert (not b!39769))

(assert (not b!39758))

(assert (not b!39834))

(assert (not d!6749))

(assert (not b!39724))

(assert (not b!39795))

(assert (not d!6743))

(assert (not d!6691))

(assert (not b!39713))

(assert (not d!6767))

(assert tp_is_empty!1747)

(assert (not d!6697))

(assert (not b!39869))

(assert (not d!6727))

(assert (not b!39831))

(assert (not b_lambda!2027))

(assert (not d!6705))

(assert (not b!39781))

(assert (not b!39754))

(assert (not d!6753))

(assert (not b!39809))

(assert (not d!6715))

(assert (not b!39863))

(assert (not bm!3076))

(assert (not b!39886))

(assert (not b!39772))

(assert (not d!6771))

(assert (not b!39715))

(assert (not d!6723))

(assert (not b!39725))

(assert (not b!39803))

(assert (not b!39755))

(assert (not b_lambda!2039))

(assert (not bm!3072))

(assert (not b!39794))

(assert (not d!6719))

(assert (not b!39797))

(assert (not b!39837))

(assert (not b!39798))

(assert (not b!39718))

(assert (not d!6707))

(assert (not d!6721))

(assert (not bm!3069))

(assert (not d!6711))

(assert (not b!39811))

(assert (not b!39760))

(assert b_and!2347)

(assert (not d!6717))

(assert (not d!6745))

(assert (not b!39750))

(assert (not b_lambda!2041))

(assert (not d!6685))

(assert (not d!6739))

(assert (not d!6731))

(assert (not b!39807))

(assert (not d!6689))

(assert (not b!39752))

(assert (not bm!3077))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2347)

(assert (not b_next!1357))

(check-sat)

(pop 1)

