; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5494 () Bool)

(assert start!5494)

(declare-fun b_free!1357 () Bool)

(declare-fun b_next!1357 () Bool)

(assert (=> start!5494 (= b_free!1357 (not b_next!1357))))

(declare-fun tp!5723 () Bool)

(declare-fun b_and!2329 () Bool)

(assert (=> start!5494 (= tp!5723 b_and!2329)))

(declare-fun res!23514 () Bool)

(declare-fun e!24802 () Bool)

(assert (=> start!5494 (=> (not res!23514) (not e!24802))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5494 (= res!23514 (validMask!0 mask!853))))

(assert (=> start!5494 e!24802))

(assert (=> start!5494 true))

(assert (=> start!5494 tp!5723))

(declare-fun b!39070 () Bool)

(declare-fun e!24803 () Bool)

(assert (=> b!39070 (= e!24802 (not e!24803))))

(declare-fun res!23515 () Bool)

(assert (=> b!39070 (=> res!23515 e!24803)))

(declare-datatypes ((array!2553 0))(
  ( (array!2554 (arr!1220 (Array (_ BitVec 32) (_ BitVec 64))) (size!1342 (_ BitVec 32))) )
))
(declare-datatypes ((V!2089 0))(
  ( (V!2090 (val!912 Int)) )
))
(declare-datatypes ((ValueCell!626 0))(
  ( (ValueCellFull!626 (v!1982 V!2089)) (EmptyCell!626) )
))
(declare-datatypes ((array!2555 0))(
  ( (array!2556 (arr!1221 (Array (_ BitVec 32) ValueCell!626)) (size!1343 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!232 0))(
  ( (LongMapFixedSize!233 (defaultEntry!1794 Int) (mask!5140 (_ BitVec 32)) (extraKeys!1685 (_ BitVec 32)) (zeroValue!1712 V!2089) (minValue!1712 V!2089) (_size!165 (_ BitVec 32)) (_keys!3264 array!2553) (_values!1777 array!2555) (_vacant!165 (_ BitVec 32))) )
))
(declare-fun lt!14678 () LongMapFixedSize!232)

(declare-datatypes ((tuple2!1482 0))(
  ( (tuple2!1483 (_1!752 (_ BitVec 64)) (_2!752 V!2089)) )
))
(declare-datatypes ((List!1039 0))(
  ( (Nil!1036) (Cons!1035 (h!1606 tuple2!1482) (t!3879 List!1039)) )
))
(declare-datatypes ((ListLongMap!1047 0))(
  ( (ListLongMap!1048 (toList!539 List!1039)) )
))
(declare-fun map!685 (LongMapFixedSize!232) ListLongMap!1047)

(assert (=> b!39070 (= res!23515 (= (map!685 lt!14678) (ListLongMap!1048 Nil!1036)))))

(declare-fun lt!14677 () array!2553)

(declare-datatypes ((List!1040 0))(
  ( (Nil!1037) (Cons!1036 (h!1607 (_ BitVec 64)) (t!3880 List!1040)) )
))
(declare-fun arrayNoDuplicates!0 (array!2553 (_ BitVec 32) List!1040) Bool)

(assert (=> b!39070 (arrayNoDuplicates!0 lt!14677 #b00000000000000000000000000000000 Nil!1037)))

(declare-datatypes ((Unit!966 0))(
  ( (Unit!967) )
))
(declare-fun lt!14675 () Unit!966)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2553 (_ BitVec 32) (_ BitVec 32) List!1040) Unit!966)

(assert (=> b!39070 (= lt!14675 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2553 (_ BitVec 32)) Bool)

(assert (=> b!39070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14677 mask!853)))

(declare-fun lt!14676 () Unit!966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!966)

(assert (=> b!39070 (= lt!14676 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14677 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39070 (= (arrayCountValidKeys!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14673 () Unit!966)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!966)

(assert (=> b!39070 (= lt!14673 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun lt!14674 () V!2089)

(declare-fun defaultEntry!470 () Int)

(assert (=> b!39070 (= lt!14678 (LongMapFixedSize!233 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14674 lt!14674 #b00000000000000000000000000000000 lt!14677 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!626)) EmptyCell!626) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!39070 (= lt!14677 (array!2554 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!186 (Int (_ BitVec 64)) V!2089)

(assert (=> b!39070 (= lt!14674 (dynLambda!186 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39071 () Bool)

(declare-fun valid!125 (LongMapFixedSize!232) Bool)

(assert (=> b!39071 (= e!24803 (valid!125 lt!14678))))

(assert (= (and start!5494 res!23514) b!39070))

(assert (= (and b!39070 (not res!23515)) b!39071))

(declare-fun b_lambda!2025 () Bool)

(assert (=> (not b_lambda!2025) (not b!39070)))

(declare-fun t!3878 () Bool)

(declare-fun tb!827 () Bool)

(assert (=> (and start!5494 (= defaultEntry!470 defaultEntry!470) t!3878) tb!827))

(declare-fun result!1417 () Bool)

(declare-fun tp_is_empty!1747 () Bool)

(assert (=> tb!827 (= result!1417 tp_is_empty!1747)))

(assert (=> b!39070 t!3878))

(declare-fun b_and!2331 () Bool)

(assert (= b_and!2329 (and (=> t!3878 result!1417) b_and!2331)))

(declare-fun m!31745 () Bool)

(assert (=> start!5494 m!31745))

(declare-fun m!31747 () Bool)

(assert (=> b!39070 m!31747))

(declare-fun m!31749 () Bool)

(assert (=> b!39070 m!31749))

(declare-fun m!31751 () Bool)

(assert (=> b!39070 m!31751))

(declare-fun m!31753 () Bool)

(assert (=> b!39070 m!31753))

(declare-fun m!31755 () Bool)

(assert (=> b!39070 m!31755))

(declare-fun m!31757 () Bool)

(assert (=> b!39070 m!31757))

(declare-fun m!31759 () Bool)

(assert (=> b!39070 m!31759))

(declare-fun m!31761 () Bool)

(assert (=> b!39070 m!31761))

(declare-fun m!31763 () Bool)

(assert (=> b!39071 m!31763))

(check-sat b_and!2331 (not b!39070) tp_is_empty!1747 (not b_lambda!2025) (not b_next!1357) (not b!39071) (not start!5494))
(check-sat b_and!2331 (not b_next!1357))
(get-model)

(declare-fun b_lambda!2035 () Bool)

(assert (= b_lambda!2025 (or (and start!5494 b_free!1357) b_lambda!2035)))

(check-sat b_and!2331 (not b!39070) (not b_lambda!2035) tp_is_empty!1747 (not b_next!1357) (not b!39071) (not start!5494))
(check-sat b_and!2331 (not b_next!1357))
(get-model)

(declare-fun d!6485 () Bool)

(assert (=> d!6485 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5494 d!6485))

(declare-fun d!6491 () Bool)

(assert (=> d!6491 (= (arrayCountValidKeys!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14723 () Unit!966)

(declare-fun choose!59 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!966)

(assert (=> d!6491 (= lt!14723 (choose!59 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6491 (bvslt (size!1342 lt!14677) #b01111111111111111111111111111111)))

(assert (=> d!6491 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14723)))

(declare-fun bs!1624 () Bool)

(assert (= bs!1624 d!6491))

(assert (=> bs!1624 m!31753))

(declare-fun m!31813 () Bool)

(assert (=> bs!1624 m!31813))

(assert (=> b!39070 d!6491))

(declare-fun d!6495 () Bool)

(declare-fun getCurrentListMap!297 (array!2553 array!2555 (_ BitVec 32) (_ BitVec 32) V!2089 V!2089 (_ BitVec 32) Int) ListLongMap!1047)

(assert (=> d!6495 (= (map!685 lt!14678) (getCurrentListMap!297 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)))))

(declare-fun bs!1625 () Bool)

(assert (= bs!1625 d!6495))

(declare-fun m!31835 () Bool)

(assert (=> bs!1625 m!31835))

(assert (=> b!39070 d!6495))

(declare-fun b!39149 () Bool)

(declare-fun e!24860 () Bool)

(declare-fun e!24859 () Bool)

(assert (=> b!39149 (= e!24860 e!24859)))

(declare-fun lt!14751 () (_ BitVec 64))

(assert (=> b!39149 (= lt!14751 (select (arr!1220 lt!14677) #b00000000000000000000000000000000))))

(declare-fun lt!14753 () Unit!966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2553 (_ BitVec 64) (_ BitVec 32)) Unit!966)

(assert (=> b!39149 (= lt!14753 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14677 lt!14751 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!39149 (arrayContainsKey!0 lt!14677 lt!14751 #b00000000000000000000000000000000)))

(declare-fun lt!14752 () Unit!966)

(assert (=> b!39149 (= lt!14752 lt!14753)))

(declare-fun res!23553 () Bool)

(declare-datatypes ((SeekEntryResult!177 0))(
  ( (MissingZero!177 (index!2830 (_ BitVec 32))) (Found!177 (index!2831 (_ BitVec 32))) (Intermediate!177 (undefined!989 Bool) (index!2832 (_ BitVec 32)) (x!7662 (_ BitVec 32))) (Undefined!177) (MissingVacant!177 (index!2833 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2553 (_ BitVec 32)) SeekEntryResult!177)

(assert (=> b!39149 (= res!23553 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853) (Found!177 #b00000000000000000000000000000000)))))

(assert (=> b!39149 (=> (not res!23553) (not e!24859))))

(declare-fun b!39150 () Bool)

(declare-fun call!2975 () Bool)

(assert (=> b!39150 (= e!24860 call!2975)))

(declare-fun b!39151 () Bool)

(declare-fun e!24858 () Bool)

(assert (=> b!39151 (= e!24858 e!24860)))

(declare-fun c!4586 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!39151 (= c!4586 (validKeyInArray!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun bm!2972 () Bool)

(assert (=> bm!2972 (= call!2975 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14677 mask!853))))

(declare-fun b!39152 () Bool)

(assert (=> b!39152 (= e!24859 call!2975)))

(declare-fun d!6501 () Bool)

(declare-fun res!23554 () Bool)

(assert (=> d!6501 (=> res!23554 e!24858)))

(assert (=> d!6501 (= res!23554 (bvsge #b00000000000000000000000000000000 (size!1342 lt!14677)))))

(assert (=> d!6501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14677 mask!853) e!24858)))

(assert (= (and d!6501 (not res!23554)) b!39151))

(assert (= (and b!39151 c!4586) b!39149))

(assert (= (and b!39151 (not c!4586)) b!39150))

(assert (= (and b!39149 res!23553) b!39152))

(assert (= (or b!39152 b!39150) bm!2972))

(declare-fun m!31843 () Bool)

(assert (=> b!39149 m!31843))

(declare-fun m!31845 () Bool)

(assert (=> b!39149 m!31845))

(declare-fun m!31847 () Bool)

(assert (=> b!39149 m!31847))

(assert (=> b!39149 m!31843))

(declare-fun m!31849 () Bool)

(assert (=> b!39149 m!31849))

(assert (=> b!39151 m!31843))

(assert (=> b!39151 m!31843))

(declare-fun m!31853 () Bool)

(assert (=> b!39151 m!31853))

(declare-fun m!31855 () Bool)

(assert (=> bm!2972 m!31855))

(assert (=> b!39070 d!6501))

(declare-fun b!39185 () Bool)

(declare-fun e!24886 () Bool)

(declare-fun e!24885 () Bool)

(assert (=> b!39185 (= e!24886 e!24885)))

(declare-fun res!23567 () Bool)

(assert (=> b!39185 (=> (not res!23567) (not e!24885))))

(declare-fun e!24883 () Bool)

(assert (=> b!39185 (= res!23567 (not e!24883))))

(declare-fun res!23569 () Bool)

(assert (=> b!39185 (=> (not res!23569) (not e!24883))))

(assert (=> b!39185 (= res!23569 (validKeyInArray!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun b!39186 () Bool)

(declare-fun e!24884 () Bool)

(assert (=> b!39186 (= e!24885 e!24884)))

(declare-fun c!4597 () Bool)

(assert (=> b!39186 (= c!4597 (validKeyInArray!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun d!6511 () Bool)

(declare-fun res!23568 () Bool)

(assert (=> d!6511 (=> res!23568 e!24886)))

(assert (=> d!6511 (= res!23568 (bvsge #b00000000000000000000000000000000 (size!1342 lt!14677)))))

(assert (=> d!6511 (= (arrayNoDuplicates!0 lt!14677 #b00000000000000000000000000000000 Nil!1037) e!24886)))

(declare-fun b!39187 () Bool)

(declare-fun call!2981 () Bool)

(assert (=> b!39187 (= e!24884 call!2981)))

(declare-fun bm!2978 () Bool)

(assert (=> bm!2978 (= call!2981 (arrayNoDuplicates!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)))))

(declare-fun b!39188 () Bool)

(assert (=> b!39188 (= e!24884 call!2981)))

(declare-fun b!39189 () Bool)

(declare-fun contains!501 (List!1040 (_ BitVec 64)) Bool)

(assert (=> b!39189 (= e!24883 (contains!501 Nil!1037 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(assert (= (and d!6511 (not res!23568)) b!39185))

(assert (= (and b!39185 res!23569) b!39189))

(assert (= (and b!39185 res!23567) b!39186))

(assert (= (and b!39186 c!4597) b!39188))

(assert (= (and b!39186 (not c!4597)) b!39187))

(assert (= (or b!39188 b!39187) bm!2978))

(assert (=> b!39185 m!31843))

(assert (=> b!39185 m!31843))

(assert (=> b!39185 m!31853))

(assert (=> b!39186 m!31843))

(assert (=> b!39186 m!31843))

(assert (=> b!39186 m!31853))

(assert (=> bm!2978 m!31843))

(declare-fun m!31863 () Bool)

(assert (=> bm!2978 m!31863))

(assert (=> b!39189 m!31843))

(assert (=> b!39189 m!31843))

(declare-fun m!31865 () Bool)

(assert (=> b!39189 m!31865))

(assert (=> b!39070 d!6511))

(declare-fun d!6519 () Bool)

(assert (=> d!6519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14677 mask!853)))

(declare-fun lt!14765 () Unit!966)

(declare-fun choose!34 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!966)

(assert (=> d!6519 (= lt!14765 (choose!34 lt!14677 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6519 (validMask!0 mask!853)))

(assert (=> d!6519 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14677 mask!853 #b00000000000000000000000000000000) lt!14765)))

(declare-fun bs!1631 () Bool)

(assert (= bs!1631 d!6519))

(assert (=> bs!1631 m!31747))

(declare-fun m!31871 () Bool)

(assert (=> bs!1631 m!31871))

(assert (=> bs!1631 m!31745))

(assert (=> b!39070 d!6519))

(declare-fun b!39203 () Bool)

(declare-fun e!24895 () (_ BitVec 32))

(declare-fun call!2987 () (_ BitVec 32))

(assert (=> b!39203 (= e!24895 (bvadd #b00000000000000000000000000000001 call!2987))))

(declare-fun bm!2984 () Bool)

(assert (=> bm!2984 (= call!2987 (arrayCountValidKeys!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39204 () Bool)

(declare-fun e!24896 () (_ BitVec 32))

(assert (=> b!39204 (= e!24896 #b00000000000000000000000000000000)))

(declare-fun b!39205 () Bool)

(assert (=> b!39205 (= e!24896 e!24895)))

(declare-fun c!4604 () Bool)

(assert (=> b!39205 (= c!4604 (validKeyInArray!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun d!6523 () Bool)

(declare-fun lt!14774 () (_ BitVec 32))

(assert (=> d!6523 (and (bvsge lt!14774 #b00000000000000000000000000000000) (bvsle lt!14774 (bvsub (size!1342 lt!14677) #b00000000000000000000000000000000)))))

(assert (=> d!6523 (= lt!14774 e!24896)))

(declare-fun c!4603 () Bool)

(assert (=> d!6523 (= c!4603 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6523 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1342 lt!14677)))))

(assert (=> d!6523 (= (arrayCountValidKeys!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14774)))

(declare-fun b!39206 () Bool)

(assert (=> b!39206 (= e!24895 call!2987)))

(assert (= (and d!6523 c!4603) b!39204))

(assert (= (and d!6523 (not c!4603)) b!39205))

(assert (= (and b!39205 c!4604) b!39203))

(assert (= (and b!39205 (not c!4604)) b!39206))

(assert (= (or b!39203 b!39206) bm!2984))

(declare-fun m!31879 () Bool)

(assert (=> bm!2984 m!31879))

(assert (=> b!39205 m!31843))

(assert (=> b!39205 m!31843))

(assert (=> b!39205 m!31853))

(assert (=> b!39070 d!6523))

(declare-fun d!6531 () Bool)

(assert (=> d!6531 (arrayNoDuplicates!0 lt!14677 #b00000000000000000000000000000000 Nil!1037)))

(declare-fun lt!14777 () Unit!966)

(declare-fun choose!111 (array!2553 (_ BitVec 32) (_ BitVec 32) List!1040) Unit!966)

(assert (=> d!6531 (= lt!14777 (choose!111 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1037))))

(assert (=> d!6531 (= (size!1342 lt!14677) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6531 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1037) lt!14777)))

(declare-fun bs!1635 () Bool)

(assert (= bs!1635 d!6531))

(assert (=> bs!1635 m!31755))

(declare-fun m!31889 () Bool)

(assert (=> bs!1635 m!31889))

(assert (=> b!39070 d!6531))

(declare-fun d!6533 () Bool)

(declare-fun res!23597 () Bool)

(declare-fun e!24905 () Bool)

(assert (=> d!6533 (=> (not res!23597) (not e!24905))))

(declare-fun simpleValid!25 (LongMapFixedSize!232) Bool)

(assert (=> d!6533 (= res!23597 (simpleValid!25 lt!14678))))

(assert (=> d!6533 (= (valid!125 lt!14678) e!24905)))

(declare-fun b!39231 () Bool)

(declare-fun res!23598 () Bool)

(assert (=> b!39231 (=> (not res!23598) (not e!24905))))

(assert (=> b!39231 (= res!23598 (= (arrayCountValidKeys!0 (_keys!3264 lt!14678) #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))) (_size!165 lt!14678)))))

(declare-fun b!39232 () Bool)

(declare-fun res!23599 () Bool)

(assert (=> b!39232 (=> (not res!23599) (not e!24905))))

(assert (=> b!39232 (= res!23599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3264 lt!14678) (mask!5140 lt!14678)))))

(declare-fun b!39233 () Bool)

(assert (=> b!39233 (= e!24905 (arrayNoDuplicates!0 (_keys!3264 lt!14678) #b00000000000000000000000000000000 Nil!1037))))

(assert (= (and d!6533 res!23597) b!39231))

(assert (= (and b!39231 res!23598) b!39232))

(assert (= (and b!39232 res!23599) b!39233))

(declare-fun m!31899 () Bool)

(assert (=> d!6533 m!31899))

(declare-fun m!31901 () Bool)

(assert (=> b!39231 m!31901))

(declare-fun m!31903 () Bool)

(assert (=> b!39232 m!31903))

(declare-fun m!31905 () Bool)

(assert (=> b!39233 m!31905))

(assert (=> b!39071 d!6533))

(check-sat (not b!39185) (not d!6495) (not b!39205) (not bm!2984) (not b_lambda!2035) tp_is_empty!1747 (not b!39149) (not d!6533) (not b_next!1357) (not d!6531) (not b!39233) (not bm!2978) (not bm!2972) b_and!2331 (not d!6491) (not b!39151) (not d!6519) (not b!39232) (not b!39186) (not b!39231) (not b!39189))
(check-sat b_and!2331 (not b_next!1357))
(get-model)

(declare-fun d!6535 () Bool)

(assert (=> d!6535 (= (validKeyInArray!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)) (and (not (= (select (arr!1220 lt!14677) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1220 lt!14677) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39185 d!6535))

(assert (=> d!6531 d!6511))

(declare-fun d!6539 () Bool)

(assert (=> d!6539 (arrayNoDuplicates!0 lt!14677 #b00000000000000000000000000000000 Nil!1037)))

(assert (=> d!6539 true))

(declare-fun res!23607 () Unit!966)

(assert (=> d!6539 (= (choose!111 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1037) res!23607)))

(declare-fun bs!1636 () Bool)

(assert (= bs!1636 d!6539))

(assert (=> bs!1636 m!31755))

(assert (=> d!6531 d!6539))

(assert (=> b!39186 d!6535))

(declare-fun d!6545 () Bool)

(declare-fun res!23619 () Bool)

(declare-fun e!24917 () Bool)

(assert (=> d!6545 (=> (not res!23619) (not e!24917))))

(assert (=> d!6545 (= res!23619 (validMask!0 (mask!5140 lt!14678)))))

(assert (=> d!6545 (= (simpleValid!25 lt!14678) e!24917)))

(declare-fun b!39255 () Bool)

(declare-fun res!23620 () Bool)

(assert (=> b!39255 (=> (not res!23620) (not e!24917))))

(assert (=> b!39255 (= res!23620 (and (= (size!1343 (_values!1777 lt!14678)) (bvadd (mask!5140 lt!14678) #b00000000000000000000000000000001)) (= (size!1342 (_keys!3264 lt!14678)) (size!1343 (_values!1777 lt!14678))) (bvsge (_size!165 lt!14678) #b00000000000000000000000000000000) (bvsle (_size!165 lt!14678) (bvadd (mask!5140 lt!14678) #b00000000000000000000000000000001))))))

(declare-fun b!39256 () Bool)

(declare-fun res!23621 () Bool)

(assert (=> b!39256 (=> (not res!23621) (not e!24917))))

(declare-fun size!1360 (LongMapFixedSize!232) (_ BitVec 32))

(assert (=> b!39256 (= res!23621 (bvsge (size!1360 lt!14678) (_size!165 lt!14678)))))

(declare-fun b!39258 () Bool)

(assert (=> b!39258 (= e!24917 (and (bvsge (extraKeys!1685 lt!14678) #b00000000000000000000000000000000) (bvsle (extraKeys!1685 lt!14678) #b00000000000000000000000000000011) (bvsge (_vacant!165 lt!14678) #b00000000000000000000000000000000)))))

(declare-fun b!39257 () Bool)

(declare-fun res!23622 () Bool)

(assert (=> b!39257 (=> (not res!23622) (not e!24917))))

(assert (=> b!39257 (= res!23622 (= (size!1360 lt!14678) (bvadd (_size!165 lt!14678) (bvsdiv (bvadd (extraKeys!1685 lt!14678) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!6545 res!23619) b!39255))

(assert (= (and b!39255 res!23620) b!39256))

(assert (= (and b!39256 res!23621) b!39257))

(assert (= (and b!39257 res!23622) b!39258))

(declare-fun m!31929 () Bool)

(assert (=> d!6545 m!31929))

(declare-fun m!31931 () Bool)

(assert (=> b!39256 m!31931))

(assert (=> b!39257 m!31931))

(assert (=> d!6533 d!6545))

(declare-fun b!39259 () Bool)

(declare-fun e!24918 () (_ BitVec 32))

(declare-fun call!2991 () (_ BitVec 32))

(assert (=> b!39259 (= e!24918 (bvadd #b00000000000000000000000000000001 call!2991))))

(declare-fun bm!2988 () Bool)

(assert (=> bm!2988 (= call!2991 (arrayCountValidKeys!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39260 () Bool)

(declare-fun e!24919 () (_ BitVec 32))

(assert (=> b!39260 (= e!24919 #b00000000000000000000000000000000)))

(declare-fun b!39261 () Bool)

(assert (=> b!39261 (= e!24919 e!24918)))

(declare-fun c!4610 () Bool)

(assert (=> b!39261 (= c!4610 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6553 () Bool)

(declare-fun lt!14782 () (_ BitVec 32))

(assert (=> d!6553 (and (bvsge lt!14782 #b00000000000000000000000000000000) (bvsle lt!14782 (bvsub (size!1342 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6553 (= lt!14782 e!24919)))

(declare-fun c!4609 () Bool)

(assert (=> d!6553 (= c!4609 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6553 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1342 lt!14677)))))

(assert (=> d!6553 (= (arrayCountValidKeys!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14782)))

(declare-fun b!39262 () Bool)

(assert (=> b!39262 (= e!24918 call!2991)))

(assert (= (and d!6553 c!4609) b!39260))

(assert (= (and d!6553 (not c!4609)) b!39261))

(assert (= (and b!39261 c!4610) b!39259))

(assert (= (and b!39261 (not c!4610)) b!39262))

(assert (= (or b!39259 b!39262) bm!2988))

(declare-fun m!31933 () Bool)

(assert (=> bm!2988 m!31933))

(declare-fun m!31935 () Bool)

(assert (=> b!39261 m!31935))

(assert (=> b!39261 m!31935))

(declare-fun m!31937 () Bool)

(assert (=> b!39261 m!31937))

(assert (=> bm!2984 d!6553))

(declare-fun b!39271 () Bool)

(declare-fun e!24925 () Bool)

(declare-fun e!24924 () Bool)

(assert (=> b!39271 (= e!24925 e!24924)))

(declare-fun res!23631 () Bool)

(assert (=> b!39271 (=> (not res!23631) (not e!24924))))

(declare-fun e!24922 () Bool)

(assert (=> b!39271 (= res!23631 (not e!24922))))

(declare-fun res!23633 () Bool)

(assert (=> b!39271 (=> (not res!23633) (not e!24922))))

(assert (=> b!39271 (= res!23633 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39272 () Bool)

(declare-fun e!24923 () Bool)

(assert (=> b!39272 (= e!24924 e!24923)))

(declare-fun c!4611 () Bool)

(assert (=> b!39272 (= c!4611 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6555 () Bool)

(declare-fun res!23632 () Bool)

(assert (=> d!6555 (=> res!23632 e!24925)))

(assert (=> d!6555 (= res!23632 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(assert (=> d!6555 (= (arrayNoDuplicates!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) e!24925)))

(declare-fun b!39273 () Bool)

(declare-fun call!2992 () Bool)

(assert (=> b!39273 (= e!24923 call!2992)))

(declare-fun bm!2989 () Bool)

(assert (=> bm!2989 (= call!2992 (arrayNoDuplicates!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4611 (Cons!1036 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037))))))

(declare-fun b!39274 () Bool)

(assert (=> b!39274 (= e!24923 call!2992)))

(declare-fun b!39275 () Bool)

(assert (=> b!39275 (= e!24922 (contains!501 (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6555 (not res!23632)) b!39271))

(assert (= (and b!39271 res!23633) b!39275))

(assert (= (and b!39271 res!23631) b!39272))

(assert (= (and b!39272 c!4611) b!39274))

(assert (= (and b!39272 (not c!4611)) b!39273))

(assert (= (or b!39274 b!39273) bm!2989))

(assert (=> b!39271 m!31935))

(assert (=> b!39271 m!31935))

(assert (=> b!39271 m!31937))

(assert (=> b!39272 m!31935))

(assert (=> b!39272 m!31935))

(assert (=> b!39272 m!31937))

(assert (=> bm!2989 m!31935))

(declare-fun m!31939 () Bool)

(assert (=> bm!2989 m!31939))

(assert (=> b!39275 m!31935))

(assert (=> b!39275 m!31935))

(declare-fun m!31941 () Bool)

(assert (=> b!39275 m!31941))

(assert (=> bm!2978 d!6555))

(declare-fun b!39393 () Bool)

(declare-fun e!25011 () Unit!966)

(declare-fun lt!14911 () Unit!966)

(assert (=> b!39393 (= e!25011 lt!14911)))

(declare-fun lt!14895 () ListLongMap!1047)

(declare-fun getCurrentListMapNoExtraKeys!30 (array!2553 array!2555 (_ BitVec 32) (_ BitVec 32) V!2089 V!2089 (_ BitVec 32) Int) ListLongMap!1047)

(assert (=> b!39393 (= lt!14895 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)))))

(declare-fun lt!14898 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14898 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14908 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14908 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))

(declare-fun lt!14900 () Unit!966)

(declare-fun addStillContains!28 (ListLongMap!1047 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!966)

(assert (=> b!39393 (= lt!14900 (addStillContains!28 lt!14895 lt!14898 (zeroValue!1712 lt!14678) lt!14908))))

(declare-fun contains!503 (ListLongMap!1047 (_ BitVec 64)) Bool)

(declare-fun +!61 (ListLongMap!1047 tuple2!1482) ListLongMap!1047)

(assert (=> b!39393 (contains!503 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))) lt!14908)))

(declare-fun lt!14899 () Unit!966)

(assert (=> b!39393 (= lt!14899 lt!14900)))

(declare-fun lt!14909 () ListLongMap!1047)

(assert (=> b!39393 (= lt!14909 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)))))

(declare-fun lt!14914 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14913 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14913 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))

(declare-fun lt!14905 () Unit!966)

(declare-fun addApplyDifferent!28 (ListLongMap!1047 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!966)

(assert (=> b!39393 (= lt!14905 (addApplyDifferent!28 lt!14909 lt!14914 (minValue!1712 lt!14678) lt!14913))))

(declare-fun apply!52 (ListLongMap!1047 (_ BitVec 64)) V!2089)

(assert (=> b!39393 (= (apply!52 (+!61 lt!14909 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))) lt!14913) (apply!52 lt!14909 lt!14913))))

(declare-fun lt!14907 () Unit!966)

(assert (=> b!39393 (= lt!14907 lt!14905)))

(declare-fun lt!14901 () ListLongMap!1047)

(assert (=> b!39393 (= lt!14901 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)))))

(declare-fun lt!14912 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14897 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14897 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))

(declare-fun lt!14910 () Unit!966)

(assert (=> b!39393 (= lt!14910 (addApplyDifferent!28 lt!14901 lt!14912 (zeroValue!1712 lt!14678) lt!14897))))

(assert (=> b!39393 (= (apply!52 (+!61 lt!14901 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))) lt!14897) (apply!52 lt!14901 lt!14897))))

(declare-fun lt!14904 () Unit!966)

(assert (=> b!39393 (= lt!14904 lt!14910)))

(declare-fun lt!14894 () ListLongMap!1047)

(assert (=> b!39393 (= lt!14894 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)))))

(declare-fun lt!14902 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14902 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14906 () (_ BitVec 64))

(assert (=> b!39393 (= lt!14906 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))

(assert (=> b!39393 (= lt!14911 (addApplyDifferent!28 lt!14894 lt!14902 (minValue!1712 lt!14678) lt!14906))))

(assert (=> b!39393 (= (apply!52 (+!61 lt!14894 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))) lt!14906) (apply!52 lt!14894 lt!14906))))

(declare-fun b!39394 () Bool)

(declare-fun e!25009 () ListLongMap!1047)

(declare-fun call!3025 () ListLongMap!1047)

(assert (=> b!39394 (= e!25009 call!3025)))

(declare-fun b!39395 () Bool)

(declare-fun e!25003 () ListLongMap!1047)

(declare-fun call!3027 () ListLongMap!1047)

(assert (=> b!39395 (= e!25003 call!3027)))

(declare-fun b!39396 () Bool)

(declare-fun e!25002 () Bool)

(assert (=> b!39396 (= e!25002 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun b!39397 () Bool)

(declare-fun e!25012 () ListLongMap!1047)

(assert (=> b!39397 (= e!25012 e!25009)))

(declare-fun c!4648 () Bool)

(assert (=> b!39397 (= c!4648 (and (not (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!39398 () Bool)

(declare-fun e!25008 () Bool)

(declare-fun call!3026 () Bool)

(assert (=> b!39398 (= e!25008 (not call!3026))))

(declare-fun b!39399 () Bool)

(declare-fun res!23684 () Bool)

(declare-fun e!25007 () Bool)

(assert (=> b!39399 (=> (not res!23684) (not e!25007))))

(declare-fun e!25013 () Bool)

(assert (=> b!39399 (= res!23684 e!25013)))

(declare-fun res!23686 () Bool)

(assert (=> b!39399 (=> res!23686 e!25013)))

(assert (=> b!39399 (= res!23686 (not e!25002))))

(declare-fun res!23687 () Bool)

(assert (=> b!39399 (=> (not res!23687) (not e!25002))))

(assert (=> b!39399 (= res!23687 (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(declare-fun bm!3018 () Bool)

(declare-fun call!3024 () ListLongMap!1047)

(declare-fun call!3023 () ListLongMap!1047)

(assert (=> bm!3018 (= call!3024 call!3023)))

(declare-fun bm!3019 () Bool)

(declare-fun call!3022 () Bool)

(declare-fun lt!14903 () ListLongMap!1047)

(assert (=> bm!3019 (= call!3022 (contains!503 lt!14903 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!6557 () Bool)

(assert (=> d!6557 e!25007))

(declare-fun res!23689 () Bool)

(assert (=> d!6557 (=> (not res!23689) (not e!25007))))

(assert (=> d!6557 (= res!23689 (or (bvsge #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))))

(declare-fun lt!14896 () ListLongMap!1047)

(assert (=> d!6557 (= lt!14903 lt!14896)))

(declare-fun lt!14915 () Unit!966)

(assert (=> d!6557 (= lt!14915 e!25011)))

(declare-fun c!4647 () Bool)

(declare-fun e!25010 () Bool)

(assert (=> d!6557 (= c!4647 e!25010)))

(declare-fun res!23691 () Bool)

(assert (=> d!6557 (=> (not res!23691) (not e!25010))))

(assert (=> d!6557 (= res!23691 (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6557 (= lt!14896 e!25012)))

(declare-fun c!4651 () Bool)

(assert (=> d!6557 (= c!4651 (and (not (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!6557 (validMask!0 (mask!5140 lt!14678))))

(assert (=> d!6557 (= (getCurrentListMap!297 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)) lt!14903)))

(declare-fun bm!3020 () Bool)

(assert (=> bm!3020 (= call!3027 call!3024)))

(declare-fun b!39400 () Bool)

(declare-fun e!25005 () Bool)

(assert (=> b!39400 (= e!25005 (= (apply!52 lt!14903 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1712 lt!14678)))))

(declare-fun b!39401 () Bool)

(declare-fun e!25004 () Bool)

(declare-fun get!689 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39401 (= e!25004 (= (apply!52 lt!14903 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) (get!689 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1343 (_values!1777 lt!14678))))))

(assert (=> b!39401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39402 () Bool)

(assert (=> b!39402 (= e!25008 e!25005)))

(declare-fun res!23692 () Bool)

(assert (=> b!39402 (= res!23692 call!3026)))

(assert (=> b!39402 (=> (not res!23692) (not e!25005))))

(declare-fun b!39403 () Bool)

(declare-fun e!25006 () Bool)

(assert (=> b!39403 (= e!25006 (= (apply!52 lt!14903 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1712 lt!14678)))))

(declare-fun bm!3021 () Bool)

(assert (=> bm!3021 (= call!3023 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)))))

(declare-fun b!39404 () Bool)

(assert (=> b!39404 (= e!25013 e!25004)))

(declare-fun res!23688 () Bool)

(assert (=> b!39404 (=> (not res!23688) (not e!25004))))

(assert (=> b!39404 (= res!23688 (contains!503 lt!14903 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (=> b!39404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39405 () Bool)

(declare-fun e!25001 () Bool)

(assert (=> b!39405 (= e!25001 e!25006)))

(declare-fun res!23685 () Bool)

(assert (=> b!39405 (= res!23685 call!3022)))

(assert (=> b!39405 (=> (not res!23685) (not e!25006))))

(declare-fun b!39406 () Bool)

(declare-fun call!3021 () ListLongMap!1047)

(assert (=> b!39406 (= e!25012 (+!61 call!3021 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))

(declare-fun b!39407 () Bool)

(assert (=> b!39407 (= e!25003 call!3025)))

(declare-fun bm!3022 () Bool)

(assert (=> bm!3022 (= call!3021 (+!61 (ite c!4651 call!3023 (ite c!4648 call!3024 call!3027)) (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))

(declare-fun bm!3023 () Bool)

(assert (=> bm!3023 (= call!3026 (contains!503 lt!14903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39408 () Bool)

(assert (=> b!39408 (= e!25007 e!25001)))

(declare-fun c!4652 () Bool)

(assert (=> b!39408 (= c!4652 (not (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3024 () Bool)

(assert (=> bm!3024 (= call!3025 call!3021)))

(declare-fun b!39409 () Bool)

(assert (=> b!39409 (= e!25010 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun b!39410 () Bool)

(assert (=> b!39410 (= e!25001 (not call!3022))))

(declare-fun b!39411 () Bool)

(declare-fun Unit!972 () Unit!966)

(assert (=> b!39411 (= e!25011 Unit!972)))

(declare-fun b!39412 () Bool)

(declare-fun c!4649 () Bool)

(assert (=> b!39412 (= c!4649 (and (not (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!39412 (= e!25009 e!25003)))

(declare-fun b!39413 () Bool)

(declare-fun res!23690 () Bool)

(assert (=> b!39413 (=> (not res!23690) (not e!25007))))

(assert (=> b!39413 (= res!23690 e!25008)))

(declare-fun c!4650 () Bool)

(assert (=> b!39413 (= c!4650 (not (= (bvand (extraKeys!1685 lt!14678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!6557 c!4651) b!39406))

(assert (= (and d!6557 (not c!4651)) b!39397))

(assert (= (and b!39397 c!4648) b!39394))

(assert (= (and b!39397 (not c!4648)) b!39412))

(assert (= (and b!39412 c!4649) b!39407))

(assert (= (and b!39412 (not c!4649)) b!39395))

(assert (= (or b!39407 b!39395) bm!3020))

(assert (= (or b!39394 bm!3020) bm!3018))

(assert (= (or b!39394 b!39407) bm!3024))

(assert (= (or b!39406 bm!3018) bm!3021))

(assert (= (or b!39406 bm!3024) bm!3022))

(assert (= (and d!6557 res!23691) b!39409))

(assert (= (and d!6557 c!4647) b!39393))

(assert (= (and d!6557 (not c!4647)) b!39411))

(assert (= (and d!6557 res!23689) b!39399))

(assert (= (and b!39399 res!23687) b!39396))

(assert (= (and b!39399 (not res!23686)) b!39404))

(assert (= (and b!39404 res!23688) b!39401))

(assert (= (and b!39399 res!23684) b!39413))

(assert (= (and b!39413 c!4650) b!39402))

(assert (= (and b!39413 (not c!4650)) b!39398))

(assert (= (and b!39402 res!23692) b!39400))

(assert (= (or b!39402 b!39398) bm!3023))

(assert (= (and b!39413 res!23690) b!39408))

(assert (= (and b!39408 c!4652) b!39405))

(assert (= (and b!39408 (not c!4652)) b!39410))

(assert (= (and b!39405 res!23685) b!39403))

(assert (= (or b!39405 b!39410) bm!3019))

(declare-fun b_lambda!2037 () Bool)

(assert (=> (not b_lambda!2037) (not b!39401)))

(declare-fun tb!833 () Bool)

(declare-fun t!3890 () Bool)

(assert (=> (and start!5494 (= defaultEntry!470 (defaultEntry!1794 lt!14678)) t!3890) tb!833))

(declare-fun result!1429 () Bool)

(assert (=> tb!833 (= result!1429 tp_is_empty!1747)))

(assert (=> b!39401 t!3890))

(declare-fun b_and!2341 () Bool)

(assert (= b_and!2331 (and (=> t!3890 result!1429) b_and!2341)))

(declare-fun m!32001 () Bool)

(assert (=> b!39401 m!32001))

(declare-fun m!32003 () Bool)

(assert (=> b!39401 m!32003))

(declare-fun m!32005 () Bool)

(assert (=> b!39401 m!32005))

(declare-fun m!32007 () Bool)

(assert (=> b!39401 m!32007))

(assert (=> b!39401 m!32003))

(assert (=> b!39401 m!32001))

(assert (=> b!39401 m!32007))

(declare-fun m!32009 () Bool)

(assert (=> b!39401 m!32009))

(declare-fun m!32011 () Bool)

(assert (=> b!39400 m!32011))

(declare-fun m!32013 () Bool)

(assert (=> b!39406 m!32013))

(declare-fun m!32015 () Bool)

(assert (=> bm!3023 m!32015))

(declare-fun m!32017 () Bool)

(assert (=> bm!3021 m!32017))

(declare-fun m!32019 () Bool)

(assert (=> bm!3019 m!32019))

(declare-fun m!32021 () Bool)

(assert (=> b!39393 m!32021))

(declare-fun m!32023 () Bool)

(assert (=> b!39393 m!32023))

(declare-fun m!32025 () Bool)

(assert (=> b!39393 m!32025))

(declare-fun m!32027 () Bool)

(assert (=> b!39393 m!32027))

(declare-fun m!32029 () Bool)

(assert (=> b!39393 m!32029))

(assert (=> b!39393 m!32021))

(declare-fun m!32031 () Bool)

(assert (=> b!39393 m!32031))

(declare-fun m!32033 () Bool)

(assert (=> b!39393 m!32033))

(declare-fun m!32035 () Bool)

(assert (=> b!39393 m!32035))

(assert (=> b!39393 m!32025))

(declare-fun m!32037 () Bool)

(assert (=> b!39393 m!32037))

(declare-fun m!32039 () Bool)

(assert (=> b!39393 m!32039))

(assert (=> b!39393 m!32017))

(declare-fun m!32041 () Bool)

(assert (=> b!39393 m!32041))

(assert (=> b!39393 m!32007))

(declare-fun m!32043 () Bool)

(assert (=> b!39393 m!32043))

(declare-fun m!32045 () Bool)

(assert (=> b!39393 m!32045))

(assert (=> b!39393 m!32029))

(declare-fun m!32047 () Bool)

(assert (=> b!39393 m!32047))

(assert (=> b!39393 m!32043))

(declare-fun m!32049 () Bool)

(assert (=> b!39393 m!32049))

(assert (=> b!39396 m!32007))

(assert (=> b!39396 m!32007))

(declare-fun m!32051 () Bool)

(assert (=> b!39396 m!32051))

(assert (=> b!39409 m!32007))

(assert (=> b!39409 m!32007))

(assert (=> b!39409 m!32051))

(assert (=> b!39404 m!32007))

(assert (=> b!39404 m!32007))

(declare-fun m!32053 () Bool)

(assert (=> b!39404 m!32053))

(declare-fun m!32055 () Bool)

(assert (=> bm!3022 m!32055))

(assert (=> d!6557 m!31929))

(declare-fun m!32057 () Bool)

(assert (=> b!39403 m!32057))

(assert (=> d!6495 d!6557))

(declare-fun d!6591 () Bool)

(assert (=> d!6591 (arrayContainsKey!0 lt!14677 lt!14751 #b00000000000000000000000000000000)))

(declare-fun lt!14918 () Unit!966)

(declare-fun choose!13 (array!2553 (_ BitVec 64) (_ BitVec 32)) Unit!966)

(assert (=> d!6591 (= lt!14918 (choose!13 lt!14677 lt!14751 #b00000000000000000000000000000000))))

(assert (=> d!6591 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6591 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14677 lt!14751 #b00000000000000000000000000000000) lt!14918)))

(declare-fun bs!1643 () Bool)

(assert (= bs!1643 d!6591))

(assert (=> bs!1643 m!31847))

(declare-fun m!32059 () Bool)

(assert (=> bs!1643 m!32059))

(assert (=> b!39149 d!6591))

(declare-fun d!6593 () Bool)

(declare-fun res!23713 () Bool)

(declare-fun e!25034 () Bool)

(assert (=> d!6593 (=> res!23713 e!25034)))

(assert (=> d!6593 (= res!23713 (= (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14751))))

(assert (=> d!6593 (= (arrayContainsKey!0 lt!14677 lt!14751 #b00000000000000000000000000000000) e!25034)))

(declare-fun b!39442 () Bool)

(declare-fun e!25035 () Bool)

(assert (=> b!39442 (= e!25034 e!25035)))

(declare-fun res!23714 () Bool)

(assert (=> b!39442 (=> (not res!23714) (not e!25035))))

(assert (=> b!39442 (= res!23714 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(declare-fun b!39443 () Bool)

(assert (=> b!39443 (= e!25035 (arrayContainsKey!0 lt!14677 lt!14751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6593 (not res!23713)) b!39442))

(assert (= (and b!39442 res!23714) b!39443))

(assert (=> d!6593 m!31843))

(declare-fun m!32061 () Bool)

(assert (=> b!39443 m!32061))

(assert (=> b!39149 d!6593))

(declare-fun b!39544 () Bool)

(declare-fun c!4686 () Bool)

(declare-fun lt!14999 () (_ BitVec 64))

(assert (=> b!39544 (= c!4686 (= lt!14999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25096 () SeekEntryResult!177)

(declare-fun e!25095 () SeekEntryResult!177)

(assert (=> b!39544 (= e!25096 e!25095)))

(declare-fun b!39545 () Bool)

(declare-fun e!25094 () SeekEntryResult!177)

(assert (=> b!39545 (= e!25094 e!25096)))

(declare-fun lt!14998 () SeekEntryResult!177)

(assert (=> b!39545 (= lt!14999 (select (arr!1220 lt!14677) (index!2832 lt!14998)))))

(declare-fun c!4684 () Bool)

(assert (=> b!39545 (= c!4684 (= lt!14999 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun d!6595 () Bool)

(declare-fun lt!14997 () SeekEntryResult!177)

(get-info :version)

(assert (=> d!6595 (and (or ((_ is Undefined!177) lt!14997) (not ((_ is Found!177) lt!14997)) (and (bvsge (index!2831 lt!14997) #b00000000000000000000000000000000) (bvslt (index!2831 lt!14997) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!14997) ((_ is Found!177) lt!14997) (not ((_ is MissingZero!177) lt!14997)) (and (bvsge (index!2830 lt!14997) #b00000000000000000000000000000000) (bvslt (index!2830 lt!14997) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!14997) ((_ is Found!177) lt!14997) ((_ is MissingZero!177) lt!14997) (not ((_ is MissingVacant!177) lt!14997)) (and (bvsge (index!2833 lt!14997) #b00000000000000000000000000000000) (bvslt (index!2833 lt!14997) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!14997) (ite ((_ is Found!177) lt!14997) (= (select (arr!1220 lt!14677) (index!2831 lt!14997)) (select (arr!1220 lt!14677) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!177) lt!14997) (= (select (arr!1220 lt!14677) (index!2830 lt!14997)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!177) lt!14997) (= (select (arr!1220 lt!14677) (index!2833 lt!14997)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6595 (= lt!14997 e!25094)))

(declare-fun c!4685 () Bool)

(assert (=> d!6595 (= c!4685 (and ((_ is Intermediate!177) lt!14998) (undefined!989 lt!14998)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2553 (_ BitVec 32)) SeekEntryResult!177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6595 (= lt!14998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853) (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853))))

(assert (=> d!6595 (validMask!0 mask!853)))

(assert (=> d!6595 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853) lt!14997)))

(declare-fun b!39546 () Bool)

(assert (=> b!39546 (= e!25095 (MissingZero!177 (index!2832 lt!14998)))))

(declare-fun b!39547 () Bool)

(assert (=> b!39547 (= e!25096 (Found!177 (index!2832 lt!14998)))))

(declare-fun b!39548 () Bool)

(assert (=> b!39548 (= e!25094 Undefined!177)))

(declare-fun b!39549 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2553 (_ BitVec 32)) SeekEntryResult!177)

(assert (=> b!39549 (= e!25095 (seekKeyOrZeroReturnVacant!0 (x!7662 lt!14998) (index!2832 lt!14998) (index!2832 lt!14998) (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853))))

(assert (= (and d!6595 c!4685) b!39548))

(assert (= (and d!6595 (not c!4685)) b!39545))

(assert (= (and b!39545 c!4684) b!39547))

(assert (= (and b!39545 (not c!4684)) b!39544))

(assert (= (and b!39544 c!4686) b!39546))

(assert (= (and b!39544 (not c!4686)) b!39549))

(declare-fun m!32141 () Bool)

(assert (=> b!39545 m!32141))

(assert (=> d!6595 m!31843))

(declare-fun m!32143 () Bool)

(assert (=> d!6595 m!32143))

(declare-fun m!32145 () Bool)

(assert (=> d!6595 m!32145))

(declare-fun m!32147 () Bool)

(assert (=> d!6595 m!32147))

(assert (=> d!6595 m!32143))

(assert (=> d!6595 m!31843))

(declare-fun m!32149 () Bool)

(assert (=> d!6595 m!32149))

(declare-fun m!32151 () Bool)

(assert (=> d!6595 m!32151))

(assert (=> d!6595 m!31745))

(assert (=> b!39549 m!31843))

(declare-fun m!32153 () Bool)

(assert (=> b!39549 m!32153))

(assert (=> b!39149 d!6595))

(declare-fun b!39550 () Bool)

(declare-fun e!25097 () (_ BitVec 32))

(declare-fun call!3056 () (_ BitVec 32))

(assert (=> b!39550 (= e!25097 (bvadd #b00000000000000000000000000000001 call!3056))))

(declare-fun bm!3053 () Bool)

(assert (=> bm!3053 (= call!3056 (arrayCountValidKeys!0 (_keys!3264 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39551 () Bool)

(declare-fun e!25098 () (_ BitVec 32))

(assert (=> b!39551 (= e!25098 #b00000000000000000000000000000000)))

(declare-fun b!39552 () Bool)

(assert (=> b!39552 (= e!25098 e!25097)))

(declare-fun c!4688 () Bool)

(assert (=> b!39552 (= c!4688 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun d!6609 () Bool)

(declare-fun lt!15000 () (_ BitVec 32))

(assert (=> d!6609 (and (bvsge lt!15000 #b00000000000000000000000000000000) (bvsle lt!15000 (bvsub (size!1342 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (=> d!6609 (= lt!15000 e!25098)))

(declare-fun c!4687 () Bool)

(assert (=> d!6609 (= c!4687 (bvsge #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6609 (and (bvsle #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1342 (_keys!3264 lt!14678)) (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6609 (= (arrayCountValidKeys!0 (_keys!3264 lt!14678) #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))) lt!15000)))

(declare-fun b!39553 () Bool)

(assert (=> b!39553 (= e!25097 call!3056)))

(assert (= (and d!6609 c!4687) b!39551))

(assert (= (and d!6609 (not c!4687)) b!39552))

(assert (= (and b!39552 c!4688) b!39550))

(assert (= (and b!39552 (not c!4688)) b!39553))

(assert (= (or b!39550 b!39553) bm!3053))

(declare-fun m!32155 () Bool)

(assert (=> bm!3053 m!32155))

(assert (=> b!39552 m!32007))

(assert (=> b!39552 m!32007))

(assert (=> b!39552 m!32051))

(assert (=> b!39231 d!6609))

(assert (=> d!6491 d!6523))

(declare-fun d!6611 () Bool)

(assert (=> d!6611 (= (arrayCountValidKeys!0 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6611 true))

(declare-fun _$88!34 () Unit!966)

(assert (=> d!6611 (= (choose!59 lt!14677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!34)))

(declare-fun bs!1646 () Bool)

(assert (= bs!1646 d!6611))

(assert (=> bs!1646 m!31753))

(assert (=> d!6491 d!6611))

(assert (=> b!39205 d!6535))

(declare-fun b!39554 () Bool)

(declare-fun e!25101 () Bool)

(declare-fun e!25100 () Bool)

(assert (=> b!39554 (= e!25101 e!25100)))

(declare-fun lt!15004 () (_ BitVec 64))

(assert (=> b!39554 (= lt!15004 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))

(declare-fun lt!15006 () Unit!966)

(assert (=> b!39554 (= lt!15006 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3264 lt!14678) lt!15004 #b00000000000000000000000000000000))))

(assert (=> b!39554 (arrayContainsKey!0 (_keys!3264 lt!14678) lt!15004 #b00000000000000000000000000000000)))

(declare-fun lt!15005 () Unit!966)

(assert (=> b!39554 (= lt!15005 lt!15006)))

(declare-fun res!23761 () Bool)

(assert (=> b!39554 (= res!23761 (= (seekEntryOrOpen!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) (_keys!3264 lt!14678) (mask!5140 lt!14678)) (Found!177 #b00000000000000000000000000000000)))))

(assert (=> b!39554 (=> (not res!23761) (not e!25100))))

(declare-fun b!39555 () Bool)

(declare-fun call!3057 () Bool)

(assert (=> b!39555 (= e!25101 call!3057)))

(declare-fun b!39556 () Bool)

(declare-fun e!25099 () Bool)

(assert (=> b!39556 (= e!25099 e!25101)))

(declare-fun c!4689 () Bool)

(assert (=> b!39556 (= c!4689 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun bm!3054 () Bool)

(assert (=> bm!3054 (= call!3057 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3264 lt!14678) (mask!5140 lt!14678)))))

(declare-fun b!39557 () Bool)

(assert (=> b!39557 (= e!25100 call!3057)))

(declare-fun d!6615 () Bool)

(declare-fun res!23762 () Bool)

(assert (=> d!6615 (=> res!23762 e!25099)))

(assert (=> d!6615 (= res!23762 (bvsge #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6615 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3264 lt!14678) (mask!5140 lt!14678)) e!25099)))

(assert (= (and d!6615 (not res!23762)) b!39556))

(assert (= (and b!39556 c!4689) b!39554))

(assert (= (and b!39556 (not c!4689)) b!39555))

(assert (= (and b!39554 res!23761) b!39557))

(assert (= (or b!39557 b!39555) bm!3054))

(assert (=> b!39554 m!32007))

(declare-fun m!32159 () Bool)

(assert (=> b!39554 m!32159))

(declare-fun m!32161 () Bool)

(assert (=> b!39554 m!32161))

(assert (=> b!39554 m!32007))

(declare-fun m!32163 () Bool)

(assert (=> b!39554 m!32163))

(assert (=> b!39556 m!32007))

(assert (=> b!39556 m!32007))

(assert (=> b!39556 m!32051))

(declare-fun m!32165 () Bool)

(assert (=> bm!3054 m!32165))

(assert (=> b!39232 d!6615))

(declare-fun d!6617 () Bool)

(declare-fun lt!15031 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!30 (List!1040) (InoxSet (_ BitVec 64)))

(assert (=> d!6617 (= lt!15031 (select (content!30 Nil!1037) (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun e!25125 () Bool)

(assert (=> d!6617 (= lt!15031 e!25125)))

(declare-fun res!23782 () Bool)

(assert (=> d!6617 (=> (not res!23782) (not e!25125))))

(assert (=> d!6617 (= res!23782 ((_ is Cons!1036) Nil!1037))))

(assert (=> d!6617 (= (contains!501 Nil!1037 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)) lt!15031)))

(declare-fun b!39589 () Bool)

(declare-fun e!25126 () Bool)

(assert (=> b!39589 (= e!25125 e!25126)))

(declare-fun res!23783 () Bool)

(assert (=> b!39589 (=> res!23783 e!25126)))

(assert (=> b!39589 (= res!23783 (= (h!1607 Nil!1037) (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun b!39590 () Bool)

(assert (=> b!39590 (= e!25126 (contains!501 (t!3880 Nil!1037) (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(assert (= (and d!6617 res!23782) b!39589))

(assert (= (and b!39589 (not res!23783)) b!39590))

(declare-fun m!32169 () Bool)

(assert (=> d!6617 m!32169))

(assert (=> d!6617 m!31843))

(declare-fun m!32171 () Bool)

(assert (=> d!6617 m!32171))

(assert (=> b!39590 m!31843))

(declare-fun m!32173 () Bool)

(assert (=> b!39590 m!32173))

(assert (=> b!39189 d!6617))

(assert (=> b!39151 d!6535))

(declare-fun b!39591 () Bool)

(declare-fun e!25130 () Bool)

(declare-fun e!25129 () Bool)

(assert (=> b!39591 (= e!25130 e!25129)))

(declare-fun res!23784 () Bool)

(assert (=> b!39591 (=> (not res!23784) (not e!25129))))

(declare-fun e!25127 () Bool)

(assert (=> b!39591 (= res!23784 (not e!25127))))

(declare-fun res!23786 () Bool)

(assert (=> b!39591 (=> (not res!23786) (not e!25127))))

(assert (=> b!39591 (= res!23786 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun b!39592 () Bool)

(declare-fun e!25128 () Bool)

(assert (=> b!39592 (= e!25129 e!25128)))

(declare-fun c!4696 () Bool)

(assert (=> b!39592 (= c!4696 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun d!6621 () Bool)

(declare-fun res!23785 () Bool)

(assert (=> d!6621 (=> res!23785 e!25130)))

(assert (=> d!6621 (= res!23785 (bvsge #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6621 (= (arrayNoDuplicates!0 (_keys!3264 lt!14678) #b00000000000000000000000000000000 Nil!1037) e!25130)))

(declare-fun b!39593 () Bool)

(declare-fun call!3065 () Bool)

(assert (=> b!39593 (= e!25128 call!3065)))

(declare-fun bm!3062 () Bool)

(assert (=> bm!3062 (= call!3065 (arrayNoDuplicates!0 (_keys!3264 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4696 (Cons!1036 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) Nil!1037) Nil!1037)))))

(declare-fun b!39594 () Bool)

(assert (=> b!39594 (= e!25128 call!3065)))

(declare-fun b!39595 () Bool)

(assert (=> b!39595 (= e!25127 (contains!501 Nil!1037 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (= (and d!6621 (not res!23785)) b!39591))

(assert (= (and b!39591 res!23786) b!39595))

(assert (= (and b!39591 res!23784) b!39592))

(assert (= (and b!39592 c!4696) b!39594))

(assert (= (and b!39592 (not c!4696)) b!39593))

(assert (= (or b!39594 b!39593) bm!3062))

(assert (=> b!39591 m!32007))

(assert (=> b!39591 m!32007))

(assert (=> b!39591 m!32051))

(assert (=> b!39592 m!32007))

(assert (=> b!39592 m!32007))

(assert (=> b!39592 m!32051))

(assert (=> bm!3062 m!32007))

(declare-fun m!32175 () Bool)

(assert (=> bm!3062 m!32175))

(assert (=> b!39595 m!32007))

(assert (=> b!39595 m!32007))

(declare-fun m!32177 () Bool)

(assert (=> b!39595 m!32177))

(assert (=> b!39233 d!6621))

(assert (=> d!6519 d!6501))

(declare-fun d!6623 () Bool)

(assert (=> d!6623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14677 mask!853)))

(assert (=> d!6623 true))

(declare-fun _$30!48 () Unit!966)

(assert (=> d!6623 (= (choose!34 lt!14677 mask!853 #b00000000000000000000000000000000) _$30!48)))

(declare-fun bs!1647 () Bool)

(assert (= bs!1647 d!6623))

(assert (=> bs!1647 m!31747))

(assert (=> d!6519 d!6623))

(assert (=> d!6519 d!6485))

(declare-fun b!39600 () Bool)

(declare-fun e!25135 () Bool)

(declare-fun e!25134 () Bool)

(assert (=> b!39600 (= e!25135 e!25134)))

(declare-fun lt!15033 () (_ BitVec 64))

(assert (=> b!39600 (= lt!15033 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15035 () Unit!966)

(assert (=> b!39600 (= lt!15035 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14677 lt!15033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39600 (arrayContainsKey!0 lt!14677 lt!15033 #b00000000000000000000000000000000)))

(declare-fun lt!15034 () Unit!966)

(assert (=> b!39600 (= lt!15034 lt!15035)))

(declare-fun res!23787 () Bool)

(assert (=> b!39600 (= res!23787 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14677 mask!853) (Found!177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39600 (=> (not res!23787) (not e!25134))))

(declare-fun b!39601 () Bool)

(declare-fun call!3067 () Bool)

(assert (=> b!39601 (= e!25135 call!3067)))

(declare-fun b!39602 () Bool)

(declare-fun e!25133 () Bool)

(assert (=> b!39602 (= e!25133 e!25135)))

(declare-fun c!4699 () Bool)

(assert (=> b!39602 (= c!4699 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3064 () Bool)

(assert (=> bm!3064 (= call!3067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14677 mask!853))))

(declare-fun b!39603 () Bool)

(assert (=> b!39603 (= e!25134 call!3067)))

(declare-fun d!6627 () Bool)

(declare-fun res!23788 () Bool)

(assert (=> d!6627 (=> res!23788 e!25133)))

(assert (=> d!6627 (= res!23788 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(assert (=> d!6627 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14677 mask!853) e!25133)))

(assert (= (and d!6627 (not res!23788)) b!39602))

(assert (= (and b!39602 c!4699) b!39600))

(assert (= (and b!39602 (not c!4699)) b!39601))

(assert (= (and b!39600 res!23787) b!39603))

(assert (= (or b!39603 b!39601) bm!3064))

(assert (=> b!39600 m!31935))

(declare-fun m!32235 () Bool)

(assert (=> b!39600 m!32235))

(declare-fun m!32237 () Bool)

(assert (=> b!39600 m!32237))

(assert (=> b!39600 m!31935))

(declare-fun m!32239 () Bool)

(assert (=> b!39600 m!32239))

(assert (=> b!39602 m!31935))

(assert (=> b!39602 m!31935))

(assert (=> b!39602 m!31937))

(declare-fun m!32241 () Bool)

(assert (=> bm!3064 m!32241))

(assert (=> bm!2972 d!6627))

(check-sat (not d!6623) b_and!2341 (not bm!3054) (not b!39257) (not b!39256) (not b!39602) (not b_lambda!2035) (not b!39271) (not d!6539) (not b!39600) (not bm!3022) (not b!39393) (not b!39261) (not d!6557) (not d!6611) (not b!39272) (not b!39591) (not d!6617) (not b_lambda!2037) (not b!39396) (not bm!3064) (not bm!2989) (not b!39443) (not bm!3019) (not b!39595) (not b!39404) (not bm!3023) (not bm!3053) (not d!6545) (not b!39554) tp_is_empty!1747 (not bm!2988) (not b_next!1357) (not b!39592) (not d!6591) (not b!39549) (not d!6595) (not b!39590) (not b!39556) (not bm!3021) (not b!39552) (not b!39401) (not b!39275) (not b!39400) (not b!39409) (not b!39406) (not bm!3062) (not b!39403))
(check-sat b_and!2341 (not b_next!1357))
(get-model)

(declare-fun d!6631 () Bool)

(declare-fun e!25151 () Bool)

(assert (=> d!6631 e!25151))

(declare-fun res!23797 () Bool)

(assert (=> d!6631 (=> (not res!23797) (not e!25151))))

(declare-fun lt!15054 () ListLongMap!1047)

(assert (=> d!6631 (= res!23797 (contains!503 lt!15054 (_1!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))

(declare-fun lt!15055 () List!1039)

(assert (=> d!6631 (= lt!15054 (ListLongMap!1048 lt!15055))))

(declare-fun lt!15053 () Unit!966)

(declare-fun lt!15056 () Unit!966)

(assert (=> d!6631 (= lt!15053 lt!15056)))

(declare-datatypes ((Option!102 0))(
  ( (Some!101 (v!1988 V!2089)) (None!100) )
))
(declare-fun getValueByKey!96 (List!1039 (_ BitVec 64)) Option!102)

(assert (=> d!6631 (= (getValueByKey!96 lt!15055 (_1!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!23 (List!1039 (_ BitVec 64) V!2089) Unit!966)

(assert (=> d!6631 (= lt!15056 (lemmaContainsTupThenGetReturnValue!23 lt!15055 (_1!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))) (_2!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))

(declare-fun insertStrictlySorted!20 (List!1039 (_ BitVec 64) V!2089) List!1039)

(assert (=> d!6631 (= lt!15055 (insertStrictlySorted!20 (toList!539 call!3021) (_1!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))) (_2!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))

(assert (=> d!6631 (= (+!61 call!3021 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))) lt!15054)))

(declare-fun b!39631 () Bool)

(declare-fun res!23796 () Bool)

(assert (=> b!39631 (=> (not res!23796) (not e!25151))))

(assert (=> b!39631 (= res!23796 (= (getValueByKey!96 (toList!539 lt!15054) (_1!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))))

(declare-fun b!39632 () Bool)

(declare-fun contains!506 (List!1039 tuple2!1482) Bool)

(assert (=> b!39632 (= e!25151 (contains!506 (toList!539 lt!15054) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))

(assert (= (and d!6631 res!23797) b!39631))

(assert (= (and b!39631 res!23796) b!39632))

(declare-fun m!32261 () Bool)

(assert (=> d!6631 m!32261))

(declare-fun m!32263 () Bool)

(assert (=> d!6631 m!32263))

(declare-fun m!32265 () Bool)

(assert (=> d!6631 m!32265))

(declare-fun m!32267 () Bool)

(assert (=> d!6631 m!32267))

(declare-fun m!32269 () Bool)

(assert (=> b!39631 m!32269))

(declare-fun m!32271 () Bool)

(assert (=> b!39632 m!32271))

(assert (=> b!39406 d!6631))

(declare-fun d!6633 () Bool)

(declare-fun lt!15057 () Bool)

(assert (=> d!6633 (= lt!15057 (select (content!30 (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25152 () Bool)

(assert (=> d!6633 (= lt!15057 e!25152)))

(declare-fun res!23798 () Bool)

(assert (=> d!6633 (=> (not res!23798) (not e!25152))))

(assert (=> d!6633 (= res!23798 ((_ is Cons!1036) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)))))

(assert (=> d!6633 (= (contains!501 (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15057)))

(declare-fun b!39633 () Bool)

(declare-fun e!25153 () Bool)

(assert (=> b!39633 (= e!25152 e!25153)))

(declare-fun res!23799 () Bool)

(assert (=> b!39633 (=> res!23799 e!25153)))

(assert (=> b!39633 (= res!23799 (= (h!1607 (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39634 () Bool)

(assert (=> b!39634 (= e!25153 (contains!501 (t!3880 (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6633 res!23798) b!39633))

(assert (= (and b!39633 (not res!23799)) b!39634))

(declare-fun m!32273 () Bool)

(assert (=> d!6633 m!32273))

(assert (=> d!6633 m!31935))

(declare-fun m!32275 () Bool)

(assert (=> d!6633 m!32275))

(assert (=> b!39634 m!31935))

(declare-fun m!32277 () Bool)

(assert (=> b!39634 m!32277))

(assert (=> b!39275 d!6633))

(assert (=> d!6591 d!6593))

(declare-fun d!6635 () Bool)

(assert (=> d!6635 (arrayContainsKey!0 lt!14677 lt!14751 #b00000000000000000000000000000000)))

(assert (=> d!6635 true))

(declare-fun _$60!329 () Unit!966)

(assert (=> d!6635 (= (choose!13 lt!14677 lt!14751 #b00000000000000000000000000000000) _$60!329)))

(declare-fun bs!1648 () Bool)

(assert (= bs!1648 d!6635))

(assert (=> bs!1648 m!31847))

(assert (=> d!6591 d!6635))

(assert (=> d!6539 d!6511))

(declare-fun d!6637 () Bool)

(declare-fun e!25158 () Bool)

(assert (=> d!6637 e!25158))

(declare-fun res!23802 () Bool)

(assert (=> d!6637 (=> res!23802 e!25158)))

(declare-fun lt!15068 () Bool)

(assert (=> d!6637 (= res!23802 (not lt!15068))))

(declare-fun lt!15069 () Bool)

(assert (=> d!6637 (= lt!15068 lt!15069)))

(declare-fun lt!15066 () Unit!966)

(declare-fun e!25159 () Unit!966)

(assert (=> d!6637 (= lt!15066 e!25159)))

(declare-fun c!4712 () Bool)

(assert (=> d!6637 (= c!4712 lt!15069)))

(declare-fun containsKey!65 (List!1039 (_ BitVec 64)) Bool)

(assert (=> d!6637 (= lt!15069 (containsKey!65 (toList!539 lt!14903) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (=> d!6637 (= (contains!503 lt!14903 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) lt!15068)))

(declare-fun b!39641 () Bool)

(declare-fun lt!15067 () Unit!966)

(assert (=> b!39641 (= e!25159 lt!15067)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!53 (List!1039 (_ BitVec 64)) Unit!966)

(assert (=> b!39641 (= lt!15067 (lemmaContainsKeyImpliesGetValueByKeyDefined!53 (toList!539 lt!14903) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun isDefined!54 (Option!102) Bool)

(assert (=> b!39641 (isDefined!54 (getValueByKey!96 (toList!539 lt!14903) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun b!39642 () Bool)

(declare-fun Unit!975 () Unit!966)

(assert (=> b!39642 (= e!25159 Unit!975)))

(declare-fun b!39643 () Bool)

(assert (=> b!39643 (= e!25158 (isDefined!54 (getValueByKey!96 (toList!539 lt!14903) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))))

(assert (= (and d!6637 c!4712) b!39641))

(assert (= (and d!6637 (not c!4712)) b!39642))

(assert (= (and d!6637 (not res!23802)) b!39643))

(assert (=> d!6637 m!32007))

(declare-fun m!32279 () Bool)

(assert (=> d!6637 m!32279))

(assert (=> b!39641 m!32007))

(declare-fun m!32281 () Bool)

(assert (=> b!39641 m!32281))

(assert (=> b!39641 m!32007))

(declare-fun m!32283 () Bool)

(assert (=> b!39641 m!32283))

(assert (=> b!39641 m!32283))

(declare-fun m!32285 () Bool)

(assert (=> b!39641 m!32285))

(assert (=> b!39643 m!32007))

(assert (=> b!39643 m!32283))

(assert (=> b!39643 m!32283))

(assert (=> b!39643 m!32285))

(assert (=> b!39404 d!6637))

(declare-fun b!39644 () Bool)

(declare-fun e!25163 () Bool)

(declare-fun e!25162 () Bool)

(assert (=> b!39644 (= e!25163 e!25162)))

(declare-fun res!23803 () Bool)

(assert (=> b!39644 (=> (not res!23803) (not e!25162))))

(declare-fun e!25160 () Bool)

(assert (=> b!39644 (= res!23803 (not e!25160))))

(declare-fun res!23805 () Bool)

(assert (=> b!39644 (=> (not res!23805) (not e!25160))))

(assert (=> b!39644 (= res!23805 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39645 () Bool)

(declare-fun e!25161 () Bool)

(assert (=> b!39645 (= e!25162 e!25161)))

(declare-fun c!4713 () Bool)

(assert (=> b!39645 (= c!4713 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6639 () Bool)

(declare-fun res!23804 () Bool)

(assert (=> d!6639 (=> res!23804 e!25163)))

(assert (=> d!6639 (= res!23804 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(assert (=> d!6639 (= (arrayNoDuplicates!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4611 (Cons!1036 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037))) e!25163)))

(declare-fun b!39646 () Bool)

(declare-fun call!3069 () Bool)

(assert (=> b!39646 (= e!25161 call!3069)))

(declare-fun bm!3066 () Bool)

(assert (=> bm!3066 (= call!3069 (arrayNoDuplicates!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4713 (Cons!1036 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4611 (Cons!1036 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037))) (ite c!4611 (Cons!1036 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)))))))

(declare-fun b!39647 () Bool)

(assert (=> b!39647 (= e!25161 call!3069)))

(declare-fun b!39648 () Bool)

(assert (=> b!39648 (= e!25160 (contains!501 (ite c!4611 (Cons!1036 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (ite c!4597 (Cons!1036 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6639 (not res!23804)) b!39644))

(assert (= (and b!39644 res!23805) b!39648))

(assert (= (and b!39644 res!23803) b!39645))

(assert (= (and b!39645 c!4713) b!39647))

(assert (= (and b!39645 (not c!4713)) b!39646))

(assert (= (or b!39647 b!39646) bm!3066))

(declare-fun m!32287 () Bool)

(assert (=> b!39644 m!32287))

(assert (=> b!39644 m!32287))

(declare-fun m!32289 () Bool)

(assert (=> b!39644 m!32289))

(assert (=> b!39645 m!32287))

(assert (=> b!39645 m!32287))

(assert (=> b!39645 m!32289))

(assert (=> bm!3066 m!32287))

(declare-fun m!32291 () Bool)

(assert (=> bm!3066 m!32291))

(assert (=> b!39648 m!32287))

(assert (=> b!39648 m!32287))

(declare-fun m!32293 () Bool)

(assert (=> b!39648 m!32293))

(assert (=> bm!2989 d!6639))

(declare-fun d!6641 () Bool)

(assert (=> d!6641 (= (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39261 d!6641))

(declare-fun b!39649 () Bool)

(declare-fun e!25166 () Bool)

(declare-fun e!25165 () Bool)

(assert (=> b!39649 (= e!25166 e!25165)))

(declare-fun lt!15070 () (_ BitVec 64))

(assert (=> b!39649 (= lt!15070 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15072 () Unit!966)

(assert (=> b!39649 (= lt!15072 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14677 lt!15070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!39649 (arrayContainsKey!0 lt!14677 lt!15070 #b00000000000000000000000000000000)))

(declare-fun lt!15071 () Unit!966)

(assert (=> b!39649 (= lt!15071 lt!15072)))

(declare-fun res!23806 () Bool)

(assert (=> b!39649 (= res!23806 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14677 mask!853) (Found!177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!39649 (=> (not res!23806) (not e!25165))))

(declare-fun b!39650 () Bool)

(declare-fun call!3070 () Bool)

(assert (=> b!39650 (= e!25166 call!3070)))

(declare-fun b!39651 () Bool)

(declare-fun e!25164 () Bool)

(assert (=> b!39651 (= e!25164 e!25166)))

(declare-fun c!4714 () Bool)

(assert (=> b!39651 (= c!4714 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3067 () Bool)

(assert (=> bm!3067 (= call!3070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14677 mask!853))))

(declare-fun b!39652 () Bool)

(assert (=> b!39652 (= e!25165 call!3070)))

(declare-fun d!6643 () Bool)

(declare-fun res!23807 () Bool)

(assert (=> d!6643 (=> res!23807 e!25164)))

(assert (=> d!6643 (= res!23807 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(assert (=> d!6643 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14677 mask!853) e!25164)))

(assert (= (and d!6643 (not res!23807)) b!39651))

(assert (= (and b!39651 c!4714) b!39649))

(assert (= (and b!39651 (not c!4714)) b!39650))

(assert (= (and b!39649 res!23806) b!39652))

(assert (= (or b!39652 b!39650) bm!3067))

(assert (=> b!39649 m!32287))

(declare-fun m!32295 () Bool)

(assert (=> b!39649 m!32295))

(declare-fun m!32297 () Bool)

(assert (=> b!39649 m!32297))

(assert (=> b!39649 m!32287))

(declare-fun m!32299 () Bool)

(assert (=> b!39649 m!32299))

(assert (=> b!39651 m!32287))

(assert (=> b!39651 m!32287))

(assert (=> b!39651 m!32289))

(declare-fun m!32301 () Bool)

(assert (=> bm!3067 m!32301))

(assert (=> bm!3064 d!6643))

(declare-fun b!39677 () Bool)

(declare-fun e!25183 () ListLongMap!1047)

(declare-fun e!25185 () ListLongMap!1047)

(assert (=> b!39677 (= e!25183 e!25185)))

(declare-fun c!4725 () Bool)

(assert (=> b!39677 (= c!4725 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun b!39678 () Bool)

(declare-fun e!25182 () Bool)

(declare-fun e!25187 () Bool)

(assert (=> b!39678 (= e!25182 e!25187)))

(assert (=> b!39678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(declare-fun res!23819 () Bool)

(declare-fun lt!15089 () ListLongMap!1047)

(assert (=> b!39678 (= res!23819 (contains!503 lt!15089 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (=> b!39678 (=> (not res!23819) (not e!25187))))

(declare-fun b!39679 () Bool)

(declare-fun res!23817 () Bool)

(declare-fun e!25181 () Bool)

(assert (=> b!39679 (=> (not res!23817) (not e!25181))))

(assert (=> b!39679 (= res!23817 (not (contains!503 lt!15089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39680 () Bool)

(assert (=> b!39680 (= e!25183 (ListLongMap!1048 Nil!1036))))

(declare-fun d!6645 () Bool)

(assert (=> d!6645 e!25181))

(declare-fun res!23816 () Bool)

(assert (=> d!6645 (=> (not res!23816) (not e!25181))))

(assert (=> d!6645 (= res!23816 (not (contains!503 lt!15089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6645 (= lt!15089 e!25183)))

(declare-fun c!4723 () Bool)

(assert (=> d!6645 (= c!4723 (bvsge #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6645 (validMask!0 (mask!5140 lt!14678))))

(assert (=> d!6645 (= (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14678)) lt!15089)))

(declare-fun b!39681 () Bool)

(declare-fun e!25184 () Bool)

(assert (=> b!39681 (= e!25184 (= lt!15089 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1794 lt!14678))))))

(declare-fun b!39682 () Bool)

(declare-fun e!25186 () Bool)

(assert (=> b!39682 (= e!25186 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (=> b!39682 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!39683 () Bool)

(declare-fun isEmpty!229 (ListLongMap!1047) Bool)

(assert (=> b!39683 (= e!25184 (isEmpty!229 lt!15089))))

(declare-fun bm!3070 () Bool)

(declare-fun call!3073 () ListLongMap!1047)

(assert (=> bm!3070 (= call!3073 (getCurrentListMapNoExtraKeys!30 (_keys!3264 lt!14678) (_values!1777 lt!14678) (mask!5140 lt!14678) (extraKeys!1685 lt!14678) (zeroValue!1712 lt!14678) (minValue!1712 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1794 lt!14678)))))

(declare-fun b!39684 () Bool)

(assert (=> b!39684 (= e!25182 e!25184)))

(declare-fun c!4724 () Bool)

(assert (=> b!39684 (= c!4724 (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39685 () Bool)

(assert (=> b!39685 (= e!25181 e!25182)))

(declare-fun c!4726 () Bool)

(assert (=> b!39685 (= c!4726 e!25186)))

(declare-fun res!23818 () Bool)

(assert (=> b!39685 (=> (not res!23818) (not e!25186))))

(assert (=> b!39685 (= res!23818 (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39686 () Bool)

(declare-fun lt!15092 () Unit!966)

(declare-fun lt!15090 () Unit!966)

(assert (=> b!39686 (= lt!15092 lt!15090)))

(declare-fun lt!15088 () (_ BitVec 64))

(declare-fun lt!15087 () ListLongMap!1047)

(declare-fun lt!15093 () (_ BitVec 64))

(declare-fun lt!15091 () V!2089)

(assert (=> b!39686 (not (contains!503 (+!61 lt!15087 (tuple2!1483 lt!15088 lt!15091)) lt!15093))))

(declare-fun addStillNotContains!4 (ListLongMap!1047 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!966)

(assert (=> b!39686 (= lt!15090 (addStillNotContains!4 lt!15087 lt!15088 lt!15091 lt!15093))))

(assert (=> b!39686 (= lt!15093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!39686 (= lt!15091 (get!689 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39686 (= lt!15088 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))

(assert (=> b!39686 (= lt!15087 call!3073)))

(assert (=> b!39686 (= e!25185 (+!61 call!3073 (tuple2!1483 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) (get!689 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!39687 () Bool)

(assert (=> b!39687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1342 (_keys!3264 lt!14678))))))

(assert (=> b!39687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1343 (_values!1777 lt!14678))))))

(assert (=> b!39687 (= e!25187 (= (apply!52 lt!15089 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) (get!689 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!39688 () Bool)

(assert (=> b!39688 (= e!25185 call!3073)))

(assert (= (and d!6645 c!4723) b!39680))

(assert (= (and d!6645 (not c!4723)) b!39677))

(assert (= (and b!39677 c!4725) b!39686))

(assert (= (and b!39677 (not c!4725)) b!39688))

(assert (= (or b!39686 b!39688) bm!3070))

(assert (= (and d!6645 res!23816) b!39679))

(assert (= (and b!39679 res!23817) b!39685))

(assert (= (and b!39685 res!23818) b!39682))

(assert (= (and b!39685 c!4726) b!39678))

(assert (= (and b!39685 (not c!4726)) b!39684))

(assert (= (and b!39678 res!23819) b!39687))

(assert (= (and b!39684 c!4724) b!39681))

(assert (= (and b!39684 (not c!4724)) b!39683))

(declare-fun b_lambda!2043 () Bool)

(assert (=> (not b_lambda!2043) (not b!39686)))

(assert (=> b!39686 t!3890))

(declare-fun b_and!2347 () Bool)

(assert (= b_and!2341 (and (=> t!3890 result!1429) b_and!2347)))

(declare-fun b_lambda!2045 () Bool)

(assert (=> (not b_lambda!2045) (not b!39687)))

(assert (=> b!39687 t!3890))

(declare-fun b_and!2349 () Bool)

(assert (= b_and!2347 (and (=> t!3890 result!1429) b_and!2349)))

(declare-fun m!32303 () Bool)

(assert (=> b!39686 m!32303))

(assert (=> b!39686 m!32001))

(assert (=> b!39686 m!32003))

(assert (=> b!39686 m!32005))

(declare-fun m!32305 () Bool)

(assert (=> b!39686 m!32305))

(declare-fun m!32307 () Bool)

(assert (=> b!39686 m!32307))

(declare-fun m!32309 () Bool)

(assert (=> b!39686 m!32309))

(assert (=> b!39686 m!32305))

(assert (=> b!39686 m!32003))

(assert (=> b!39686 m!32007))

(assert (=> b!39686 m!32001))

(declare-fun m!32311 () Bool)

(assert (=> b!39681 m!32311))

(assert (=> b!39682 m!32007))

(assert (=> b!39682 m!32007))

(assert (=> b!39682 m!32051))

(assert (=> b!39687 m!32001))

(assert (=> b!39687 m!32003))

(assert (=> b!39687 m!32005))

(assert (=> b!39687 m!32003))

(assert (=> b!39687 m!32007))

(assert (=> b!39687 m!32001))

(assert (=> b!39687 m!32007))

(declare-fun m!32313 () Bool)

(assert (=> b!39687 m!32313))

(declare-fun m!32315 () Bool)

(assert (=> d!6645 m!32315))

(assert (=> d!6645 m!31929))

(assert (=> b!39678 m!32007))

(assert (=> b!39678 m!32007))

(declare-fun m!32317 () Bool)

(assert (=> b!39678 m!32317))

(declare-fun m!32319 () Bool)

(assert (=> b!39679 m!32319))

(assert (=> b!39677 m!32007))

(assert (=> b!39677 m!32007))

(assert (=> b!39677 m!32051))

(assert (=> bm!3070 m!32311))

(declare-fun m!32321 () Bool)

(assert (=> b!39683 m!32321))

(assert (=> bm!3021 d!6645))

(assert (=> b!39602 d!6641))

(declare-fun b!39707 () Bool)

(declare-fun e!25198 () SeekEntryResult!177)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39707 (= e!25198 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853))))

(declare-fun b!39708 () Bool)

(declare-fun e!25200 () Bool)

(declare-fun e!25201 () Bool)

(assert (=> b!39708 (= e!25200 e!25201)))

(declare-fun res!23826 () Bool)

(declare-fun lt!15099 () SeekEntryResult!177)

(assert (=> b!39708 (= res!23826 (and ((_ is Intermediate!177) lt!15099) (not (undefined!989 lt!15099)) (bvslt (x!7662 lt!15099) #b01111111111111111111111111111110) (bvsge (x!7662 lt!15099) #b00000000000000000000000000000000) (bvsge (x!7662 lt!15099) #b00000000000000000000000000000000)))))

(assert (=> b!39708 (=> (not res!23826) (not e!25201))))

(declare-fun b!39709 () Bool)

(declare-fun e!25199 () SeekEntryResult!177)

(assert (=> b!39709 (= e!25199 e!25198)))

(declare-fun c!4735 () Bool)

(declare-fun lt!15098 () (_ BitVec 64))

(assert (=> b!39709 (= c!4735 (or (= lt!15098 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)) (= (bvadd lt!15098 lt!15098) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!6647 () Bool)

(assert (=> d!6647 e!25200))

(declare-fun c!4734 () Bool)

(assert (=> d!6647 (= c!4734 (and ((_ is Intermediate!177) lt!15099) (undefined!989 lt!15099)))))

(assert (=> d!6647 (= lt!15099 e!25199)))

(declare-fun c!4733 () Bool)

(assert (=> d!6647 (= c!4733 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6647 (= lt!15098 (select (arr!1220 lt!14677) (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6647 (validMask!0 mask!853)))

(assert (=> d!6647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853) (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853) lt!15099)))

(declare-fun b!39710 () Bool)

(assert (=> b!39710 (and (bvsge (index!2832 lt!15099) #b00000000000000000000000000000000) (bvslt (index!2832 lt!15099) (size!1342 lt!14677)))))

(declare-fun res!23828 () Bool)

(assert (=> b!39710 (= res!23828 (= (select (arr!1220 lt!14677) (index!2832 lt!15099)) (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun e!25202 () Bool)

(assert (=> b!39710 (=> res!23828 e!25202)))

(assert (=> b!39710 (= e!25201 e!25202)))

(declare-fun b!39711 () Bool)

(assert (=> b!39711 (= e!25198 (Intermediate!177 false (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39712 () Bool)

(assert (=> b!39712 (= e!25200 (bvsge (x!7662 lt!15099) #b01111111111111111111111111111110))))

(declare-fun b!39713 () Bool)

(assert (=> b!39713 (and (bvsge (index!2832 lt!15099) #b00000000000000000000000000000000) (bvslt (index!2832 lt!15099) (size!1342 lt!14677)))))

(declare-fun res!23827 () Bool)

(assert (=> b!39713 (= res!23827 (= (select (arr!1220 lt!14677) (index!2832 lt!15099)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39713 (=> res!23827 e!25202)))

(declare-fun b!39714 () Bool)

(assert (=> b!39714 (and (bvsge (index!2832 lt!15099) #b00000000000000000000000000000000) (bvslt (index!2832 lt!15099) (size!1342 lt!14677)))))

(assert (=> b!39714 (= e!25202 (= (select (arr!1220 lt!14677) (index!2832 lt!15099)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39715 () Bool)

(assert (=> b!39715 (= e!25199 (Intermediate!177 true (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!6647 c!4733) b!39715))

(assert (= (and d!6647 (not c!4733)) b!39709))

(assert (= (and b!39709 c!4735) b!39711))

(assert (= (and b!39709 (not c!4735)) b!39707))

(assert (= (and d!6647 c!4734) b!39712))

(assert (= (and d!6647 (not c!4734)) b!39708))

(assert (= (and b!39708 res!23826) b!39710))

(assert (= (and b!39710 (not res!23828)) b!39713))

(assert (= (and b!39713 (not res!23827)) b!39714))

(declare-fun m!32323 () Bool)

(assert (=> b!39713 m!32323))

(assert (=> b!39714 m!32323))

(assert (=> b!39707 m!32143))

(declare-fun m!32325 () Bool)

(assert (=> b!39707 m!32325))

(assert (=> b!39707 m!32325))

(assert (=> b!39707 m!31843))

(declare-fun m!32327 () Bool)

(assert (=> b!39707 m!32327))

(assert (=> d!6647 m!32143))

(declare-fun m!32329 () Bool)

(assert (=> d!6647 m!32329))

(assert (=> d!6647 m!31745))

(assert (=> b!39710 m!32323))

(assert (=> d!6595 d!6647))

(declare-fun d!6649 () Bool)

(declare-fun lt!15105 () (_ BitVec 32))

(declare-fun lt!15104 () (_ BitVec 32))

(assert (=> d!6649 (= lt!15105 (bvmul (bvxor lt!15104 (bvlshr lt!15104 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6649 (= lt!15104 ((_ extract 31 0) (bvand (bvxor (select (arr!1220 lt!14677) #b00000000000000000000000000000000) (bvlshr (select (arr!1220 lt!14677) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6649 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23829 (let ((h!1612 ((_ extract 31 0) (bvand (bvxor (select (arr!1220 lt!14677) #b00000000000000000000000000000000) (bvlshr (select (arr!1220 lt!14677) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7681 (bvmul (bvxor h!1612 (bvlshr h!1612 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7681 (bvlshr x!7681 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23829 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23829 #b00000000000000000000000000000000))))))

(assert (=> d!6649 (= (toIndex!0 (select (arr!1220 lt!14677) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15105 (bvlshr lt!15105 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6595 d!6649))

(assert (=> d!6595 d!6485))

(declare-fun d!6651 () Bool)

(declare-fun get!692 (Option!102) V!2089)

(assert (=> d!6651 (= (apply!52 lt!14903 #b1000000000000000000000000000000000000000000000000000000000000000) (get!692 (getValueByKey!96 (toList!539 lt!14903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1649 () Bool)

(assert (= bs!1649 d!6651))

(declare-fun m!32331 () Bool)

(assert (=> bs!1649 m!32331))

(assert (=> bs!1649 m!32331))

(declare-fun m!32333 () Bool)

(assert (=> bs!1649 m!32333))

(assert (=> b!39403 d!6651))

(assert (=> b!39272 d!6641))

(declare-fun b!39716 () Bool)

(declare-fun e!25203 () (_ BitVec 32))

(declare-fun call!3074 () (_ BitVec 32))

(assert (=> b!39716 (= e!25203 (bvadd #b00000000000000000000000000000001 call!3074))))

(declare-fun bm!3071 () Bool)

(assert (=> bm!3071 (= call!3074 (arrayCountValidKeys!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39717 () Bool)

(declare-fun e!25204 () (_ BitVec 32))

(assert (=> b!39717 (= e!25204 #b00000000000000000000000000000000)))

(declare-fun b!39718 () Bool)

(assert (=> b!39718 (= e!25204 e!25203)))

(declare-fun c!4737 () Bool)

(assert (=> b!39718 (= c!4737 (validKeyInArray!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6655 () Bool)

(declare-fun lt!15106 () (_ BitVec 32))

(assert (=> d!6655 (and (bvsge lt!15106 #b00000000000000000000000000000000) (bvsle lt!15106 (bvsub (size!1342 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6655 (= lt!15106 e!25204)))

(declare-fun c!4736 () Bool)

(assert (=> d!6655 (= c!4736 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6655 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1342 lt!14677)))))

(assert (=> d!6655 (= (arrayCountValidKeys!0 lt!14677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15106)))

(declare-fun b!39719 () Bool)

(assert (=> b!39719 (= e!25203 call!3074)))

(assert (= (and d!6655 c!4736) b!39717))

(assert (= (and d!6655 (not c!4736)) b!39718))

(assert (= (and b!39718 c!4737) b!39716))

(assert (= (and b!39718 (not c!4737)) b!39719))

(assert (= (or b!39716 b!39719) bm!3071))

(declare-fun m!32335 () Bool)

(assert (=> bm!3071 m!32335))

(assert (=> b!39718 m!32287))

(assert (=> b!39718 m!32287))

(assert (=> b!39718 m!32289))

(assert (=> bm!2988 d!6655))

(assert (=> d!6611 d!6523))

(assert (=> b!39271 d!6641))

(declare-fun d!6657 () Bool)

(assert (=> d!6657 (arrayContainsKey!0 lt!14677 lt!15033 #b00000000000000000000000000000000)))

(declare-fun lt!15107 () Unit!966)

(assert (=> d!6657 (= lt!15107 (choose!13 lt!14677 lt!15033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6657 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6657 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14677 lt!15033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15107)))

(declare-fun bs!1650 () Bool)

(assert (= bs!1650 d!6657))

(assert (=> bs!1650 m!32237))

(declare-fun m!32337 () Bool)

(assert (=> bs!1650 m!32337))

(assert (=> b!39600 d!6657))

(declare-fun d!6659 () Bool)

(declare-fun res!23830 () Bool)

(declare-fun e!25205 () Bool)

(assert (=> d!6659 (=> res!23830 e!25205)))

(assert (=> d!6659 (= res!23830 (= (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!15033))))

(assert (=> d!6659 (= (arrayContainsKey!0 lt!14677 lt!15033 #b00000000000000000000000000000000) e!25205)))

(declare-fun b!39720 () Bool)

(declare-fun e!25206 () Bool)

(assert (=> b!39720 (= e!25205 e!25206)))

(declare-fun res!23831 () Bool)

(assert (=> b!39720 (=> (not res!23831) (not e!25206))))

(assert (=> b!39720 (= res!23831 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(declare-fun b!39721 () Bool)

(assert (=> b!39721 (= e!25206 (arrayContainsKey!0 lt!14677 lt!15033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6659 (not res!23830)) b!39720))

(assert (= (and b!39720 res!23831) b!39721))

(assert (=> d!6659 m!31843))

(declare-fun m!32339 () Bool)

(assert (=> b!39721 m!32339))

(assert (=> b!39600 d!6659))

(declare-fun b!39722 () Bool)

(declare-fun c!4740 () Bool)

(declare-fun lt!15110 () (_ BitVec 64))

(assert (=> b!39722 (= c!4740 (= lt!15110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25209 () SeekEntryResult!177)

(declare-fun e!25208 () SeekEntryResult!177)

(assert (=> b!39722 (= e!25209 e!25208)))

(declare-fun b!39723 () Bool)

(declare-fun e!25207 () SeekEntryResult!177)

(assert (=> b!39723 (= e!25207 e!25209)))

(declare-fun lt!15109 () SeekEntryResult!177)

(assert (=> b!39723 (= lt!15110 (select (arr!1220 lt!14677) (index!2832 lt!15109)))))

(declare-fun c!4738 () Bool)

(assert (=> b!39723 (= c!4738 (= lt!15110 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6661 () Bool)

(declare-fun lt!15108 () SeekEntryResult!177)

(assert (=> d!6661 (and (or ((_ is Undefined!177) lt!15108) (not ((_ is Found!177) lt!15108)) (and (bvsge (index!2831 lt!15108) #b00000000000000000000000000000000) (bvslt (index!2831 lt!15108) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!15108) ((_ is Found!177) lt!15108) (not ((_ is MissingZero!177) lt!15108)) (and (bvsge (index!2830 lt!15108) #b00000000000000000000000000000000) (bvslt (index!2830 lt!15108) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!15108) ((_ is Found!177) lt!15108) ((_ is MissingZero!177) lt!15108) (not ((_ is MissingVacant!177) lt!15108)) (and (bvsge (index!2833 lt!15108) #b00000000000000000000000000000000) (bvslt (index!2833 lt!15108) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!15108) (ite ((_ is Found!177) lt!15108) (= (select (arr!1220 lt!14677) (index!2831 lt!15108)) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!177) lt!15108) (= (select (arr!1220 lt!14677) (index!2830 lt!15108)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!177) lt!15108) (= (select (arr!1220 lt!14677) (index!2833 lt!15108)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6661 (= lt!15108 e!25207)))

(declare-fun c!4739 () Bool)

(assert (=> d!6661 (= c!4739 (and ((_ is Intermediate!177) lt!15109) (undefined!989 lt!15109)))))

(assert (=> d!6661 (= lt!15109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14677 mask!853))))

(assert (=> d!6661 (validMask!0 mask!853)))

(assert (=> d!6661 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14677 mask!853) lt!15108)))

(declare-fun b!39724 () Bool)

(assert (=> b!39724 (= e!25208 (MissingZero!177 (index!2832 lt!15109)))))

(declare-fun b!39725 () Bool)

(assert (=> b!39725 (= e!25209 (Found!177 (index!2832 lt!15109)))))

(declare-fun b!39726 () Bool)

(assert (=> b!39726 (= e!25207 Undefined!177)))

(declare-fun b!39727 () Bool)

(assert (=> b!39727 (= e!25208 (seekKeyOrZeroReturnVacant!0 (x!7662 lt!15109) (index!2832 lt!15109) (index!2832 lt!15109) (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14677 mask!853))))

(assert (= (and d!6661 c!4739) b!39726))

(assert (= (and d!6661 (not c!4739)) b!39723))

(assert (= (and b!39723 c!4738) b!39725))

(assert (= (and b!39723 (not c!4738)) b!39722))

(assert (= (and b!39722 c!4740) b!39724))

(assert (= (and b!39722 (not c!4740)) b!39727))

(declare-fun m!32341 () Bool)

(assert (=> b!39723 m!32341))

(assert (=> d!6661 m!31935))

(declare-fun m!32343 () Bool)

(assert (=> d!6661 m!32343))

(declare-fun m!32345 () Bool)

(assert (=> d!6661 m!32345))

(declare-fun m!32347 () Bool)

(assert (=> d!6661 m!32347))

(assert (=> d!6661 m!32343))

(assert (=> d!6661 m!31935))

(declare-fun m!32349 () Bool)

(assert (=> d!6661 m!32349))

(declare-fun m!32351 () Bool)

(assert (=> d!6661 m!32351))

(assert (=> d!6661 m!31745))

(assert (=> b!39727 m!31935))

(declare-fun m!32353 () Bool)

(assert (=> b!39727 m!32353))

(assert (=> b!39600 d!6661))

(declare-fun d!6663 () Bool)

(assert (=> d!6663 (= (apply!52 lt!14903 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) (get!692 (getValueByKey!96 (toList!539 lt!14903) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000))))))

(declare-fun bs!1651 () Bool)

(assert (= bs!1651 d!6663))

(assert (=> bs!1651 m!32007))

(assert (=> bs!1651 m!32283))

(assert (=> bs!1651 m!32283))

(declare-fun m!32355 () Bool)

(assert (=> bs!1651 m!32355))

(assert (=> b!39401 d!6663))

(declare-fun d!6665 () Bool)

(declare-fun c!4743 () Bool)

(assert (=> d!6665 (= c!4743 ((_ is ValueCellFull!626) (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun e!25212 () V!2089)

(assert (=> d!6665 (= (get!689 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000)) e!25212)))

(declare-fun b!39732 () Bool)

(declare-fun get!693 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39732 (= e!25212 (get!693 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39733 () Bool)

(declare-fun get!694 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39733 (= e!25212 (get!694 (select (arr!1221 (_values!1777 lt!14678)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1794 lt!14678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6665 c!4743) b!39732))

(assert (= (and d!6665 (not c!4743)) b!39733))

(assert (=> b!39732 m!32001))

(assert (=> b!39732 m!32003))

(declare-fun m!32357 () Bool)

(assert (=> b!39732 m!32357))

(assert (=> b!39733 m!32001))

(assert (=> b!39733 m!32003))

(declare-fun m!32359 () Bool)

(assert (=> b!39733 m!32359))

(assert (=> b!39401 d!6665))

(declare-fun d!6667 () Bool)

(declare-fun lt!15111 () Bool)

(assert (=> d!6667 (= lt!15111 (select (content!30 Nil!1037) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun e!25213 () Bool)

(assert (=> d!6667 (= lt!15111 e!25213)))

(declare-fun res!23832 () Bool)

(assert (=> d!6667 (=> (not res!23832) (not e!25213))))

(assert (=> d!6667 (= res!23832 ((_ is Cons!1036) Nil!1037))))

(assert (=> d!6667 (= (contains!501 Nil!1037 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) lt!15111)))

(declare-fun b!39734 () Bool)

(declare-fun e!25214 () Bool)

(assert (=> b!39734 (= e!25213 e!25214)))

(declare-fun res!23833 () Bool)

(assert (=> b!39734 (=> res!23833 e!25214)))

(assert (=> b!39734 (= res!23833 (= (h!1607 Nil!1037) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun b!39735 () Bool)

(assert (=> b!39735 (= e!25214 (contains!501 (t!3880 Nil!1037) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(assert (= (and d!6667 res!23832) b!39734))

(assert (= (and b!39734 (not res!23833)) b!39735))

(assert (=> d!6667 m!32169))

(assert (=> d!6667 m!32007))

(declare-fun m!32361 () Bool)

(assert (=> d!6667 m!32361))

(assert (=> b!39735 m!32007))

(declare-fun m!32363 () Bool)

(assert (=> b!39735 m!32363))

(assert (=> b!39595 d!6667))

(declare-fun d!6669 () Bool)

(assert (=> d!6669 (= (apply!52 lt!14903 #b0000000000000000000000000000000000000000000000000000000000000000) (get!692 (getValueByKey!96 (toList!539 lt!14903) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1652 () Bool)

(assert (= bs!1652 d!6669))

(declare-fun m!32365 () Bool)

(assert (=> bs!1652 m!32365))

(assert (=> bs!1652 m!32365))

(declare-fun m!32367 () Bool)

(assert (=> bs!1652 m!32367))

(assert (=> b!39400 d!6669))

(declare-fun d!6671 () Bool)

(assert (not d!6671))

(assert (=> b!39590 d!6671))

(assert (=> d!6623 d!6501))

(declare-fun d!6673 () Bool)

(declare-fun res!23836 () Bool)

(declare-fun e!25219 () Bool)

(assert (=> d!6673 (=> res!23836 e!25219)))

(assert (=> d!6673 (= res!23836 (= (select (arr!1220 lt!14677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14751))))

(assert (=> d!6673 (= (arrayContainsKey!0 lt!14677 lt!14751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25219)))

(declare-fun b!39742 () Bool)

(declare-fun e!25220 () Bool)

(assert (=> b!39742 (= e!25219 e!25220)))

(declare-fun res!23837 () Bool)

(assert (=> b!39742 (=> (not res!23837) (not e!25220))))

(assert (=> b!39742 (= res!23837 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1342 lt!14677)))))

(declare-fun b!39743 () Bool)

(assert (=> b!39743 (= e!25220 (arrayContainsKey!0 lt!14677 lt!14751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6673 (not res!23836)) b!39742))

(assert (= (and b!39742 res!23837) b!39743))

(assert (=> d!6673 m!31935))

(declare-fun m!32369 () Bool)

(assert (=> b!39743 m!32369))

(assert (=> b!39443 d!6673))

(declare-fun b!39744 () Bool)

(declare-fun e!25224 () Bool)

(declare-fun e!25223 () Bool)

(assert (=> b!39744 (= e!25224 e!25223)))

(declare-fun res!23838 () Bool)

(assert (=> b!39744 (=> (not res!23838) (not e!25223))))

(declare-fun e!25221 () Bool)

(assert (=> b!39744 (= res!23838 (not e!25221))))

(declare-fun res!23840 () Bool)

(assert (=> b!39744 (=> (not res!23840) (not e!25221))))

(assert (=> b!39744 (= res!23840 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39745 () Bool)

(declare-fun e!25222 () Bool)

(assert (=> b!39745 (= e!25223 e!25222)))

(declare-fun c!4746 () Bool)

(assert (=> b!39745 (= c!4746 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6675 () Bool)

(declare-fun res!23839 () Bool)

(assert (=> d!6675 (=> res!23839 e!25224)))

(assert (=> d!6675 (= res!23839 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6675 (= (arrayNoDuplicates!0 (_keys!3264 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4696 (Cons!1036 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) e!25224)))

(declare-fun b!39746 () Bool)

(declare-fun call!3075 () Bool)

(assert (=> b!39746 (= e!25222 call!3075)))

(declare-fun bm!3072 () Bool)

(assert (=> bm!3072 (= call!3075 (arrayNoDuplicates!0 (_keys!3264 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4746 (Cons!1036 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4696 (Cons!1036 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) Nil!1037) Nil!1037)) (ite c!4696 (Cons!1036 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) Nil!1037) Nil!1037))))))

(declare-fun b!39747 () Bool)

(assert (=> b!39747 (= e!25222 call!3075)))

(declare-fun b!39748 () Bool)

(assert (=> b!39748 (= e!25221 (contains!501 (ite c!4696 (Cons!1036 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) Nil!1037) Nil!1037) (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6675 (not res!23839)) b!39744))

(assert (= (and b!39744 res!23840) b!39748))

(assert (= (and b!39744 res!23838) b!39745))

(assert (= (and b!39745 c!4746) b!39747))

(assert (= (and b!39745 (not c!4746)) b!39746))

(assert (= (or b!39747 b!39746) bm!3072))

(declare-fun m!32371 () Bool)

(assert (=> b!39744 m!32371))

(assert (=> b!39744 m!32371))

(declare-fun m!32373 () Bool)

(assert (=> b!39744 m!32373))

(assert (=> b!39745 m!32371))

(assert (=> b!39745 m!32371))

(assert (=> b!39745 m!32373))

(assert (=> bm!3072 m!32371))

(declare-fun m!32383 () Bool)

(assert (=> bm!3072 m!32383))

(assert (=> b!39748 m!32371))

(assert (=> b!39748 m!32371))

(declare-fun m!32385 () Bool)

(assert (=> b!39748 m!32385))

(assert (=> bm!3062 d!6675))

(declare-fun d!6679 () Bool)

(declare-fun e!25227 () Bool)

(assert (=> d!6679 e!25227))

(declare-fun res!23842 () Bool)

(assert (=> d!6679 (=> res!23842 e!25227)))

(declare-fun lt!15126 () Bool)

(assert (=> d!6679 (= res!23842 (not lt!15126))))

(declare-fun lt!15127 () Bool)

(assert (=> d!6679 (= lt!15126 lt!15127)))

(declare-fun lt!15124 () Unit!966)

(declare-fun e!25228 () Unit!966)

(assert (=> d!6679 (= lt!15124 e!25228)))

(declare-fun c!4748 () Bool)

(assert (=> d!6679 (= c!4748 lt!15127)))

(assert (=> d!6679 (= lt!15127 (containsKey!65 (toList!539 lt!14903) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6679 (= (contains!503 lt!14903 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15126)))

(declare-fun b!39752 () Bool)

(declare-fun lt!15125 () Unit!966)

(assert (=> b!39752 (= e!25228 lt!15125)))

(assert (=> b!39752 (= lt!15125 (lemmaContainsKeyImpliesGetValueByKeyDefined!53 (toList!539 lt!14903) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39752 (isDefined!54 (getValueByKey!96 (toList!539 lt!14903) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39753 () Bool)

(declare-fun Unit!977 () Unit!966)

(assert (=> b!39753 (= e!25228 Unit!977)))

(declare-fun b!39754 () Bool)

(assert (=> b!39754 (= e!25227 (isDefined!54 (getValueByKey!96 (toList!539 lt!14903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6679 c!4748) b!39752))

(assert (= (and d!6679 (not c!4748)) b!39753))

(assert (= (and d!6679 (not res!23842)) b!39754))

(declare-fun m!32387 () Bool)

(assert (=> d!6679 m!32387))

(declare-fun m!32389 () Bool)

(assert (=> b!39752 m!32389))

(assert (=> b!39752 m!32331))

(assert (=> b!39752 m!32331))

(declare-fun m!32391 () Bool)

(assert (=> b!39752 m!32391))

(assert (=> b!39754 m!32331))

(assert (=> b!39754 m!32331))

(assert (=> b!39754 m!32391))

(assert (=> bm!3019 d!6679))

(declare-fun d!6681 () Bool)

(assert (=> d!6681 (= (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39552 d!6681))

(declare-fun b!39755 () Bool)

(declare-fun e!25231 () Bool)

(declare-fun e!25230 () Bool)

(assert (=> b!39755 (= e!25231 e!25230)))

(declare-fun lt!15128 () (_ BitVec 64))

(assert (=> b!39755 (= lt!15128 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15130 () Unit!966)

(assert (=> b!39755 (= lt!15130 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3264 lt!14678) lt!15128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39755 (arrayContainsKey!0 (_keys!3264 lt!14678) lt!15128 #b00000000000000000000000000000000)))

(declare-fun lt!15129 () Unit!966)

(assert (=> b!39755 (= lt!15129 lt!15130)))

(declare-fun res!23843 () Bool)

(assert (=> b!39755 (= res!23843 (= (seekEntryOrOpen!0 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3264 lt!14678) (mask!5140 lt!14678)) (Found!177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39755 (=> (not res!23843) (not e!25230))))

(declare-fun b!39756 () Bool)

(declare-fun call!3076 () Bool)

(assert (=> b!39756 (= e!25231 call!3076)))

(declare-fun b!39757 () Bool)

(declare-fun e!25229 () Bool)

(assert (=> b!39757 (= e!25229 e!25231)))

(declare-fun c!4749 () Bool)

(assert (=> b!39757 (= c!4749 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3073 () Bool)

(assert (=> bm!3073 (= call!3076 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3264 lt!14678) (mask!5140 lt!14678)))))

(declare-fun b!39758 () Bool)

(assert (=> b!39758 (= e!25230 call!3076)))

(declare-fun d!6683 () Bool)

(declare-fun res!23844 () Bool)

(assert (=> d!6683 (=> res!23844 e!25229)))

(assert (=> d!6683 (= res!23844 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6683 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3264 lt!14678) (mask!5140 lt!14678)) e!25229)))

(assert (= (and d!6683 (not res!23844)) b!39757))

(assert (= (and b!39757 c!4749) b!39755))

(assert (= (and b!39757 (not c!4749)) b!39756))

(assert (= (and b!39755 res!23843) b!39758))

(assert (= (or b!39758 b!39756) bm!3073))

(assert (=> b!39755 m!32371))

(declare-fun m!32397 () Bool)

(assert (=> b!39755 m!32397))

(declare-fun m!32401 () Bool)

(assert (=> b!39755 m!32401))

(assert (=> b!39755 m!32371))

(declare-fun m!32403 () Bool)

(assert (=> b!39755 m!32403))

(assert (=> b!39757 m!32371))

(assert (=> b!39757 m!32371))

(assert (=> b!39757 m!32373))

(declare-fun m!32407 () Bool)

(assert (=> bm!3073 m!32407))

(assert (=> bm!3054 d!6683))

(assert (=> b!39556 d!6681))

(assert (=> b!39592 d!6681))

(assert (=> b!39591 d!6681))

(declare-fun d!6689 () Bool)

(assert (=> d!6689 (= (validMask!0 (mask!5140 lt!14678)) (and (or (= (mask!5140 lt!14678) #b00000000000000000000000000000111) (= (mask!5140 lt!14678) #b00000000000000000000000000001111) (= (mask!5140 lt!14678) #b00000000000000000000000000011111) (= (mask!5140 lt!14678) #b00000000000000000000000000111111) (= (mask!5140 lt!14678) #b00000000000000000000000001111111) (= (mask!5140 lt!14678) #b00000000000000000000000011111111) (= (mask!5140 lt!14678) #b00000000000000000000000111111111) (= (mask!5140 lt!14678) #b00000000000000000000001111111111) (= (mask!5140 lt!14678) #b00000000000000000000011111111111) (= (mask!5140 lt!14678) #b00000000000000000000111111111111) (= (mask!5140 lt!14678) #b00000000000000000001111111111111) (= (mask!5140 lt!14678) #b00000000000000000011111111111111) (= (mask!5140 lt!14678) #b00000000000000000111111111111111) (= (mask!5140 lt!14678) #b00000000000000001111111111111111) (= (mask!5140 lt!14678) #b00000000000000011111111111111111) (= (mask!5140 lt!14678) #b00000000000000111111111111111111) (= (mask!5140 lt!14678) #b00000000000001111111111111111111) (= (mask!5140 lt!14678) #b00000000000011111111111111111111) (= (mask!5140 lt!14678) #b00000000000111111111111111111111) (= (mask!5140 lt!14678) #b00000000001111111111111111111111) (= (mask!5140 lt!14678) #b00000000011111111111111111111111) (= (mask!5140 lt!14678) #b00000000111111111111111111111111) (= (mask!5140 lt!14678) #b00000001111111111111111111111111) (= (mask!5140 lt!14678) #b00000011111111111111111111111111) (= (mask!5140 lt!14678) #b00000111111111111111111111111111) (= (mask!5140 lt!14678) #b00001111111111111111111111111111) (= (mask!5140 lt!14678) #b00011111111111111111111111111111) (= (mask!5140 lt!14678) #b00111111111111111111111111111111)) (bvsle (mask!5140 lt!14678) #b00111111111111111111111111111111)))))

(assert (=> d!6545 d!6689))

(declare-fun b!39762 () Bool)

(declare-fun e!25234 () (_ BitVec 32))

(declare-fun call!3077 () (_ BitVec 32))

(assert (=> b!39762 (= e!25234 (bvadd #b00000000000000000000000000000001 call!3077))))

(declare-fun bm!3074 () Bool)

(assert (=> bm!3074 (= call!3077 (arrayCountValidKeys!0 (_keys!3264 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39763 () Bool)

(declare-fun e!25235 () (_ BitVec 32))

(assert (=> b!39763 (= e!25235 #b00000000000000000000000000000000)))

(declare-fun b!39764 () Bool)

(assert (=> b!39764 (= e!25235 e!25234)))

(declare-fun c!4752 () Bool)

(assert (=> b!39764 (= c!4752 (validKeyInArray!0 (select (arr!1220 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6693 () Bool)

(declare-fun lt!15135 () (_ BitVec 32))

(assert (=> d!6693 (and (bvsge lt!15135 #b00000000000000000000000000000000) (bvsle lt!15135 (bvsub (size!1342 (_keys!3264 lt!14678)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6693 (= lt!15135 e!25235)))

(declare-fun c!4751 () Bool)

(assert (=> d!6693 (= c!4751 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6693 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1342 (_keys!3264 lt!14678)) (size!1342 (_keys!3264 lt!14678))))))

(assert (=> d!6693 (= (arrayCountValidKeys!0 (_keys!3264 lt!14678) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))) lt!15135)))

(declare-fun b!39765 () Bool)

(assert (=> b!39765 (= e!25234 call!3077)))

(assert (= (and d!6693 c!4751) b!39763))

(assert (= (and d!6693 (not c!4751)) b!39764))

(assert (= (and b!39764 c!4752) b!39762))

(assert (= (and b!39764 (not c!4752)) b!39765))

(assert (= (or b!39762 b!39765) bm!3074))

(declare-fun m!32419 () Bool)

(assert (=> bm!3074 m!32419))

(assert (=> b!39764 m!32371))

(assert (=> b!39764 m!32371))

(assert (=> b!39764 m!32373))

(assert (=> bm!3053 d!6693))

(declare-fun d!6695 () Bool)

(assert (=> d!6695 (arrayContainsKey!0 (_keys!3264 lt!14678) lt!15004 #b00000000000000000000000000000000)))

(declare-fun lt!15136 () Unit!966)

(assert (=> d!6695 (= lt!15136 (choose!13 (_keys!3264 lt!14678) lt!15004 #b00000000000000000000000000000000))))

(assert (=> d!6695 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6695 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3264 lt!14678) lt!15004 #b00000000000000000000000000000000) lt!15136)))

(declare-fun bs!1656 () Bool)

(assert (= bs!1656 d!6695))

(assert (=> bs!1656 m!32161))

(declare-fun m!32423 () Bool)

(assert (=> bs!1656 m!32423))

(assert (=> b!39554 d!6695))

(declare-fun d!6699 () Bool)

(declare-fun res!23846 () Bool)

(declare-fun e!25236 () Bool)

(assert (=> d!6699 (=> res!23846 e!25236)))

(assert (=> d!6699 (= res!23846 (= (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) lt!15004))))

(assert (=> d!6699 (= (arrayContainsKey!0 (_keys!3264 lt!14678) lt!15004 #b00000000000000000000000000000000) e!25236)))

(declare-fun b!39766 () Bool)

(declare-fun e!25237 () Bool)

(assert (=> b!39766 (= e!25236 e!25237)))

(declare-fun res!23847 () Bool)

(assert (=> b!39766 (=> (not res!23847) (not e!25237))))

(assert (=> b!39766 (= res!23847 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1342 (_keys!3264 lt!14678))))))

(declare-fun b!39767 () Bool)

(assert (=> b!39767 (= e!25237 (arrayContainsKey!0 (_keys!3264 lt!14678) lt!15004 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6699 (not res!23846)) b!39766))

(assert (= (and b!39766 res!23847) b!39767))

(assert (=> d!6699 m!32007))

(declare-fun m!32425 () Bool)

(assert (=> b!39767 m!32425))

(assert (=> b!39554 d!6699))

(declare-fun b!39768 () Bool)

(declare-fun c!4755 () Bool)

(declare-fun lt!15139 () (_ BitVec 64))

(assert (=> b!39768 (= c!4755 (= lt!15139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25240 () SeekEntryResult!177)

(declare-fun e!25239 () SeekEntryResult!177)

(assert (=> b!39768 (= e!25240 e!25239)))

(declare-fun b!39769 () Bool)

(declare-fun e!25238 () SeekEntryResult!177)

(assert (=> b!39769 (= e!25238 e!25240)))

(declare-fun lt!15138 () SeekEntryResult!177)

(assert (=> b!39769 (= lt!15139 (select (arr!1220 (_keys!3264 lt!14678)) (index!2832 lt!15138)))))

(declare-fun c!4753 () Bool)

(assert (=> b!39769 (= c!4753 (= lt!15139 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)))))

(declare-fun d!6701 () Bool)

(declare-fun lt!15137 () SeekEntryResult!177)

(assert (=> d!6701 (and (or ((_ is Undefined!177) lt!15137) (not ((_ is Found!177) lt!15137)) (and (bvsge (index!2831 lt!15137) #b00000000000000000000000000000000) (bvslt (index!2831 lt!15137) (size!1342 (_keys!3264 lt!14678))))) (or ((_ is Undefined!177) lt!15137) ((_ is Found!177) lt!15137) (not ((_ is MissingZero!177) lt!15137)) (and (bvsge (index!2830 lt!15137) #b00000000000000000000000000000000) (bvslt (index!2830 lt!15137) (size!1342 (_keys!3264 lt!14678))))) (or ((_ is Undefined!177) lt!15137) ((_ is Found!177) lt!15137) ((_ is MissingZero!177) lt!15137) (not ((_ is MissingVacant!177) lt!15137)) (and (bvsge (index!2833 lt!15137) #b00000000000000000000000000000000) (bvslt (index!2833 lt!15137) (size!1342 (_keys!3264 lt!14678))))) (or ((_ is Undefined!177) lt!15137) (ite ((_ is Found!177) lt!15137) (= (select (arr!1220 (_keys!3264 lt!14678)) (index!2831 lt!15137)) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!177) lt!15137) (= (select (arr!1220 (_keys!3264 lt!14678)) (index!2830 lt!15137)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!177) lt!15137) (= (select (arr!1220 (_keys!3264 lt!14678)) (index!2833 lt!15137)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6701 (= lt!15137 e!25238)))

(declare-fun c!4754 () Bool)

(assert (=> d!6701 (= c!4754 (and ((_ is Intermediate!177) lt!15138) (undefined!989 lt!15138)))))

(assert (=> d!6701 (= lt!15138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) (mask!5140 lt!14678)) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) (_keys!3264 lt!14678) (mask!5140 lt!14678)))))

(assert (=> d!6701 (validMask!0 (mask!5140 lt!14678))))

(assert (=> d!6701 (= (seekEntryOrOpen!0 (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) (_keys!3264 lt!14678) (mask!5140 lt!14678)) lt!15137)))

(declare-fun b!39770 () Bool)

(assert (=> b!39770 (= e!25239 (MissingZero!177 (index!2832 lt!15138)))))

(declare-fun b!39771 () Bool)

(assert (=> b!39771 (= e!25240 (Found!177 (index!2832 lt!15138)))))

(declare-fun b!39772 () Bool)

(assert (=> b!39772 (= e!25238 Undefined!177)))

(declare-fun b!39773 () Bool)

(assert (=> b!39773 (= e!25239 (seekKeyOrZeroReturnVacant!0 (x!7662 lt!15138) (index!2832 lt!15138) (index!2832 lt!15138) (select (arr!1220 (_keys!3264 lt!14678)) #b00000000000000000000000000000000) (_keys!3264 lt!14678) (mask!5140 lt!14678)))))

(assert (= (and d!6701 c!4754) b!39772))

(assert (= (and d!6701 (not c!4754)) b!39769))

(assert (= (and b!39769 c!4753) b!39771))

(assert (= (and b!39769 (not c!4753)) b!39768))

(assert (= (and b!39768 c!4755) b!39770))

(assert (= (and b!39768 (not c!4755)) b!39773))

(declare-fun m!32427 () Bool)

(assert (=> b!39769 m!32427))

(assert (=> d!6701 m!32007))

(declare-fun m!32429 () Bool)

(assert (=> d!6701 m!32429))

(declare-fun m!32431 () Bool)

(assert (=> d!6701 m!32431))

(declare-fun m!32433 () Bool)

(assert (=> d!6701 m!32433))

(assert (=> d!6701 m!32429))

(assert (=> d!6701 m!32007))

(declare-fun m!32435 () Bool)

(assert (=> d!6701 m!32435))

(declare-fun m!32437 () Bool)

(assert (=> d!6701 m!32437))

(assert (=> d!6701 m!31929))

(assert (=> b!39773 m!32007))

(declare-fun m!32439 () Bool)

(assert (=> b!39773 m!32439))

(assert (=> b!39554 d!6701))

(assert (=> b!39396 d!6681))

(assert (=> b!39409 d!6681))

(assert (=> d!6557 d!6689))

(declare-fun d!6703 () Bool)

(declare-fun e!25241 () Bool)

(assert (=> d!6703 e!25241))

(declare-fun res!23849 () Bool)

(assert (=> d!6703 (=> (not res!23849) (not e!25241))))

(declare-fun lt!15141 () ListLongMap!1047)

(assert (=> d!6703 (= res!23849 (contains!503 lt!15141 (_1!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))))))

(declare-fun lt!15142 () List!1039)

(assert (=> d!6703 (= lt!15141 (ListLongMap!1048 lt!15142))))

(declare-fun lt!15140 () Unit!966)

(declare-fun lt!15143 () Unit!966)

(assert (=> d!6703 (= lt!15140 lt!15143)))

(assert (=> d!6703 (= (getValueByKey!96 lt!15142 (_1!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))))))

(assert (=> d!6703 (= lt!15143 (lemmaContainsTupThenGetReturnValue!23 lt!15142 (_1!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))))))

(assert (=> d!6703 (= lt!15142 (insertStrictlySorted!20 (toList!539 lt!14909) (_1!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))))))

(assert (=> d!6703 (= (+!61 lt!14909 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))) lt!15141)))

(declare-fun b!39774 () Bool)

(declare-fun res!23848 () Bool)

(assert (=> b!39774 (=> (not res!23848) (not e!25241))))

(assert (=> b!39774 (= res!23848 (= (getValueByKey!96 (toList!539 lt!15141) (_1!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))))))))

(declare-fun b!39775 () Bool)

(assert (=> b!39775 (= e!25241 (contains!506 (toList!539 lt!15141) (tuple2!1483 lt!14914 (minValue!1712 lt!14678))))))

(assert (= (and d!6703 res!23849) b!39774))

(assert (= (and b!39774 res!23848) b!39775))

(declare-fun m!32441 () Bool)

(assert (=> d!6703 m!32441))

(declare-fun m!32443 () Bool)

(assert (=> d!6703 m!32443))

(declare-fun m!32445 () Bool)

(assert (=> d!6703 m!32445))

(declare-fun m!32447 () Bool)

(assert (=> d!6703 m!32447))

(declare-fun m!32449 () Bool)

(assert (=> b!39774 m!32449))

(declare-fun m!32451 () Bool)

(assert (=> b!39775 m!32451))

(assert (=> b!39393 d!6703))

(declare-fun d!6705 () Bool)

(declare-fun e!25242 () Bool)

(assert (=> d!6705 e!25242))

(declare-fun res!23851 () Bool)

(assert (=> d!6705 (=> (not res!23851) (not e!25242))))

(declare-fun lt!15145 () ListLongMap!1047)

(assert (=> d!6705 (= res!23851 (contains!503 lt!15145 (_1!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))))))

(declare-fun lt!15146 () List!1039)

(assert (=> d!6705 (= lt!15145 (ListLongMap!1048 lt!15146))))

(declare-fun lt!15144 () Unit!966)

(declare-fun lt!15147 () Unit!966)

(assert (=> d!6705 (= lt!15144 lt!15147)))

(assert (=> d!6705 (= (getValueByKey!96 lt!15146 (_1!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))))))

(assert (=> d!6705 (= lt!15147 (lemmaContainsTupThenGetReturnValue!23 lt!15146 (_1!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))))))

(assert (=> d!6705 (= lt!15146 (insertStrictlySorted!20 (toList!539 lt!14895) (_1!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))))))

(assert (=> d!6705 (= (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))) lt!15145)))

(declare-fun b!39776 () Bool)

(declare-fun res!23850 () Bool)

(assert (=> b!39776 (=> (not res!23850) (not e!25242))))

(assert (=> b!39776 (= res!23850 (= (getValueByKey!96 (toList!539 lt!15145) (_1!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))))))))

(declare-fun b!39777 () Bool)

(assert (=> b!39777 (= e!25242 (contains!506 (toList!539 lt!15145) (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))))))

(assert (= (and d!6705 res!23851) b!39776))

(assert (= (and b!39776 res!23850) b!39777))

(declare-fun m!32453 () Bool)

(assert (=> d!6705 m!32453))

(declare-fun m!32455 () Bool)

(assert (=> d!6705 m!32455))

(declare-fun m!32457 () Bool)

(assert (=> d!6705 m!32457))

(declare-fun m!32459 () Bool)

(assert (=> d!6705 m!32459))

(declare-fun m!32461 () Bool)

(assert (=> b!39776 m!32461))

(declare-fun m!32463 () Bool)

(assert (=> b!39777 m!32463))

(assert (=> b!39393 d!6705))

(declare-fun d!6707 () Bool)

(assert (=> d!6707 (= (apply!52 (+!61 lt!14909 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))) lt!14913) (get!692 (getValueByKey!96 (toList!539 (+!61 lt!14909 (tuple2!1483 lt!14914 (minValue!1712 lt!14678)))) lt!14913)))))

(declare-fun bs!1657 () Bool)

(assert (= bs!1657 d!6707))

(declare-fun m!32465 () Bool)

(assert (=> bs!1657 m!32465))

(assert (=> bs!1657 m!32465))

(declare-fun m!32467 () Bool)

(assert (=> bs!1657 m!32467))

(assert (=> b!39393 d!6707))

(declare-fun d!6709 () Bool)

(assert (=> d!6709 (= (apply!52 (+!61 lt!14901 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))) lt!14897) (apply!52 lt!14901 lt!14897))))

(declare-fun lt!15153 () Unit!966)

(declare-fun choose!245 (ListLongMap!1047 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!966)

(assert (=> d!6709 (= lt!15153 (choose!245 lt!14901 lt!14912 (zeroValue!1712 lt!14678) lt!14897))))

(declare-fun e!25248 () Bool)

(assert (=> d!6709 e!25248))

(declare-fun res!23857 () Bool)

(assert (=> d!6709 (=> (not res!23857) (not e!25248))))

(assert (=> d!6709 (= res!23857 (contains!503 lt!14901 lt!14897))))

(assert (=> d!6709 (= (addApplyDifferent!28 lt!14901 lt!14912 (zeroValue!1712 lt!14678) lt!14897) lt!15153)))

(declare-fun b!39785 () Bool)

(assert (=> b!39785 (= e!25248 (not (= lt!14897 lt!14912)))))

(assert (= (and d!6709 res!23857) b!39785))

(assert (=> d!6709 m!32029))

(assert (=> d!6709 m!32045))

(declare-fun m!32473 () Bool)

(assert (=> d!6709 m!32473))

(declare-fun m!32475 () Bool)

(assert (=> d!6709 m!32475))

(assert (=> d!6709 m!32029))

(assert (=> d!6709 m!32047))

(assert (=> b!39393 d!6709))

(assert (=> b!39393 d!6645))

(declare-fun d!6713 () Bool)

(assert (=> d!6713 (= (apply!52 lt!14901 lt!14897) (get!692 (getValueByKey!96 (toList!539 lt!14901) lt!14897)))))

(declare-fun bs!1658 () Bool)

(assert (= bs!1658 d!6713))

(declare-fun m!32477 () Bool)

(assert (=> bs!1658 m!32477))

(assert (=> bs!1658 m!32477))

(declare-fun m!32479 () Bool)

(assert (=> bs!1658 m!32479))

(assert (=> b!39393 d!6713))

(declare-fun d!6715 () Bool)

(assert (=> d!6715 (= (apply!52 lt!14909 lt!14913) (get!692 (getValueByKey!96 (toList!539 lt!14909) lt!14913)))))

(declare-fun bs!1659 () Bool)

(assert (= bs!1659 d!6715))

(declare-fun m!32481 () Bool)

(assert (=> bs!1659 m!32481))

(assert (=> bs!1659 m!32481))

(declare-fun m!32483 () Bool)

(assert (=> bs!1659 m!32483))

(assert (=> b!39393 d!6715))

(declare-fun d!6717 () Bool)

(declare-fun e!25249 () Bool)

(assert (=> d!6717 e!25249))

(declare-fun res!23858 () Bool)

(assert (=> d!6717 (=> res!23858 e!25249)))

(declare-fun lt!15156 () Bool)

(assert (=> d!6717 (= res!23858 (not lt!15156))))

(declare-fun lt!15157 () Bool)

(assert (=> d!6717 (= lt!15156 lt!15157)))

(declare-fun lt!15154 () Unit!966)

(declare-fun e!25250 () Unit!966)

(assert (=> d!6717 (= lt!15154 e!25250)))

(declare-fun c!4756 () Bool)

(assert (=> d!6717 (= c!4756 lt!15157)))

(assert (=> d!6717 (= lt!15157 (containsKey!65 (toList!539 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))) lt!14908))))

(assert (=> d!6717 (= (contains!503 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))) lt!14908) lt!15156)))

(declare-fun b!39786 () Bool)

(declare-fun lt!15155 () Unit!966)

(assert (=> b!39786 (= e!25250 lt!15155)))

(assert (=> b!39786 (= lt!15155 (lemmaContainsKeyImpliesGetValueByKeyDefined!53 (toList!539 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))) lt!14908))))

(assert (=> b!39786 (isDefined!54 (getValueByKey!96 (toList!539 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))) lt!14908))))

(declare-fun b!39787 () Bool)

(declare-fun Unit!979 () Unit!966)

(assert (=> b!39787 (= e!25250 Unit!979)))

(declare-fun b!39788 () Bool)

(assert (=> b!39788 (= e!25249 (isDefined!54 (getValueByKey!96 (toList!539 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678)))) lt!14908)))))

(assert (= (and d!6717 c!4756) b!39786))

(assert (= (and d!6717 (not c!4756)) b!39787))

(assert (= (and d!6717 (not res!23858)) b!39788))

(declare-fun m!32485 () Bool)

(assert (=> d!6717 m!32485))

(declare-fun m!32487 () Bool)

(assert (=> b!39786 m!32487))

(declare-fun m!32489 () Bool)

(assert (=> b!39786 m!32489))

(assert (=> b!39786 m!32489))

(declare-fun m!32491 () Bool)

(assert (=> b!39786 m!32491))

(assert (=> b!39788 m!32489))

(assert (=> b!39788 m!32489))

(assert (=> b!39788 m!32491))

(assert (=> b!39393 d!6717))

(declare-fun d!6719 () Bool)

(assert (=> d!6719 (contains!503 (+!61 lt!14895 (tuple2!1483 lt!14898 (zeroValue!1712 lt!14678))) lt!14908)))

(declare-fun lt!15176 () Unit!966)

(declare-fun choose!246 (ListLongMap!1047 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!966)

(assert (=> d!6719 (= lt!15176 (choose!246 lt!14895 lt!14898 (zeroValue!1712 lt!14678) lt!14908))))

(assert (=> d!6719 (contains!503 lt!14895 lt!14908)))

(assert (=> d!6719 (= (addStillContains!28 lt!14895 lt!14898 (zeroValue!1712 lt!14678) lt!14908) lt!15176)))

(declare-fun bs!1662 () Bool)

(assert (= bs!1662 d!6719))

(assert (=> bs!1662 m!32021))

(assert (=> bs!1662 m!32021))

(assert (=> bs!1662 m!32031))

(declare-fun m!32525 () Bool)

(assert (=> bs!1662 m!32525))

(declare-fun m!32527 () Bool)

(assert (=> bs!1662 m!32527))

(assert (=> b!39393 d!6719))

(declare-fun d!6729 () Bool)

(assert (=> d!6729 (= (apply!52 (+!61 lt!14894 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))) lt!14906) (get!692 (getValueByKey!96 (toList!539 (+!61 lt!14894 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))) lt!14906)))))

(declare-fun bs!1663 () Bool)

(assert (= bs!1663 d!6729))

(declare-fun m!32529 () Bool)

(assert (=> bs!1663 m!32529))

(assert (=> bs!1663 m!32529))

(declare-fun m!32531 () Bool)

(assert (=> bs!1663 m!32531))

(assert (=> b!39393 d!6729))

(declare-fun d!6731 () Bool)

(assert (=> d!6731 (= (apply!52 (+!61 lt!14909 (tuple2!1483 lt!14914 (minValue!1712 lt!14678))) lt!14913) (apply!52 lt!14909 lt!14913))))

(declare-fun lt!15181 () Unit!966)

(assert (=> d!6731 (= lt!15181 (choose!245 lt!14909 lt!14914 (minValue!1712 lt!14678) lt!14913))))

(declare-fun e!25256 () Bool)

(assert (=> d!6731 e!25256))

(declare-fun res!23869 () Bool)

(assert (=> d!6731 (=> (not res!23869) (not e!25256))))

(assert (=> d!6731 (= res!23869 (contains!503 lt!14909 lt!14913))))

(assert (=> d!6731 (= (addApplyDifferent!28 lt!14909 lt!14914 (minValue!1712 lt!14678) lt!14913) lt!15181)))

(declare-fun b!39800 () Bool)

(assert (=> b!39800 (= e!25256 (not (= lt!14913 lt!14914)))))

(assert (= (and d!6731 res!23869) b!39800))

(assert (=> d!6731 m!32043))

(assert (=> d!6731 m!32039))

(declare-fun m!32545 () Bool)

(assert (=> d!6731 m!32545))

(declare-fun m!32547 () Bool)

(assert (=> d!6731 m!32547))

(assert (=> d!6731 m!32043))

(assert (=> d!6731 m!32049))

(assert (=> b!39393 d!6731))

(declare-fun d!6735 () Bool)

(assert (=> d!6735 (= (apply!52 lt!14894 lt!14906) (get!692 (getValueByKey!96 (toList!539 lt!14894) lt!14906)))))

(declare-fun bs!1664 () Bool)

(assert (= bs!1664 d!6735))

(declare-fun m!32549 () Bool)

(assert (=> bs!1664 m!32549))

(assert (=> bs!1664 m!32549))

(declare-fun m!32551 () Bool)

(assert (=> bs!1664 m!32551))

(assert (=> b!39393 d!6735))

(declare-fun d!6737 () Bool)

(declare-fun e!25257 () Bool)

(assert (=> d!6737 e!25257))

(declare-fun res!23871 () Bool)

(assert (=> d!6737 (=> (not res!23871) (not e!25257))))

(declare-fun lt!15183 () ListLongMap!1047)

(assert (=> d!6737 (= res!23871 (contains!503 lt!15183 (_1!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))))))

(declare-fun lt!15184 () List!1039)

(assert (=> d!6737 (= lt!15183 (ListLongMap!1048 lt!15184))))

(declare-fun lt!15182 () Unit!966)

(declare-fun lt!15185 () Unit!966)

(assert (=> d!6737 (= lt!15182 lt!15185)))

(assert (=> d!6737 (= (getValueByKey!96 lt!15184 (_1!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))))))

(assert (=> d!6737 (= lt!15185 (lemmaContainsTupThenGetReturnValue!23 lt!15184 (_1!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))))))

(assert (=> d!6737 (= lt!15184 (insertStrictlySorted!20 (toList!539 lt!14901) (_1!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))))))

(assert (=> d!6737 (= (+!61 lt!14901 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))) lt!15183)))

(declare-fun b!39801 () Bool)

(declare-fun res!23870 () Bool)

(assert (=> b!39801 (=> (not res!23870) (not e!25257))))

(assert (=> b!39801 (= res!23870 (= (getValueByKey!96 (toList!539 lt!15183) (_1!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))))))))

(declare-fun b!39802 () Bool)

(assert (=> b!39802 (= e!25257 (contains!506 (toList!539 lt!15183) (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))))))

(assert (= (and d!6737 res!23871) b!39801))

(assert (= (and b!39801 res!23870) b!39802))

(declare-fun m!32553 () Bool)

(assert (=> d!6737 m!32553))

(declare-fun m!32555 () Bool)

(assert (=> d!6737 m!32555))

(declare-fun m!32557 () Bool)

(assert (=> d!6737 m!32557))

(declare-fun m!32559 () Bool)

(assert (=> d!6737 m!32559))

(declare-fun m!32561 () Bool)

(assert (=> b!39801 m!32561))

(declare-fun m!32563 () Bool)

(assert (=> b!39802 m!32563))

(assert (=> b!39393 d!6737))

(declare-fun d!6739 () Bool)

(assert (=> d!6739 (= (apply!52 (+!61 lt!14901 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678))) lt!14897) (get!692 (getValueByKey!96 (toList!539 (+!61 lt!14901 (tuple2!1483 lt!14912 (zeroValue!1712 lt!14678)))) lt!14897)))))

(declare-fun bs!1665 () Bool)

(assert (= bs!1665 d!6739))

(declare-fun m!32565 () Bool)

(assert (=> bs!1665 m!32565))

(assert (=> bs!1665 m!32565))

(declare-fun m!32567 () Bool)

(assert (=> bs!1665 m!32567))

(assert (=> b!39393 d!6739))

(declare-fun d!6741 () Bool)

(declare-fun e!25258 () Bool)

(assert (=> d!6741 e!25258))

(declare-fun res!23873 () Bool)

(assert (=> d!6741 (=> (not res!23873) (not e!25258))))

(declare-fun lt!15187 () ListLongMap!1047)

(assert (=> d!6741 (= res!23873 (contains!503 lt!15187 (_1!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))))))

(declare-fun lt!15188 () List!1039)

(assert (=> d!6741 (= lt!15187 (ListLongMap!1048 lt!15188))))

(declare-fun lt!15186 () Unit!966)

(declare-fun lt!15189 () Unit!966)

(assert (=> d!6741 (= lt!15186 lt!15189)))

(assert (=> d!6741 (= (getValueByKey!96 lt!15188 (_1!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))))))

(assert (=> d!6741 (= lt!15189 (lemmaContainsTupThenGetReturnValue!23 lt!15188 (_1!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))))))

(assert (=> d!6741 (= lt!15188 (insertStrictlySorted!20 (toList!539 lt!14894) (_1!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))) (_2!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))))))

(assert (=> d!6741 (= (+!61 lt!14894 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))) lt!15187)))

(declare-fun b!39803 () Bool)

(declare-fun res!23872 () Bool)

(assert (=> b!39803 (=> (not res!23872) (not e!25258))))

(assert (=> b!39803 (= res!23872 (= (getValueByKey!96 (toList!539 lt!15187) (_1!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678)))) (Some!101 (_2!752 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))))))))

(declare-fun b!39804 () Bool)

(assert (=> b!39804 (= e!25258 (contains!506 (toList!539 lt!15187) (tuple2!1483 lt!14902 (minValue!1712 lt!14678))))))

(assert (= (and d!6741 res!23873) b!39803))

(assert (= (and b!39803 res!23872) b!39804))

(declare-fun m!32569 () Bool)

(assert (=> d!6741 m!32569))

(declare-fun m!32571 () Bool)

(assert (=> d!6741 m!32571))

(declare-fun m!32573 () Bool)

(assert (=> d!6741 m!32573))

(declare-fun m!32575 () Bool)

(assert (=> d!6741 m!32575))

(declare-fun m!32577 () Bool)

(assert (=> b!39803 m!32577))

(declare-fun m!32579 () Bool)

(assert (=> b!39804 m!32579))

(assert (=> b!39393 d!6741))

(declare-fun d!6743 () Bool)

(assert (=> d!6743 (= (apply!52 (+!61 lt!14894 (tuple2!1483 lt!14902 (minValue!1712 lt!14678))) lt!14906) (apply!52 lt!14894 lt!14906))))

(declare-fun lt!15190 () Unit!966)

(assert (=> d!6743 (= lt!15190 (choose!245 lt!14894 lt!14902 (minValue!1712 lt!14678) lt!14906))))

(declare-fun e!25259 () Bool)

(assert (=> d!6743 e!25259))

(declare-fun res!23874 () Bool)

(assert (=> d!6743 (=> (not res!23874) (not e!25259))))

(assert (=> d!6743 (= res!23874 (contains!503 lt!14894 lt!14906))))

(assert (=> d!6743 (= (addApplyDifferent!28 lt!14894 lt!14902 (minValue!1712 lt!14678) lt!14906) lt!15190)))

(declare-fun b!39805 () Bool)

(assert (=> b!39805 (= e!25259 (not (= lt!14906 lt!14902)))))

(assert (= (and d!6743 res!23874) b!39805))

(assert (=> d!6743 m!32025))

(assert (=> d!6743 m!32037))

(declare-fun m!32581 () Bool)

(assert (=> d!6743 m!32581))

(declare-fun m!32583 () Bool)

(assert (=> d!6743 m!32583))

(assert (=> d!6743 m!32025))

(assert (=> d!6743 m!32027))

(assert (=> b!39393 d!6743))

(declare-fun e!25271 () SeekEntryResult!177)

(declare-fun b!39823 () Bool)

(assert (=> b!39823 (= e!25271 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7662 lt!14998) #b00000000000000000000000000000001) (nextIndex!0 (index!2832 lt!14998) (x!7662 lt!14998) mask!853) (index!2832 lt!14998) (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853))))

(declare-fun b!39824 () Bool)

(declare-fun e!25270 () SeekEntryResult!177)

(declare-fun e!25269 () SeekEntryResult!177)

(assert (=> b!39824 (= e!25270 e!25269)))

(declare-fun c!4763 () Bool)

(declare-fun lt!15205 () (_ BitVec 64))

(assert (=> b!39824 (= c!4763 (= lt!15205 (select (arr!1220 lt!14677) #b00000000000000000000000000000000)))))

(declare-fun b!39825 () Bool)

(assert (=> b!39825 (= e!25269 (Found!177 (index!2832 lt!14998)))))

(declare-fun d!6745 () Bool)

(declare-fun lt!15204 () SeekEntryResult!177)

(assert (=> d!6745 (and (or ((_ is Undefined!177) lt!15204) (not ((_ is Found!177) lt!15204)) (and (bvsge (index!2831 lt!15204) #b00000000000000000000000000000000) (bvslt (index!2831 lt!15204) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!15204) ((_ is Found!177) lt!15204) (not ((_ is MissingVacant!177) lt!15204)) (not (= (index!2833 lt!15204) (index!2832 lt!14998))) (and (bvsge (index!2833 lt!15204) #b00000000000000000000000000000000) (bvslt (index!2833 lt!15204) (size!1342 lt!14677)))) (or ((_ is Undefined!177) lt!15204) (ite ((_ is Found!177) lt!15204) (= (select (arr!1220 lt!14677) (index!2831 lt!15204)) (select (arr!1220 lt!14677) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!177) lt!15204) (= (index!2833 lt!15204) (index!2832 lt!14998)) (= (select (arr!1220 lt!14677) (index!2833 lt!15204)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6745 (= lt!15204 e!25270)))

(declare-fun c!4765 () Bool)

(assert (=> d!6745 (= c!4765 (bvsge (x!7662 lt!14998) #b01111111111111111111111111111110))))

(assert (=> d!6745 (= lt!15205 (select (arr!1220 lt!14677) (index!2832 lt!14998)))))

(assert (=> d!6745 (validMask!0 mask!853)))

(assert (=> d!6745 (= (seekKeyOrZeroReturnVacant!0 (x!7662 lt!14998) (index!2832 lt!14998) (index!2832 lt!14998) (select (arr!1220 lt!14677) #b00000000000000000000000000000000) lt!14677 mask!853) lt!15204)))

(declare-fun b!39826 () Bool)

(declare-fun c!4764 () Bool)

(assert (=> b!39826 (= c!4764 (= lt!15205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39826 (= e!25269 e!25271)))

(declare-fun b!39827 () Bool)

(assert (=> b!39827 (= e!25270 Undefined!177)))

(declare-fun b!39828 () Bool)

(assert (=> b!39828 (= e!25271 (MissingVacant!177 (index!2832 lt!14998)))))

(assert (= (and d!6745 c!4765) b!39827))

(assert (= (and d!6745 (not c!4765)) b!39824))

(assert (= (and b!39824 c!4763) b!39825))

(assert (= (and b!39824 (not c!4763)) b!39826))

(assert (= (and b!39826 c!4764) b!39828))

(assert (= (and b!39826 (not c!4764)) b!39823))

(declare-fun m!32613 () Bool)

(assert (=> b!39823 m!32613))

(assert (=> b!39823 m!32613))

(assert (=> b!39823 m!31843))

(declare-fun m!32615 () Bool)

(assert (=> b!39823 m!32615))

(declare-fun m!32617 () Bool)

(assert (=> d!6745 m!32617))

(declare-fun m!32619 () Bool)

(assert (=> d!6745 m!32619))

(assert (=> d!6745 m!32141))

(assert (=> d!6745 m!31745))

(assert (=> b!39549 d!6745))

(declare-fun d!6757 () Bool)

(declare-fun e!25272 () Bool)

(assert (=> d!6757 e!25272))

(declare-fun res!23879 () Bool)

(assert (=> d!6757 (=> res!23879 e!25272)))

(declare-fun lt!15208 () Bool)

(assert (=> d!6757 (= res!23879 (not lt!15208))))

(declare-fun lt!15209 () Bool)

(assert (=> d!6757 (= lt!15208 lt!15209)))

(declare-fun lt!15206 () Unit!966)

(declare-fun e!25273 () Unit!966)

(assert (=> d!6757 (= lt!15206 e!25273)))

(declare-fun c!4766 () Bool)

(assert (=> d!6757 (= c!4766 lt!15209)))

(assert (=> d!6757 (= lt!15209 (containsKey!65 (toList!539 lt!14903) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6757 (= (contains!503 lt!14903 #b0000000000000000000000000000000000000000000000000000000000000000) lt!15208)))

(declare-fun b!39829 () Bool)

(declare-fun lt!15207 () Unit!966)

(assert (=> b!39829 (= e!25273 lt!15207)))

(assert (=> b!39829 (= lt!15207 (lemmaContainsKeyImpliesGetValueByKeyDefined!53 (toList!539 lt!14903) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39829 (isDefined!54 (getValueByKey!96 (toList!539 lt!14903) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39830 () Bool)

(declare-fun Unit!980 () Unit!966)

(assert (=> b!39830 (= e!25273 Unit!980)))

(declare-fun b!39831 () Bool)

(assert (=> b!39831 (= e!25272 (isDefined!54 (getValueByKey!96 (toList!539 lt!14903) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6757 c!4766) b!39829))

(assert (= (and d!6757 (not c!4766)) b!39830))

(assert (= (and d!6757 (not res!23879)) b!39831))

(declare-fun m!32621 () Bool)

(assert (=> d!6757 m!32621))

(declare-fun m!32623 () Bool)

(assert (=> b!39829 m!32623))

(assert (=> b!39829 m!32365))

(assert (=> b!39829 m!32365))

(declare-fun m!32625 () Bool)

(assert (=> b!39829 m!32625))

(assert (=> b!39831 m!32365))

(assert (=> b!39831 m!32365))

(assert (=> b!39831 m!32625))

(assert (=> bm!3023 d!6757))

(declare-fun d!6759 () Bool)

(assert (=> d!6759 (= (content!30 Nil!1037) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!6617 d!6759))

(declare-fun d!6761 () Bool)

(declare-fun e!25274 () Bool)

(assert (=> d!6761 e!25274))

(declare-fun res!23881 () Bool)

(assert (=> d!6761 (=> (not res!23881) (not e!25274))))

(declare-fun lt!15211 () ListLongMap!1047)

(assert (=> d!6761 (= res!23881 (contains!503 lt!15211 (_1!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))))

(declare-fun lt!15212 () List!1039)

(assert (=> d!6761 (= lt!15211 (ListLongMap!1048 lt!15212))))

(declare-fun lt!15210 () Unit!966)

(declare-fun lt!15213 () Unit!966)

(assert (=> d!6761 (= lt!15210 lt!15213)))

(assert (=> d!6761 (= (getValueByKey!96 lt!15212 (_1!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))) (Some!101 (_2!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))))

(assert (=> d!6761 (= lt!15213 (lemmaContainsTupThenGetReturnValue!23 lt!15212 (_1!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))) (_2!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))))

(assert (=> d!6761 (= lt!15212 (insertStrictlySorted!20 (toList!539 (ite c!4651 call!3023 (ite c!4648 call!3024 call!3027))) (_1!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))) (_2!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))))))

(assert (=> d!6761 (= (+!61 (ite c!4651 call!3023 (ite c!4648 call!3024 call!3027)) (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))) lt!15211)))

(declare-fun b!39832 () Bool)

(declare-fun res!23880 () Bool)

(assert (=> b!39832 (=> (not res!23880) (not e!25274))))

(assert (=> b!39832 (= res!23880 (= (getValueByKey!96 (toList!539 lt!15211) (_1!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678))))) (Some!101 (_2!752 (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))))

(declare-fun b!39833 () Bool)

(assert (=> b!39833 (= e!25274 (contains!506 (toList!539 lt!15211) (ite (or c!4651 c!4648) (tuple2!1483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14678)) (tuple2!1483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14678)))))))

(assert (= (and d!6761 res!23881) b!39832))

(assert (= (and b!39832 res!23880) b!39833))

(declare-fun m!32627 () Bool)

(assert (=> d!6761 m!32627))

(declare-fun m!32629 () Bool)

(assert (=> d!6761 m!32629))

(declare-fun m!32631 () Bool)

(assert (=> d!6761 m!32631))

(declare-fun m!32633 () Bool)

(assert (=> d!6761 m!32633))

(declare-fun m!32635 () Bool)

(assert (=> b!39832 m!32635))

(declare-fun m!32637 () Bool)

(assert (=> b!39833 m!32637))

(assert (=> bm!3022 d!6761))

(declare-fun d!6763 () Bool)

(assert (=> d!6763 (= (size!1360 lt!14678) (bvadd (_size!165 lt!14678) (bvsdiv (bvadd (extraKeys!1685 lt!14678) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!39257 d!6763))

(assert (=> b!39256 d!6763))

(declare-fun b_lambda!2047 () Bool)

(assert (= b_lambda!2037 (or (and start!5494 b_free!1357 (= defaultEntry!470 (defaultEntry!1794 lt!14678))) b_lambda!2047)))

(check-sat (not b!39648) (not b_lambda!2045) (not d!6729) (not b!39755) (not d!6669) (not b_lambda!2047) (not d!6745) (not b!39777) (not b!39803) (not b!39683) (not b!39721) (not b!39644) (not d!6661) (not b!39645) (not d!6645) (not d!6739) (not d!6741) (not bm!3066) (not d!6647) (not d!6717) (not d!6679) (not b!39774) (not b_lambda!2043) (not b!39681) (not d!6657) (not d!6651) (not d!6719) (not d!6637) (not d!6757) (not b!39776) (not bm!3074) (not b!39686) (not b!39682) (not bm!3073) (not b!39801) (not d!6667) (not b!39833) (not d!6701) (not b!39829) (not b!39687) (not d!6695) (not d!6735) (not b!39832) (not b!39632) (not b_lambda!2035) (not d!6703) (not b!39727) (not d!6705) b_and!2349 (not b!39752) (not b!39788) tp_is_empty!1747 (not b!39707) (not b!39748) (not b!39718) (not b!39823) (not d!6713) (not b!39802) (not bm!3071) (not b!39786) (not b!39775) (not d!6731) (not d!6761) (not b_next!1357) (not b!39678) (not b!39764) (not bm!3070) (not b!39744) (not b!39651) (not b!39773) (not b!39649) (not bm!3067) (not b!39733) (not d!6743) (not b!39735) (not b!39743) (not d!6707) (not b!39631) (not b!39745) (not bm!3072) (not d!6715) (not b!39732) (not b!39831) (not b!39679) (not d!6631) (not b!39641) (not d!6737) (not b!39804) (not d!6633) (not b!39757) (not b!39767) (not d!6663) (not d!6635) (not b!39643) (not b!39677) (not b!39754) (not b!39634) (not d!6709))
(check-sat b_and!2349 (not b_next!1357))
