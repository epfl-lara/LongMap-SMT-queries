; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5504 () Bool)

(assert start!5504)

(declare-fun b_free!1357 () Bool)

(declare-fun b_next!1357 () Bool)

(assert (=> start!5504 (= b_free!1357 (not b_next!1357))))

(declare-fun tp!5723 () Bool)

(declare-fun b_and!2325 () Bool)

(assert (=> start!5504 (= tp!5723 b_and!2325)))

(declare-fun res!23515 () Bool)

(declare-fun e!24819 () Bool)

(assert (=> start!5504 (=> (not res!23515) (not e!24819))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5504 (= res!23515 (validMask!0 mask!853))))

(assert (=> start!5504 e!24819))

(assert (=> start!5504 true))

(assert (=> start!5504 tp!5723))

(declare-fun b!39093 () Bool)

(declare-fun e!24818 () Bool)

(assert (=> b!39093 (= e!24819 (not e!24818))))

(declare-fun res!23516 () Bool)

(assert (=> b!39093 (=> res!23516 e!24818)))

(declare-datatypes ((array!2565 0))(
  ( (array!2566 (arr!1226 (Array (_ BitVec 32) (_ BitVec 64))) (size!1348 (_ BitVec 32))) )
))
(declare-datatypes ((V!2089 0))(
  ( (V!2090 (val!912 Int)) )
))
(declare-datatypes ((ValueCell!626 0))(
  ( (ValueCellFull!626 (v!1985 V!2089)) (EmptyCell!626) )
))
(declare-datatypes ((array!2567 0))(
  ( (array!2568 (arr!1227 (Array (_ BitVec 32) ValueCell!626)) (size!1349 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!232 0))(
  ( (LongMapFixedSize!233 (defaultEntry!1794 Int) (mask!5141 (_ BitVec 32)) (extraKeys!1685 (_ BitVec 32)) (zeroValue!1712 V!2089) (minValue!1712 V!2089) (_size!165 (_ BitVec 32)) (_keys!3265 array!2565) (_values!1777 array!2567) (_vacant!165 (_ BitVec 32))) )
))
(declare-fun lt!14651 () LongMapFixedSize!232)

(declare-datatypes ((tuple2!1460 0))(
  ( (tuple2!1461 (_1!741 (_ BitVec 64)) (_2!741 V!2089)) )
))
(declare-datatypes ((List!1032 0))(
  ( (Nil!1029) (Cons!1028 (h!1599 tuple2!1460) (t!3873 List!1032)) )
))
(declare-datatypes ((ListLongMap!1031 0))(
  ( (ListLongMap!1032 (toList!531 List!1032)) )
))
(declare-fun map!684 (LongMapFixedSize!232) ListLongMap!1031)

(assert (=> b!39093 (= res!23516 (= (map!684 lt!14651) (ListLongMap!1032 Nil!1029)))))

(declare-fun lt!14653 () array!2565)

(declare-datatypes ((List!1033 0))(
  ( (Nil!1030) (Cons!1029 (h!1600 (_ BitVec 64)) (t!3874 List!1033)) )
))
(declare-fun arrayNoDuplicates!0 (array!2565 (_ BitVec 32) List!1033) Bool)

(assert (=> b!39093 (arrayNoDuplicates!0 lt!14653 #b00000000000000000000000000000000 Nil!1030)))

(declare-datatypes ((Unit!971 0))(
  ( (Unit!972) )
))
(declare-fun lt!14648 () Unit!971)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2565 (_ BitVec 32) (_ BitVec 32) List!1033) Unit!971)

(assert (=> b!39093 (= lt!14648 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2565 (_ BitVec 32)) Bool)

(assert (=> b!39093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14653 mask!853)))

(declare-fun lt!14650 () Unit!971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!971)

(assert (=> b!39093 (= lt!14650 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14653 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39093 (= (arrayCountValidKeys!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14652 () Unit!971)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!971)

(assert (=> b!39093 (= lt!14652 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!14649 () V!2089)

(assert (=> b!39093 (= lt!14651 (LongMapFixedSize!233 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14649 lt!14649 #b00000000000000000000000000000000 lt!14653 (array!2568 ((as const (Array (_ BitVec 32) ValueCell!626)) EmptyCell!626) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!39093 (= lt!14653 (array!2566 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!183 (Int (_ BitVec 64)) V!2089)

(assert (=> b!39093 (= lt!14649 (dynLambda!183 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39094 () Bool)

(declare-fun valid!129 (LongMapFixedSize!232) Bool)

(assert (=> b!39094 (= e!24818 (valid!129 lt!14651))))

(assert (= (and start!5504 res!23515) b!39093))

(assert (= (and b!39093 (not res!23516)) b!39094))

(declare-fun b_lambda!2021 () Bool)

(assert (=> (not b_lambda!2021) (not b!39093)))

(declare-fun t!3872 () Bool)

(declare-fun tb!827 () Bool)

(assert (=> (and start!5504 (= defaultEntry!470 defaultEntry!470) t!3872) tb!827))

(declare-fun result!1417 () Bool)

(declare-fun tp_is_empty!1747 () Bool)

(assert (=> tb!827 (= result!1417 tp_is_empty!1747)))

(assert (=> b!39093 t!3872))

(declare-fun b_and!2327 () Bool)

(assert (= b_and!2325 (and (=> t!3872 result!1417) b_and!2327)))

(declare-fun m!31717 () Bool)

(assert (=> start!5504 m!31717))

(declare-fun m!31719 () Bool)

(assert (=> b!39093 m!31719))

(declare-fun m!31721 () Bool)

(assert (=> b!39093 m!31721))

(declare-fun m!31723 () Bool)

(assert (=> b!39093 m!31723))

(declare-fun m!31725 () Bool)

(assert (=> b!39093 m!31725))

(declare-fun m!31727 () Bool)

(assert (=> b!39093 m!31727))

(declare-fun m!31729 () Bool)

(assert (=> b!39093 m!31729))

(declare-fun m!31731 () Bool)

(assert (=> b!39093 m!31731))

(declare-fun m!31733 () Bool)

(assert (=> b!39093 m!31733))

(declare-fun m!31735 () Bool)

(assert (=> b!39094 m!31735))

(check-sat (not b!39093) tp_is_empty!1747 b_and!2327 (not b_next!1357) (not b_lambda!2021) (not b!39094) (not start!5504))
(check-sat b_and!2327 (not b_next!1357))
(get-model)

(declare-fun b_lambda!2031 () Bool)

(assert (= b_lambda!2021 (or (and start!5504 b_free!1357) b_lambda!2031)))

(check-sat (not b!39093) (not b_lambda!2031) tp_is_empty!1747 b_and!2327 (not b_next!1357) (not b!39094) (not start!5504))
(check-sat b_and!2327 (not b_next!1357))
(get-model)

(declare-fun d!6511 () Bool)

(assert (=> d!6511 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5504 d!6511))

(declare-fun b!39148 () Bool)

(declare-fun e!24857 () (_ BitVec 32))

(declare-fun e!24858 () (_ BitVec 32))

(assert (=> b!39148 (= e!24857 e!24858)))

(declare-fun c!4591 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!39148 (= c!4591 (validKeyInArray!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun b!39149 () Bool)

(declare-fun call!2958 () (_ BitVec 32))

(assert (=> b!39149 (= e!24858 (bvadd #b00000000000000000000000000000001 call!2958))))

(declare-fun b!39150 () Bool)

(assert (=> b!39150 (= e!24857 #b00000000000000000000000000000000)))

(declare-fun bm!2955 () Bool)

(assert (=> bm!2955 (= call!2958 (arrayCountValidKeys!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39151 () Bool)

(assert (=> b!39151 (= e!24858 call!2958)))

(declare-fun d!6517 () Bool)

(declare-fun lt!14701 () (_ BitVec 32))

(assert (=> d!6517 (and (bvsge lt!14701 #b00000000000000000000000000000000) (bvsle lt!14701 (bvsub (size!1348 lt!14653) #b00000000000000000000000000000000)))))

(assert (=> d!6517 (= lt!14701 e!24857)))

(declare-fun c!4590 () Bool)

(assert (=> d!6517 (= c!4590 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6517 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1348 lt!14653)))))

(assert (=> d!6517 (= (arrayCountValidKeys!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14701)))

(assert (= (and d!6517 c!4590) b!39150))

(assert (= (and d!6517 (not c!4590)) b!39148))

(assert (= (and b!39148 c!4591) b!39149))

(assert (= (and b!39148 (not c!4591)) b!39151))

(assert (= (or b!39149 b!39151) bm!2955))

(declare-fun m!31797 () Bool)

(assert (=> b!39148 m!31797))

(assert (=> b!39148 m!31797))

(declare-fun m!31799 () Bool)

(assert (=> b!39148 m!31799))

(declare-fun m!31801 () Bool)

(assert (=> bm!2955 m!31801))

(assert (=> b!39093 d!6517))

(declare-fun d!6523 () Bool)

(declare-fun getCurrentListMap!291 (array!2565 array!2567 (_ BitVec 32) (_ BitVec 32) V!2089 V!2089 (_ BitVec 32) Int) ListLongMap!1031)

(assert (=> d!6523 (= (map!684 lt!14651) (getCurrentListMap!291 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)))))

(declare-fun bs!1628 () Bool)

(assert (= bs!1628 d!6523))

(declare-fun m!31815 () Bool)

(assert (=> bs!1628 m!31815))

(assert (=> b!39093 d!6523))

(declare-fun b!39196 () Bool)

(declare-fun e!24887 () Bool)

(declare-fun call!2970 () Bool)

(assert (=> b!39196 (= e!24887 call!2970)))

(declare-fun d!6531 () Bool)

(declare-fun res!23554 () Bool)

(declare-fun e!24886 () Bool)

(assert (=> d!6531 (=> res!23554 e!24886)))

(assert (=> d!6531 (= res!23554 (bvsge #b00000000000000000000000000000000 (size!1348 lt!14653)))))

(assert (=> d!6531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14653 mask!853) e!24886)))

(declare-fun b!39197 () Bool)

(declare-fun e!24888 () Bool)

(assert (=> b!39197 (= e!24886 e!24888)))

(declare-fun c!4609 () Bool)

(assert (=> b!39197 (= c!4609 (validKeyInArray!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun bm!2967 () Bool)

(assert (=> bm!2967 (= call!2970 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14653 mask!853))))

(declare-fun b!39198 () Bool)

(assert (=> b!39198 (= e!24888 call!2970)))

(declare-fun b!39199 () Bool)

(assert (=> b!39199 (= e!24888 e!24887)))

(declare-fun lt!14732 () (_ BitVec 64))

(assert (=> b!39199 (= lt!14732 (select (arr!1226 lt!14653) #b00000000000000000000000000000000))))

(declare-fun lt!14734 () Unit!971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2565 (_ BitVec 64) (_ BitVec 32)) Unit!971)

(assert (=> b!39199 (= lt!14734 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14653 lt!14732 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!39199 (arrayContainsKey!0 lt!14653 lt!14732 #b00000000000000000000000000000000)))

(declare-fun lt!14733 () Unit!971)

(assert (=> b!39199 (= lt!14733 lt!14734)))

(declare-fun res!23555 () Bool)

(declare-datatypes ((SeekEntryResult!165 0))(
  ( (MissingZero!165 (index!2782 (_ BitVec 32))) (Found!165 (index!2783 (_ BitVec 32))) (Intermediate!165 (undefined!977 Bool) (index!2784 (_ BitVec 32)) (x!7651 (_ BitVec 32))) (Undefined!165) (MissingVacant!165 (index!2785 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2565 (_ BitVec 32)) SeekEntryResult!165)

(assert (=> b!39199 (= res!23555 (= (seekEntryOrOpen!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853) (Found!165 #b00000000000000000000000000000000)))))

(assert (=> b!39199 (=> (not res!23555) (not e!24887))))

(assert (= (and d!6531 (not res!23554)) b!39197))

(assert (= (and b!39197 c!4609) b!39199))

(assert (= (and b!39197 (not c!4609)) b!39198))

(assert (= (and b!39199 res!23555) b!39196))

(assert (= (or b!39196 b!39198) bm!2967))

(assert (=> b!39197 m!31797))

(assert (=> b!39197 m!31797))

(assert (=> b!39197 m!31799))

(declare-fun m!31823 () Bool)

(assert (=> bm!2967 m!31823))

(assert (=> b!39199 m!31797))

(declare-fun m!31825 () Bool)

(assert (=> b!39199 m!31825))

(declare-fun m!31827 () Bool)

(assert (=> b!39199 m!31827))

(assert (=> b!39199 m!31797))

(declare-fun m!31829 () Bool)

(assert (=> b!39199 m!31829))

(assert (=> b!39093 d!6531))

(declare-fun d!6539 () Bool)

(assert (=> d!6539 (= (arrayCountValidKeys!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14740 () Unit!971)

(declare-fun choose!59 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!971)

(assert (=> d!6539 (= lt!14740 (choose!59 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6539 (bvslt (size!1348 lt!14653) #b01111111111111111111111111111111)))

(assert (=> d!6539 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14740)))

(declare-fun bs!1632 () Bool)

(assert (= bs!1632 d!6539))

(assert (=> bs!1632 m!31723))

(declare-fun m!31835 () Bool)

(assert (=> bs!1632 m!31835))

(assert (=> b!39093 d!6539))

(declare-fun d!6545 () Bool)

(assert (=> d!6545 (arrayNoDuplicates!0 lt!14653 #b00000000000000000000000000000000 Nil!1030)))

(declare-fun lt!14746 () Unit!971)

(declare-fun choose!111 (array!2565 (_ BitVec 32) (_ BitVec 32) List!1033) Unit!971)

(assert (=> d!6545 (= lt!14746 (choose!111 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1030))))

(assert (=> d!6545 (= (size!1348 lt!14653) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6545 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1030) lt!14746)))

(declare-fun bs!1634 () Bool)

(assert (= bs!1634 d!6545))

(assert (=> bs!1634 m!31719))

(declare-fun m!31839 () Bool)

(assert (=> bs!1634 m!31839))

(assert (=> b!39093 d!6545))

(declare-fun b!39225 () Bool)

(declare-fun e!24911 () Bool)

(declare-fun contains!494 (List!1033 (_ BitVec 64)) Bool)

(assert (=> b!39225 (= e!24911 (contains!494 Nil!1030 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun d!6549 () Bool)

(declare-fun res!23572 () Bool)

(declare-fun e!24910 () Bool)

(assert (=> d!6549 (=> res!23572 e!24910)))

(assert (=> d!6549 (= res!23572 (bvsge #b00000000000000000000000000000000 (size!1348 lt!14653)))))

(assert (=> d!6549 (= (arrayNoDuplicates!0 lt!14653 #b00000000000000000000000000000000 Nil!1030) e!24910)))

(declare-fun b!39226 () Bool)

(declare-fun e!24909 () Bool)

(declare-fun call!2976 () Bool)

(assert (=> b!39226 (= e!24909 call!2976)))

(declare-fun b!39227 () Bool)

(declare-fun e!24912 () Bool)

(assert (=> b!39227 (= e!24912 e!24909)))

(declare-fun c!4615 () Bool)

(assert (=> b!39227 (= c!4615 (validKeyInArray!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun b!39228 () Bool)

(assert (=> b!39228 (= e!24909 call!2976)))

(declare-fun b!39229 () Bool)

(assert (=> b!39229 (= e!24910 e!24912)))

(declare-fun res!23571 () Bool)

(assert (=> b!39229 (=> (not res!23571) (not e!24912))))

(assert (=> b!39229 (= res!23571 (not e!24911))))

(declare-fun res!23573 () Bool)

(assert (=> b!39229 (=> (not res!23573) (not e!24911))))

(assert (=> b!39229 (= res!23573 (validKeyInArray!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun bm!2973 () Bool)

(assert (=> bm!2973 (= call!2976 (arrayNoDuplicates!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)))))

(assert (= (and d!6549 (not res!23572)) b!39229))

(assert (= (and b!39229 res!23573) b!39225))

(assert (= (and b!39229 res!23571) b!39227))

(assert (= (and b!39227 c!4615) b!39226))

(assert (= (and b!39227 (not c!4615)) b!39228))

(assert (= (or b!39226 b!39228) bm!2973))

(assert (=> b!39225 m!31797))

(assert (=> b!39225 m!31797))

(declare-fun m!31849 () Bool)

(assert (=> b!39225 m!31849))

(assert (=> b!39227 m!31797))

(assert (=> b!39227 m!31797))

(assert (=> b!39227 m!31799))

(assert (=> b!39229 m!31797))

(assert (=> b!39229 m!31797))

(assert (=> b!39229 m!31799))

(assert (=> bm!2973 m!31797))

(declare-fun m!31851 () Bool)

(assert (=> bm!2973 m!31851))

(assert (=> b!39093 d!6549))

(declare-fun d!6557 () Bool)

(assert (=> d!6557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14653 mask!853)))

(declare-fun lt!14752 () Unit!971)

(declare-fun choose!34 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!971)

(assert (=> d!6557 (= lt!14752 (choose!34 lt!14653 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6557 (validMask!0 mask!853)))

(assert (=> d!6557 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14653 mask!853 #b00000000000000000000000000000000) lt!14752)))

(declare-fun bs!1637 () Bool)

(assert (= bs!1637 d!6557))

(assert (=> bs!1637 m!31733))

(declare-fun m!31853 () Bool)

(assert (=> bs!1637 m!31853))

(assert (=> bs!1637 m!31717))

(assert (=> b!39093 d!6557))

(declare-fun d!6559 () Bool)

(declare-fun res!23598 () Bool)

(declare-fun e!24921 () Bool)

(assert (=> d!6559 (=> (not res!23598) (not e!24921))))

(declare-fun simpleValid!24 (LongMapFixedSize!232) Bool)

(assert (=> d!6559 (= res!23598 (simpleValid!24 lt!14651))))

(assert (=> d!6559 (= (valid!129 lt!14651) e!24921)))

(declare-fun b!39254 () Bool)

(declare-fun res!23599 () Bool)

(assert (=> b!39254 (=> (not res!23599) (not e!24921))))

(assert (=> b!39254 (= res!23599 (= (arrayCountValidKeys!0 (_keys!3265 lt!14651) #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))) (_size!165 lt!14651)))))

(declare-fun b!39255 () Bool)

(declare-fun res!23600 () Bool)

(assert (=> b!39255 (=> (not res!23600) (not e!24921))))

(assert (=> b!39255 (= res!23600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3265 lt!14651) (mask!5141 lt!14651)))))

(declare-fun b!39256 () Bool)

(assert (=> b!39256 (= e!24921 (arrayNoDuplicates!0 (_keys!3265 lt!14651) #b00000000000000000000000000000000 Nil!1030))))

(assert (= (and d!6559 res!23598) b!39254))

(assert (= (and b!39254 res!23599) b!39255))

(assert (= (and b!39255 res!23600) b!39256))

(declare-fun m!31871 () Bool)

(assert (=> d!6559 m!31871))

(declare-fun m!31873 () Bool)

(assert (=> b!39254 m!31873))

(declare-fun m!31875 () Bool)

(assert (=> b!39255 m!31875))

(declare-fun m!31877 () Bool)

(assert (=> b!39256 m!31877))

(assert (=> b!39094 d!6559))

(check-sat (not b!39254) (not b!39225) tp_is_empty!1747 b_and!2327 (not b!39148) (not d!6523) (not bm!2967) (not b!39255) (not b!39199) (not bm!2955) (not d!6545) (not b!39229) (not b_lambda!2031) (not d!6559) (not d!6557) (not b!39256) (not d!6539) (not b!39197) (not b!39227) (not b_next!1357) (not bm!2973))
(check-sat b_and!2327 (not b_next!1357))
(get-model)

(declare-fun d!6561 () Bool)

(assert (=> d!6561 (= (validKeyInArray!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)) (and (not (= (select (arr!1226 lt!14653) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1226 lt!14653) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39229 d!6561))

(declare-fun b!39257 () Bool)

(declare-fun e!24922 () (_ BitVec 32))

(declare-fun e!24923 () (_ BitVec 32))

(assert (=> b!39257 (= e!24922 e!24923)))

(declare-fun c!4617 () Bool)

(assert (=> b!39257 (= c!4617 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39258 () Bool)

(declare-fun call!2977 () (_ BitVec 32))

(assert (=> b!39258 (= e!24923 (bvadd #b00000000000000000000000000000001 call!2977))))

(declare-fun b!39259 () Bool)

(assert (=> b!39259 (= e!24922 #b00000000000000000000000000000000)))

(declare-fun bm!2974 () Bool)

(assert (=> bm!2974 (= call!2977 (arrayCountValidKeys!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39260 () Bool)

(assert (=> b!39260 (= e!24923 call!2977)))

(declare-fun d!6563 () Bool)

(declare-fun lt!14753 () (_ BitVec 32))

(assert (=> d!6563 (and (bvsge lt!14753 #b00000000000000000000000000000000) (bvsle lt!14753 (bvsub (size!1348 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6563 (= lt!14753 e!24922)))

(declare-fun c!4616 () Bool)

(assert (=> d!6563 (= c!4616 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6563 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1348 lt!14653)))))

(assert (=> d!6563 (= (arrayCountValidKeys!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14753)))

(assert (= (and d!6563 c!4616) b!39259))

(assert (= (and d!6563 (not c!4616)) b!39257))

(assert (= (and b!39257 c!4617) b!39258))

(assert (= (and b!39257 (not c!4617)) b!39260))

(assert (= (or b!39258 b!39260) bm!2974))

(declare-fun m!31879 () Bool)

(assert (=> b!39257 m!31879))

(assert (=> b!39257 m!31879))

(declare-fun m!31881 () Bool)

(assert (=> b!39257 m!31881))

(declare-fun m!31883 () Bool)

(assert (=> bm!2974 m!31883))

(assert (=> bm!2955 d!6563))

(declare-fun b!39261 () Bool)

(declare-fun e!24924 () (_ BitVec 32))

(declare-fun e!24925 () (_ BitVec 32))

(assert (=> b!39261 (= e!24924 e!24925)))

(declare-fun c!4619 () Bool)

(assert (=> b!39261 (= c!4619 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39262 () Bool)

(declare-fun call!2978 () (_ BitVec 32))

(assert (=> b!39262 (= e!24925 (bvadd #b00000000000000000000000000000001 call!2978))))

(declare-fun b!39263 () Bool)

(assert (=> b!39263 (= e!24924 #b00000000000000000000000000000000)))

(declare-fun bm!2975 () Bool)

(assert (=> bm!2975 (= call!2978 (arrayCountValidKeys!0 (_keys!3265 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39264 () Bool)

(assert (=> b!39264 (= e!24925 call!2978)))

(declare-fun d!6565 () Bool)

(declare-fun lt!14754 () (_ BitVec 32))

(assert (=> d!6565 (and (bvsge lt!14754 #b00000000000000000000000000000000) (bvsle lt!14754 (bvsub (size!1348 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (=> d!6565 (= lt!14754 e!24924)))

(declare-fun c!4618 () Bool)

(assert (=> d!6565 (= c!4618 (bvsge #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6565 (and (bvsle #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1348 (_keys!3265 lt!14651)) (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6565 (= (arrayCountValidKeys!0 (_keys!3265 lt!14651) #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))) lt!14754)))

(assert (= (and d!6565 c!4618) b!39263))

(assert (= (and d!6565 (not c!4618)) b!39261))

(assert (= (and b!39261 c!4619) b!39262))

(assert (= (and b!39261 (not c!4619)) b!39264))

(assert (= (or b!39262 b!39264) bm!2975))

(declare-fun m!31885 () Bool)

(assert (=> b!39261 m!31885))

(assert (=> b!39261 m!31885))

(declare-fun m!31887 () Bool)

(assert (=> b!39261 m!31887))

(declare-fun m!31889 () Bool)

(assert (=> bm!2975 m!31889))

(assert (=> b!39254 d!6565))

(declare-fun b!39265 () Bool)

(declare-fun e!24928 () Bool)

(assert (=> b!39265 (= e!24928 (contains!494 (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6567 () Bool)

(declare-fun res!23602 () Bool)

(declare-fun e!24927 () Bool)

(assert (=> d!6567 (=> res!23602 e!24927)))

(assert (=> d!6567 (= res!23602 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(assert (=> d!6567 (= (arrayNoDuplicates!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) e!24927)))

(declare-fun b!39266 () Bool)

(declare-fun e!24926 () Bool)

(declare-fun call!2979 () Bool)

(assert (=> b!39266 (= e!24926 call!2979)))

(declare-fun b!39267 () Bool)

(declare-fun e!24929 () Bool)

(assert (=> b!39267 (= e!24929 e!24926)))

(declare-fun c!4620 () Bool)

(assert (=> b!39267 (= c!4620 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39268 () Bool)

(assert (=> b!39268 (= e!24926 call!2979)))

(declare-fun b!39269 () Bool)

(assert (=> b!39269 (= e!24927 e!24929)))

(declare-fun res!23601 () Bool)

(assert (=> b!39269 (=> (not res!23601) (not e!24929))))

(assert (=> b!39269 (= res!23601 (not e!24928))))

(declare-fun res!23603 () Bool)

(assert (=> b!39269 (=> (not res!23603) (not e!24928))))

(assert (=> b!39269 (= res!23603 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2976 () Bool)

(assert (=> bm!2976 (= call!2979 (arrayNoDuplicates!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4620 (Cons!1029 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030))))))

(assert (= (and d!6567 (not res!23602)) b!39269))

(assert (= (and b!39269 res!23603) b!39265))

(assert (= (and b!39269 res!23601) b!39267))

(assert (= (and b!39267 c!4620) b!39266))

(assert (= (and b!39267 (not c!4620)) b!39268))

(assert (= (or b!39266 b!39268) bm!2976))

(assert (=> b!39265 m!31879))

(assert (=> b!39265 m!31879))

(declare-fun m!31891 () Bool)

(assert (=> b!39265 m!31891))

(assert (=> b!39267 m!31879))

(assert (=> b!39267 m!31879))

(assert (=> b!39267 m!31881))

(assert (=> b!39269 m!31879))

(assert (=> b!39269 m!31879))

(assert (=> b!39269 m!31881))

(assert (=> bm!2976 m!31879))

(declare-fun m!31893 () Bool)

(assert (=> bm!2976 m!31893))

(assert (=> bm!2973 d!6567))

(declare-fun b!39270 () Bool)

(declare-fun e!24931 () Bool)

(declare-fun call!2980 () Bool)

(assert (=> b!39270 (= e!24931 call!2980)))

(declare-fun d!6569 () Bool)

(declare-fun res!23604 () Bool)

(declare-fun e!24930 () Bool)

(assert (=> d!6569 (=> res!23604 e!24930)))

(assert (=> d!6569 (= res!23604 (bvsge #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3265 lt!14651) (mask!5141 lt!14651)) e!24930)))

(declare-fun b!39271 () Bool)

(declare-fun e!24932 () Bool)

(assert (=> b!39271 (= e!24930 e!24932)))

(declare-fun c!4621 () Bool)

(assert (=> b!39271 (= c!4621 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun bm!2977 () Bool)

(assert (=> bm!2977 (= call!2980 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3265 lt!14651) (mask!5141 lt!14651)))))

(declare-fun b!39272 () Bool)

(assert (=> b!39272 (= e!24932 call!2980)))

(declare-fun b!39273 () Bool)

(assert (=> b!39273 (= e!24932 e!24931)))

(declare-fun lt!14755 () (_ BitVec 64))

(assert (=> b!39273 (= lt!14755 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))

(declare-fun lt!14757 () Unit!971)

(assert (=> b!39273 (= lt!14757 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3265 lt!14651) lt!14755 #b00000000000000000000000000000000))))

(assert (=> b!39273 (arrayContainsKey!0 (_keys!3265 lt!14651) lt!14755 #b00000000000000000000000000000000)))

(declare-fun lt!14756 () Unit!971)

(assert (=> b!39273 (= lt!14756 lt!14757)))

(declare-fun res!23605 () Bool)

(assert (=> b!39273 (= res!23605 (= (seekEntryOrOpen!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) (_keys!3265 lt!14651) (mask!5141 lt!14651)) (Found!165 #b00000000000000000000000000000000)))))

(assert (=> b!39273 (=> (not res!23605) (not e!24931))))

(assert (= (and d!6569 (not res!23604)) b!39271))

(assert (= (and b!39271 c!4621) b!39273))

(assert (= (and b!39271 (not c!4621)) b!39272))

(assert (= (and b!39273 res!23605) b!39270))

(assert (= (or b!39270 b!39272) bm!2977))

(assert (=> b!39271 m!31885))

(assert (=> b!39271 m!31885))

(assert (=> b!39271 m!31887))

(declare-fun m!31895 () Bool)

(assert (=> bm!2977 m!31895))

(assert (=> b!39273 m!31885))

(declare-fun m!31897 () Bool)

(assert (=> b!39273 m!31897))

(declare-fun m!31899 () Bool)

(assert (=> b!39273 m!31899))

(assert (=> b!39273 m!31885))

(declare-fun m!31901 () Bool)

(assert (=> b!39273 m!31901))

(assert (=> b!39255 d!6569))

(declare-fun b!39283 () Bool)

(declare-fun res!23617 () Bool)

(declare-fun e!24935 () Bool)

(assert (=> b!39283 (=> (not res!23617) (not e!24935))))

(declare-fun size!1366 (LongMapFixedSize!232) (_ BitVec 32))

(assert (=> b!39283 (= res!23617 (bvsge (size!1366 lt!14651) (_size!165 lt!14651)))))

(declare-fun b!39285 () Bool)

(assert (=> b!39285 (= e!24935 (and (bvsge (extraKeys!1685 lt!14651) #b00000000000000000000000000000000) (bvsle (extraKeys!1685 lt!14651) #b00000000000000000000000000000011) (bvsge (_vacant!165 lt!14651) #b00000000000000000000000000000000)))))

(declare-fun b!39284 () Bool)

(declare-fun res!23615 () Bool)

(assert (=> b!39284 (=> (not res!23615) (not e!24935))))

(assert (=> b!39284 (= res!23615 (= (size!1366 lt!14651) (bvadd (_size!165 lt!14651) (bvsdiv (bvadd (extraKeys!1685 lt!14651) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!6571 () Bool)

(declare-fun res!23616 () Bool)

(assert (=> d!6571 (=> (not res!23616) (not e!24935))))

(assert (=> d!6571 (= res!23616 (validMask!0 (mask!5141 lt!14651)))))

(assert (=> d!6571 (= (simpleValid!24 lt!14651) e!24935)))

(declare-fun b!39282 () Bool)

(declare-fun res!23614 () Bool)

(assert (=> b!39282 (=> (not res!23614) (not e!24935))))

(assert (=> b!39282 (= res!23614 (and (= (size!1349 (_values!1777 lt!14651)) (bvadd (mask!5141 lt!14651) #b00000000000000000000000000000001)) (= (size!1348 (_keys!3265 lt!14651)) (size!1349 (_values!1777 lt!14651))) (bvsge (_size!165 lt!14651) #b00000000000000000000000000000000) (bvsle (_size!165 lt!14651) (bvadd (mask!5141 lt!14651) #b00000000000000000000000000000001))))))

(assert (= (and d!6571 res!23616) b!39282))

(assert (= (and b!39282 res!23614) b!39283))

(assert (= (and b!39283 res!23617) b!39284))

(assert (= (and b!39284 res!23615) b!39285))

(declare-fun m!31903 () Bool)

(assert (=> b!39283 m!31903))

(assert (=> b!39284 m!31903))

(declare-fun m!31905 () Bool)

(assert (=> d!6571 m!31905))

(assert (=> d!6559 d!6571))

(declare-fun b!39286 () Bool)

(declare-fun e!24938 () Bool)

(assert (=> b!39286 (= e!24938 (contains!494 Nil!1030 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun d!6573 () Bool)

(declare-fun res!23619 () Bool)

(declare-fun e!24937 () Bool)

(assert (=> d!6573 (=> res!23619 e!24937)))

(assert (=> d!6573 (= res!23619 (bvsge #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6573 (= (arrayNoDuplicates!0 (_keys!3265 lt!14651) #b00000000000000000000000000000000 Nil!1030) e!24937)))

(declare-fun b!39287 () Bool)

(declare-fun e!24936 () Bool)

(declare-fun call!2981 () Bool)

(assert (=> b!39287 (= e!24936 call!2981)))

(declare-fun b!39288 () Bool)

(declare-fun e!24939 () Bool)

(assert (=> b!39288 (= e!24939 e!24936)))

(declare-fun c!4622 () Bool)

(assert (=> b!39288 (= c!4622 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39289 () Bool)

(assert (=> b!39289 (= e!24936 call!2981)))

(declare-fun b!39290 () Bool)

(assert (=> b!39290 (= e!24937 e!24939)))

(declare-fun res!23618 () Bool)

(assert (=> b!39290 (=> (not res!23618) (not e!24939))))

(assert (=> b!39290 (= res!23618 (not e!24938))))

(declare-fun res!23620 () Bool)

(assert (=> b!39290 (=> (not res!23620) (not e!24938))))

(assert (=> b!39290 (= res!23620 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun bm!2978 () Bool)

(assert (=> bm!2978 (= call!2981 (arrayNoDuplicates!0 (_keys!3265 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4622 (Cons!1029 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) Nil!1030) Nil!1030)))))

(assert (= (and d!6573 (not res!23619)) b!39290))

(assert (= (and b!39290 res!23620) b!39286))

(assert (= (and b!39290 res!23618) b!39288))

(assert (= (and b!39288 c!4622) b!39287))

(assert (= (and b!39288 (not c!4622)) b!39289))

(assert (= (or b!39287 b!39289) bm!2978))

(assert (=> b!39286 m!31885))

(assert (=> b!39286 m!31885))

(declare-fun m!31907 () Bool)

(assert (=> b!39286 m!31907))

(assert (=> b!39288 m!31885))

(assert (=> b!39288 m!31885))

(assert (=> b!39288 m!31887))

(assert (=> b!39290 m!31885))

(assert (=> b!39290 m!31885))

(assert (=> b!39290 m!31887))

(assert (=> bm!2978 m!31885))

(declare-fun m!31909 () Bool)

(assert (=> bm!2978 m!31909))

(assert (=> b!39256 d!6573))

(assert (=> b!39197 d!6561))

(declare-fun b!39291 () Bool)

(declare-fun e!24941 () Bool)

(declare-fun call!2982 () Bool)

(assert (=> b!39291 (= e!24941 call!2982)))

(declare-fun d!6575 () Bool)

(declare-fun res!23621 () Bool)

(declare-fun e!24940 () Bool)

(assert (=> d!6575 (=> res!23621 e!24940)))

(assert (=> d!6575 (= res!23621 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(assert (=> d!6575 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14653 mask!853) e!24940)))

(declare-fun b!39292 () Bool)

(declare-fun e!24942 () Bool)

(assert (=> b!39292 (= e!24940 e!24942)))

(declare-fun c!4623 () Bool)

(assert (=> b!39292 (= c!4623 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2979 () Bool)

(assert (=> bm!2979 (= call!2982 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14653 mask!853))))

(declare-fun b!39293 () Bool)

(assert (=> b!39293 (= e!24942 call!2982)))

(declare-fun b!39294 () Bool)

(assert (=> b!39294 (= e!24942 e!24941)))

(declare-fun lt!14758 () (_ BitVec 64))

(assert (=> b!39294 (= lt!14758 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14760 () Unit!971)

(assert (=> b!39294 (= lt!14760 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14653 lt!14758 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39294 (arrayContainsKey!0 lt!14653 lt!14758 #b00000000000000000000000000000000)))

(declare-fun lt!14759 () Unit!971)

(assert (=> b!39294 (= lt!14759 lt!14760)))

(declare-fun res!23622 () Bool)

(assert (=> b!39294 (= res!23622 (= (seekEntryOrOpen!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14653 mask!853) (Found!165 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39294 (=> (not res!23622) (not e!24941))))

(assert (= (and d!6575 (not res!23621)) b!39292))

(assert (= (and b!39292 c!4623) b!39294))

(assert (= (and b!39292 (not c!4623)) b!39293))

(assert (= (and b!39294 res!23622) b!39291))

(assert (= (or b!39291 b!39293) bm!2979))

(assert (=> b!39292 m!31879))

(assert (=> b!39292 m!31879))

(assert (=> b!39292 m!31881))

(declare-fun m!31911 () Bool)

(assert (=> bm!2979 m!31911))

(assert (=> b!39294 m!31879))

(declare-fun m!31913 () Bool)

(assert (=> b!39294 m!31913))

(declare-fun m!31915 () Bool)

(assert (=> b!39294 m!31915))

(assert (=> b!39294 m!31879))

(declare-fun m!31917 () Bool)

(assert (=> b!39294 m!31917))

(assert (=> bm!2967 d!6575))

(assert (=> d!6539 d!6517))

(declare-fun d!6579 () Bool)

(assert (=> d!6579 (= (arrayCountValidKeys!0 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6579 true))

(declare-fun _$88!28 () Unit!971)

(assert (=> d!6579 (= (choose!59 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!28)))

(declare-fun bs!1638 () Bool)

(assert (= bs!1638 d!6579))

(assert (=> bs!1638 m!31723))

(assert (=> d!6539 d!6579))

(declare-fun d!6585 () Bool)

(assert (=> d!6585 (arrayContainsKey!0 lt!14653 lt!14732 #b00000000000000000000000000000000)))

(declare-fun lt!14764 () Unit!971)

(declare-fun choose!13 (array!2565 (_ BitVec 64) (_ BitVec 32)) Unit!971)

(assert (=> d!6585 (= lt!14764 (choose!13 lt!14653 lt!14732 #b00000000000000000000000000000000))))

(assert (=> d!6585 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6585 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14653 lt!14732 #b00000000000000000000000000000000) lt!14764)))

(declare-fun bs!1639 () Bool)

(assert (= bs!1639 d!6585))

(assert (=> bs!1639 m!31827))

(declare-fun m!31925 () Bool)

(assert (=> bs!1639 m!31925))

(assert (=> b!39199 d!6585))

(declare-fun d!6587 () Bool)

(declare-fun res!23627 () Bool)

(declare-fun e!24949 () Bool)

(assert (=> d!6587 (=> res!23627 e!24949)))

(assert (=> d!6587 (= res!23627 (= (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14732))))

(assert (=> d!6587 (= (arrayContainsKey!0 lt!14653 lt!14732 #b00000000000000000000000000000000) e!24949)))

(declare-fun b!39303 () Bool)

(declare-fun e!24950 () Bool)

(assert (=> b!39303 (= e!24949 e!24950)))

(declare-fun res!23628 () Bool)

(assert (=> b!39303 (=> (not res!23628) (not e!24950))))

(assert (=> b!39303 (= res!23628 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(declare-fun b!39304 () Bool)

(assert (=> b!39304 (= e!24950 (arrayContainsKey!0 lt!14653 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6587 (not res!23627)) b!39303))

(assert (= (and b!39303 res!23628) b!39304))

(assert (=> d!6587 m!31797))

(declare-fun m!31929 () Bool)

(assert (=> b!39304 m!31929))

(assert (=> b!39199 d!6587))

(declare-fun d!6595 () Bool)

(declare-fun lt!14781 () SeekEntryResult!165)

(get-info :version)

(assert (=> d!6595 (and (or ((_ is Undefined!165) lt!14781) (not ((_ is Found!165) lt!14781)) (and (bvsge (index!2783 lt!14781) #b00000000000000000000000000000000) (bvslt (index!2783 lt!14781) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!14781) ((_ is Found!165) lt!14781) (not ((_ is MissingZero!165) lt!14781)) (and (bvsge (index!2782 lt!14781) #b00000000000000000000000000000000) (bvslt (index!2782 lt!14781) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!14781) ((_ is Found!165) lt!14781) ((_ is MissingZero!165) lt!14781) (not ((_ is MissingVacant!165) lt!14781)) (and (bvsge (index!2785 lt!14781) #b00000000000000000000000000000000) (bvslt (index!2785 lt!14781) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!14781) (ite ((_ is Found!165) lt!14781) (= (select (arr!1226 lt!14653) (index!2783 lt!14781)) (select (arr!1226 lt!14653) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!165) lt!14781) (= (select (arr!1226 lt!14653) (index!2782 lt!14781)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!165) lt!14781) (= (select (arr!1226 lt!14653) (index!2785 lt!14781)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!24970 () SeekEntryResult!165)

(assert (=> d!6595 (= lt!14781 e!24970)))

(declare-fun c!4638 () Bool)

(declare-fun lt!14782 () SeekEntryResult!165)

(assert (=> d!6595 (= c!4638 (and ((_ is Intermediate!165) lt!14782) (undefined!977 lt!14782)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2565 (_ BitVec 32)) SeekEntryResult!165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6595 (= lt!14782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853) (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853))))

(assert (=> d!6595 (validMask!0 mask!853)))

(assert (=> d!6595 (= (seekEntryOrOpen!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853) lt!14781)))

(declare-fun b!39335 () Bool)

(assert (=> b!39335 (= e!24970 Undefined!165)))

(declare-fun b!39336 () Bool)

(declare-fun c!4640 () Bool)

(declare-fun lt!14780 () (_ BitVec 64))

(assert (=> b!39336 (= c!4640 (= lt!14780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24969 () SeekEntryResult!165)

(declare-fun e!24971 () SeekEntryResult!165)

(assert (=> b!39336 (= e!24969 e!24971)))

(declare-fun b!39337 () Bool)

(assert (=> b!39337 (= e!24969 (Found!165 (index!2784 lt!14782)))))

(declare-fun b!39338 () Bool)

(assert (=> b!39338 (= e!24970 e!24969)))

(assert (=> b!39338 (= lt!14780 (select (arr!1226 lt!14653) (index!2784 lt!14782)))))

(declare-fun c!4639 () Bool)

(assert (=> b!39338 (= c!4639 (= lt!14780 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun b!39339 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2565 (_ BitVec 32)) SeekEntryResult!165)

(assert (=> b!39339 (= e!24971 (seekKeyOrZeroReturnVacant!0 (x!7651 lt!14782) (index!2784 lt!14782) (index!2784 lt!14782) (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853))))

(declare-fun b!39340 () Bool)

(assert (=> b!39340 (= e!24971 (MissingZero!165 (index!2784 lt!14782)))))

(assert (= (and d!6595 c!4638) b!39335))

(assert (= (and d!6595 (not c!4638)) b!39338))

(assert (= (and b!39338 c!4639) b!39337))

(assert (= (and b!39338 (not c!4639)) b!39336))

(assert (= (and b!39336 c!4640) b!39340))

(assert (= (and b!39336 (not c!4640)) b!39339))

(declare-fun m!31933 () Bool)

(assert (=> d!6595 m!31933))

(assert (=> d!6595 m!31797))

(declare-fun m!31935 () Bool)

(assert (=> d!6595 m!31935))

(declare-fun m!31937 () Bool)

(assert (=> d!6595 m!31937))

(assert (=> d!6595 m!31797))

(assert (=> d!6595 m!31933))

(assert (=> d!6595 m!31717))

(declare-fun m!31939 () Bool)

(assert (=> d!6595 m!31939))

(declare-fun m!31941 () Bool)

(assert (=> d!6595 m!31941))

(declare-fun m!31943 () Bool)

(assert (=> b!39338 m!31943))

(assert (=> b!39339 m!31797))

(declare-fun m!31945 () Bool)

(assert (=> b!39339 m!31945))

(assert (=> b!39199 d!6595))

(declare-fun d!6605 () Bool)

(declare-fun lt!14789 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!28 (List!1033) (InoxSet (_ BitVec 64)))

(assert (=> d!6605 (= lt!14789 (select (content!28 Nil!1030) (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun e!24981 () Bool)

(assert (=> d!6605 (= lt!14789 e!24981)))

(declare-fun res!23643 () Bool)

(assert (=> d!6605 (=> (not res!23643) (not e!24981))))

(assert (=> d!6605 (= res!23643 ((_ is Cons!1029) Nil!1030))))

(assert (=> d!6605 (= (contains!494 Nil!1030 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)) lt!14789)))

(declare-fun b!39355 () Bool)

(declare-fun e!24982 () Bool)

(assert (=> b!39355 (= e!24981 e!24982)))

(declare-fun res!23642 () Bool)

(assert (=> b!39355 (=> res!23642 e!24982)))

(assert (=> b!39355 (= res!23642 (= (h!1600 Nil!1030) (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun b!39356 () Bool)

(assert (=> b!39356 (= e!24982 (contains!494 (t!3874 Nil!1030) (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(assert (= (and d!6605 res!23643) b!39355))

(assert (= (and b!39355 (not res!23642)) b!39356))

(declare-fun m!31967 () Bool)

(assert (=> d!6605 m!31967))

(assert (=> d!6605 m!31797))

(declare-fun m!31969 () Bool)

(assert (=> d!6605 m!31969))

(assert (=> b!39356 m!31797))

(declare-fun m!31971 () Bool)

(assert (=> b!39356 m!31971))

(assert (=> b!39225 d!6605))

(declare-fun b!39536 () Bool)

(declare-fun res!23735 () Bool)

(declare-fun e!25102 () Bool)

(assert (=> b!39536 (=> (not res!23735) (not e!25102))))

(declare-fun e!25108 () Bool)

(assert (=> b!39536 (= res!23735 e!25108)))

(declare-fun res!23736 () Bool)

(assert (=> b!39536 (=> res!23736 e!25108)))

(declare-fun e!25106 () Bool)

(assert (=> b!39536 (= res!23736 (not e!25106))))

(declare-fun res!23742 () Bool)

(assert (=> b!39536 (=> (not res!23742) (not e!25106))))

(assert (=> b!39536 (= res!23742 (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39537 () Bool)

(declare-fun e!25100 () Bool)

(declare-fun e!25101 () Bool)

(assert (=> b!39537 (= e!25100 e!25101)))

(declare-fun res!23737 () Bool)

(declare-fun call!3042 () Bool)

(assert (=> b!39537 (= res!23737 call!3042)))

(assert (=> b!39537 (=> (not res!23737) (not e!25101))))

(declare-fun b!39538 () Bool)

(declare-fun e!25098 () ListLongMap!1031)

(declare-fun call!3040 () ListLongMap!1031)

(assert (=> b!39538 (= e!25098 call!3040)))

(declare-fun b!39539 () Bool)

(declare-fun e!25097 () Bool)

(assert (=> b!39539 (= e!25108 e!25097)))

(declare-fun res!23744 () Bool)

(assert (=> b!39539 (=> (not res!23744) (not e!25097))))

(declare-fun lt!14968 () ListLongMap!1031)

(declare-fun contains!497 (ListLongMap!1031 (_ BitVec 64)) Bool)

(assert (=> b!39539 (= res!23744 (contains!497 lt!14968 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (=> b!39539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39540 () Bool)

(assert (=> b!39540 (= e!25106 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39541 () Bool)

(declare-fun apply!53 (ListLongMap!1031 (_ BitVec 64)) V!2089)

(declare-fun get!690 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39541 (= e!25097 (= (apply!53 lt!14968 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) (get!690 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39541 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1349 (_values!1777 lt!14651))))))

(assert (=> b!39541 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39542 () Bool)

(declare-fun e!25096 () Unit!971)

(declare-fun lt!14957 () Unit!971)

(assert (=> b!39542 (= e!25096 lt!14957)))

(declare-fun lt!14960 () ListLongMap!1031)

(declare-fun getCurrentListMapNoExtraKeys!31 (array!2565 array!2567 (_ BitVec 32) (_ BitVec 32) V!2089 V!2089 (_ BitVec 32) Int) ListLongMap!1031)

(assert (=> b!39542 (= lt!14960 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)))))

(declare-fun lt!14976 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14959 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14959 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))

(declare-fun lt!14971 () Unit!971)

(declare-fun addStillContains!29 (ListLongMap!1031 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!971)

(assert (=> b!39542 (= lt!14971 (addStillContains!29 lt!14960 lt!14976 (zeroValue!1712 lt!14651) lt!14959))))

(declare-fun +!61 (ListLongMap!1031 tuple2!1460) ListLongMap!1031)

(assert (=> b!39542 (contains!497 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))) lt!14959)))

(declare-fun lt!14962 () Unit!971)

(assert (=> b!39542 (= lt!14962 lt!14971)))

(declare-fun lt!14958 () ListLongMap!1031)

(assert (=> b!39542 (= lt!14958 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)))))

(declare-fun lt!14977 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14966 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14966 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))

(declare-fun lt!14965 () Unit!971)

(declare-fun addApplyDifferent!29 (ListLongMap!1031 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!971)

(assert (=> b!39542 (= lt!14965 (addApplyDifferent!29 lt!14958 lt!14977 (minValue!1712 lt!14651) lt!14966))))

(assert (=> b!39542 (= (apply!53 (+!61 lt!14958 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))) lt!14966) (apply!53 lt!14958 lt!14966))))

(declare-fun lt!14969 () Unit!971)

(assert (=> b!39542 (= lt!14969 lt!14965)))

(declare-fun lt!14961 () ListLongMap!1031)

(assert (=> b!39542 (= lt!14961 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)))))

(declare-fun lt!14973 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14973 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14964 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14964 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))

(declare-fun lt!14972 () Unit!971)

(assert (=> b!39542 (= lt!14972 (addApplyDifferent!29 lt!14961 lt!14973 (zeroValue!1712 lt!14651) lt!14964))))

(assert (=> b!39542 (= (apply!53 (+!61 lt!14961 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))) lt!14964) (apply!53 lt!14961 lt!14964))))

(declare-fun lt!14978 () Unit!971)

(assert (=> b!39542 (= lt!14978 lt!14972)))

(declare-fun lt!14963 () ListLongMap!1031)

(assert (=> b!39542 (= lt!14963 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)))))

(declare-fun lt!14967 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14967 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14974 () (_ BitVec 64))

(assert (=> b!39542 (= lt!14974 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))

(assert (=> b!39542 (= lt!14957 (addApplyDifferent!29 lt!14963 lt!14967 (minValue!1712 lt!14651) lt!14974))))

(assert (=> b!39542 (= (apply!53 (+!61 lt!14963 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))) lt!14974) (apply!53 lt!14963 lt!14974))))

(declare-fun b!39543 () Bool)

(declare-fun e!25110 () Bool)

(declare-fun e!25099 () Bool)

(assert (=> b!39543 (= e!25110 e!25099)))

(declare-fun res!23738 () Bool)

(declare-fun call!3038 () Bool)

(assert (=> b!39543 (= res!23738 call!3038)))

(assert (=> b!39543 (=> (not res!23738) (not e!25099))))

(declare-fun b!39544 () Bool)

(assert (=> b!39544 (= e!25102 e!25100)))

(declare-fun c!4692 () Bool)

(assert (=> b!39544 (= c!4692 (not (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!39545 () Bool)

(declare-fun res!23745 () Bool)

(assert (=> b!39545 (=> (not res!23745) (not e!25102))))

(assert (=> b!39545 (= res!23745 e!25110)))

(declare-fun c!4696 () Bool)

(assert (=> b!39545 (= c!4696 (not (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!39546 () Bool)

(assert (=> b!39546 (= e!25100 (not call!3042))))

(declare-fun bm!3034 () Bool)

(declare-fun call!3041 () ListLongMap!1031)

(assert (=> bm!3034 (= call!3040 call!3041)))

(declare-fun bm!3035 () Bool)

(declare-fun call!3043 () ListLongMap!1031)

(assert (=> bm!3035 (= call!3043 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)))))

(declare-fun b!39547 () Bool)

(declare-fun call!3039 () ListLongMap!1031)

(assert (=> b!39547 (= e!25098 call!3039)))

(declare-fun b!39535 () Bool)

(declare-fun e!25107 () ListLongMap!1031)

(declare-fun e!25109 () ListLongMap!1031)

(assert (=> b!39535 (= e!25107 e!25109)))

(declare-fun c!4697 () Bool)

(assert (=> b!39535 (= c!4697 (and (not (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!6611 () Bool)

(assert (=> d!6611 e!25102))

(declare-fun res!23743 () Bool)

(assert (=> d!6611 (=> (not res!23743) (not e!25102))))

(assert (=> d!6611 (= res!23743 (or (bvsge #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))))

(declare-fun lt!14970 () ListLongMap!1031)

(assert (=> d!6611 (= lt!14968 lt!14970)))

(declare-fun lt!14975 () Unit!971)

(assert (=> d!6611 (= lt!14975 e!25096)))

(declare-fun c!4694 () Bool)

(declare-fun e!25105 () Bool)

(assert (=> d!6611 (= c!4694 e!25105)))

(declare-fun res!23739 () Bool)

(assert (=> d!6611 (=> (not res!23739) (not e!25105))))

(assert (=> d!6611 (= res!23739 (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6611 (= lt!14970 e!25107)))

(declare-fun c!4695 () Bool)

(assert (=> d!6611 (= c!4695 (and (not (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!6611 (validMask!0 (mask!5141 lt!14651))))

(assert (=> d!6611 (= (getCurrentListMap!291 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)) lt!14968)))

(declare-fun b!39548 () Bool)

(declare-fun c!4693 () Bool)

(assert (=> b!39548 (= c!4693 (and (not (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1685 lt!14651) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!39548 (= e!25109 e!25098)))

(declare-fun b!39549 () Bool)

(assert (=> b!39549 (= e!25101 (= (apply!53 lt!14968 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1712 lt!14651)))))

(declare-fun b!39550 () Bool)

(assert (=> b!39550 (= e!25110 (not call!3038))))

(declare-fun b!39551 () Bool)

(assert (=> b!39551 (= e!25099 (= (apply!53 lt!14968 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1712 lt!14651)))))

(declare-fun b!39552 () Bool)

(assert (=> b!39552 (= e!25107 (+!61 call!3041 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))

(declare-fun bm!3036 () Bool)

(declare-fun call!3037 () ListLongMap!1031)

(assert (=> bm!3036 (= call!3037 call!3043)))

(declare-fun bm!3037 () Bool)

(assert (=> bm!3037 (= call!3039 call!3037)))

(declare-fun b!39553 () Bool)

(assert (=> b!39553 (= e!25105 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun bm!3038 () Bool)

(assert (=> bm!3038 (= call!3041 (+!61 (ite c!4695 call!3043 (ite c!4697 call!3037 call!3039)) (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))

(declare-fun bm!3039 () Bool)

(assert (=> bm!3039 (= call!3042 (contains!497 lt!14968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3040 () Bool)

(assert (=> bm!3040 (= call!3038 (contains!497 lt!14968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39554 () Bool)

(declare-fun Unit!978 () Unit!971)

(assert (=> b!39554 (= e!25096 Unit!978)))

(declare-fun b!39555 () Bool)

(assert (=> b!39555 (= e!25109 call!3040)))

(assert (= (and d!6611 c!4695) b!39552))

(assert (= (and d!6611 (not c!4695)) b!39535))

(assert (= (and b!39535 c!4697) b!39555))

(assert (= (and b!39535 (not c!4697)) b!39548))

(assert (= (and b!39548 c!4693) b!39538))

(assert (= (and b!39548 (not c!4693)) b!39547))

(assert (= (or b!39538 b!39547) bm!3037))

(assert (= (or b!39555 bm!3037) bm!3036))

(assert (= (or b!39555 b!39538) bm!3034))

(assert (= (or b!39552 bm!3036) bm!3035))

(assert (= (or b!39552 bm!3034) bm!3038))

(assert (= (and d!6611 res!23739) b!39553))

(assert (= (and d!6611 c!4694) b!39542))

(assert (= (and d!6611 (not c!4694)) b!39554))

(assert (= (and d!6611 res!23743) b!39536))

(assert (= (and b!39536 res!23742) b!39540))

(assert (= (and b!39536 (not res!23736)) b!39539))

(assert (= (and b!39539 res!23744) b!39541))

(assert (= (and b!39536 res!23735) b!39545))

(assert (= (and b!39545 c!4696) b!39543))

(assert (= (and b!39545 (not c!4696)) b!39550))

(assert (= (and b!39543 res!23738) b!39551))

(assert (= (or b!39543 b!39550) bm!3040))

(assert (= (and b!39545 res!23745) b!39544))

(assert (= (and b!39544 c!4692) b!39537))

(assert (= (and b!39544 (not c!4692)) b!39546))

(assert (= (and b!39537 res!23737) b!39549))

(assert (= (or b!39537 b!39546) bm!3039))

(declare-fun b_lambda!2035 () Bool)

(assert (=> (not b_lambda!2035) (not b!39541)))

(declare-fun tb!835 () Bool)

(declare-fun t!3886 () Bool)

(assert (=> (and start!5504 (= defaultEntry!470 (defaultEntry!1794 lt!14651)) t!3886) tb!835))

(declare-fun result!1431 () Bool)

(assert (=> tb!835 (= result!1431 tp_is_empty!1747)))

(assert (=> b!39541 t!3886))

(declare-fun b_and!2339 () Bool)

(assert (= b_and!2327 (and (=> t!3886 result!1431) b_and!2339)))

(declare-fun m!32083 () Bool)

(assert (=> bm!3040 m!32083))

(assert (=> b!39541 m!31885))

(declare-fun m!32085 () Bool)

(assert (=> b!39541 m!32085))

(assert (=> b!39541 m!31885))

(declare-fun m!32087 () Bool)

(assert (=> b!39541 m!32087))

(declare-fun m!32089 () Bool)

(assert (=> b!39541 m!32089))

(assert (=> b!39541 m!32085))

(assert (=> b!39541 m!32089))

(declare-fun m!32091 () Bool)

(assert (=> b!39541 m!32091))

(declare-fun m!32093 () Bool)

(assert (=> bm!3038 m!32093))

(assert (=> b!39553 m!31885))

(assert (=> b!39553 m!31885))

(assert (=> b!39553 m!31887))

(assert (=> d!6611 m!31905))

(declare-fun m!32095 () Bool)

(assert (=> b!39549 m!32095))

(declare-fun m!32097 () Bool)

(assert (=> b!39552 m!32097))

(declare-fun m!32099 () Bool)

(assert (=> b!39542 m!32099))

(declare-fun m!32101 () Bool)

(assert (=> b!39542 m!32101))

(declare-fun m!32103 () Bool)

(assert (=> b!39542 m!32103))

(declare-fun m!32105 () Bool)

(assert (=> b!39542 m!32105))

(declare-fun m!32107 () Bool)

(assert (=> b!39542 m!32107))

(assert (=> b!39542 m!32105))

(declare-fun m!32109 () Bool)

(assert (=> b!39542 m!32109))

(declare-fun m!32111 () Bool)

(assert (=> b!39542 m!32111))

(declare-fun m!32113 () Bool)

(assert (=> b!39542 m!32113))

(declare-fun m!32115 () Bool)

(assert (=> b!39542 m!32115))

(declare-fun m!32117 () Bool)

(assert (=> b!39542 m!32117))

(declare-fun m!32119 () Bool)

(assert (=> b!39542 m!32119))

(assert (=> b!39542 m!32099))

(declare-fun m!32121 () Bool)

(assert (=> b!39542 m!32121))

(assert (=> b!39542 m!32109))

(declare-fun m!32123 () Bool)

(assert (=> b!39542 m!32123))

(declare-fun m!32125 () Bool)

(assert (=> b!39542 m!32125))

(assert (=> b!39542 m!31885))

(assert (=> b!39542 m!32111))

(declare-fun m!32127 () Bool)

(assert (=> b!39542 m!32127))

(declare-fun m!32129 () Bool)

(assert (=> b!39542 m!32129))

(assert (=> bm!3035 m!32127))

(declare-fun m!32131 () Bool)

(assert (=> bm!3039 m!32131))

(assert (=> b!39539 m!31885))

(assert (=> b!39539 m!31885))

(declare-fun m!32133 () Bool)

(assert (=> b!39539 m!32133))

(assert (=> b!39540 m!31885))

(assert (=> b!39540 m!31885))

(assert (=> b!39540 m!31887))

(declare-fun m!32135 () Bool)

(assert (=> b!39551 m!32135))

(assert (=> d!6523 d!6611))

(assert (=> d!6545 d!6549))

(declare-fun d!6641 () Bool)

(assert (=> d!6641 (arrayNoDuplicates!0 lt!14653 #b00000000000000000000000000000000 Nil!1030)))

(assert (=> d!6641 true))

(declare-fun res!23754 () Unit!971)

(assert (=> d!6641 (= (choose!111 lt!14653 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1030) res!23754)))

(declare-fun bs!1648 () Bool)

(assert (= bs!1648 d!6641))

(assert (=> bs!1648 m!31719))

(assert (=> d!6545 d!6641))

(assert (=> b!39148 d!6561))

(assert (=> d!6557 d!6531))

(declare-fun d!6643 () Bool)

(assert (=> d!6643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14653 mask!853)))

(assert (=> d!6643 true))

(declare-fun _$30!48 () Unit!971)

(assert (=> d!6643 (= (choose!34 lt!14653 mask!853 #b00000000000000000000000000000000) _$30!48)))

(declare-fun bs!1649 () Bool)

(assert (= bs!1649 d!6643))

(assert (=> bs!1649 m!31733))

(assert (=> d!6557 d!6643))

(assert (=> d!6557 d!6511))

(assert (=> b!39227 d!6561))

(check-sat (not bm!2974) (not b!39273) (not b_lambda!2035) (not bm!2976) (not b!39284) (not b!39292) (not b!39288) (not b!39261) (not d!6595) (not b!39549) (not b!39290) (not b!39542) (not d!6571) (not b!39271) (not b_lambda!2031) (not bm!2977) tp_is_empty!1747 (not bm!2979) (not bm!2975) (not b!39356) (not d!6611) (not bm!3035) (not b!39267) (not b!39551) (not d!6585) (not b!39283) (not bm!3038) (not b!39257) (not b!39553) (not b!39265) (not b!39286) (not b!39552) (not d!6605) (not b!39540) (not b!39269) (not b!39304) (not b!39541) (not bm!3040) (not b_next!1357) (not b!39539) (not bm!2978) (not bm!3039) (not b!39294) b_and!2339 (not d!6579) (not b!39339) (not d!6641) (not d!6643))
(check-sat b_and!2339 (not b_next!1357))
(get-model)

(declare-fun d!6657 () Bool)

(declare-datatypes ((Option!105 0))(
  ( (Some!104 (v!1991 V!2089)) (None!103) )
))
(declare-fun get!692 (Option!105) V!2089)

(declare-fun getValueByKey!99 (List!1032 (_ BitVec 64)) Option!105)

(assert (=> d!6657 (= (apply!53 lt!14961 lt!14964) (get!692 (getValueByKey!99 (toList!531 lt!14961) lt!14964)))))

(declare-fun bs!1650 () Bool)

(assert (= bs!1650 d!6657))

(declare-fun m!32233 () Bool)

(assert (=> bs!1650 m!32233))

(assert (=> bs!1650 m!32233))

(declare-fun m!32235 () Bool)

(assert (=> bs!1650 m!32235))

(assert (=> b!39542 d!6657))

(declare-fun d!6659 () Bool)

(declare-fun e!25167 () Bool)

(assert (=> d!6659 e!25167))

(declare-fun res!23797 () Bool)

(assert (=> d!6659 (=> (not res!23797) (not e!25167))))

(declare-fun lt!15030 () ListLongMap!1031)

(assert (=> d!6659 (= res!23797 (contains!497 lt!15030 (_1!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))))))

(declare-fun lt!15029 () List!1032)

(assert (=> d!6659 (= lt!15030 (ListLongMap!1032 lt!15029))))

(declare-fun lt!15028 () Unit!971)

(declare-fun lt!15031 () Unit!971)

(assert (=> d!6659 (= lt!15028 lt!15031)))

(assert (=> d!6659 (= (getValueByKey!99 lt!15029 (_1!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!23 (List!1032 (_ BitVec 64) V!2089) Unit!971)

(assert (=> d!6659 (= lt!15031 (lemmaContainsTupThenGetReturnValue!23 lt!15029 (_1!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))))))

(declare-fun insertStrictlySorted!20 (List!1032 (_ BitVec 64) V!2089) List!1032)

(assert (=> d!6659 (= lt!15029 (insertStrictlySorted!20 (toList!531 lt!14958) (_1!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))))))

(assert (=> d!6659 (= (+!61 lt!14958 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))) lt!15030)))

(declare-fun b!39654 () Bool)

(declare-fun res!23798 () Bool)

(assert (=> b!39654 (=> (not res!23798) (not e!25167))))

(assert (=> b!39654 (= res!23798 (= (getValueByKey!99 (toList!531 lt!15030) (_1!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))))))))

(declare-fun b!39655 () Bool)

(declare-fun contains!499 (List!1032 tuple2!1460) Bool)

(assert (=> b!39655 (= e!25167 (contains!499 (toList!531 lt!15030) (tuple2!1461 lt!14977 (minValue!1712 lt!14651))))))

(assert (= (and d!6659 res!23797) b!39654))

(assert (= (and b!39654 res!23798) b!39655))

(declare-fun m!32237 () Bool)

(assert (=> d!6659 m!32237))

(declare-fun m!32239 () Bool)

(assert (=> d!6659 m!32239))

(declare-fun m!32241 () Bool)

(assert (=> d!6659 m!32241))

(declare-fun m!32243 () Bool)

(assert (=> d!6659 m!32243))

(declare-fun m!32245 () Bool)

(assert (=> b!39654 m!32245))

(declare-fun m!32247 () Bool)

(assert (=> b!39655 m!32247))

(assert (=> b!39542 d!6659))

(declare-fun d!6661 () Bool)

(assert (=> d!6661 (= (apply!53 (+!61 lt!14961 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))) lt!14964) (get!692 (getValueByKey!99 (toList!531 (+!61 lt!14961 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))) lt!14964)))))

(declare-fun bs!1651 () Bool)

(assert (= bs!1651 d!6661))

(declare-fun m!32249 () Bool)

(assert (=> bs!1651 m!32249))

(assert (=> bs!1651 m!32249))

(declare-fun m!32251 () Bool)

(assert (=> bs!1651 m!32251))

(assert (=> b!39542 d!6661))

(declare-fun d!6663 () Bool)

(declare-fun e!25168 () Bool)

(assert (=> d!6663 e!25168))

(declare-fun res!23799 () Bool)

(assert (=> d!6663 (=> (not res!23799) (not e!25168))))

(declare-fun lt!15034 () ListLongMap!1031)

(assert (=> d!6663 (= res!23799 (contains!497 lt!15034 (_1!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))))))

(declare-fun lt!15033 () List!1032)

(assert (=> d!6663 (= lt!15034 (ListLongMap!1032 lt!15033))))

(declare-fun lt!15032 () Unit!971)

(declare-fun lt!15035 () Unit!971)

(assert (=> d!6663 (= lt!15032 lt!15035)))

(assert (=> d!6663 (= (getValueByKey!99 lt!15033 (_1!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))))))

(assert (=> d!6663 (= lt!15035 (lemmaContainsTupThenGetReturnValue!23 lt!15033 (_1!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))))))

(assert (=> d!6663 (= lt!15033 (insertStrictlySorted!20 (toList!531 lt!14961) (_1!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))))))

(assert (=> d!6663 (= (+!61 lt!14961 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))) lt!15034)))

(declare-fun b!39656 () Bool)

(declare-fun res!23800 () Bool)

(assert (=> b!39656 (=> (not res!23800) (not e!25168))))

(assert (=> b!39656 (= res!23800 (= (getValueByKey!99 (toList!531 lt!15034) (_1!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))))))))

(declare-fun b!39657 () Bool)

(assert (=> b!39657 (= e!25168 (contains!499 (toList!531 lt!15034) (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))))))

(assert (= (and d!6663 res!23799) b!39656))

(assert (= (and b!39656 res!23800) b!39657))

(declare-fun m!32253 () Bool)

(assert (=> d!6663 m!32253))

(declare-fun m!32255 () Bool)

(assert (=> d!6663 m!32255))

(declare-fun m!32257 () Bool)

(assert (=> d!6663 m!32257))

(declare-fun m!32259 () Bool)

(assert (=> d!6663 m!32259))

(declare-fun m!32261 () Bool)

(assert (=> b!39656 m!32261))

(declare-fun m!32263 () Bool)

(assert (=> b!39657 m!32263))

(assert (=> b!39542 d!6663))

(declare-fun d!6665 () Bool)

(assert (=> d!6665 (= (apply!53 (+!61 lt!14961 (tuple2!1461 lt!14973 (zeroValue!1712 lt!14651))) lt!14964) (apply!53 lt!14961 lt!14964))))

(declare-fun lt!15038 () Unit!971)

(declare-fun choose!244 (ListLongMap!1031 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!971)

(assert (=> d!6665 (= lt!15038 (choose!244 lt!14961 lt!14973 (zeroValue!1712 lt!14651) lt!14964))))

(declare-fun e!25171 () Bool)

(assert (=> d!6665 e!25171))

(declare-fun res!23803 () Bool)

(assert (=> d!6665 (=> (not res!23803) (not e!25171))))

(assert (=> d!6665 (= res!23803 (contains!497 lt!14961 lt!14964))))

(assert (=> d!6665 (= (addApplyDifferent!29 lt!14961 lt!14973 (zeroValue!1712 lt!14651) lt!14964) lt!15038)))

(declare-fun b!39661 () Bool)

(assert (=> b!39661 (= e!25171 (not (= lt!14964 lt!14973)))))

(assert (= (and d!6665 res!23803) b!39661))

(assert (=> d!6665 m!32111))

(assert (=> d!6665 m!32129))

(declare-fun m!32265 () Bool)

(assert (=> d!6665 m!32265))

(declare-fun m!32267 () Bool)

(assert (=> d!6665 m!32267))

(assert (=> d!6665 m!32111))

(assert (=> d!6665 m!32113))

(assert (=> b!39542 d!6665))

(declare-fun d!6667 () Bool)

(assert (=> d!6667 (= (apply!53 lt!14958 lt!14966) (get!692 (getValueByKey!99 (toList!531 lt!14958) lt!14966)))))

(declare-fun bs!1652 () Bool)

(assert (= bs!1652 d!6667))

(declare-fun m!32269 () Bool)

(assert (=> bs!1652 m!32269))

(assert (=> bs!1652 m!32269))

(declare-fun m!32271 () Bool)

(assert (=> bs!1652 m!32271))

(assert (=> b!39542 d!6667))

(declare-fun d!6669 () Bool)

(assert (=> d!6669 (= (apply!53 (+!61 lt!14963 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))) lt!14974) (apply!53 lt!14963 lt!14974))))

(declare-fun lt!15039 () Unit!971)

(assert (=> d!6669 (= lt!15039 (choose!244 lt!14963 lt!14967 (minValue!1712 lt!14651) lt!14974))))

(declare-fun e!25172 () Bool)

(assert (=> d!6669 e!25172))

(declare-fun res!23804 () Bool)

(assert (=> d!6669 (=> (not res!23804) (not e!25172))))

(assert (=> d!6669 (= res!23804 (contains!497 lt!14963 lt!14974))))

(assert (=> d!6669 (= (addApplyDifferent!29 lt!14963 lt!14967 (minValue!1712 lt!14651) lt!14974) lt!15039)))

(declare-fun b!39662 () Bool)

(assert (=> b!39662 (= e!25172 (not (= lt!14974 lt!14967)))))

(assert (= (and d!6669 res!23804) b!39662))

(assert (=> d!6669 m!32099))

(assert (=> d!6669 m!32101))

(declare-fun m!32273 () Bool)

(assert (=> d!6669 m!32273))

(declare-fun m!32275 () Bool)

(assert (=> d!6669 m!32275))

(assert (=> d!6669 m!32099))

(assert (=> d!6669 m!32121))

(assert (=> b!39542 d!6669))

(declare-fun d!6671 () Bool)

(assert (=> d!6671 (= (apply!53 (+!61 lt!14958 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))) lt!14966) (get!692 (getValueByKey!99 (toList!531 (+!61 lt!14958 (tuple2!1461 lt!14977 (minValue!1712 lt!14651)))) lt!14966)))))

(declare-fun bs!1653 () Bool)

(assert (= bs!1653 d!6671))

(declare-fun m!32277 () Bool)

(assert (=> bs!1653 m!32277))

(assert (=> bs!1653 m!32277))

(declare-fun m!32279 () Bool)

(assert (=> bs!1653 m!32279))

(assert (=> b!39542 d!6671))

(declare-fun d!6673 () Bool)

(assert (=> d!6673 (= (apply!53 (+!61 lt!14963 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))) lt!14974) (get!692 (getValueByKey!99 (toList!531 (+!61 lt!14963 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))) lt!14974)))))

(declare-fun bs!1654 () Bool)

(assert (= bs!1654 d!6673))

(declare-fun m!32281 () Bool)

(assert (=> bs!1654 m!32281))

(assert (=> bs!1654 m!32281))

(declare-fun m!32283 () Bool)

(assert (=> bs!1654 m!32283))

(assert (=> b!39542 d!6673))

(declare-fun d!6675 () Bool)

(assert (=> d!6675 (= (apply!53 (+!61 lt!14958 (tuple2!1461 lt!14977 (minValue!1712 lt!14651))) lt!14966) (apply!53 lt!14958 lt!14966))))

(declare-fun lt!15040 () Unit!971)

(assert (=> d!6675 (= lt!15040 (choose!244 lt!14958 lt!14977 (minValue!1712 lt!14651) lt!14966))))

(declare-fun e!25173 () Bool)

(assert (=> d!6675 e!25173))

(declare-fun res!23805 () Bool)

(assert (=> d!6675 (=> (not res!23805) (not e!25173))))

(assert (=> d!6675 (= res!23805 (contains!497 lt!14958 lt!14966))))

(assert (=> d!6675 (= (addApplyDifferent!29 lt!14958 lt!14977 (minValue!1712 lt!14651) lt!14966) lt!15040)))

(declare-fun b!39663 () Bool)

(assert (=> b!39663 (= e!25173 (not (= lt!14966 lt!14977)))))

(assert (= (and d!6675 res!23805) b!39663))

(assert (=> d!6675 m!32109))

(assert (=> d!6675 m!32119))

(declare-fun m!32285 () Bool)

(assert (=> d!6675 m!32285))

(declare-fun m!32287 () Bool)

(assert (=> d!6675 m!32287))

(assert (=> d!6675 m!32109))

(assert (=> d!6675 m!32123))

(assert (=> b!39542 d!6675))

(declare-fun d!6677 () Bool)

(assert (=> d!6677 (contains!497 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))) lt!14959)))

(declare-fun lt!15043 () Unit!971)

(declare-fun choose!245 (ListLongMap!1031 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!971)

(assert (=> d!6677 (= lt!15043 (choose!245 lt!14960 lt!14976 (zeroValue!1712 lt!14651) lt!14959))))

(assert (=> d!6677 (contains!497 lt!14960 lt!14959)))

(assert (=> d!6677 (= (addStillContains!29 lt!14960 lt!14976 (zeroValue!1712 lt!14651) lt!14959) lt!15043)))

(declare-fun bs!1655 () Bool)

(assert (= bs!1655 d!6677))

(assert (=> bs!1655 m!32105))

(assert (=> bs!1655 m!32105))

(assert (=> bs!1655 m!32107))

(declare-fun m!32289 () Bool)

(assert (=> bs!1655 m!32289))

(declare-fun m!32291 () Bool)

(assert (=> bs!1655 m!32291))

(assert (=> b!39542 d!6677))

(declare-fun d!6679 () Bool)

(declare-fun e!25174 () Bool)

(assert (=> d!6679 e!25174))

(declare-fun res!23806 () Bool)

(assert (=> d!6679 (=> (not res!23806) (not e!25174))))

(declare-fun lt!15046 () ListLongMap!1031)

(assert (=> d!6679 (= res!23806 (contains!497 lt!15046 (_1!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))))))

(declare-fun lt!15045 () List!1032)

(assert (=> d!6679 (= lt!15046 (ListLongMap!1032 lt!15045))))

(declare-fun lt!15044 () Unit!971)

(declare-fun lt!15047 () Unit!971)

(assert (=> d!6679 (= lt!15044 lt!15047)))

(assert (=> d!6679 (= (getValueByKey!99 lt!15045 (_1!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))))))

(assert (=> d!6679 (= lt!15047 (lemmaContainsTupThenGetReturnValue!23 lt!15045 (_1!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))))))

(assert (=> d!6679 (= lt!15045 (insertStrictlySorted!20 (toList!531 lt!14960) (_1!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))))))

(assert (=> d!6679 (= (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))) lt!15046)))

(declare-fun b!39665 () Bool)

(declare-fun res!23807 () Bool)

(assert (=> b!39665 (=> (not res!23807) (not e!25174))))

(assert (=> b!39665 (= res!23807 (= (getValueByKey!99 (toList!531 lt!15046) (_1!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))))))))

(declare-fun b!39666 () Bool)

(assert (=> b!39666 (= e!25174 (contains!499 (toList!531 lt!15046) (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))))))

(assert (= (and d!6679 res!23806) b!39665))

(assert (= (and b!39665 res!23807) b!39666))

(declare-fun m!32293 () Bool)

(assert (=> d!6679 m!32293))

(declare-fun m!32295 () Bool)

(assert (=> d!6679 m!32295))

(declare-fun m!32297 () Bool)

(assert (=> d!6679 m!32297))

(declare-fun m!32299 () Bool)

(assert (=> d!6679 m!32299))

(declare-fun m!32301 () Bool)

(assert (=> b!39665 m!32301))

(declare-fun m!32303 () Bool)

(assert (=> b!39666 m!32303))

(assert (=> b!39542 d!6679))

(declare-fun d!6681 () Bool)

(assert (=> d!6681 (= (apply!53 lt!14963 lt!14974) (get!692 (getValueByKey!99 (toList!531 lt!14963) lt!14974)))))

(declare-fun bs!1656 () Bool)

(assert (= bs!1656 d!6681))

(declare-fun m!32305 () Bool)

(assert (=> bs!1656 m!32305))

(assert (=> bs!1656 m!32305))

(declare-fun m!32307 () Bool)

(assert (=> bs!1656 m!32307))

(assert (=> b!39542 d!6681))

(declare-fun b!39691 () Bool)

(declare-fun e!25195 () Bool)

(declare-fun lt!15063 () ListLongMap!1031)

(declare-fun isEmpty!230 (ListLongMap!1031) Bool)

(assert (=> b!39691 (= e!25195 (isEmpty!230 lt!15063))))

(declare-fun b!39692 () Bool)

(declare-fun e!25193 () Bool)

(assert (=> b!39692 (= e!25193 e!25195)))

(declare-fun c!4731 () Bool)

(assert (=> b!39692 (= c!4731 (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39694 () Bool)

(declare-fun e!25191 () ListLongMap!1031)

(declare-fun call!3060 () ListLongMap!1031)

(assert (=> b!39694 (= e!25191 call!3060)))

(declare-fun b!39695 () Bool)

(declare-fun e!25192 () Bool)

(assert (=> b!39695 (= e!25193 e!25192)))

(assert (=> b!39695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(declare-fun res!23819 () Bool)

(assert (=> b!39695 (= res!23819 (contains!497 lt!15063 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (=> b!39695 (=> (not res!23819) (not e!25192))))

(declare-fun b!39696 () Bool)

(declare-fun e!25194 () Bool)

(assert (=> b!39696 (= e!25194 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (=> b!39696 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!39697 () Bool)

(assert (=> b!39697 (= e!25195 (= lt!15063 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1794 lt!14651))))))

(declare-fun b!39698 () Bool)

(assert (=> b!39698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(assert (=> b!39698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1349 (_values!1777 lt!14651))))))

(assert (=> b!39698 (= e!25192 (= (apply!53 lt!15063 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) (get!690 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!6683 () Bool)

(declare-fun e!25189 () Bool)

(assert (=> d!6683 e!25189))

(declare-fun res!23816 () Bool)

(assert (=> d!6683 (=> (not res!23816) (not e!25189))))

(assert (=> d!6683 (= res!23816 (not (contains!497 lt!15063 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!25190 () ListLongMap!1031)

(assert (=> d!6683 (= lt!15063 e!25190)))

(declare-fun c!4729 () Bool)

(assert (=> d!6683 (= c!4729 (bvsge #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6683 (validMask!0 (mask!5141 lt!14651))))

(assert (=> d!6683 (= (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) #b00000000000000000000000000000000 (defaultEntry!1794 lt!14651)) lt!15063)))

(declare-fun b!39693 () Bool)

(assert (=> b!39693 (= e!25190 e!25191)))

(declare-fun c!4732 () Bool)

(assert (=> b!39693 (= c!4732 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39699 () Bool)

(assert (=> b!39699 (= e!25189 e!25193)))

(declare-fun c!4730 () Bool)

(assert (=> b!39699 (= c!4730 e!25194)))

(declare-fun res!23818 () Bool)

(assert (=> b!39699 (=> (not res!23818) (not e!25194))))

(assert (=> b!39699 (= res!23818 (bvslt #b00000000000000000000000000000000 (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39700 () Bool)

(assert (=> b!39700 (= e!25190 (ListLongMap!1032 Nil!1029))))

(declare-fun b!39701 () Bool)

(declare-fun res!23817 () Bool)

(assert (=> b!39701 (=> (not res!23817) (not e!25189))))

(assert (=> b!39701 (= res!23817 (not (contains!497 lt!15063 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!3057 () Bool)

(assert (=> bm!3057 (= call!3060 (getCurrentListMapNoExtraKeys!31 (_keys!3265 lt!14651) (_values!1777 lt!14651) (mask!5141 lt!14651) (extraKeys!1685 lt!14651) (zeroValue!1712 lt!14651) (minValue!1712 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1794 lt!14651)))))

(declare-fun b!39702 () Bool)

(declare-fun lt!15064 () Unit!971)

(declare-fun lt!15068 () Unit!971)

(assert (=> b!39702 (= lt!15064 lt!15068)))

(declare-fun lt!15066 () (_ BitVec 64))

(declare-fun lt!15062 () (_ BitVec 64))

(declare-fun lt!15065 () ListLongMap!1031)

(declare-fun lt!15067 () V!2089)

(assert (=> b!39702 (not (contains!497 (+!61 lt!15065 (tuple2!1461 lt!15066 lt!15067)) lt!15062))))

(declare-fun addStillNotContains!4 (ListLongMap!1031 (_ BitVec 64) V!2089 (_ BitVec 64)) Unit!971)

(assert (=> b!39702 (= lt!15068 (addStillNotContains!4 lt!15065 lt!15066 lt!15067 lt!15062))))

(assert (=> b!39702 (= lt!15062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!39702 (= lt!15067 (get!690 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39702 (= lt!15066 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))

(assert (=> b!39702 (= lt!15065 call!3060)))

(assert (=> b!39702 (= e!25191 (+!61 call!3060 (tuple2!1461 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) (get!690 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!6683 c!4729) b!39700))

(assert (= (and d!6683 (not c!4729)) b!39693))

(assert (= (and b!39693 c!4732) b!39702))

(assert (= (and b!39693 (not c!4732)) b!39694))

(assert (= (or b!39702 b!39694) bm!3057))

(assert (= (and d!6683 res!23816) b!39701))

(assert (= (and b!39701 res!23817) b!39699))

(assert (= (and b!39699 res!23818) b!39696))

(assert (= (and b!39699 c!4730) b!39695))

(assert (= (and b!39699 (not c!4730)) b!39692))

(assert (= (and b!39695 res!23819) b!39698))

(assert (= (and b!39692 c!4731) b!39697))

(assert (= (and b!39692 (not c!4731)) b!39691))

(declare-fun b_lambda!2039 () Bool)

(assert (=> (not b_lambda!2039) (not b!39698)))

(assert (=> b!39698 t!3886))

(declare-fun b_and!2343 () Bool)

(assert (= b_and!2339 (and (=> t!3886 result!1431) b_and!2343)))

(declare-fun b_lambda!2041 () Bool)

(assert (=> (not b_lambda!2041) (not b!39702)))

(assert (=> b!39702 t!3886))

(declare-fun b_and!2345 () Bool)

(assert (= b_and!2343 (and (=> t!3886 result!1431) b_and!2345)))

(declare-fun m!32309 () Bool)

(assert (=> bm!3057 m!32309))

(assert (=> b!39697 m!32309))

(assert (=> b!39693 m!31885))

(assert (=> b!39693 m!31885))

(assert (=> b!39693 m!31887))

(assert (=> b!39695 m!31885))

(assert (=> b!39695 m!31885))

(declare-fun m!32311 () Bool)

(assert (=> b!39695 m!32311))

(assert (=> b!39702 m!31885))

(assert (=> b!39702 m!32089))

(declare-fun m!32313 () Bool)

(assert (=> b!39702 m!32313))

(declare-fun m!32315 () Bool)

(assert (=> b!39702 m!32315))

(assert (=> b!39702 m!32085))

(assert (=> b!39702 m!32089))

(assert (=> b!39702 m!32091))

(declare-fun m!32317 () Bool)

(assert (=> b!39702 m!32317))

(declare-fun m!32319 () Bool)

(assert (=> b!39702 m!32319))

(assert (=> b!39702 m!32085))

(assert (=> b!39702 m!32317))

(declare-fun m!32321 () Bool)

(assert (=> d!6683 m!32321))

(assert (=> d!6683 m!31905))

(declare-fun m!32323 () Bool)

(assert (=> b!39691 m!32323))

(assert (=> b!39698 m!31885))

(assert (=> b!39698 m!32085))

(assert (=> b!39698 m!32089))

(assert (=> b!39698 m!32085))

(assert (=> b!39698 m!32089))

(assert (=> b!39698 m!32091))

(assert (=> b!39698 m!31885))

(declare-fun m!32325 () Bool)

(assert (=> b!39698 m!32325))

(declare-fun m!32327 () Bool)

(assert (=> b!39701 m!32327))

(assert (=> b!39696 m!31885))

(assert (=> b!39696 m!31885))

(assert (=> b!39696 m!31887))

(assert (=> b!39542 d!6683))

(declare-fun d!6685 () Bool)

(declare-fun e!25196 () Bool)

(assert (=> d!6685 e!25196))

(declare-fun res!23820 () Bool)

(assert (=> d!6685 (=> (not res!23820) (not e!25196))))

(declare-fun lt!15071 () ListLongMap!1031)

(assert (=> d!6685 (= res!23820 (contains!497 lt!15071 (_1!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))))))

(declare-fun lt!15070 () List!1032)

(assert (=> d!6685 (= lt!15071 (ListLongMap!1032 lt!15070))))

(declare-fun lt!15069 () Unit!971)

(declare-fun lt!15072 () Unit!971)

(assert (=> d!6685 (= lt!15069 lt!15072)))

(assert (=> d!6685 (= (getValueByKey!99 lt!15070 (_1!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))))))

(assert (=> d!6685 (= lt!15072 (lemmaContainsTupThenGetReturnValue!23 lt!15070 (_1!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))))))

(assert (=> d!6685 (= lt!15070 (insertStrictlySorted!20 (toList!531 lt!14963) (_1!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))) (_2!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))))))

(assert (=> d!6685 (= (+!61 lt!14963 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))) lt!15071)))

(declare-fun b!39703 () Bool)

(declare-fun res!23821 () Bool)

(assert (=> b!39703 (=> (not res!23821) (not e!25196))))

(assert (=> b!39703 (= res!23821 (= (getValueByKey!99 (toList!531 lt!15071) (_1!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 lt!14967 (minValue!1712 lt!14651))))))))

(declare-fun b!39704 () Bool)

(assert (=> b!39704 (= e!25196 (contains!499 (toList!531 lt!15071) (tuple2!1461 lt!14967 (minValue!1712 lt!14651))))))

(assert (= (and d!6685 res!23820) b!39703))

(assert (= (and b!39703 res!23821) b!39704))

(declare-fun m!32329 () Bool)

(assert (=> d!6685 m!32329))

(declare-fun m!32331 () Bool)

(assert (=> d!6685 m!32331))

(declare-fun m!32333 () Bool)

(assert (=> d!6685 m!32333))

(declare-fun m!32335 () Bool)

(assert (=> d!6685 m!32335))

(declare-fun m!32337 () Bool)

(assert (=> b!39703 m!32337))

(declare-fun m!32339 () Bool)

(assert (=> b!39704 m!32339))

(assert (=> b!39542 d!6685))

(declare-fun d!6687 () Bool)

(declare-fun e!25201 () Bool)

(assert (=> d!6687 e!25201))

(declare-fun res!23824 () Bool)

(assert (=> d!6687 (=> res!23824 e!25201)))

(declare-fun lt!15082 () Bool)

(assert (=> d!6687 (= res!23824 (not lt!15082))))

(declare-fun lt!15083 () Bool)

(assert (=> d!6687 (= lt!15082 lt!15083)))

(declare-fun lt!15081 () Unit!971)

(declare-fun e!25202 () Unit!971)

(assert (=> d!6687 (= lt!15081 e!25202)))

(declare-fun c!4735 () Bool)

(assert (=> d!6687 (= c!4735 lt!15083)))

(declare-fun containsKey!66 (List!1032 (_ BitVec 64)) Bool)

(assert (=> d!6687 (= lt!15083 (containsKey!66 (toList!531 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))) lt!14959))))

(assert (=> d!6687 (= (contains!497 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651))) lt!14959) lt!15082)))

(declare-fun b!39711 () Bool)

(declare-fun lt!15084 () Unit!971)

(assert (=> b!39711 (= e!25202 lt!15084)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!54 (List!1032 (_ BitVec 64)) Unit!971)

(assert (=> b!39711 (= lt!15084 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!531 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))) lt!14959))))

(declare-fun isDefined!55 (Option!105) Bool)

(assert (=> b!39711 (isDefined!55 (getValueByKey!99 (toList!531 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))) lt!14959))))

(declare-fun b!39712 () Bool)

(declare-fun Unit!980 () Unit!971)

(assert (=> b!39712 (= e!25202 Unit!980)))

(declare-fun b!39713 () Bool)

(assert (=> b!39713 (= e!25201 (isDefined!55 (getValueByKey!99 (toList!531 (+!61 lt!14960 (tuple2!1461 lt!14976 (zeroValue!1712 lt!14651)))) lt!14959)))))

(assert (= (and d!6687 c!4735) b!39711))

(assert (= (and d!6687 (not c!4735)) b!39712))

(assert (= (and d!6687 (not res!23824)) b!39713))

(declare-fun m!32341 () Bool)

(assert (=> d!6687 m!32341))

(declare-fun m!32343 () Bool)

(assert (=> b!39711 m!32343))

(declare-fun m!32345 () Bool)

(assert (=> b!39711 m!32345))

(assert (=> b!39711 m!32345))

(declare-fun m!32347 () Bool)

(assert (=> b!39711 m!32347))

(assert (=> b!39713 m!32345))

(assert (=> b!39713 m!32345))

(assert (=> b!39713 m!32347))

(assert (=> b!39542 d!6687))

(declare-fun d!6689 () Bool)

(assert (=> d!6689 (= (validMask!0 (mask!5141 lt!14651)) (and (or (= (mask!5141 lt!14651) #b00000000000000000000000000000111) (= (mask!5141 lt!14651) #b00000000000000000000000000001111) (= (mask!5141 lt!14651) #b00000000000000000000000000011111) (= (mask!5141 lt!14651) #b00000000000000000000000000111111) (= (mask!5141 lt!14651) #b00000000000000000000000001111111) (= (mask!5141 lt!14651) #b00000000000000000000000011111111) (= (mask!5141 lt!14651) #b00000000000000000000000111111111) (= (mask!5141 lt!14651) #b00000000000000000000001111111111) (= (mask!5141 lt!14651) #b00000000000000000000011111111111) (= (mask!5141 lt!14651) #b00000000000000000000111111111111) (= (mask!5141 lt!14651) #b00000000000000000001111111111111) (= (mask!5141 lt!14651) #b00000000000000000011111111111111) (= (mask!5141 lt!14651) #b00000000000000000111111111111111) (= (mask!5141 lt!14651) #b00000000000000001111111111111111) (= (mask!5141 lt!14651) #b00000000000000011111111111111111) (= (mask!5141 lt!14651) #b00000000000000111111111111111111) (= (mask!5141 lt!14651) #b00000000000001111111111111111111) (= (mask!5141 lt!14651) #b00000000000011111111111111111111) (= (mask!5141 lt!14651) #b00000000000111111111111111111111) (= (mask!5141 lt!14651) #b00000000001111111111111111111111) (= (mask!5141 lt!14651) #b00000000011111111111111111111111) (= (mask!5141 lt!14651) #b00000000111111111111111111111111) (= (mask!5141 lt!14651) #b00000001111111111111111111111111) (= (mask!5141 lt!14651) #b00000011111111111111111111111111) (= (mask!5141 lt!14651) #b00000111111111111111111111111111) (= (mask!5141 lt!14651) #b00001111111111111111111111111111) (= (mask!5141 lt!14651) #b00011111111111111111111111111111) (= (mask!5141 lt!14651) #b00111111111111111111111111111111)) (bvsle (mask!5141 lt!14651) #b00111111111111111111111111111111)))))

(assert (=> d!6611 d!6689))

(declare-fun d!6691 () Bool)

(assert (=> d!6691 (= (apply!53 lt!14968 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) (get!692 (getValueByKey!99 (toList!531 lt!14968) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))))

(declare-fun bs!1657 () Bool)

(assert (= bs!1657 d!6691))

(assert (=> bs!1657 m!31885))

(declare-fun m!32349 () Bool)

(assert (=> bs!1657 m!32349))

(assert (=> bs!1657 m!32349))

(declare-fun m!32351 () Bool)

(assert (=> bs!1657 m!32351))

(assert (=> b!39541 d!6691))

(declare-fun d!6693 () Bool)

(declare-fun c!4738 () Bool)

(assert (=> d!6693 (= c!4738 ((_ is ValueCellFull!626) (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun e!25205 () V!2089)

(assert (=> d!6693 (= (get!690 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000)) e!25205)))

(declare-fun b!39718 () Bool)

(declare-fun get!693 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39718 (= e!25205 (get!693 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39719 () Bool)

(declare-fun get!694 (ValueCell!626 V!2089) V!2089)

(assert (=> b!39719 (= e!25205 (get!694 (select (arr!1227 (_values!1777 lt!14651)) #b00000000000000000000000000000000) (dynLambda!183 (defaultEntry!1794 lt!14651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6693 c!4738) b!39718))

(assert (= (and d!6693 (not c!4738)) b!39719))

(assert (=> b!39718 m!32085))

(assert (=> b!39718 m!32089))

(declare-fun m!32353 () Bool)

(assert (=> b!39718 m!32353))

(assert (=> b!39719 m!32085))

(assert (=> b!39719 m!32089))

(declare-fun m!32355 () Bool)

(assert (=> b!39719 m!32355))

(assert (=> b!39541 d!6693))

(declare-fun b!39751 () Bool)

(declare-fun lt!15093 () SeekEntryResult!165)

(assert (=> b!39751 (and (bvsge (index!2784 lt!15093) #b00000000000000000000000000000000) (bvslt (index!2784 lt!15093) (size!1348 lt!14653)))))

(declare-fun res!23836 () Bool)

(assert (=> b!39751 (= res!23836 (= (select (arr!1226 lt!14653) (index!2784 lt!15093)) (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun e!25226 () Bool)

(assert (=> b!39751 (=> res!23836 e!25226)))

(declare-fun e!25227 () Bool)

(assert (=> b!39751 (= e!25227 e!25226)))

(declare-fun b!39752 () Bool)

(assert (=> b!39752 (and (bvsge (index!2784 lt!15093) #b00000000000000000000000000000000) (bvslt (index!2784 lt!15093) (size!1348 lt!14653)))))

(assert (=> b!39752 (= e!25226 (= (select (arr!1226 lt!14653) (index!2784 lt!15093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39753 () Bool)

(declare-fun e!25228 () SeekEntryResult!165)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39753 (= e!25228 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!853) (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853))))

(declare-fun b!39754 () Bool)

(declare-fun e!25229 () Bool)

(assert (=> b!39754 (= e!25229 e!25227)))

(declare-fun res!23837 () Bool)

(assert (=> b!39754 (= res!23837 (and ((_ is Intermediate!165) lt!15093) (not (undefined!977 lt!15093)) (bvslt (x!7651 lt!15093) #b01111111111111111111111111111110) (bvsge (x!7651 lt!15093) #b00000000000000000000000000000000) (bvsge (x!7651 lt!15093) #b00000000000000000000000000000000)))))

(assert (=> b!39754 (=> (not res!23837) (not e!25227))))

(declare-fun d!6695 () Bool)

(assert (=> d!6695 e!25229))

(declare-fun c!4750 () Bool)

(assert (=> d!6695 (= c!4750 (and ((_ is Intermediate!165) lt!15093) (undefined!977 lt!15093)))))

(declare-fun e!25225 () SeekEntryResult!165)

(assert (=> d!6695 (= lt!15093 e!25225)))

(declare-fun c!4749 () Bool)

(assert (=> d!6695 (= c!4749 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!15094 () (_ BitVec 64))

(assert (=> d!6695 (= lt!15094 (select (arr!1226 lt!14653) (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6695 (validMask!0 mask!853)))

(assert (=> d!6695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853) (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853) lt!15093)))

(declare-fun b!39755 () Bool)

(assert (=> b!39755 (= e!25229 (bvsge (x!7651 lt!15093) #b01111111111111111111111111111110))))

(declare-fun b!39756 () Bool)

(assert (=> b!39756 (= e!25225 e!25228)))

(declare-fun c!4751 () Bool)

(assert (=> b!39756 (= c!4751 (or (= lt!15094 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)) (= (bvadd lt!15094 lt!15094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39757 () Bool)

(assert (=> b!39757 (= e!25228 (Intermediate!165 false (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39758 () Bool)

(assert (=> b!39758 (and (bvsge (index!2784 lt!15093) #b00000000000000000000000000000000) (bvslt (index!2784 lt!15093) (size!1348 lt!14653)))))

(declare-fun res!23838 () Bool)

(assert (=> b!39758 (= res!23838 (= (select (arr!1226 lt!14653) (index!2784 lt!15093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39758 (=> res!23838 e!25226)))

(declare-fun b!39759 () Bool)

(assert (=> b!39759 (= e!25225 (Intermediate!165 true (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!6695 c!4749) b!39759))

(assert (= (and d!6695 (not c!4749)) b!39756))

(assert (= (and b!39756 c!4751) b!39757))

(assert (= (and b!39756 (not c!4751)) b!39753))

(assert (= (and d!6695 c!4750) b!39755))

(assert (= (and d!6695 (not c!4750)) b!39754))

(assert (= (and b!39754 res!23837) b!39751))

(assert (= (and b!39751 (not res!23836)) b!39758))

(assert (= (and b!39758 (not res!23838)) b!39752))

(declare-fun m!32375 () Bool)

(assert (=> b!39758 m!32375))

(assert (=> b!39753 m!31933))

(declare-fun m!32377 () Bool)

(assert (=> b!39753 m!32377))

(assert (=> b!39753 m!32377))

(assert (=> b!39753 m!31797))

(declare-fun m!32379 () Bool)

(assert (=> b!39753 m!32379))

(assert (=> b!39752 m!32375))

(assert (=> d!6695 m!31933))

(declare-fun m!32381 () Bool)

(assert (=> d!6695 m!32381))

(assert (=> d!6695 m!31717))

(assert (=> b!39751 m!32375))

(assert (=> d!6595 d!6695))

(declare-fun d!6709 () Bool)

(declare-fun lt!15100 () (_ BitVec 32))

(declare-fun lt!15099 () (_ BitVec 32))

(assert (=> d!6709 (= lt!15100 (bvmul (bvxor lt!15099 (bvlshr lt!15099 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6709 (= lt!15099 ((_ extract 31 0) (bvand (bvxor (select (arr!1226 lt!14653) #b00000000000000000000000000000000) (bvlshr (select (arr!1226 lt!14653) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6709 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23839 (let ((h!1605 ((_ extract 31 0) (bvand (bvxor (select (arr!1226 lt!14653) #b00000000000000000000000000000000) (bvlshr (select (arr!1226 lt!14653) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7670 (bvmul (bvxor h!1605 (bvlshr h!1605 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7670 (bvlshr x!7670 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23839 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23839 #b00000000000000000000000000000000))))))

(assert (=> d!6709 (= (toIndex!0 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15100 (bvlshr lt!15100 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6595 d!6709))

(assert (=> d!6595 d!6511))

(declare-fun d!6711 () Bool)

(assert (=> d!6711 (= (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39540 d!6711))

(declare-fun d!6713 () Bool)

(declare-fun e!25230 () Bool)

(assert (=> d!6713 e!25230))

(declare-fun res!23840 () Bool)

(assert (=> d!6713 (=> res!23840 e!25230)))

(declare-fun lt!15102 () Bool)

(assert (=> d!6713 (= res!23840 (not lt!15102))))

(declare-fun lt!15103 () Bool)

(assert (=> d!6713 (= lt!15102 lt!15103)))

(declare-fun lt!15101 () Unit!971)

(declare-fun e!25231 () Unit!971)

(assert (=> d!6713 (= lt!15101 e!25231)))

(declare-fun c!4752 () Bool)

(assert (=> d!6713 (= c!4752 lt!15103)))

(assert (=> d!6713 (= lt!15103 (containsKey!66 (toList!531 lt!14968) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (=> d!6713 (= (contains!497 lt!14968 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) lt!15102)))

(declare-fun b!39760 () Bool)

(declare-fun lt!15104 () Unit!971)

(assert (=> b!39760 (= e!25231 lt!15104)))

(assert (=> b!39760 (= lt!15104 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!531 lt!14968) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (=> b!39760 (isDefined!55 (getValueByKey!99 (toList!531 lt!14968) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39761 () Bool)

(declare-fun Unit!981 () Unit!971)

(assert (=> b!39761 (= e!25231 Unit!981)))

(declare-fun b!39762 () Bool)

(assert (=> b!39762 (= e!25230 (isDefined!55 (getValueByKey!99 (toList!531 lt!14968) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000))))))

(assert (= (and d!6713 c!4752) b!39760))

(assert (= (and d!6713 (not c!4752)) b!39761))

(assert (= (and d!6713 (not res!23840)) b!39762))

(assert (=> d!6713 m!31885))

(declare-fun m!32383 () Bool)

(assert (=> d!6713 m!32383))

(assert (=> b!39760 m!31885))

(declare-fun m!32385 () Bool)

(assert (=> b!39760 m!32385))

(assert (=> b!39760 m!31885))

(assert (=> b!39760 m!32349))

(assert (=> b!39760 m!32349))

(declare-fun m!32387 () Bool)

(assert (=> b!39760 m!32387))

(assert (=> b!39762 m!31885))

(assert (=> b!39762 m!32349))

(assert (=> b!39762 m!32349))

(assert (=> b!39762 m!32387))

(assert (=> b!39539 d!6713))

(declare-fun d!6715 () Bool)

(declare-fun e!25232 () Bool)

(assert (=> d!6715 e!25232))

(declare-fun res!23841 () Bool)

(assert (=> d!6715 (=> res!23841 e!25232)))

(declare-fun lt!15106 () Bool)

(assert (=> d!6715 (= res!23841 (not lt!15106))))

(declare-fun lt!15107 () Bool)

(assert (=> d!6715 (= lt!15106 lt!15107)))

(declare-fun lt!15105 () Unit!971)

(declare-fun e!25233 () Unit!971)

(assert (=> d!6715 (= lt!15105 e!25233)))

(declare-fun c!4753 () Bool)

(assert (=> d!6715 (= c!4753 lt!15107)))

(assert (=> d!6715 (= lt!15107 (containsKey!66 (toList!531 lt!14968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6715 (= (contains!497 lt!14968 #b0000000000000000000000000000000000000000000000000000000000000000) lt!15106)))

(declare-fun b!39763 () Bool)

(declare-fun lt!15108 () Unit!971)

(assert (=> b!39763 (= e!25233 lt!15108)))

(assert (=> b!39763 (= lt!15108 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!531 lt!14968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39763 (isDefined!55 (getValueByKey!99 (toList!531 lt!14968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39764 () Bool)

(declare-fun Unit!982 () Unit!971)

(assert (=> b!39764 (= e!25233 Unit!982)))

(declare-fun b!39765 () Bool)

(assert (=> b!39765 (= e!25232 (isDefined!55 (getValueByKey!99 (toList!531 lt!14968) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6715 c!4753) b!39763))

(assert (= (and d!6715 (not c!4753)) b!39764))

(assert (= (and d!6715 (not res!23841)) b!39765))

(declare-fun m!32389 () Bool)

(assert (=> d!6715 m!32389))

(declare-fun m!32391 () Bool)

(assert (=> b!39763 m!32391))

(declare-fun m!32393 () Bool)

(assert (=> b!39763 m!32393))

(assert (=> b!39763 m!32393))

(declare-fun m!32395 () Bool)

(assert (=> b!39763 m!32395))

(assert (=> b!39765 m!32393))

(assert (=> b!39765 m!32393))

(assert (=> b!39765 m!32395))

(assert (=> bm!3040 d!6715))

(declare-fun d!6717 () Bool)

(declare-fun e!25234 () Bool)

(assert (=> d!6717 e!25234))

(declare-fun res!23842 () Bool)

(assert (=> d!6717 (=> res!23842 e!25234)))

(declare-fun lt!15110 () Bool)

(assert (=> d!6717 (= res!23842 (not lt!15110))))

(declare-fun lt!15111 () Bool)

(assert (=> d!6717 (= lt!15110 lt!15111)))

(declare-fun lt!15109 () Unit!971)

(declare-fun e!25235 () Unit!971)

(assert (=> d!6717 (= lt!15109 e!25235)))

(declare-fun c!4754 () Bool)

(assert (=> d!6717 (= c!4754 lt!15111)))

(assert (=> d!6717 (= lt!15111 (containsKey!66 (toList!531 lt!14968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6717 (= (contains!497 lt!14968 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15110)))

(declare-fun b!39766 () Bool)

(declare-fun lt!15112 () Unit!971)

(assert (=> b!39766 (= e!25235 lt!15112)))

(assert (=> b!39766 (= lt!15112 (lemmaContainsKeyImpliesGetValueByKeyDefined!54 (toList!531 lt!14968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39766 (isDefined!55 (getValueByKey!99 (toList!531 lt!14968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39767 () Bool)

(declare-fun Unit!983 () Unit!971)

(assert (=> b!39767 (= e!25235 Unit!983)))

(declare-fun b!39768 () Bool)

(assert (=> b!39768 (= e!25234 (isDefined!55 (getValueByKey!99 (toList!531 lt!14968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6717 c!4754) b!39766))

(assert (= (and d!6717 (not c!4754)) b!39767))

(assert (= (and d!6717 (not res!23842)) b!39768))

(declare-fun m!32397 () Bool)

(assert (=> d!6717 m!32397))

(declare-fun m!32399 () Bool)

(assert (=> b!39766 m!32399))

(declare-fun m!32401 () Bool)

(assert (=> b!39766 m!32401))

(assert (=> b!39766 m!32401))

(declare-fun m!32403 () Bool)

(assert (=> b!39766 m!32403))

(assert (=> b!39768 m!32401))

(assert (=> b!39768 m!32401))

(assert (=> b!39768 m!32403))

(assert (=> bm!3039 d!6717))

(assert (=> b!39261 d!6711))

(assert (=> d!6579 d!6517))

(declare-fun d!6719 () Bool)

(declare-fun lt!15113 () Bool)

(assert (=> d!6719 (= lt!15113 (select (content!28 (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25236 () Bool)

(assert (=> d!6719 (= lt!15113 e!25236)))

(declare-fun res!23844 () Bool)

(assert (=> d!6719 (=> (not res!23844) (not e!25236))))

(assert (=> d!6719 (= res!23844 ((_ is Cons!1029) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)))))

(assert (=> d!6719 (= (contains!494 (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15113)))

(declare-fun b!39769 () Bool)

(declare-fun e!25237 () Bool)

(assert (=> b!39769 (= e!25236 e!25237)))

(declare-fun res!23843 () Bool)

(assert (=> b!39769 (=> res!23843 e!25237)))

(assert (=> b!39769 (= res!23843 (= (h!1600 (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39770 () Bool)

(assert (=> b!39770 (= e!25237 (contains!494 (t!3874 (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6719 res!23844) b!39769))

(assert (= (and b!39769 (not res!23843)) b!39770))

(declare-fun m!32405 () Bool)

(assert (=> d!6719 m!32405))

(assert (=> d!6719 m!31879))

(declare-fun m!32407 () Bool)

(assert (=> d!6719 m!32407))

(assert (=> b!39770 m!31879))

(declare-fun m!32409 () Bool)

(assert (=> b!39770 m!32409))

(assert (=> b!39265 d!6719))

(declare-fun d!6721 () Bool)

(declare-fun e!25238 () Bool)

(assert (=> d!6721 e!25238))

(declare-fun res!23845 () Bool)

(assert (=> d!6721 (=> (not res!23845) (not e!25238))))

(declare-fun lt!15116 () ListLongMap!1031)

(assert (=> d!6721 (= res!23845 (contains!497 lt!15116 (_1!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))))

(declare-fun lt!15115 () List!1032)

(assert (=> d!6721 (= lt!15116 (ListLongMap!1032 lt!15115))))

(declare-fun lt!15114 () Unit!971)

(declare-fun lt!15117 () Unit!971)

(assert (=> d!6721 (= lt!15114 lt!15117)))

(assert (=> d!6721 (= (getValueByKey!99 lt!15115 (_1!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))) (Some!104 (_2!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))))

(assert (=> d!6721 (= lt!15117 (lemmaContainsTupThenGetReturnValue!23 lt!15115 (_1!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))) (_2!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))))

(assert (=> d!6721 (= lt!15115 (insertStrictlySorted!20 (toList!531 (ite c!4695 call!3043 (ite c!4697 call!3037 call!3039))) (_1!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))) (_2!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))))

(assert (=> d!6721 (= (+!61 (ite c!4695 call!3043 (ite c!4697 call!3037 call!3039)) (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))) lt!15116)))

(declare-fun b!39771 () Bool)

(declare-fun res!23846 () Bool)

(assert (=> b!39771 (=> (not res!23846) (not e!25238))))

(assert (=> b!39771 (= res!23846 (= (getValueByKey!99 (toList!531 lt!15116) (_1!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))) (Some!104 (_2!741 (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))))

(declare-fun b!39772 () Bool)

(assert (=> b!39772 (= e!25238 (contains!499 (toList!531 lt!15116) (ite (or c!4695 c!4697) (tuple2!1461 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1712 lt!14651)) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))

(assert (= (and d!6721 res!23845) b!39771))

(assert (= (and b!39771 res!23846) b!39772))

(declare-fun m!32411 () Bool)

(assert (=> d!6721 m!32411))

(declare-fun m!32413 () Bool)

(assert (=> d!6721 m!32413))

(declare-fun m!32415 () Bool)

(assert (=> d!6721 m!32415))

(declare-fun m!32417 () Bool)

(assert (=> d!6721 m!32417))

(declare-fun m!32419 () Bool)

(assert (=> b!39771 m!32419))

(declare-fun m!32421 () Bool)

(assert (=> b!39772 m!32421))

(assert (=> bm!3038 d!6721))

(assert (=> b!39553 d!6711))

(assert (=> b!39271 d!6711))

(declare-fun d!6723 () Bool)

(declare-fun lt!15118 () Bool)

(assert (=> d!6723 (= lt!15118 (select (content!28 Nil!1030) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun e!25239 () Bool)

(assert (=> d!6723 (= lt!15118 e!25239)))

(declare-fun res!23848 () Bool)

(assert (=> d!6723 (=> (not res!23848) (not e!25239))))

(assert (=> d!6723 (= res!23848 ((_ is Cons!1029) Nil!1030))))

(assert (=> d!6723 (= (contains!494 Nil!1030 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) lt!15118)))

(declare-fun b!39773 () Bool)

(declare-fun e!25240 () Bool)

(assert (=> b!39773 (= e!25239 e!25240)))

(declare-fun res!23847 () Bool)

(assert (=> b!39773 (=> res!23847 e!25240)))

(assert (=> b!39773 (= res!23847 (= (h!1600 Nil!1030) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39774 () Bool)

(assert (=> b!39774 (= e!25240 (contains!494 (t!3874 Nil!1030) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(assert (= (and d!6723 res!23848) b!39773))

(assert (= (and b!39773 (not res!23847)) b!39774))

(assert (=> d!6723 m!31967))

(assert (=> d!6723 m!31885))

(declare-fun m!32423 () Bool)

(assert (=> d!6723 m!32423))

(assert (=> b!39774 m!31885))

(declare-fun m!32425 () Bool)

(assert (=> b!39774 m!32425))

(assert (=> b!39286 d!6723))

(declare-fun d!6725 () Bool)

(assert (=> d!6725 (= (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39257 d!6725))

(assert (=> b!39267 d!6725))

(declare-fun b!39775 () Bool)

(declare-fun e!25241 () (_ BitVec 32))

(declare-fun e!25242 () (_ BitVec 32))

(assert (=> b!39775 (= e!25241 e!25242)))

(declare-fun c!4756 () Bool)

(assert (=> b!39775 (= c!4756 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39776 () Bool)

(declare-fun call!3064 () (_ BitVec 32))

(assert (=> b!39776 (= e!25242 (bvadd #b00000000000000000000000000000001 call!3064))))

(declare-fun b!39777 () Bool)

(assert (=> b!39777 (= e!25241 #b00000000000000000000000000000000)))

(declare-fun bm!3061 () Bool)

(assert (=> bm!3061 (= call!3064 (arrayCountValidKeys!0 (_keys!3265 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39778 () Bool)

(assert (=> b!39778 (= e!25242 call!3064)))

(declare-fun d!6727 () Bool)

(declare-fun lt!15119 () (_ BitVec 32))

(assert (=> d!6727 (and (bvsge lt!15119 #b00000000000000000000000000000000) (bvsle lt!15119 (bvsub (size!1348 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6727 (= lt!15119 e!25241)))

(declare-fun c!4755 () Bool)

(assert (=> d!6727 (= c!4755 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6727 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1348 (_keys!3265 lt!14651)) (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6727 (= (arrayCountValidKeys!0 (_keys!3265 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))) lt!15119)))

(assert (= (and d!6727 c!4755) b!39777))

(assert (= (and d!6727 (not c!4755)) b!39775))

(assert (= (and b!39775 c!4756) b!39776))

(assert (= (and b!39775 (not c!4756)) b!39778))

(assert (= (or b!39776 b!39778) bm!3061))

(declare-fun m!32427 () Bool)

(assert (=> b!39775 m!32427))

(assert (=> b!39775 m!32427))

(declare-fun m!32429 () Bool)

(assert (=> b!39775 m!32429))

(declare-fun m!32431 () Bool)

(assert (=> bm!3061 m!32431))

(assert (=> bm!2975 d!6727))

(declare-fun b!39787 () Bool)

(declare-fun e!25248 () Bool)

(declare-fun call!3065 () Bool)

(assert (=> b!39787 (= e!25248 call!3065)))

(declare-fun d!6729 () Bool)

(declare-fun res!23849 () Bool)

(declare-fun e!25247 () Bool)

(assert (=> d!6729 (=> res!23849 e!25247)))

(assert (=> d!6729 (= res!23849 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6729 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3265 lt!14651) (mask!5141 lt!14651)) e!25247)))

(declare-fun b!39788 () Bool)

(declare-fun e!25249 () Bool)

(assert (=> b!39788 (= e!25247 e!25249)))

(declare-fun c!4761 () Bool)

(assert (=> b!39788 (= c!4761 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3062 () Bool)

(assert (=> bm!3062 (= call!3065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3265 lt!14651) (mask!5141 lt!14651)))))

(declare-fun b!39789 () Bool)

(assert (=> b!39789 (= e!25249 call!3065)))

(declare-fun b!39790 () Bool)

(assert (=> b!39790 (= e!25249 e!25248)))

(declare-fun lt!15122 () (_ BitVec 64))

(assert (=> b!39790 (= lt!15122 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15128 () Unit!971)

(assert (=> b!39790 (= lt!15128 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3265 lt!14651) lt!15122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39790 (arrayContainsKey!0 (_keys!3265 lt!14651) lt!15122 #b00000000000000000000000000000000)))

(declare-fun lt!15127 () Unit!971)

(assert (=> b!39790 (= lt!15127 lt!15128)))

(declare-fun res!23850 () Bool)

(assert (=> b!39790 (= res!23850 (= (seekEntryOrOpen!0 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3265 lt!14651) (mask!5141 lt!14651)) (Found!165 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39790 (=> (not res!23850) (not e!25248))))

(assert (= (and d!6729 (not res!23849)) b!39788))

(assert (= (and b!39788 c!4761) b!39790))

(assert (= (and b!39788 (not c!4761)) b!39789))

(assert (= (and b!39790 res!23850) b!39787))

(assert (= (or b!39787 b!39789) bm!3062))

(assert (=> b!39788 m!32427))

(assert (=> b!39788 m!32427))

(assert (=> b!39788 m!32429))

(declare-fun m!32433 () Bool)

(assert (=> bm!3062 m!32433))

(assert (=> b!39790 m!32427))

(declare-fun m!32435 () Bool)

(assert (=> b!39790 m!32435))

(declare-fun m!32437 () Bool)

(assert (=> b!39790 m!32437))

(assert (=> b!39790 m!32427))

(declare-fun m!32439 () Bool)

(assert (=> b!39790 m!32439))

(assert (=> bm!2977 d!6729))

(assert (=> d!6643 d!6531))

(assert (=> b!39292 d!6725))

(assert (=> b!39288 d!6711))

(declare-fun d!6731 () Bool)

(assert (not d!6731))

(assert (=> b!39356 d!6731))

(assert (=> b!39269 d!6725))

(declare-fun b!39791 () Bool)

(declare-fun e!25251 () Bool)

(declare-fun call!3068 () Bool)

(assert (=> b!39791 (= e!25251 call!3068)))

(declare-fun d!6733 () Bool)

(declare-fun res!23851 () Bool)

(declare-fun e!25250 () Bool)

(assert (=> d!6733 (=> res!23851 e!25250)))

(assert (=> d!6733 (= res!23851 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(assert (=> d!6733 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14653 mask!853) e!25250)))

(declare-fun b!39792 () Bool)

(declare-fun e!25252 () Bool)

(assert (=> b!39792 (= e!25250 e!25252)))

(declare-fun c!4762 () Bool)

(assert (=> b!39792 (= c!4762 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3065 () Bool)

(assert (=> bm!3065 (= call!3068 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14653 mask!853))))

(declare-fun b!39793 () Bool)

(assert (=> b!39793 (= e!25252 call!3068)))

(declare-fun b!39794 () Bool)

(assert (=> b!39794 (= e!25252 e!25251)))

(declare-fun lt!15137 () (_ BitVec 64))

(assert (=> b!39794 (= lt!15137 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15139 () Unit!971)

(assert (=> b!39794 (= lt!15139 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14653 lt!15137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!39794 (arrayContainsKey!0 lt!14653 lt!15137 #b00000000000000000000000000000000)))

(declare-fun lt!15138 () Unit!971)

(assert (=> b!39794 (= lt!15138 lt!15139)))

(declare-fun res!23852 () Bool)

(assert (=> b!39794 (= res!23852 (= (seekEntryOrOpen!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14653 mask!853) (Found!165 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!39794 (=> (not res!23852) (not e!25251))))

(assert (= (and d!6733 (not res!23851)) b!39792))

(assert (= (and b!39792 c!4762) b!39794))

(assert (= (and b!39792 (not c!4762)) b!39793))

(assert (= (and b!39794 res!23852) b!39791))

(assert (= (or b!39791 b!39793) bm!3065))

(declare-fun m!32441 () Bool)

(assert (=> b!39792 m!32441))

(assert (=> b!39792 m!32441))

(declare-fun m!32443 () Bool)

(assert (=> b!39792 m!32443))

(declare-fun m!32445 () Bool)

(assert (=> bm!3065 m!32445))

(assert (=> b!39794 m!32441))

(declare-fun m!32447 () Bool)

(assert (=> b!39794 m!32447))

(declare-fun m!32449 () Bool)

(assert (=> b!39794 m!32449))

(assert (=> b!39794 m!32441))

(declare-fun m!32451 () Bool)

(assert (=> b!39794 m!32451))

(assert (=> bm!2979 d!6733))

(declare-fun d!6735 () Bool)

(assert (=> d!6735 (arrayContainsKey!0 (_keys!3265 lt!14651) lt!14755 #b00000000000000000000000000000000)))

(declare-fun lt!15140 () Unit!971)

(assert (=> d!6735 (= lt!15140 (choose!13 (_keys!3265 lt!14651) lt!14755 #b00000000000000000000000000000000))))

(assert (=> d!6735 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6735 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3265 lt!14651) lt!14755 #b00000000000000000000000000000000) lt!15140)))

(declare-fun bs!1658 () Bool)

(assert (= bs!1658 d!6735))

(assert (=> bs!1658 m!31899))

(declare-fun m!32453 () Bool)

(assert (=> bs!1658 m!32453))

(assert (=> b!39273 d!6735))

(declare-fun d!6737 () Bool)

(declare-fun res!23857 () Bool)

(declare-fun e!25255 () Bool)

(assert (=> d!6737 (=> res!23857 e!25255)))

(assert (=> d!6737 (= res!23857 (= (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) lt!14755))))

(assert (=> d!6737 (= (arrayContainsKey!0 (_keys!3265 lt!14651) lt!14755 #b00000000000000000000000000000000) e!25255)))

(declare-fun b!39801 () Bool)

(declare-fun e!25256 () Bool)

(assert (=> b!39801 (= e!25255 e!25256)))

(declare-fun res!23858 () Bool)

(assert (=> b!39801 (=> (not res!23858) (not e!25256))))

(assert (=> b!39801 (= res!23858 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))))))

(declare-fun b!39802 () Bool)

(assert (=> b!39802 (= e!25256 (arrayContainsKey!0 (_keys!3265 lt!14651) lt!14755 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6737 (not res!23857)) b!39801))

(assert (= (and b!39801 res!23858) b!39802))

(assert (=> d!6737 m!31885))

(declare-fun m!32455 () Bool)

(assert (=> b!39802 m!32455))

(assert (=> b!39273 d!6737))

(declare-fun d!6739 () Bool)

(declare-fun lt!15142 () SeekEntryResult!165)

(assert (=> d!6739 (and (or ((_ is Undefined!165) lt!15142) (not ((_ is Found!165) lt!15142)) (and (bvsge (index!2783 lt!15142) #b00000000000000000000000000000000) (bvslt (index!2783 lt!15142) (size!1348 (_keys!3265 lt!14651))))) (or ((_ is Undefined!165) lt!15142) ((_ is Found!165) lt!15142) (not ((_ is MissingZero!165) lt!15142)) (and (bvsge (index!2782 lt!15142) #b00000000000000000000000000000000) (bvslt (index!2782 lt!15142) (size!1348 (_keys!3265 lt!14651))))) (or ((_ is Undefined!165) lt!15142) ((_ is Found!165) lt!15142) ((_ is MissingZero!165) lt!15142) (not ((_ is MissingVacant!165) lt!15142)) (and (bvsge (index!2785 lt!15142) #b00000000000000000000000000000000) (bvslt (index!2785 lt!15142) (size!1348 (_keys!3265 lt!14651))))) (or ((_ is Undefined!165) lt!15142) (ite ((_ is Found!165) lt!15142) (= (select (arr!1226 (_keys!3265 lt!14651)) (index!2783 lt!15142)) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!165) lt!15142) (= (select (arr!1226 (_keys!3265 lt!14651)) (index!2782 lt!15142)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!165) lt!15142) (= (select (arr!1226 (_keys!3265 lt!14651)) (index!2785 lt!15142)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25264 () SeekEntryResult!165)

(assert (=> d!6739 (= lt!15142 e!25264)))

(declare-fun c!4765 () Bool)

(declare-fun lt!15143 () SeekEntryResult!165)

(assert (=> d!6739 (= c!4765 (and ((_ is Intermediate!165) lt!15143) (undefined!977 lt!15143)))))

(assert (=> d!6739 (= lt!15143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) (mask!5141 lt!14651)) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) (_keys!3265 lt!14651) (mask!5141 lt!14651)))))

(assert (=> d!6739 (validMask!0 (mask!5141 lt!14651))))

(assert (=> d!6739 (= (seekEntryOrOpen!0 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) (_keys!3265 lt!14651) (mask!5141 lt!14651)) lt!15142)))

(declare-fun b!39809 () Bool)

(assert (=> b!39809 (= e!25264 Undefined!165)))

(declare-fun b!39810 () Bool)

(declare-fun c!4767 () Bool)

(declare-fun lt!15141 () (_ BitVec 64))

(assert (=> b!39810 (= c!4767 (= lt!15141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25263 () SeekEntryResult!165)

(declare-fun e!25265 () SeekEntryResult!165)

(assert (=> b!39810 (= e!25263 e!25265)))

(declare-fun b!39811 () Bool)

(assert (=> b!39811 (= e!25263 (Found!165 (index!2784 lt!15143)))))

(declare-fun b!39812 () Bool)

(assert (=> b!39812 (= e!25264 e!25263)))

(assert (=> b!39812 (= lt!15141 (select (arr!1226 (_keys!3265 lt!14651)) (index!2784 lt!15143)))))

(declare-fun c!4766 () Bool)

(assert (=> b!39812 (= c!4766 (= lt!15141 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000)))))

(declare-fun b!39813 () Bool)

(assert (=> b!39813 (= e!25265 (seekKeyOrZeroReturnVacant!0 (x!7651 lt!15143) (index!2784 lt!15143) (index!2784 lt!15143) (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) (_keys!3265 lt!14651) (mask!5141 lt!14651)))))

(declare-fun b!39814 () Bool)

(assert (=> b!39814 (= e!25265 (MissingZero!165 (index!2784 lt!15143)))))

(assert (= (and d!6739 c!4765) b!39809))

(assert (= (and d!6739 (not c!4765)) b!39812))

(assert (= (and b!39812 c!4766) b!39811))

(assert (= (and b!39812 (not c!4766)) b!39810))

(assert (= (and b!39810 c!4767) b!39814))

(assert (= (and b!39810 (not c!4767)) b!39813))

(declare-fun m!32457 () Bool)

(assert (=> d!6739 m!32457))

(assert (=> d!6739 m!31885))

(declare-fun m!32459 () Bool)

(assert (=> d!6739 m!32459))

(declare-fun m!32461 () Bool)

(assert (=> d!6739 m!32461))

(assert (=> d!6739 m!31885))

(assert (=> d!6739 m!32457))

(assert (=> d!6739 m!31905))

(declare-fun m!32463 () Bool)

(assert (=> d!6739 m!32463))

(declare-fun m!32465 () Bool)

(assert (=> d!6739 m!32465))

(declare-fun m!32467 () Bool)

(assert (=> b!39812 m!32467))

(assert (=> b!39813 m!31885))

(declare-fun m!32469 () Bool)

(assert (=> b!39813 m!32469))

(assert (=> b!39273 d!6739))

(declare-fun b!39819 () Bool)

(declare-fun e!25268 () (_ BitVec 32))

(declare-fun e!25269 () (_ BitVec 32))

(assert (=> b!39819 (= e!25268 e!25269)))

(declare-fun c!4771 () Bool)

(assert (=> b!39819 (= c!4771 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39820 () Bool)

(declare-fun call!3069 () (_ BitVec 32))

(assert (=> b!39820 (= e!25269 (bvadd #b00000000000000000000000000000001 call!3069))))

(declare-fun b!39821 () Bool)

(assert (=> b!39821 (= e!25268 #b00000000000000000000000000000000)))

(declare-fun bm!3066 () Bool)

(assert (=> bm!3066 (= call!3069 (arrayCountValidKeys!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39822 () Bool)

(assert (=> b!39822 (= e!25269 call!3069)))

(declare-fun d!6741 () Bool)

(declare-fun lt!15144 () (_ BitVec 32))

(assert (=> d!6741 (and (bvsge lt!15144 #b00000000000000000000000000000000) (bvsle lt!15144 (bvsub (size!1348 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6741 (= lt!15144 e!25268)))

(declare-fun c!4770 () Bool)

(assert (=> d!6741 (= c!4770 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6741 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1348 lt!14653)))))

(assert (=> d!6741 (= (arrayCountValidKeys!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15144)))

(assert (= (and d!6741 c!4770) b!39821))

(assert (= (and d!6741 (not c!4770)) b!39819))

(assert (= (and b!39819 c!4771) b!39820))

(assert (= (and b!39819 (not c!4771)) b!39822))

(assert (= (or b!39820 b!39822) bm!3066))

(assert (=> b!39819 m!32441))

(assert (=> b!39819 m!32441))

(assert (=> b!39819 m!32443))

(declare-fun m!32471 () Bool)

(assert (=> bm!3066 m!32471))

(assert (=> bm!2974 d!6741))

(declare-fun d!6743 () Bool)

(declare-fun e!25270 () Bool)

(assert (=> d!6743 e!25270))

(declare-fun res!23863 () Bool)

(assert (=> d!6743 (=> (not res!23863) (not e!25270))))

(declare-fun lt!15147 () ListLongMap!1031)

(assert (=> d!6743 (= res!23863 (contains!497 lt!15147 (_1!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))

(declare-fun lt!15146 () List!1032)

(assert (=> d!6743 (= lt!15147 (ListLongMap!1032 lt!15146))))

(declare-fun lt!15145 () Unit!971)

(declare-fun lt!15148 () Unit!971)

(assert (=> d!6743 (= lt!15145 lt!15148)))

(assert (=> d!6743 (= (getValueByKey!99 lt!15146 (_1!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))

(assert (=> d!6743 (= lt!15148 (lemmaContainsTupThenGetReturnValue!23 lt!15146 (_1!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))) (_2!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))

(assert (=> d!6743 (= lt!15146 (insertStrictlySorted!20 (toList!531 call!3041) (_1!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))) (_2!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))))))

(assert (=> d!6743 (= (+!61 call!3041 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))) lt!15147)))

(declare-fun b!39823 () Bool)

(declare-fun res!23864 () Bool)

(assert (=> b!39823 (=> (not res!23864) (not e!25270))))

(assert (=> b!39823 (= res!23864 (= (getValueByKey!99 (toList!531 lt!15147) (_1!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651)))) (Some!104 (_2!741 (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))))

(declare-fun b!39824 () Bool)

(assert (=> b!39824 (= e!25270 (contains!499 (toList!531 lt!15147) (tuple2!1461 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1712 lt!14651))))))

(assert (= (and d!6743 res!23863) b!39823))

(assert (= (and b!39823 res!23864) b!39824))

(declare-fun m!32473 () Bool)

(assert (=> d!6743 m!32473))

(declare-fun m!32475 () Bool)

(assert (=> d!6743 m!32475))

(declare-fun m!32477 () Bool)

(assert (=> d!6743 m!32477))

(declare-fun m!32479 () Bool)

(assert (=> d!6743 m!32479))

(declare-fun m!32481 () Bool)

(assert (=> b!39823 m!32481))

(declare-fun m!32483 () Bool)

(assert (=> b!39824 m!32483))

(assert (=> b!39552 d!6743))

(declare-fun d!6745 () Bool)

(assert (=> d!6745 (= (size!1366 lt!14651) (bvadd (_size!165 lt!14651) (bvsdiv (bvadd (extraKeys!1685 lt!14651) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!39283 d!6745))

(declare-fun b!39825 () Bool)

(declare-fun e!25273 () Bool)

(assert (=> b!39825 (= e!25273 (contains!494 (ite c!4620 (Cons!1029 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6747 () Bool)

(declare-fun res!23866 () Bool)

(declare-fun e!25272 () Bool)

(assert (=> d!6747 (=> res!23866 e!25272)))

(assert (=> d!6747 (= res!23866 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(assert (=> d!6747 (= (arrayNoDuplicates!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4620 (Cons!1029 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030))) e!25272)))

(declare-fun b!39826 () Bool)

(declare-fun e!25271 () Bool)

(declare-fun call!3070 () Bool)

(assert (=> b!39826 (= e!25271 call!3070)))

(declare-fun b!39827 () Bool)

(declare-fun e!25274 () Bool)

(assert (=> b!39827 (= e!25274 e!25271)))

(declare-fun c!4772 () Bool)

(assert (=> b!39827 (= c!4772 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39828 () Bool)

(assert (=> b!39828 (= e!25271 call!3070)))

(declare-fun b!39829 () Bool)

(assert (=> b!39829 (= e!25272 e!25274)))

(declare-fun res!23865 () Bool)

(assert (=> b!39829 (=> (not res!23865) (not e!25274))))

(assert (=> b!39829 (= res!23865 (not e!25273))))

(declare-fun res!23867 () Bool)

(assert (=> b!39829 (=> (not res!23867) (not e!25273))))

(assert (=> b!39829 (= res!23867 (validKeyInArray!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3067 () Bool)

(assert (=> bm!3067 (= call!3070 (arrayNoDuplicates!0 lt!14653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4772 (Cons!1029 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4620 (Cons!1029 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030))) (ite c!4620 (Cons!1029 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (ite c!4615 (Cons!1029 (select (arr!1226 lt!14653) #b00000000000000000000000000000000) Nil!1030) Nil!1030)))))))

(assert (= (and d!6747 (not res!23866)) b!39829))

(assert (= (and b!39829 res!23867) b!39825))

(assert (= (and b!39829 res!23865) b!39827))

(assert (= (and b!39827 c!4772) b!39826))

(assert (= (and b!39827 (not c!4772)) b!39828))

(assert (= (or b!39826 b!39828) bm!3067))

(assert (=> b!39825 m!32441))

(assert (=> b!39825 m!32441))

(declare-fun m!32485 () Bool)

(assert (=> b!39825 m!32485))

(assert (=> b!39827 m!32441))

(assert (=> b!39827 m!32441))

(assert (=> b!39827 m!32443))

(assert (=> b!39829 m!32441))

(assert (=> b!39829 m!32441))

(assert (=> b!39829 m!32443))

(assert (=> bm!3067 m!32441))

(declare-fun m!32487 () Bool)

(assert (=> bm!3067 m!32487))

(assert (=> bm!2976 d!6747))

(declare-fun d!6749 () Bool)

(assert (=> d!6749 (= (apply!53 lt!14968 #b0000000000000000000000000000000000000000000000000000000000000000) (get!692 (getValueByKey!99 (toList!531 lt!14968) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1659 () Bool)

(assert (= bs!1659 d!6749))

(assert (=> bs!1659 m!32393))

(assert (=> bs!1659 m!32393))

(declare-fun m!32489 () Bool)

(assert (=> bs!1659 m!32489))

(assert (=> b!39551 d!6749))

(assert (=> b!39290 d!6711))

(assert (=> b!39284 d!6745))

(declare-fun d!6751 () Bool)

(assert (=> d!6751 (arrayContainsKey!0 lt!14653 lt!14758 #b00000000000000000000000000000000)))

(declare-fun lt!15149 () Unit!971)

(assert (=> d!6751 (= lt!15149 (choose!13 lt!14653 lt!14758 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6751 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6751 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14653 lt!14758 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15149)))

(declare-fun bs!1660 () Bool)

(assert (= bs!1660 d!6751))

(assert (=> bs!1660 m!31915))

(declare-fun m!32491 () Bool)

(assert (=> bs!1660 m!32491))

(assert (=> b!39294 d!6751))

(declare-fun d!6753 () Bool)

(declare-fun res!23868 () Bool)

(declare-fun e!25275 () Bool)

(assert (=> d!6753 (=> res!23868 e!25275)))

(assert (=> d!6753 (= res!23868 (= (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14758))))

(assert (=> d!6753 (= (arrayContainsKey!0 lt!14653 lt!14758 #b00000000000000000000000000000000) e!25275)))

(declare-fun b!39830 () Bool)

(declare-fun e!25276 () Bool)

(assert (=> b!39830 (= e!25275 e!25276)))

(declare-fun res!23869 () Bool)

(assert (=> b!39830 (=> (not res!23869) (not e!25276))))

(assert (=> b!39830 (= res!23869 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(declare-fun b!39831 () Bool)

(assert (=> b!39831 (= e!25276 (arrayContainsKey!0 lt!14653 lt!14758 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6753 (not res!23868)) b!39830))

(assert (= (and b!39830 res!23869) b!39831))

(assert (=> d!6753 m!31797))

(declare-fun m!32493 () Bool)

(assert (=> b!39831 m!32493))

(assert (=> b!39294 d!6753))

(declare-fun d!6755 () Bool)

(declare-fun lt!15151 () SeekEntryResult!165)

(assert (=> d!6755 (and (or ((_ is Undefined!165) lt!15151) (not ((_ is Found!165) lt!15151)) (and (bvsge (index!2783 lt!15151) #b00000000000000000000000000000000) (bvslt (index!2783 lt!15151) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!15151) ((_ is Found!165) lt!15151) (not ((_ is MissingZero!165) lt!15151)) (and (bvsge (index!2782 lt!15151) #b00000000000000000000000000000000) (bvslt (index!2782 lt!15151) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!15151) ((_ is Found!165) lt!15151) ((_ is MissingZero!165) lt!15151) (not ((_ is MissingVacant!165) lt!15151)) (and (bvsge (index!2785 lt!15151) #b00000000000000000000000000000000) (bvslt (index!2785 lt!15151) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!15151) (ite ((_ is Found!165) lt!15151) (= (select (arr!1226 lt!14653) (index!2783 lt!15151)) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!165) lt!15151) (= (select (arr!1226 lt!14653) (index!2782 lt!15151)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!165) lt!15151) (= (select (arr!1226 lt!14653) (index!2785 lt!15151)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25278 () SeekEntryResult!165)

(assert (=> d!6755 (= lt!15151 e!25278)))

(declare-fun c!4773 () Bool)

(declare-fun lt!15152 () SeekEntryResult!165)

(assert (=> d!6755 (= c!4773 (and ((_ is Intermediate!165) lt!15152) (undefined!977 lt!15152)))))

(assert (=> d!6755 (= lt!15152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14653 mask!853))))

(assert (=> d!6755 (validMask!0 mask!853)))

(assert (=> d!6755 (= (seekEntryOrOpen!0 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14653 mask!853) lt!15151)))

(declare-fun b!39832 () Bool)

(assert (=> b!39832 (= e!25278 Undefined!165)))

(declare-fun b!39833 () Bool)

(declare-fun c!4775 () Bool)

(declare-fun lt!15150 () (_ BitVec 64))

(assert (=> b!39833 (= c!4775 (= lt!15150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25277 () SeekEntryResult!165)

(declare-fun e!25279 () SeekEntryResult!165)

(assert (=> b!39833 (= e!25277 e!25279)))

(declare-fun b!39834 () Bool)

(assert (=> b!39834 (= e!25277 (Found!165 (index!2784 lt!15152)))))

(declare-fun b!39835 () Bool)

(assert (=> b!39835 (= e!25278 e!25277)))

(assert (=> b!39835 (= lt!15150 (select (arr!1226 lt!14653) (index!2784 lt!15152)))))

(declare-fun c!4774 () Bool)

(assert (=> b!39835 (= c!4774 (= lt!15150 (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39836 () Bool)

(assert (=> b!39836 (= e!25279 (seekKeyOrZeroReturnVacant!0 (x!7651 lt!15152) (index!2784 lt!15152) (index!2784 lt!15152) (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14653 mask!853))))

(declare-fun b!39837 () Bool)

(assert (=> b!39837 (= e!25279 (MissingZero!165 (index!2784 lt!15152)))))

(assert (= (and d!6755 c!4773) b!39832))

(assert (= (and d!6755 (not c!4773)) b!39835))

(assert (= (and b!39835 c!4774) b!39834))

(assert (= (and b!39835 (not c!4774)) b!39833))

(assert (= (and b!39833 c!4775) b!39837))

(assert (= (and b!39833 (not c!4775)) b!39836))

(declare-fun m!32495 () Bool)

(assert (=> d!6755 m!32495))

(assert (=> d!6755 m!31879))

(declare-fun m!32497 () Bool)

(assert (=> d!6755 m!32497))

(declare-fun m!32499 () Bool)

(assert (=> d!6755 m!32499))

(assert (=> d!6755 m!31879))

(assert (=> d!6755 m!32495))

(assert (=> d!6755 m!31717))

(declare-fun m!32501 () Bool)

(assert (=> d!6755 m!32501))

(declare-fun m!32503 () Bool)

(assert (=> d!6755 m!32503))

(declare-fun m!32505 () Bool)

(assert (=> b!39835 m!32505))

(assert (=> b!39836 m!31879))

(declare-fun m!32507 () Bool)

(assert (=> b!39836 m!32507))

(assert (=> b!39294 d!6755))

(declare-fun b!39850 () Bool)

(declare-fun e!25289 () Bool)

(assert (=> b!39850 (= e!25289 (contains!494 (ite c!4622 (Cons!1029 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) Nil!1030) Nil!1030) (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6757 () Bool)

(declare-fun res!23875 () Bool)

(declare-fun e!25288 () Bool)

(assert (=> d!6757 (=> res!23875 e!25288)))

(assert (=> d!6757 (= res!23875 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1348 (_keys!3265 lt!14651))))))

(assert (=> d!6757 (= (arrayNoDuplicates!0 (_keys!3265 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4622 (Cons!1029 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) e!25288)))

(declare-fun b!39851 () Bool)

(declare-fun e!25287 () Bool)

(declare-fun call!3072 () Bool)

(assert (=> b!39851 (= e!25287 call!3072)))

(declare-fun b!39852 () Bool)

(declare-fun e!25290 () Bool)

(assert (=> b!39852 (= e!25290 e!25287)))

(declare-fun c!4780 () Bool)

(assert (=> b!39852 (= c!4780 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39853 () Bool)

(assert (=> b!39853 (= e!25287 call!3072)))

(declare-fun b!39854 () Bool)

(assert (=> b!39854 (= e!25288 e!25290)))

(declare-fun res!23874 () Bool)

(assert (=> b!39854 (=> (not res!23874) (not e!25290))))

(assert (=> b!39854 (= res!23874 (not e!25289))))

(declare-fun res!23876 () Bool)

(assert (=> b!39854 (=> (not res!23876) (not e!25289))))

(assert (=> b!39854 (= res!23876 (validKeyInArray!0 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3069 () Bool)

(assert (=> bm!3069 (= call!3072 (arrayNoDuplicates!0 (_keys!3265 lt!14651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4780 (Cons!1029 (select (arr!1226 (_keys!3265 lt!14651)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4622 (Cons!1029 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) Nil!1030) Nil!1030)) (ite c!4622 (Cons!1029 (select (arr!1226 (_keys!3265 lt!14651)) #b00000000000000000000000000000000) Nil!1030) Nil!1030))))))

(assert (= (and d!6757 (not res!23875)) b!39854))

(assert (= (and b!39854 res!23876) b!39850))

(assert (= (and b!39854 res!23874) b!39852))

(assert (= (and b!39852 c!4780) b!39851))

(assert (= (and b!39852 (not c!4780)) b!39853))

(assert (= (or b!39851 b!39853) bm!3069))

(assert (=> b!39850 m!32427))

(assert (=> b!39850 m!32427))

(declare-fun m!32509 () Bool)

(assert (=> b!39850 m!32509))

(assert (=> b!39852 m!32427))

(assert (=> b!39852 m!32427))

(assert (=> b!39852 m!32429))

(assert (=> b!39854 m!32427))

(assert (=> b!39854 m!32427))

(assert (=> b!39854 m!32429))

(assert (=> bm!3069 m!32427))

(declare-fun m!32517 () Bool)

(assert (=> bm!3069 m!32517))

(assert (=> bm!2978 d!6757))

(declare-fun d!6759 () Bool)

(assert (=> d!6759 (= (apply!53 lt!14968 #b1000000000000000000000000000000000000000000000000000000000000000) (get!692 (getValueByKey!99 (toList!531 lt!14968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1661 () Bool)

(assert (= bs!1661 d!6759))

(assert (=> bs!1661 m!32401))

(assert (=> bs!1661 m!32401))

(declare-fun m!32525 () Bool)

(assert (=> bs!1661 m!32525))

(assert (=> b!39549 d!6759))

(declare-fun d!6761 () Bool)

(declare-fun res!23877 () Bool)

(declare-fun e!25291 () Bool)

(assert (=> d!6761 (=> res!23877 e!25291)))

(assert (=> d!6761 (= res!23877 (= (select (arr!1226 lt!14653) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14732))))

(assert (=> d!6761 (= (arrayContainsKey!0 lt!14653 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25291)))

(declare-fun b!39855 () Bool)

(declare-fun e!25292 () Bool)

(assert (=> b!39855 (= e!25291 e!25292)))

(declare-fun res!23878 () Bool)

(assert (=> b!39855 (=> (not res!23878) (not e!25292))))

(assert (=> b!39855 (= res!23878 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1348 lt!14653)))))

(declare-fun b!39856 () Bool)

(assert (=> b!39856 (= e!25292 (arrayContainsKey!0 lt!14653 lt!14732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6761 (not res!23877)) b!39855))

(assert (= (and b!39855 res!23878) b!39856))

(assert (=> d!6761 m!31879))

(declare-fun m!32533 () Bool)

(assert (=> b!39856 m!32533))

(assert (=> b!39304 d!6761))

(declare-fun b!39877 () Bool)

(declare-fun e!25305 () SeekEntryResult!165)

(assert (=> b!39877 (= e!25305 (MissingVacant!165 (index!2784 lt!14782)))))

(declare-fun b!39878 () Bool)

(declare-fun e!25303 () SeekEntryResult!165)

(declare-fun e!25304 () SeekEntryResult!165)

(assert (=> b!39878 (= e!25303 e!25304)))

(declare-fun c!4791 () Bool)

(declare-fun lt!15169 () (_ BitVec 64))

(assert (=> b!39878 (= c!4791 (= lt!15169 (select (arr!1226 lt!14653) #b00000000000000000000000000000000)))))

(declare-fun d!6763 () Bool)

(declare-fun lt!15168 () SeekEntryResult!165)

(assert (=> d!6763 (and (or ((_ is Undefined!165) lt!15168) (not ((_ is Found!165) lt!15168)) (and (bvsge (index!2783 lt!15168) #b00000000000000000000000000000000) (bvslt (index!2783 lt!15168) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!15168) ((_ is Found!165) lt!15168) (not ((_ is MissingVacant!165) lt!15168)) (not (= (index!2785 lt!15168) (index!2784 lt!14782))) (and (bvsge (index!2785 lt!15168) #b00000000000000000000000000000000) (bvslt (index!2785 lt!15168) (size!1348 lt!14653)))) (or ((_ is Undefined!165) lt!15168) (ite ((_ is Found!165) lt!15168) (= (select (arr!1226 lt!14653) (index!2783 lt!15168)) (select (arr!1226 lt!14653) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!165) lt!15168) (= (index!2785 lt!15168) (index!2784 lt!14782)) (= (select (arr!1226 lt!14653) (index!2785 lt!15168)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6763 (= lt!15168 e!25303)))

(declare-fun c!4793 () Bool)

(assert (=> d!6763 (= c!4793 (bvsge (x!7651 lt!14782) #b01111111111111111111111111111110))))

(assert (=> d!6763 (= lt!15169 (select (arr!1226 lt!14653) (index!2784 lt!14782)))))

(assert (=> d!6763 (validMask!0 mask!853)))

(assert (=> d!6763 (= (seekKeyOrZeroReturnVacant!0 (x!7651 lt!14782) (index!2784 lt!14782) (index!2784 lt!14782) (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853) lt!15168)))

(declare-fun b!39879 () Bool)

(assert (=> b!39879 (= e!25305 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7651 lt!14782) #b00000000000000000000000000000001) (nextIndex!0 (index!2784 lt!14782) (bvadd (x!7651 lt!14782) #b00000000000000000000000000000001) mask!853) (index!2784 lt!14782) (select (arr!1226 lt!14653) #b00000000000000000000000000000000) lt!14653 mask!853))))

(declare-fun b!39880 () Bool)

(assert (=> b!39880 (= e!25303 Undefined!165)))

(declare-fun b!39881 () Bool)

(assert (=> b!39881 (= e!25304 (Found!165 (index!2784 lt!14782)))))

(declare-fun b!39882 () Bool)

(declare-fun c!4792 () Bool)

(assert (=> b!39882 (= c!4792 (= lt!15169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39882 (= e!25304 e!25305)))

(assert (= (and d!6763 c!4793) b!39880))

(assert (= (and d!6763 (not c!4793)) b!39878))

(assert (= (and b!39878 c!4791) b!39881))

(assert (= (and b!39878 (not c!4791)) b!39882))

(assert (= (and b!39882 c!4792) b!39877))

(assert (= (and b!39882 (not c!4792)) b!39879))

(declare-fun m!32537 () Bool)

(assert (=> d!6763 m!32537))

(declare-fun m!32539 () Bool)

(assert (=> d!6763 m!32539))

(assert (=> d!6763 m!31943))

(assert (=> d!6763 m!31717))

(declare-fun m!32541 () Bool)

(assert (=> b!39879 m!32541))

(assert (=> b!39879 m!32541))

(assert (=> b!39879 m!31797))

(declare-fun m!32543 () Bool)

(assert (=> b!39879 m!32543))

(assert (=> b!39339 d!6763))

(assert (=> d!6585 d!6587))

(declare-fun d!6769 () Bool)

(assert (=> d!6769 (arrayContainsKey!0 lt!14653 lt!14732 #b00000000000000000000000000000000)))

(assert (=> d!6769 true))

(declare-fun _$60!332 () Unit!971)

(assert (=> d!6769 (= (choose!13 lt!14653 lt!14732 #b00000000000000000000000000000000) _$60!332)))

(declare-fun bs!1662 () Bool)

(assert (= bs!1662 d!6769))

(assert (=> bs!1662 m!31827))

(assert (=> d!6585 d!6769))

(assert (=> bm!3035 d!6683))

(assert (=> d!6571 d!6689))

(declare-fun d!6771 () Bool)

(assert (=> d!6771 (= (content!28 Nil!1030) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!6605 d!6771))

(assert (=> d!6641 d!6549))

(declare-fun b_lambda!2047 () Bool)

(assert (= b_lambda!2035 (or (and start!5504 b_free!1357 (= defaultEntry!470 (defaultEntry!1794 lt!14651))) b_lambda!2047)))

(check-sat (not b!39852) (not b!39824) (not b!39827) (not d!6743) (not d!6717) (not b!39765) (not d!6657) (not b!39825) (not b!39770) (not d!6663) (not b_lambda!2039) (not b!39831) (not d!6763) (not d!6735) (not b!39666) (not b!39654) (not d!6755) (not d!6723) (not b!39763) (not b!39719) (not d!6681) (not b_lambda!2031) (not b!39854) (not b!39850) (not d!6691) (not bm!3066) (not d!6695) (not b!39819) (not b!39693) (not b!39788) (not d!6683) tp_is_empty!1747 (not d!6759) (not d!6677) (not d!6687) (not b!39771) (not b!39794) (not d!6665) (not d!6679) (not b!39698) (not b!39753) (not d!6751) (not b!39879) (not d!6719) (not b!39718) (not d!6667) (not b!39711) (not b_lambda!2041) (not d!6675) (not d!6671) (not b!39775) (not b!39772) (not b!39790) (not b!39768) (not bm!3067) (not bm!3062) (not b!39760) (not b!39802) (not b!39766) (not b!39702) (not d!6769) (not b!39792) (not b!39836) (not b!39656) b_and!2345 (not d!6715) (not d!6669) (not b!39713) (not bm!3065) (not d!6713) (not b!39697) (not b!39701) (not b!39813) (not b!39823) (not b!39657) (not d!6659) (not d!6673) (not b!39762) (not bm!3057) (not b!39695) (not b_next!1357) (not d!6661) (not b!39856) (not b!39655) (not b!39696) (not b_lambda!2047) (not d!6721) (not b!39703) (not d!6739) (not b!39665) (not b!39829) (not bm!3061) (not bm!3069) (not b!39704) (not d!6685) (not b!39774) (not b!39691) (not d!6749))
(check-sat b_and!2345 (not b_next!1357))
