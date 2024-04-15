; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113780 () Bool)

(assert start!113780)

(declare-fun k0!387 () (_ BitVec 64))

(declare-datatypes ((B!2192 0))(
  ( (B!2193 (val!18885 Int)) )
))
(declare-datatypes ((tuple2!24438 0))(
  ( (tuple2!24439 (_1!12230 (_ BitVec 64)) (_2!12230 B!2192)) )
))
(declare-datatypes ((List!31556 0))(
  ( (Nil!31553) (Cons!31552 (h!32761 tuple2!24438) (t!46206 List!31556)) )
))
(declare-datatypes ((ListLongMap!22095 0))(
  ( (ListLongMap!22096 (toList!11063 List!31556)) )
))
(declare-fun contains!9176 (ListLongMap!22095 (_ BitVec 64)) Bool)

(assert (=> start!113780 (contains!9176 (ListLongMap!22096 Nil!31553) k0!387)))

(assert (=> start!113780 true))

(declare-fun bs!38697 () Bool)

(assert (= bs!38697 start!113780))

(declare-fun m!1236883 () Bool)

(assert (=> bs!38697 m!1236883))

(check-sat (not start!113780))
(check-sat)
(get-model)

(declare-fun d!144739 () Bool)

(declare-fun e!768007 () Bool)

(assert (=> d!144739 e!768007))

(declare-fun res!895595 () Bool)

(assert (=> d!144739 (=> res!895595 e!768007)))

(declare-fun lt!596749 () Bool)

(assert (=> d!144739 (= res!895595 (not lt!596749))))

(declare-fun lt!596748 () Bool)

(assert (=> d!144739 (= lt!596749 lt!596748)))

(declare-datatypes ((Unit!44064 0))(
  ( (Unit!44065) )
))
(declare-fun lt!596746 () Unit!44064)

(declare-fun e!768006 () Unit!44064)

(assert (=> d!144739 (= lt!596746 e!768006)))

(declare-fun c!126674 () Bool)

(assert (=> d!144739 (= c!126674 lt!596748)))

(declare-fun containsKey!745 (List!31556 (_ BitVec 64)) Bool)

(assert (=> d!144739 (= lt!596748 (containsKey!745 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))

(assert (=> d!144739 (= (contains!9176 (ListLongMap!22096 Nil!31553) k0!387) lt!596749)))

(declare-fun b!1350058 () Bool)

(declare-fun lt!596747 () Unit!44064)

(assert (=> b!1350058 (= e!768006 lt!596747)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!492 (List!31556 (_ BitVec 64)) Unit!44064)

(assert (=> b!1350058 (= lt!596747 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))

(declare-datatypes ((Option!779 0))(
  ( (Some!778 (v!21530 B!2192)) (None!777) )
))
(declare-fun isDefined!535 (Option!779) Bool)

(declare-fun getValueByKey!728 (List!31556 (_ BitVec 64)) Option!779)

(assert (=> b!1350058 (isDefined!535 (getValueByKey!728 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))

(declare-fun b!1350059 () Bool)

(declare-fun Unit!44070 () Unit!44064)

(assert (=> b!1350059 (= e!768006 Unit!44070)))

(declare-fun b!1350060 () Bool)

(assert (=> b!1350060 (= e!768007 (isDefined!535 (getValueByKey!728 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387)))))

(assert (= (and d!144739 c!126674) b!1350058))

(assert (= (and d!144739 (not c!126674)) b!1350059))

(assert (= (and d!144739 (not res!895595)) b!1350060))

(declare-fun m!1236893 () Bool)

(assert (=> d!144739 m!1236893))

(declare-fun m!1236899 () Bool)

(assert (=> b!1350058 m!1236899))

(declare-fun m!1236905 () Bool)

(assert (=> b!1350058 m!1236905))

(assert (=> b!1350058 m!1236905))

(declare-fun m!1236911 () Bool)

(assert (=> b!1350058 m!1236911))

(assert (=> b!1350060 m!1236905))

(assert (=> b!1350060 m!1236905))

(assert (=> b!1350060 m!1236911))

(assert (=> start!113780 d!144739))

(check-sat (not b!1350060) (not d!144739) (not b!1350058))
(check-sat)
(get-model)

(declare-fun d!144743 () Bool)

(declare-fun isEmpty!1107 (Option!779) Bool)

(assert (=> d!144743 (= (isDefined!535 (getValueByKey!728 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387)) (not (isEmpty!1107 (getValueByKey!728 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))))

(declare-fun bs!38700 () Bool)

(assert (= bs!38700 d!144743))

(assert (=> bs!38700 m!1236905))

(declare-fun m!1236913 () Bool)

(assert (=> bs!38700 m!1236913))

(assert (=> b!1350060 d!144743))

(declare-fun b!1350071 () Bool)

(declare-fun e!768013 () Option!779)

(assert (=> b!1350071 (= e!768013 (getValueByKey!728 (t!46206 (toList!11063 (ListLongMap!22096 Nil!31553))) k0!387))))

(declare-fun b!1350072 () Bool)

(assert (=> b!1350072 (= e!768013 None!777)))

(declare-fun b!1350070 () Bool)

(declare-fun e!768012 () Option!779)

(assert (=> b!1350070 (= e!768012 e!768013)))

(declare-fun c!126680 () Bool)

(get-info :version)

(assert (=> b!1350070 (= c!126680 (and ((_ is Cons!31552) (toList!11063 (ListLongMap!22096 Nil!31553))) (not (= (_1!12230 (h!32761 (toList!11063 (ListLongMap!22096 Nil!31553)))) k0!387))))))

(declare-fun d!144745 () Bool)

(declare-fun c!126679 () Bool)

(assert (=> d!144745 (= c!126679 (and ((_ is Cons!31552) (toList!11063 (ListLongMap!22096 Nil!31553))) (= (_1!12230 (h!32761 (toList!11063 (ListLongMap!22096 Nil!31553)))) k0!387)))))

(assert (=> d!144745 (= (getValueByKey!728 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387) e!768012)))

(declare-fun b!1350069 () Bool)

(assert (=> b!1350069 (= e!768012 (Some!778 (_2!12230 (h!32761 (toList!11063 (ListLongMap!22096 Nil!31553))))))))

(assert (= (and d!144745 c!126679) b!1350069))

(assert (= (and d!144745 (not c!126679)) b!1350070))

(assert (= (and b!1350070 c!126680) b!1350071))

(assert (= (and b!1350070 (not c!126680)) b!1350072))

(declare-fun m!1236915 () Bool)

(assert (=> b!1350071 m!1236915))

(assert (=> b!1350060 d!144745))

(declare-fun d!144749 () Bool)

(declare-fun res!895600 () Bool)

(declare-fun e!768018 () Bool)

(assert (=> d!144749 (=> res!895600 e!768018)))

(assert (=> d!144749 (= res!895600 (and ((_ is Cons!31552) (toList!11063 (ListLongMap!22096 Nil!31553))) (= (_1!12230 (h!32761 (toList!11063 (ListLongMap!22096 Nil!31553)))) k0!387)))))

(assert (=> d!144749 (= (containsKey!745 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387) e!768018)))

(declare-fun b!1350077 () Bool)

(declare-fun e!768019 () Bool)

(assert (=> b!1350077 (= e!768018 e!768019)))

(declare-fun res!895601 () Bool)

(assert (=> b!1350077 (=> (not res!895601) (not e!768019))))

(assert (=> b!1350077 (= res!895601 (and (or (not ((_ is Cons!31552) (toList!11063 (ListLongMap!22096 Nil!31553)))) (bvsle (_1!12230 (h!32761 (toList!11063 (ListLongMap!22096 Nil!31553)))) k0!387)) ((_ is Cons!31552) (toList!11063 (ListLongMap!22096 Nil!31553))) (bvslt (_1!12230 (h!32761 (toList!11063 (ListLongMap!22096 Nil!31553)))) k0!387)))))

(declare-fun b!1350078 () Bool)

(assert (=> b!1350078 (= e!768019 (containsKey!745 (t!46206 (toList!11063 (ListLongMap!22096 Nil!31553))) k0!387))))

(assert (= (and d!144749 (not res!895600)) b!1350077))

(assert (= (and b!1350077 res!895601) b!1350078))

(declare-fun m!1236917 () Bool)

(assert (=> b!1350078 m!1236917))

(assert (=> d!144739 d!144749))

(declare-fun d!144751 () Bool)

(assert (=> d!144751 (isDefined!535 (getValueByKey!728 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))

(declare-fun lt!596755 () Unit!44064)

(declare-fun choose!1997 (List!31556 (_ BitVec 64)) Unit!44064)

(assert (=> d!144751 (= lt!596755 (choose!1997 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))

(declare-fun e!768027 () Bool)

(assert (=> d!144751 e!768027))

(declare-fun res!895609 () Bool)

(assert (=> d!144751 (=> (not res!895609) (not e!768027))))

(declare-fun isStrictlySorted!882 (List!31556) Bool)

(assert (=> d!144751 (= res!895609 (isStrictlySorted!882 (toList!11063 (ListLongMap!22096 Nil!31553))))))

(assert (=> d!144751 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387) lt!596755)))

(declare-fun b!1350084 () Bool)

(assert (=> b!1350084 (= e!768027 (containsKey!745 (toList!11063 (ListLongMap!22096 Nil!31553)) k0!387))))

(assert (= (and d!144751 res!895609) b!1350084))

(assert (=> d!144751 m!1236905))

(assert (=> d!144751 m!1236905))

(assert (=> d!144751 m!1236911))

(declare-fun m!1236925 () Bool)

(assert (=> d!144751 m!1236925))

(declare-fun m!1236927 () Bool)

(assert (=> d!144751 m!1236927))

(assert (=> b!1350084 m!1236893))

(assert (=> b!1350058 d!144751))

(assert (=> b!1350058 d!144743))

(assert (=> b!1350058 d!144745))

(check-sat (not b!1350071) (not d!144751) (not d!144743) (not b!1350084) (not b!1350078))
(check-sat)
