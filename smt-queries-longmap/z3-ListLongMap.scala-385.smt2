; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7260 () Bool)

(assert start!7260)

(declare-datatypes ((B!892 0))(
  ( (B!893 (val!1033 Int)) )
))
(declare-datatypes ((tuple2!1714 0))(
  ( (tuple2!1715 (_1!868 (_ BitVec 64)) (_2!868 B!892)) )
))
(declare-datatypes ((List!1251 0))(
  ( (Nil!1248) (Cons!1247 (h!1827 tuple2!1714) (t!4276 List!1251)) )
))
(declare-fun l!812 () List!1251)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46442 () Bool)

(declare-fun e!29600 () Bool)

(declare-fun removeStrictlySorted!43 (List!1251 (_ BitVec 64)) List!1251)

(assert (=> b!46442 (= e!29600 (not (= (removeStrictlySorted!43 (removeStrictlySorted!43 l!812 key1!43) key2!27) (removeStrictlySorted!43 (removeStrictlySorted!43 l!812 key2!27) key1!43))))))

(assert (=> b!46442 (= (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key1!43) key2!27) (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1323 0))(
  ( (Unit!1324) )
))
(declare-fun lt!20302 () Unit!1323)

(declare-fun lemmaRemoveStrictlySortedCommutative!17 (List!1251 (_ BitVec 64) (_ BitVec 64)) Unit!1323)

(assert (=> b!46442 (= lt!20302 (lemmaRemoveStrictlySortedCommutative!17 (t!4276 l!812) key1!43 key2!27))))

(declare-fun b!46443 () Bool)

(declare-fun e!29599 () Bool)

(declare-fun tp_is_empty!1989 () Bool)

(declare-fun tp!6140 () Bool)

(assert (=> b!46443 (= e!29599 (and tp_is_empty!1989 tp!6140))))

(declare-fun res!27131 () Bool)

(assert (=> start!7260 (=> (not res!27131) (not e!29600))))

(declare-fun isStrictlySorted!242 (List!1251) Bool)

(assert (=> start!7260 (= res!27131 (isStrictlySorted!242 l!812))))

(assert (=> start!7260 e!29600))

(assert (=> start!7260 e!29599))

(assert (=> start!7260 true))

(declare-fun b!46440 () Bool)

(declare-fun res!27130 () Bool)

(assert (=> b!46440 (=> (not res!27130) (not e!29600))))

(get-info :version)

(assert (=> b!46440 (= res!27130 ((_ is Cons!1247) l!812))))

(declare-fun b!46441 () Bool)

(declare-fun res!27132 () Bool)

(assert (=> b!46441 (=> (not res!27132) (not e!29600))))

(assert (=> b!46441 (= res!27132 (isStrictlySorted!242 (t!4276 l!812)))))

(assert (= (and start!7260 res!27131) b!46440))

(assert (= (and b!46440 res!27130) b!46441))

(assert (= (and b!46441 res!27132) b!46442))

(assert (= (and start!7260 ((_ is Cons!1247) l!812)) b!46443))

(declare-fun m!40735 () Bool)

(assert (=> b!46442 m!40735))

(declare-fun m!40737 () Bool)

(assert (=> b!46442 m!40737))

(declare-fun m!40739 () Bool)

(assert (=> b!46442 m!40739))

(assert (=> b!46442 m!40737))

(declare-fun m!40741 () Bool)

(assert (=> b!46442 m!40741))

(declare-fun m!40743 () Bool)

(assert (=> b!46442 m!40743))

(declare-fun m!40745 () Bool)

(assert (=> b!46442 m!40745))

(assert (=> b!46442 m!40735))

(declare-fun m!40747 () Bool)

(assert (=> b!46442 m!40747))

(declare-fun m!40749 () Bool)

(assert (=> b!46442 m!40749))

(assert (=> b!46442 m!40745))

(declare-fun m!40751 () Bool)

(assert (=> b!46442 m!40751))

(assert (=> b!46442 m!40741))

(declare-fun m!40753 () Bool)

(assert (=> start!7260 m!40753))

(declare-fun m!40755 () Bool)

(assert (=> b!46441 m!40755))

(check-sat tp_is_empty!1989 (not b!46443) (not b!46441) (not b!46442) (not start!7260))
(check-sat)
(get-model)

(declare-fun d!9097 () Bool)

(declare-fun e!29661 () Bool)

(assert (=> d!9097 e!29661))

(declare-fun res!27168 () Bool)

(assert (=> d!9097 (=> (not res!27168) (not e!29661))))

(declare-fun lt!20321 () List!1251)

(assert (=> d!9097 (= res!27168 (isStrictlySorted!242 lt!20321))))

(declare-fun e!29660 () List!1251)

(assert (=> d!9097 (= lt!20321 e!29660)))

(declare-fun c!6290 () Bool)

(assert (=> d!9097 (= c!6290 (and ((_ is Cons!1247) (removeStrictlySorted!43 l!812 key2!27)) (= (_1!868 (h!1827 (removeStrictlySorted!43 l!812 key2!27))) key1!43)))))

(assert (=> d!9097 (isStrictlySorted!242 (removeStrictlySorted!43 l!812 key2!27))))

(assert (=> d!9097 (= (removeStrictlySorted!43 (removeStrictlySorted!43 l!812 key2!27) key1!43) lt!20321)))

(declare-fun b!46535 () Bool)

(assert (=> b!46535 (= e!29660 (t!4276 (removeStrictlySorted!43 l!812 key2!27)))))

(declare-fun b!46536 () Bool)

(declare-fun containsKey!91 (List!1251 (_ BitVec 64)) Bool)

(assert (=> b!46536 (= e!29661 (not (containsKey!91 lt!20321 key1!43)))))

(declare-fun b!46537 () Bool)

(declare-fun e!29662 () List!1251)

(assert (=> b!46537 (= e!29662 Nil!1248)))

(declare-fun b!46538 () Bool)

(declare-fun $colon$colon!45 (List!1251 tuple2!1714) List!1251)

(assert (=> b!46538 (= e!29662 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key2!27)) key1!43) (h!1827 (removeStrictlySorted!43 l!812 key2!27))))))

(declare-fun b!46539 () Bool)

(assert (=> b!46539 (= e!29660 e!29662)))

(declare-fun c!6289 () Bool)

(assert (=> b!46539 (= c!6289 (and ((_ is Cons!1247) (removeStrictlySorted!43 l!812 key2!27)) (not (= (_1!868 (h!1827 (removeStrictlySorted!43 l!812 key2!27))) key1!43))))))

(assert (= (and d!9097 c!6290) b!46535))

(assert (= (and d!9097 (not c!6290)) b!46539))

(assert (= (and b!46539 c!6289) b!46538))

(assert (= (and b!46539 (not c!6289)) b!46537))

(assert (= (and d!9097 res!27168) b!46536))

(declare-fun m!40853 () Bool)

(assert (=> d!9097 m!40853))

(assert (=> d!9097 m!40737))

(declare-fun m!40855 () Bool)

(assert (=> d!9097 m!40855))

(declare-fun m!40857 () Bool)

(assert (=> b!46536 m!40857))

(declare-fun m!40859 () Bool)

(assert (=> b!46538 m!40859))

(assert (=> b!46538 m!40859))

(declare-fun m!40861 () Bool)

(assert (=> b!46538 m!40861))

(assert (=> b!46442 d!9097))

(declare-fun d!9117 () Bool)

(declare-fun e!29668 () Bool)

(assert (=> d!9117 e!29668))

(declare-fun res!27169 () Bool)

(assert (=> d!9117 (=> (not res!27169) (not e!29668))))

(declare-fun lt!20324 () List!1251)

(assert (=> d!9117 (= res!27169 (isStrictlySorted!242 lt!20324))))

(declare-fun e!29667 () List!1251)

(assert (=> d!9117 (= lt!20324 e!29667)))

(declare-fun c!6296 () Bool)

(assert (=> d!9117 (= c!6296 (and ((_ is Cons!1247) l!812) (= (_1!868 (h!1827 l!812)) key1!43)))))

(assert (=> d!9117 (isStrictlySorted!242 l!812)))

(assert (=> d!9117 (= (removeStrictlySorted!43 l!812 key1!43) lt!20324)))

(declare-fun b!46548 () Bool)

(assert (=> b!46548 (= e!29667 (t!4276 l!812))))

(declare-fun b!46549 () Bool)

(assert (=> b!46549 (= e!29668 (not (containsKey!91 lt!20324 key1!43)))))

(declare-fun b!46550 () Bool)

(declare-fun e!29669 () List!1251)

(assert (=> b!46550 (= e!29669 Nil!1248)))

(declare-fun b!46551 () Bool)

(assert (=> b!46551 (= e!29669 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 l!812) key1!43) (h!1827 l!812)))))

(declare-fun b!46552 () Bool)

(assert (=> b!46552 (= e!29667 e!29669)))

(declare-fun c!6295 () Bool)

(assert (=> b!46552 (= c!6295 (and ((_ is Cons!1247) l!812) (not (= (_1!868 (h!1827 l!812)) key1!43))))))

(assert (= (and d!9117 c!6296) b!46548))

(assert (= (and d!9117 (not c!6296)) b!46552))

(assert (= (and b!46552 c!6295) b!46551))

(assert (= (and b!46552 (not c!6295)) b!46550))

(assert (= (and d!9117 res!27169) b!46549))

(declare-fun m!40863 () Bool)

(assert (=> d!9117 m!40863))

(assert (=> d!9117 m!40753))

(declare-fun m!40865 () Bool)

(assert (=> b!46549 m!40865))

(assert (=> b!46551 m!40741))

(assert (=> b!46551 m!40741))

(declare-fun m!40867 () Bool)

(assert (=> b!46551 m!40867))

(assert (=> b!46442 d!9117))

(declare-fun d!9119 () Bool)

(declare-fun e!29673 () Bool)

(assert (=> d!9119 e!29673))

(declare-fun res!27172 () Bool)

(assert (=> d!9119 (=> (not res!27172) (not e!29673))))

(declare-fun lt!20325 () List!1251)

(assert (=> d!9119 (= res!27172 (isStrictlySorted!242 lt!20325))))

(declare-fun e!29672 () List!1251)

(assert (=> d!9119 (= lt!20325 e!29672)))

(declare-fun c!6298 () Bool)

(assert (=> d!9119 (= c!6298 (and ((_ is Cons!1247) l!812) (= (_1!868 (h!1827 l!812)) key2!27)))))

(assert (=> d!9119 (isStrictlySorted!242 l!812)))

(assert (=> d!9119 (= (removeStrictlySorted!43 l!812 key2!27) lt!20325)))

(declare-fun b!46555 () Bool)

(assert (=> b!46555 (= e!29672 (t!4276 l!812))))

(declare-fun b!46556 () Bool)

(assert (=> b!46556 (= e!29673 (not (containsKey!91 lt!20325 key2!27)))))

(declare-fun b!46557 () Bool)

(declare-fun e!29674 () List!1251)

(assert (=> b!46557 (= e!29674 Nil!1248)))

(declare-fun b!46558 () Bool)

(assert (=> b!46558 (= e!29674 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 l!812) key2!27) (h!1827 l!812)))))

(declare-fun b!46559 () Bool)

(assert (=> b!46559 (= e!29672 e!29674)))

(declare-fun c!6297 () Bool)

(assert (=> b!46559 (= c!6297 (and ((_ is Cons!1247) l!812) (not (= (_1!868 (h!1827 l!812)) key2!27))))))

(assert (= (and d!9119 c!6298) b!46555))

(assert (= (and d!9119 (not c!6298)) b!46559))

(assert (= (and b!46559 c!6297) b!46558))

(assert (= (and b!46559 (not c!6297)) b!46557))

(assert (= (and d!9119 res!27172) b!46556))

(declare-fun m!40869 () Bool)

(assert (=> d!9119 m!40869))

(assert (=> d!9119 m!40753))

(declare-fun m!40871 () Bool)

(assert (=> b!46556 m!40871))

(assert (=> b!46558 m!40735))

(assert (=> b!46558 m!40735))

(declare-fun m!40873 () Bool)

(assert (=> b!46558 m!40873))

(assert (=> b!46442 d!9119))

(declare-fun d!9121 () Bool)

(assert (=> d!9121 (= (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key1!43) key2!27) (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key2!27) key1!43))))

(declare-fun lt!20331 () Unit!1323)

(declare-fun choose!278 (List!1251 (_ BitVec 64) (_ BitVec 64)) Unit!1323)

(assert (=> d!9121 (= lt!20331 (choose!278 (t!4276 l!812) key1!43 key2!27))))

(assert (=> d!9121 (isStrictlySorted!242 (t!4276 l!812))))

(assert (=> d!9121 (= (lemmaRemoveStrictlySortedCommutative!17 (t!4276 l!812) key1!43 key2!27) lt!20331)))

(declare-fun bs!2183 () Bool)

(assert (= bs!2183 d!9121))

(assert (=> bs!2183 m!40735))

(assert (=> bs!2183 m!40741))

(assert (=> bs!2183 m!40735))

(assert (=> bs!2183 m!40747))

(declare-fun m!40897 () Bool)

(assert (=> bs!2183 m!40897))

(assert (=> bs!2183 m!40755))

(assert (=> bs!2183 m!40741))

(assert (=> bs!2183 m!40743))

(assert (=> b!46442 d!9121))

(declare-fun d!9129 () Bool)

(declare-fun e!29685 () Bool)

(assert (=> d!9129 e!29685))

(declare-fun res!27176 () Bool)

(assert (=> d!9129 (=> (not res!27176) (not e!29685))))

(declare-fun lt!20332 () List!1251)

(assert (=> d!9129 (= res!27176 (isStrictlySorted!242 lt!20332))))

(declare-fun e!29684 () List!1251)

(assert (=> d!9129 (= lt!20332 e!29684)))

(declare-fun c!6306 () Bool)

(assert (=> d!9129 (= c!6306 (and ((_ is Cons!1247) (removeStrictlySorted!43 (t!4276 l!812) key1!43)) (= (_1!868 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) key2!27)))))

(assert (=> d!9129 (isStrictlySorted!242 (removeStrictlySorted!43 (t!4276 l!812) key1!43))))

(assert (=> d!9129 (= (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key1!43) key2!27) lt!20332)))

(declare-fun b!46575 () Bool)

(assert (=> b!46575 (= e!29684 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)))))

(declare-fun b!46576 () Bool)

(assert (=> b!46576 (= e!29685 (not (containsKey!91 lt!20332 key2!27)))))

(declare-fun b!46577 () Bool)

(declare-fun e!29686 () List!1251)

(assert (=> b!46577 (= e!29686 Nil!1248)))

(declare-fun b!46578 () Bool)

(assert (=> b!46578 (= e!29686 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)) key2!27) (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key1!43))))))

(declare-fun b!46579 () Bool)

(assert (=> b!46579 (= e!29684 e!29686)))

(declare-fun c!6305 () Bool)

(assert (=> b!46579 (= c!6305 (and ((_ is Cons!1247) (removeStrictlySorted!43 (t!4276 l!812) key1!43)) (not (= (_1!868 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) key2!27))))))

(assert (= (and d!9129 c!6306) b!46575))

(assert (= (and d!9129 (not c!6306)) b!46579))

(assert (= (and b!46579 c!6305) b!46578))

(assert (= (and b!46579 (not c!6305)) b!46577))

(assert (= (and d!9129 res!27176) b!46576))

(declare-fun m!40899 () Bool)

(assert (=> d!9129 m!40899))

(assert (=> d!9129 m!40741))

(declare-fun m!40901 () Bool)

(assert (=> d!9129 m!40901))

(declare-fun m!40903 () Bool)

(assert (=> b!46576 m!40903))

(declare-fun m!40905 () Bool)

(assert (=> b!46578 m!40905))

(assert (=> b!46578 m!40905))

(declare-fun m!40907 () Bool)

(assert (=> b!46578 m!40907))

(assert (=> b!46442 d!9129))

(declare-fun d!9131 () Bool)

(declare-fun e!29688 () Bool)

(assert (=> d!9131 e!29688))

(declare-fun res!27177 () Bool)

(assert (=> d!9131 (=> (not res!27177) (not e!29688))))

(declare-fun lt!20333 () List!1251)

(assert (=> d!9131 (= res!27177 (isStrictlySorted!242 lt!20333))))

(declare-fun e!29687 () List!1251)

(assert (=> d!9131 (= lt!20333 e!29687)))

(declare-fun c!6308 () Bool)

(assert (=> d!9131 (= c!6308 (and ((_ is Cons!1247) (t!4276 l!812)) (= (_1!868 (h!1827 (t!4276 l!812))) key1!43)))))

(assert (=> d!9131 (isStrictlySorted!242 (t!4276 l!812))))

(assert (=> d!9131 (= (removeStrictlySorted!43 (t!4276 l!812) key1!43) lt!20333)))

(declare-fun b!46580 () Bool)

(assert (=> b!46580 (= e!29687 (t!4276 (t!4276 l!812)))))

(declare-fun b!46581 () Bool)

(assert (=> b!46581 (= e!29688 (not (containsKey!91 lt!20333 key1!43)))))

(declare-fun b!46582 () Bool)

(declare-fun e!29689 () List!1251)

(assert (=> b!46582 (= e!29689 Nil!1248)))

(declare-fun b!46583 () Bool)

(assert (=> b!46583 (= e!29689 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key1!43) (h!1827 (t!4276 l!812))))))

(declare-fun b!46584 () Bool)

(assert (=> b!46584 (= e!29687 e!29689)))

(declare-fun c!6307 () Bool)

(assert (=> b!46584 (= c!6307 (and ((_ is Cons!1247) (t!4276 l!812)) (not (= (_1!868 (h!1827 (t!4276 l!812))) key1!43))))))

(assert (= (and d!9131 c!6308) b!46580))

(assert (= (and d!9131 (not c!6308)) b!46584))

(assert (= (and b!46584 c!6307) b!46583))

(assert (= (and b!46584 (not c!6307)) b!46582))

(assert (= (and d!9131 res!27177) b!46581))

(declare-fun m!40909 () Bool)

(assert (=> d!9131 m!40909))

(assert (=> d!9131 m!40755))

(declare-fun m!40911 () Bool)

(assert (=> b!46581 m!40911))

(declare-fun m!40913 () Bool)

(assert (=> b!46583 m!40913))

(assert (=> b!46583 m!40913))

(declare-fun m!40915 () Bool)

(assert (=> b!46583 m!40915))

(assert (=> b!46442 d!9131))

(declare-fun d!9133 () Bool)

(declare-fun e!29691 () Bool)

(assert (=> d!9133 e!29691))

(declare-fun res!27178 () Bool)

(assert (=> d!9133 (=> (not res!27178) (not e!29691))))

(declare-fun lt!20336 () List!1251)

(assert (=> d!9133 (= res!27178 (isStrictlySorted!242 lt!20336))))

(declare-fun e!29690 () List!1251)

(assert (=> d!9133 (= lt!20336 e!29690)))

(declare-fun c!6310 () Bool)

(assert (=> d!9133 (= c!6310 (and ((_ is Cons!1247) (removeStrictlySorted!43 (t!4276 l!812) key2!27)) (= (_1!868 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) key1!43)))))

(assert (=> d!9133 (isStrictlySorted!242 (removeStrictlySorted!43 (t!4276 l!812) key2!27))))

(assert (=> d!9133 (= (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key2!27) key1!43) lt!20336)))

(declare-fun b!46585 () Bool)

(assert (=> b!46585 (= e!29690 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)))))

(declare-fun b!46586 () Bool)

(assert (=> b!46586 (= e!29691 (not (containsKey!91 lt!20336 key1!43)))))

(declare-fun b!46587 () Bool)

(declare-fun e!29692 () List!1251)

(assert (=> b!46587 (= e!29692 Nil!1248)))

(declare-fun b!46588 () Bool)

(assert (=> b!46588 (= e!29692 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)) key1!43) (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key2!27))))))

(declare-fun b!46589 () Bool)

(assert (=> b!46589 (= e!29690 e!29692)))

(declare-fun c!6309 () Bool)

(assert (=> b!46589 (= c!6309 (and ((_ is Cons!1247) (removeStrictlySorted!43 (t!4276 l!812) key2!27)) (not (= (_1!868 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) key1!43))))))

(assert (= (and d!9133 c!6310) b!46585))

(assert (= (and d!9133 (not c!6310)) b!46589))

(assert (= (and b!46589 c!6309) b!46588))

(assert (= (and b!46589 (not c!6309)) b!46587))

(assert (= (and d!9133 res!27178) b!46586))

(declare-fun m!40917 () Bool)

(assert (=> d!9133 m!40917))

(assert (=> d!9133 m!40735))

(declare-fun m!40919 () Bool)

(assert (=> d!9133 m!40919))

(declare-fun m!40921 () Bool)

(assert (=> b!46586 m!40921))

(declare-fun m!40923 () Bool)

(assert (=> b!46588 m!40923))

(assert (=> b!46588 m!40923))

(declare-fun m!40925 () Bool)

(assert (=> b!46588 m!40925))

(assert (=> b!46442 d!9133))

(declare-fun d!9135 () Bool)

(declare-fun e!29694 () Bool)

(assert (=> d!9135 e!29694))

(declare-fun res!27179 () Bool)

(assert (=> d!9135 (=> (not res!27179) (not e!29694))))

(declare-fun lt!20338 () List!1251)

(assert (=> d!9135 (= res!27179 (isStrictlySorted!242 lt!20338))))

(declare-fun e!29693 () List!1251)

(assert (=> d!9135 (= lt!20338 e!29693)))

(declare-fun c!6312 () Bool)

(assert (=> d!9135 (= c!6312 (and ((_ is Cons!1247) (t!4276 l!812)) (= (_1!868 (h!1827 (t!4276 l!812))) key2!27)))))

(assert (=> d!9135 (isStrictlySorted!242 (t!4276 l!812))))

(assert (=> d!9135 (= (removeStrictlySorted!43 (t!4276 l!812) key2!27) lt!20338)))

(declare-fun b!46590 () Bool)

(assert (=> b!46590 (= e!29693 (t!4276 (t!4276 l!812)))))

(declare-fun b!46591 () Bool)

(assert (=> b!46591 (= e!29694 (not (containsKey!91 lt!20338 key2!27)))))

(declare-fun b!46592 () Bool)

(declare-fun e!29695 () List!1251)

(assert (=> b!46592 (= e!29695 Nil!1248)))

(declare-fun b!46593 () Bool)

(assert (=> b!46593 (= e!29695 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key2!27) (h!1827 (t!4276 l!812))))))

(declare-fun b!46594 () Bool)

(assert (=> b!46594 (= e!29693 e!29695)))

(declare-fun c!6311 () Bool)

(assert (=> b!46594 (= c!6311 (and ((_ is Cons!1247) (t!4276 l!812)) (not (= (_1!868 (h!1827 (t!4276 l!812))) key2!27))))))

(assert (= (and d!9135 c!6312) b!46590))

(assert (= (and d!9135 (not c!6312)) b!46594))

(assert (= (and b!46594 c!6311) b!46593))

(assert (= (and b!46594 (not c!6311)) b!46592))

(assert (= (and d!9135 res!27179) b!46591))

(declare-fun m!40929 () Bool)

(assert (=> d!9135 m!40929))

(assert (=> d!9135 m!40755))

(declare-fun m!40931 () Bool)

(assert (=> b!46591 m!40931))

(declare-fun m!40933 () Bool)

(assert (=> b!46593 m!40933))

(assert (=> b!46593 m!40933))

(declare-fun m!40935 () Bool)

(assert (=> b!46593 m!40935))

(assert (=> b!46442 d!9135))

(declare-fun d!9139 () Bool)

(declare-fun e!29700 () Bool)

(assert (=> d!9139 e!29700))

(declare-fun res!27181 () Bool)

(assert (=> d!9139 (=> (not res!27181) (not e!29700))))

(declare-fun lt!20340 () List!1251)

(assert (=> d!9139 (= res!27181 (isStrictlySorted!242 lt!20340))))

(declare-fun e!29699 () List!1251)

(assert (=> d!9139 (= lt!20340 e!29699)))

(declare-fun c!6316 () Bool)

(assert (=> d!9139 (= c!6316 (and ((_ is Cons!1247) (removeStrictlySorted!43 l!812 key1!43)) (= (_1!868 (h!1827 (removeStrictlySorted!43 l!812 key1!43))) key2!27)))))

(assert (=> d!9139 (isStrictlySorted!242 (removeStrictlySorted!43 l!812 key1!43))))

(assert (=> d!9139 (= (removeStrictlySorted!43 (removeStrictlySorted!43 l!812 key1!43) key2!27) lt!20340)))

(declare-fun b!46600 () Bool)

(assert (=> b!46600 (= e!29699 (t!4276 (removeStrictlySorted!43 l!812 key1!43)))))

(declare-fun b!46601 () Bool)

(assert (=> b!46601 (= e!29700 (not (containsKey!91 lt!20340 key2!27)))))

(declare-fun b!46602 () Bool)

(declare-fun e!29701 () List!1251)

(assert (=> b!46602 (= e!29701 Nil!1248)))

(declare-fun b!46603 () Bool)

(assert (=> b!46603 (= e!29701 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key1!43)) key2!27) (h!1827 (removeStrictlySorted!43 l!812 key1!43))))))

(declare-fun b!46604 () Bool)

(assert (=> b!46604 (= e!29699 e!29701)))

(declare-fun c!6315 () Bool)

(assert (=> b!46604 (= c!6315 (and ((_ is Cons!1247) (removeStrictlySorted!43 l!812 key1!43)) (not (= (_1!868 (h!1827 (removeStrictlySorted!43 l!812 key1!43))) key2!27))))))

(assert (= (and d!9139 c!6316) b!46600))

(assert (= (and d!9139 (not c!6316)) b!46604))

(assert (= (and b!46604 c!6315) b!46603))

(assert (= (and b!46604 (not c!6315)) b!46602))

(assert (= (and d!9139 res!27181) b!46601))

(declare-fun m!40947 () Bool)

(assert (=> d!9139 m!40947))

(assert (=> d!9139 m!40745))

(declare-fun m!40949 () Bool)

(assert (=> d!9139 m!40949))

(declare-fun m!40951 () Bool)

(assert (=> b!46601 m!40951))

(declare-fun m!40953 () Bool)

(assert (=> b!46603 m!40953))

(assert (=> b!46603 m!40953))

(declare-fun m!40955 () Bool)

(assert (=> b!46603 m!40955))

(assert (=> b!46442 d!9139))

(declare-fun d!9143 () Bool)

(declare-fun res!27190 () Bool)

(declare-fun e!29718 () Bool)

(assert (=> d!9143 (=> res!27190 e!29718)))

(assert (=> d!9143 (= res!27190 (or ((_ is Nil!1248) l!812) ((_ is Nil!1248) (t!4276 l!812))))))

(assert (=> d!9143 (= (isStrictlySorted!242 l!812) e!29718)))

(declare-fun b!46629 () Bool)

(declare-fun e!29719 () Bool)

(assert (=> b!46629 (= e!29718 e!29719)))

(declare-fun res!27191 () Bool)

(assert (=> b!46629 (=> (not res!27191) (not e!29719))))

(assert (=> b!46629 (= res!27191 (bvslt (_1!868 (h!1827 l!812)) (_1!868 (h!1827 (t!4276 l!812)))))))

(declare-fun b!46630 () Bool)

(assert (=> b!46630 (= e!29719 (isStrictlySorted!242 (t!4276 l!812)))))

(assert (= (and d!9143 (not res!27190)) b!46629))

(assert (= (and b!46629 res!27191) b!46630))

(assert (=> b!46630 m!40755))

(assert (=> start!7260 d!9143))

(declare-fun d!9151 () Bool)

(declare-fun res!27192 () Bool)

(declare-fun e!29720 () Bool)

(assert (=> d!9151 (=> res!27192 e!29720)))

(assert (=> d!9151 (= res!27192 (or ((_ is Nil!1248) (t!4276 l!812)) ((_ is Nil!1248) (t!4276 (t!4276 l!812)))))))

(assert (=> d!9151 (= (isStrictlySorted!242 (t!4276 l!812)) e!29720)))

(declare-fun b!46631 () Bool)

(declare-fun e!29721 () Bool)

(assert (=> b!46631 (= e!29720 e!29721)))

(declare-fun res!27193 () Bool)

(assert (=> b!46631 (=> (not res!27193) (not e!29721))))

(assert (=> b!46631 (= res!27193 (bvslt (_1!868 (h!1827 (t!4276 l!812))) (_1!868 (h!1827 (t!4276 (t!4276 l!812))))))))

(declare-fun b!46632 () Bool)

(assert (=> b!46632 (= e!29721 (isStrictlySorted!242 (t!4276 (t!4276 l!812))))))

(assert (= (and d!9151 (not res!27192)) b!46631))

(assert (= (and b!46631 res!27193) b!46632))

(declare-fun m!40993 () Bool)

(assert (=> b!46632 m!40993))

(assert (=> b!46441 d!9151))

(declare-fun b!46643 () Bool)

(declare-fun e!29728 () Bool)

(declare-fun tp!6151 () Bool)

(assert (=> b!46643 (= e!29728 (and tp_is_empty!1989 tp!6151))))

(assert (=> b!46443 (= tp!6140 e!29728)))

(assert (= (and b!46443 ((_ is Cons!1247) (t!4276 l!812))) b!46643))

(check-sat (not b!46591) (not d!9131) tp_is_empty!1989 (not b!46601) (not b!46632) (not b!46586) (not b!46549) (not b!46558) (not b!46578) (not d!9119) (not b!46536) (not d!9133) (not d!9139) (not d!9129) (not b!46593) (not b!46538) (not b!46643) (not b!46576) (not b!46583) (not b!46588) (not d!9121) (not d!9117) (not d!9097) (not d!9135) (not b!46551) (not b!46556) (not b!46603) (not b!46581) (not b!46630))
(check-sat)
(get-model)

(declare-fun d!9155 () Bool)

(declare-fun res!27196 () Bool)

(declare-fun e!29730 () Bool)

(assert (=> d!9155 (=> res!27196 e!29730)))

(assert (=> d!9155 (= res!27196 (or ((_ is Nil!1248) lt!20321) ((_ is Nil!1248) (t!4276 lt!20321))))))

(assert (=> d!9155 (= (isStrictlySorted!242 lt!20321) e!29730)))

(declare-fun b!46645 () Bool)

(declare-fun e!29731 () Bool)

(assert (=> b!46645 (= e!29730 e!29731)))

(declare-fun res!27197 () Bool)

(assert (=> b!46645 (=> (not res!27197) (not e!29731))))

(assert (=> b!46645 (= res!27197 (bvslt (_1!868 (h!1827 lt!20321)) (_1!868 (h!1827 (t!4276 lt!20321)))))))

(declare-fun b!46646 () Bool)

(assert (=> b!46646 (= e!29731 (isStrictlySorted!242 (t!4276 lt!20321)))))

(assert (= (and d!9155 (not res!27196)) b!46645))

(assert (= (and b!46645 res!27197) b!46646))

(declare-fun m!40995 () Bool)

(assert (=> b!46646 m!40995))

(assert (=> d!9097 d!9155))

(declare-fun d!9157 () Bool)

(declare-fun res!27198 () Bool)

(declare-fun e!29732 () Bool)

(assert (=> d!9157 (=> res!27198 e!29732)))

(assert (=> d!9157 (= res!27198 (or ((_ is Nil!1248) (removeStrictlySorted!43 l!812 key2!27)) ((_ is Nil!1248) (t!4276 (removeStrictlySorted!43 l!812 key2!27)))))))

(assert (=> d!9157 (= (isStrictlySorted!242 (removeStrictlySorted!43 l!812 key2!27)) e!29732)))

(declare-fun b!46647 () Bool)

(declare-fun e!29733 () Bool)

(assert (=> b!46647 (= e!29732 e!29733)))

(declare-fun res!27199 () Bool)

(assert (=> b!46647 (=> (not res!27199) (not e!29733))))

(assert (=> b!46647 (= res!27199 (bvslt (_1!868 (h!1827 (removeStrictlySorted!43 l!812 key2!27))) (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key2!27))))))))

(declare-fun b!46648 () Bool)

(assert (=> b!46648 (= e!29733 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 l!812 key2!27))))))

(assert (= (and d!9157 (not res!27198)) b!46647))

(assert (= (and b!46647 res!27199) b!46648))

(declare-fun m!40997 () Bool)

(assert (=> b!46648 m!40997))

(assert (=> d!9097 d!9157))

(declare-fun d!9159 () Bool)

(assert (=> d!9159 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)) key2!27) (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) (Cons!1247 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key1!43)) (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)) key2!27)))))

(assert (=> b!46578 d!9159))

(declare-fun d!9161 () Bool)

(declare-fun e!29735 () Bool)

(assert (=> d!9161 e!29735))

(declare-fun res!27200 () Bool)

(assert (=> d!9161 (=> (not res!27200) (not e!29735))))

(declare-fun lt!20345 () List!1251)

(assert (=> d!9161 (= res!27200 (isStrictlySorted!242 lt!20345))))

(declare-fun e!29734 () List!1251)

(assert (=> d!9161 (= lt!20345 e!29734)))

(declare-fun c!6326 () Bool)

(assert (=> d!9161 (= c!6326 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)))) key2!27)))))

(assert (=> d!9161 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)))))

(assert (=> d!9161 (= (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)) key2!27) lt!20345)))

(declare-fun b!46649 () Bool)

(assert (=> b!46649 (= e!29734 (t!4276 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43))))))

(declare-fun b!46650 () Bool)

(assert (=> b!46650 (= e!29735 (not (containsKey!91 lt!20345 key2!27)))))

(declare-fun b!46651 () Bool)

(declare-fun e!29736 () List!1251)

(assert (=> b!46651 (= e!29736 Nil!1248)))

(declare-fun b!46652 () Bool)

(assert (=> b!46652 (= e!29736 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) key2!27) (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)))))))

(declare-fun b!46653 () Bool)

(assert (=> b!46653 (= e!29734 e!29736)))

(declare-fun c!6325 () Bool)

(assert (=> b!46653 (= c!6325 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) (not (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)))) key2!27))))))

(assert (= (and d!9161 c!6326) b!46649))

(assert (= (and d!9161 (not c!6326)) b!46653))

(assert (= (and b!46653 c!6325) b!46652))

(assert (= (and b!46653 (not c!6325)) b!46651))

(assert (= (and d!9161 res!27200) b!46650))

(declare-fun m!40999 () Bool)

(assert (=> d!9161 m!40999))

(declare-fun m!41001 () Bool)

(assert (=> d!9161 m!41001))

(declare-fun m!41003 () Bool)

(assert (=> b!46650 m!41003))

(declare-fun m!41005 () Bool)

(assert (=> b!46652 m!41005))

(assert (=> b!46652 m!41005))

(declare-fun m!41007 () Bool)

(assert (=> b!46652 m!41007))

(assert (=> b!46578 d!9161))

(declare-fun d!9163 () Bool)

(assert (=> d!9163 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key2!27)) key1!43) (h!1827 (removeStrictlySorted!43 l!812 key2!27))) (Cons!1247 (h!1827 (removeStrictlySorted!43 l!812 key2!27)) (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key2!27)) key1!43)))))

(assert (=> b!46538 d!9163))

(declare-fun d!9165 () Bool)

(declare-fun e!29738 () Bool)

(assert (=> d!9165 e!29738))

(declare-fun res!27201 () Bool)

(assert (=> d!9165 (=> (not res!27201) (not e!29738))))

(declare-fun lt!20346 () List!1251)

(assert (=> d!9165 (= res!27201 (isStrictlySorted!242 lt!20346))))

(declare-fun e!29737 () List!1251)

(assert (=> d!9165 (= lt!20346 e!29737)))

(declare-fun c!6328 () Bool)

(assert (=> d!9165 (= c!6328 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 l!812 key2!27))) (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key2!27)))) key1!43)))))

(assert (=> d!9165 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 l!812 key2!27)))))

(assert (=> d!9165 (= (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key2!27)) key1!43) lt!20346)))

(declare-fun b!46654 () Bool)

(assert (=> b!46654 (= e!29737 (t!4276 (t!4276 (removeStrictlySorted!43 l!812 key2!27))))))

(declare-fun b!46655 () Bool)

(assert (=> b!46655 (= e!29738 (not (containsKey!91 lt!20346 key1!43)))))

(declare-fun b!46656 () Bool)

(declare-fun e!29739 () List!1251)

(assert (=> b!46656 (= e!29739 Nil!1248)))

(declare-fun b!46657 () Bool)

(assert (=> b!46657 (= e!29739 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 (removeStrictlySorted!43 l!812 key2!27))) key1!43) (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key2!27)))))))

(declare-fun b!46658 () Bool)

(assert (=> b!46658 (= e!29737 e!29739)))

(declare-fun c!6327 () Bool)

(assert (=> b!46658 (= c!6327 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 l!812 key2!27))) (not (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key2!27)))) key1!43))))))

(assert (= (and d!9165 c!6328) b!46654))

(assert (= (and d!9165 (not c!6328)) b!46658))

(assert (= (and b!46658 c!6327) b!46657))

(assert (= (and b!46658 (not c!6327)) b!46656))

(assert (= (and d!9165 res!27201) b!46655))

(declare-fun m!41009 () Bool)

(assert (=> d!9165 m!41009))

(assert (=> d!9165 m!40997))

(declare-fun m!41011 () Bool)

(assert (=> b!46655 m!41011))

(declare-fun m!41013 () Bool)

(assert (=> b!46657 m!41013))

(assert (=> b!46657 m!41013))

(declare-fun m!41015 () Bool)

(assert (=> b!46657 m!41015))

(assert (=> b!46538 d!9165))

(declare-fun d!9167 () Bool)

(declare-fun res!27206 () Bool)

(declare-fun e!29744 () Bool)

(assert (=> d!9167 (=> res!27206 e!29744)))

(assert (=> d!9167 (= res!27206 (and ((_ is Cons!1247) lt!20333) (= (_1!868 (h!1827 lt!20333)) key1!43)))))

(assert (=> d!9167 (= (containsKey!91 lt!20333 key1!43) e!29744)))

(declare-fun b!46663 () Bool)

(declare-fun e!29745 () Bool)

(assert (=> b!46663 (= e!29744 e!29745)))

(declare-fun res!27207 () Bool)

(assert (=> b!46663 (=> (not res!27207) (not e!29745))))

(assert (=> b!46663 (= res!27207 (and (or (not ((_ is Cons!1247) lt!20333)) (bvsle (_1!868 (h!1827 lt!20333)) key1!43)) ((_ is Cons!1247) lt!20333) (bvslt (_1!868 (h!1827 lt!20333)) key1!43)))))

(declare-fun b!46664 () Bool)

(assert (=> b!46664 (= e!29745 (containsKey!91 (t!4276 lt!20333) key1!43))))

(assert (= (and d!9167 (not res!27206)) b!46663))

(assert (= (and b!46663 res!27207) b!46664))

(declare-fun m!41017 () Bool)

(assert (=> b!46664 m!41017))

(assert (=> b!46581 d!9167))

(declare-fun d!9171 () Bool)

(declare-fun res!27208 () Bool)

(declare-fun e!29746 () Bool)

(assert (=> d!9171 (=> res!27208 e!29746)))

(assert (=> d!9171 (= res!27208 (and ((_ is Cons!1247) lt!20324) (= (_1!868 (h!1827 lt!20324)) key1!43)))))

(assert (=> d!9171 (= (containsKey!91 lt!20324 key1!43) e!29746)))

(declare-fun b!46665 () Bool)

(declare-fun e!29747 () Bool)

(assert (=> b!46665 (= e!29746 e!29747)))

(declare-fun res!27209 () Bool)

(assert (=> b!46665 (=> (not res!27209) (not e!29747))))

(assert (=> b!46665 (= res!27209 (and (or (not ((_ is Cons!1247) lt!20324)) (bvsle (_1!868 (h!1827 lt!20324)) key1!43)) ((_ is Cons!1247) lt!20324) (bvslt (_1!868 (h!1827 lt!20324)) key1!43)))))

(declare-fun b!46666 () Bool)

(assert (=> b!46666 (= e!29747 (containsKey!91 (t!4276 lt!20324) key1!43))))

(assert (= (and d!9171 (not res!27208)) b!46665))

(assert (= (and b!46665 res!27209) b!46666))

(declare-fun m!41019 () Bool)

(assert (=> b!46666 m!41019))

(assert (=> b!46549 d!9171))

(declare-fun d!9175 () Bool)

(declare-fun res!27211 () Bool)

(declare-fun e!29751 () Bool)

(assert (=> d!9175 (=> res!27211 e!29751)))

(assert (=> d!9175 (= res!27211 (and ((_ is Cons!1247) lt!20332) (= (_1!868 (h!1827 lt!20332)) key2!27)))))

(assert (=> d!9175 (= (containsKey!91 lt!20332 key2!27) e!29751)))

(declare-fun b!46672 () Bool)

(declare-fun e!29752 () Bool)

(assert (=> b!46672 (= e!29751 e!29752)))

(declare-fun res!27212 () Bool)

(assert (=> b!46672 (=> (not res!27212) (not e!29752))))

(assert (=> b!46672 (= res!27212 (and (or (not ((_ is Cons!1247) lt!20332)) (bvsle (_1!868 (h!1827 lt!20332)) key2!27)) ((_ is Cons!1247) lt!20332) (bvslt (_1!868 (h!1827 lt!20332)) key2!27)))))

(declare-fun b!46673 () Bool)

(assert (=> b!46673 (= e!29752 (containsKey!91 (t!4276 lt!20332) key2!27))))

(assert (= (and d!9175 (not res!27211)) b!46672))

(assert (= (and b!46672 res!27212) b!46673))

(declare-fun m!41021 () Bool)

(assert (=> b!46673 m!41021))

(assert (=> b!46576 d!9175))

(declare-fun d!9177 () Bool)

(declare-fun res!27213 () Bool)

(declare-fun e!29753 () Bool)

(assert (=> d!9177 (=> res!27213 e!29753)))

(assert (=> d!9177 (= res!27213 (and ((_ is Cons!1247) lt!20321) (= (_1!868 (h!1827 lt!20321)) key1!43)))))

(assert (=> d!9177 (= (containsKey!91 lt!20321 key1!43) e!29753)))

(declare-fun b!46674 () Bool)

(declare-fun e!29754 () Bool)

(assert (=> b!46674 (= e!29753 e!29754)))

(declare-fun res!27214 () Bool)

(assert (=> b!46674 (=> (not res!27214) (not e!29754))))

(assert (=> b!46674 (= res!27214 (and (or (not ((_ is Cons!1247) lt!20321)) (bvsle (_1!868 (h!1827 lt!20321)) key1!43)) ((_ is Cons!1247) lt!20321) (bvslt (_1!868 (h!1827 lt!20321)) key1!43)))))

(declare-fun b!46675 () Bool)

(assert (=> b!46675 (= e!29754 (containsKey!91 (t!4276 lt!20321) key1!43))))

(assert (= (and d!9177 (not res!27213)) b!46674))

(assert (= (and b!46674 res!27214) b!46675))

(declare-fun m!41033 () Bool)

(assert (=> b!46675 m!41033))

(assert (=> b!46536 d!9177))

(declare-fun d!9181 () Bool)

(declare-fun res!27215 () Bool)

(declare-fun e!29755 () Bool)

(assert (=> d!9181 (=> res!27215 e!29755)))

(assert (=> d!9181 (= res!27215 (or ((_ is Nil!1248) lt!20336) ((_ is Nil!1248) (t!4276 lt!20336))))))

(assert (=> d!9181 (= (isStrictlySorted!242 lt!20336) e!29755)))

(declare-fun b!46676 () Bool)

(declare-fun e!29756 () Bool)

(assert (=> b!46676 (= e!29755 e!29756)))

(declare-fun res!27216 () Bool)

(assert (=> b!46676 (=> (not res!27216) (not e!29756))))

(assert (=> b!46676 (= res!27216 (bvslt (_1!868 (h!1827 lt!20336)) (_1!868 (h!1827 (t!4276 lt!20336)))))))

(declare-fun b!46677 () Bool)

(assert (=> b!46677 (= e!29756 (isStrictlySorted!242 (t!4276 lt!20336)))))

(assert (= (and d!9181 (not res!27215)) b!46676))

(assert (= (and b!46676 res!27216) b!46677))

(declare-fun m!41035 () Bool)

(assert (=> b!46677 m!41035))

(assert (=> d!9133 d!9181))

(declare-fun d!9183 () Bool)

(declare-fun res!27217 () Bool)

(declare-fun e!29757 () Bool)

(assert (=> d!9183 (=> res!27217 e!29757)))

(assert (=> d!9183 (= res!27217 (or ((_ is Nil!1248) (removeStrictlySorted!43 (t!4276 l!812) key2!27)) ((_ is Nil!1248) (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)))))))

(assert (=> d!9183 (= (isStrictlySorted!242 (removeStrictlySorted!43 (t!4276 l!812) key2!27)) e!29757)))

(declare-fun b!46678 () Bool)

(declare-fun e!29758 () Bool)

(assert (=> b!46678 (= e!29757 e!29758)))

(declare-fun res!27218 () Bool)

(assert (=> b!46678 (=> (not res!27218) (not e!29758))))

(assert (=> b!46678 (= res!27218 (bvslt (_1!868 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27))))))))

(declare-fun b!46679 () Bool)

(assert (=> b!46679 (= e!29758 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27))))))

(assert (= (and d!9183 (not res!27217)) b!46678))

(assert (= (and b!46678 res!27218) b!46679))

(declare-fun m!41037 () Bool)

(assert (=> b!46679 m!41037))

(assert (=> d!9133 d!9183))

(declare-fun d!9185 () Bool)

(declare-fun res!27219 () Bool)

(declare-fun e!29759 () Bool)

(assert (=> d!9185 (=> res!27219 e!29759)))

(assert (=> d!9185 (= res!27219 (or ((_ is Nil!1248) lt!20340) ((_ is Nil!1248) (t!4276 lt!20340))))))

(assert (=> d!9185 (= (isStrictlySorted!242 lt!20340) e!29759)))

(declare-fun b!46680 () Bool)

(declare-fun e!29760 () Bool)

(assert (=> b!46680 (= e!29759 e!29760)))

(declare-fun res!27220 () Bool)

(assert (=> b!46680 (=> (not res!27220) (not e!29760))))

(assert (=> b!46680 (= res!27220 (bvslt (_1!868 (h!1827 lt!20340)) (_1!868 (h!1827 (t!4276 lt!20340)))))))

(declare-fun b!46681 () Bool)

(assert (=> b!46681 (= e!29760 (isStrictlySorted!242 (t!4276 lt!20340)))))

(assert (= (and d!9185 (not res!27219)) b!46680))

(assert (= (and b!46680 res!27220) b!46681))

(declare-fun m!41039 () Bool)

(assert (=> b!46681 m!41039))

(assert (=> d!9139 d!9185))

(declare-fun d!9187 () Bool)

(declare-fun res!27221 () Bool)

(declare-fun e!29761 () Bool)

(assert (=> d!9187 (=> res!27221 e!29761)))

(assert (=> d!9187 (= res!27221 (or ((_ is Nil!1248) (removeStrictlySorted!43 l!812 key1!43)) ((_ is Nil!1248) (t!4276 (removeStrictlySorted!43 l!812 key1!43)))))))

(assert (=> d!9187 (= (isStrictlySorted!242 (removeStrictlySorted!43 l!812 key1!43)) e!29761)))

(declare-fun b!46682 () Bool)

(declare-fun e!29762 () Bool)

(assert (=> b!46682 (= e!29761 e!29762)))

(declare-fun res!27222 () Bool)

(assert (=> b!46682 (=> (not res!27222) (not e!29762))))

(assert (=> b!46682 (= res!27222 (bvslt (_1!868 (h!1827 (removeStrictlySorted!43 l!812 key1!43))) (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key1!43))))))))

(declare-fun b!46683 () Bool)

(assert (=> b!46683 (= e!29762 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 l!812 key1!43))))))

(assert (= (and d!9187 (not res!27221)) b!46682))

(assert (= (and b!46682 res!27222) b!46683))

(declare-fun m!41041 () Bool)

(assert (=> b!46683 m!41041))

(assert (=> d!9139 d!9187))

(declare-fun d!9189 () Bool)

(declare-fun res!27223 () Bool)

(declare-fun e!29763 () Bool)

(assert (=> d!9189 (=> res!27223 e!29763)))

(assert (=> d!9189 (= res!27223 (or ((_ is Nil!1248) (t!4276 (t!4276 l!812))) ((_ is Nil!1248) (t!4276 (t!4276 (t!4276 l!812))))))))

(assert (=> d!9189 (= (isStrictlySorted!242 (t!4276 (t!4276 l!812))) e!29763)))

(declare-fun b!46684 () Bool)

(declare-fun e!29764 () Bool)

(assert (=> b!46684 (= e!29763 e!29764)))

(declare-fun res!27224 () Bool)

(assert (=> b!46684 (=> (not res!27224) (not e!29764))))

(assert (=> b!46684 (= res!27224 (bvslt (_1!868 (h!1827 (t!4276 (t!4276 l!812)))) (_1!868 (h!1827 (t!4276 (t!4276 (t!4276 l!812)))))))))

(declare-fun b!46685 () Bool)

(assert (=> b!46685 (= e!29764 (isStrictlySorted!242 (t!4276 (t!4276 (t!4276 l!812)))))))

(assert (= (and d!9189 (not res!27223)) b!46684))

(assert (= (and b!46684 res!27224) b!46685))

(declare-fun m!41043 () Bool)

(assert (=> b!46685 m!41043))

(assert (=> b!46632 d!9189))

(declare-fun d!9191 () Bool)

(declare-fun res!27225 () Bool)

(declare-fun e!29765 () Bool)

(assert (=> d!9191 (=> res!27225 e!29765)))

(assert (=> d!9191 (= res!27225 (and ((_ is Cons!1247) lt!20325) (= (_1!868 (h!1827 lt!20325)) key2!27)))))

(assert (=> d!9191 (= (containsKey!91 lt!20325 key2!27) e!29765)))

(declare-fun b!46686 () Bool)

(declare-fun e!29766 () Bool)

(assert (=> b!46686 (= e!29765 e!29766)))

(declare-fun res!27226 () Bool)

(assert (=> b!46686 (=> (not res!27226) (not e!29766))))

(assert (=> b!46686 (= res!27226 (and (or (not ((_ is Cons!1247) lt!20325)) (bvsle (_1!868 (h!1827 lt!20325)) key2!27)) ((_ is Cons!1247) lt!20325) (bvslt (_1!868 (h!1827 lt!20325)) key2!27)))))

(declare-fun b!46687 () Bool)

(assert (=> b!46687 (= e!29766 (containsKey!91 (t!4276 lt!20325) key2!27))))

(assert (= (and d!9191 (not res!27225)) b!46686))

(assert (= (and b!46686 res!27226) b!46687))

(declare-fun m!41047 () Bool)

(assert (=> b!46687 m!41047))

(assert (=> b!46556 d!9191))

(declare-fun d!9197 () Bool)

(assert (=> d!9197 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key1!43) (h!1827 (t!4276 l!812))) (Cons!1247 (h!1827 (t!4276 l!812)) (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key1!43)))))

(assert (=> b!46583 d!9197))

(declare-fun d!9199 () Bool)

(declare-fun e!29770 () Bool)

(assert (=> d!9199 e!29770))

(declare-fun res!27229 () Bool)

(assert (=> d!9199 (=> (not res!27229) (not e!29770))))

(declare-fun lt!20348 () List!1251)

(assert (=> d!9199 (= res!27229 (isStrictlySorted!242 lt!20348))))

(declare-fun e!29769 () List!1251)

(assert (=> d!9199 (= lt!20348 e!29769)))

(declare-fun c!6332 () Bool)

(assert (=> d!9199 (= c!6332 (and ((_ is Cons!1247) (t!4276 (t!4276 l!812))) (= (_1!868 (h!1827 (t!4276 (t!4276 l!812)))) key1!43)))))

(assert (=> d!9199 (isStrictlySorted!242 (t!4276 (t!4276 l!812)))))

(assert (=> d!9199 (= (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key1!43) lt!20348)))

(declare-fun b!46690 () Bool)

(assert (=> b!46690 (= e!29769 (t!4276 (t!4276 (t!4276 l!812))))))

(declare-fun b!46691 () Bool)

(assert (=> b!46691 (= e!29770 (not (containsKey!91 lt!20348 key1!43)))))

(declare-fun b!46692 () Bool)

(declare-fun e!29771 () List!1251)

(assert (=> b!46692 (= e!29771 Nil!1248)))

(declare-fun b!46693 () Bool)

(assert (=> b!46693 (= e!29771 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 (t!4276 l!812))) key1!43) (h!1827 (t!4276 (t!4276 l!812)))))))

(declare-fun b!46694 () Bool)

(assert (=> b!46694 (= e!29769 e!29771)))

(declare-fun c!6331 () Bool)

(assert (=> b!46694 (= c!6331 (and ((_ is Cons!1247) (t!4276 (t!4276 l!812))) (not (= (_1!868 (h!1827 (t!4276 (t!4276 l!812)))) key1!43))))))

(assert (= (and d!9199 c!6332) b!46690))

(assert (= (and d!9199 (not c!6332)) b!46694))

(assert (= (and b!46694 c!6331) b!46693))

(assert (= (and b!46694 (not c!6331)) b!46692))

(assert (= (and d!9199 res!27229) b!46691))

(declare-fun m!41049 () Bool)

(assert (=> d!9199 m!41049))

(assert (=> d!9199 m!40993))

(declare-fun m!41051 () Bool)

(assert (=> b!46691 m!41051))

(declare-fun m!41053 () Bool)

(assert (=> b!46693 m!41053))

(assert (=> b!46693 m!41053))

(declare-fun m!41055 () Bool)

(assert (=> b!46693 m!41055))

(assert (=> b!46583 d!9199))

(declare-fun d!9201 () Bool)

(declare-fun res!27230 () Bool)

(declare-fun e!29772 () Bool)

(assert (=> d!9201 (=> res!27230 e!29772)))

(assert (=> d!9201 (= res!27230 (or ((_ is Nil!1248) lt!20338) ((_ is Nil!1248) (t!4276 lt!20338))))))

(assert (=> d!9201 (= (isStrictlySorted!242 lt!20338) e!29772)))

(declare-fun b!46695 () Bool)

(declare-fun e!29773 () Bool)

(assert (=> b!46695 (= e!29772 e!29773)))

(declare-fun res!27231 () Bool)

(assert (=> b!46695 (=> (not res!27231) (not e!29773))))

(assert (=> b!46695 (= res!27231 (bvslt (_1!868 (h!1827 lt!20338)) (_1!868 (h!1827 (t!4276 lt!20338)))))))

(declare-fun b!46696 () Bool)

(assert (=> b!46696 (= e!29773 (isStrictlySorted!242 (t!4276 lt!20338)))))

(assert (= (and d!9201 (not res!27230)) b!46695))

(assert (= (and b!46695 res!27231) b!46696))

(declare-fun m!41057 () Bool)

(assert (=> b!46696 m!41057))

(assert (=> d!9135 d!9201))

(assert (=> d!9135 d!9151))

(declare-fun d!9203 () Bool)

(assert (=> d!9203 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 l!812) key1!43) (h!1827 l!812)) (Cons!1247 (h!1827 l!812) (removeStrictlySorted!43 (t!4276 l!812) key1!43)))))

(assert (=> b!46551 d!9203))

(assert (=> b!46551 d!9131))

(declare-fun d!9205 () Bool)

(assert (=> d!9205 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)) key1!43) (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) (Cons!1247 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key2!27)) (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)) key1!43)))))

(assert (=> b!46588 d!9205))

(declare-fun d!9207 () Bool)

(declare-fun e!29779 () Bool)

(assert (=> d!9207 e!29779))

(declare-fun res!27236 () Bool)

(assert (=> d!9207 (=> (not res!27236) (not e!29779))))

(declare-fun lt!20349 () List!1251)

(assert (=> d!9207 (= res!27236 (isStrictlySorted!242 lt!20349))))

(declare-fun e!29778 () List!1251)

(assert (=> d!9207 (= lt!20349 e!29778)))

(declare-fun c!6334 () Bool)

(assert (=> d!9207 (= c!6334 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)))) key1!43)))))

(assert (=> d!9207 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)))))

(assert (=> d!9207 (= (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)) key1!43) lt!20349)))

(declare-fun b!46701 () Bool)

(assert (=> b!46701 (= e!29778 (t!4276 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27))))))

(declare-fun b!46702 () Bool)

(assert (=> b!46702 (= e!29779 (not (containsKey!91 lt!20349 key1!43)))))

(declare-fun b!46703 () Bool)

(declare-fun e!29780 () List!1251)

(assert (=> b!46703 (= e!29780 Nil!1248)))

(declare-fun b!46704 () Bool)

(assert (=> b!46704 (= e!29780 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) key1!43) (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)))))))

(declare-fun b!46705 () Bool)

(assert (=> b!46705 (= e!29778 e!29780)))

(declare-fun c!6333 () Bool)

(assert (=> b!46705 (= c!6333 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27))) (not (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key2!27)))) key1!43))))))

(assert (= (and d!9207 c!6334) b!46701))

(assert (= (and d!9207 (not c!6334)) b!46705))

(assert (= (and b!46705 c!6333) b!46704))

(assert (= (and b!46705 (not c!6333)) b!46703))

(assert (= (and d!9207 res!27236) b!46702))

(declare-fun m!41059 () Bool)

(assert (=> d!9207 m!41059))

(assert (=> d!9207 m!41037))

(declare-fun m!41061 () Bool)

(assert (=> b!46702 m!41061))

(declare-fun m!41063 () Bool)

(assert (=> b!46704 m!41063))

(assert (=> b!46704 m!41063))

(declare-fun m!41065 () Bool)

(assert (=> b!46704 m!41065))

(assert (=> b!46588 d!9207))

(declare-fun d!9209 () Bool)

(assert (=> d!9209 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key1!43)) key2!27) (h!1827 (removeStrictlySorted!43 l!812 key1!43))) (Cons!1247 (h!1827 (removeStrictlySorted!43 l!812 key1!43)) (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key1!43)) key2!27)))))

(assert (=> b!46603 d!9209))

(declare-fun d!9211 () Bool)

(declare-fun e!29784 () Bool)

(assert (=> d!9211 e!29784))

(declare-fun res!27239 () Bool)

(assert (=> d!9211 (=> (not res!27239) (not e!29784))))

(declare-fun lt!20350 () List!1251)

(assert (=> d!9211 (= res!27239 (isStrictlySorted!242 lt!20350))))

(declare-fun e!29783 () List!1251)

(assert (=> d!9211 (= lt!20350 e!29783)))

(declare-fun c!6336 () Bool)

(assert (=> d!9211 (= c!6336 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 l!812 key1!43))) (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key1!43)))) key2!27)))))

(assert (=> d!9211 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 l!812 key1!43)))))

(assert (=> d!9211 (= (removeStrictlySorted!43 (t!4276 (removeStrictlySorted!43 l!812 key1!43)) key2!27) lt!20350)))

(declare-fun b!46708 () Bool)

(assert (=> b!46708 (= e!29783 (t!4276 (t!4276 (removeStrictlySorted!43 l!812 key1!43))))))

(declare-fun b!46709 () Bool)

(assert (=> b!46709 (= e!29784 (not (containsKey!91 lt!20350 key2!27)))))

(declare-fun b!46710 () Bool)

(declare-fun e!29785 () List!1251)

(assert (=> b!46710 (= e!29785 Nil!1248)))

(declare-fun b!46711 () Bool)

(assert (=> b!46711 (= e!29785 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 (removeStrictlySorted!43 l!812 key1!43))) key2!27) (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key1!43)))))))

(declare-fun b!46712 () Bool)

(assert (=> b!46712 (= e!29783 e!29785)))

(declare-fun c!6335 () Bool)

(assert (=> b!46712 (= c!6335 (and ((_ is Cons!1247) (t!4276 (removeStrictlySorted!43 l!812 key1!43))) (not (= (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 l!812 key1!43)))) key2!27))))))

(assert (= (and d!9211 c!6336) b!46708))

(assert (= (and d!9211 (not c!6336)) b!46712))

(assert (= (and b!46712 c!6335) b!46711))

(assert (= (and b!46712 (not c!6335)) b!46710))

(assert (= (and d!9211 res!27239) b!46709))

(declare-fun m!41069 () Bool)

(assert (=> d!9211 m!41069))

(assert (=> d!9211 m!41041))

(declare-fun m!41071 () Bool)

(assert (=> b!46709 m!41071))

(declare-fun m!41073 () Bool)

(assert (=> b!46711 m!41073))

(assert (=> b!46711 m!41073))

(declare-fun m!41075 () Bool)

(assert (=> b!46711 m!41075))

(assert (=> b!46603 d!9211))

(declare-fun d!9217 () Bool)

(declare-fun res!27241 () Bool)

(declare-fun e!29789 () Bool)

(assert (=> d!9217 (=> res!27241 e!29789)))

(assert (=> d!9217 (= res!27241 (or ((_ is Nil!1248) lt!20332) ((_ is Nil!1248) (t!4276 lt!20332))))))

(assert (=> d!9217 (= (isStrictlySorted!242 lt!20332) e!29789)))

(declare-fun b!46718 () Bool)

(declare-fun e!29790 () Bool)

(assert (=> b!46718 (= e!29789 e!29790)))

(declare-fun res!27242 () Bool)

(assert (=> b!46718 (=> (not res!27242) (not e!29790))))

(assert (=> b!46718 (= res!27242 (bvslt (_1!868 (h!1827 lt!20332)) (_1!868 (h!1827 (t!4276 lt!20332)))))))

(declare-fun b!46719 () Bool)

(assert (=> b!46719 (= e!29790 (isStrictlySorted!242 (t!4276 lt!20332)))))

(assert (= (and d!9217 (not res!27241)) b!46718))

(assert (= (and b!46718 res!27242) b!46719))

(declare-fun m!41083 () Bool)

(assert (=> b!46719 m!41083))

(assert (=> d!9129 d!9217))

(declare-fun d!9219 () Bool)

(declare-fun res!27243 () Bool)

(declare-fun e!29791 () Bool)

(assert (=> d!9219 (=> res!27243 e!29791)))

(assert (=> d!9219 (= res!27243 (or ((_ is Nil!1248) (removeStrictlySorted!43 (t!4276 l!812) key1!43)) ((_ is Nil!1248) (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43)))))))

(assert (=> d!9219 (= (isStrictlySorted!242 (removeStrictlySorted!43 (t!4276 l!812) key1!43)) e!29791)))

(declare-fun b!46720 () Bool)

(declare-fun e!29792 () Bool)

(assert (=> b!46720 (= e!29791 e!29792)))

(declare-fun res!27244 () Bool)

(assert (=> b!46720 (=> (not res!27244) (not e!29792))))

(assert (=> b!46720 (= res!27244 (bvslt (_1!868 (h!1827 (removeStrictlySorted!43 (t!4276 l!812) key1!43))) (_1!868 (h!1827 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43))))))))

(declare-fun b!46721 () Bool)

(assert (=> b!46721 (= e!29792 (isStrictlySorted!242 (t!4276 (removeStrictlySorted!43 (t!4276 l!812) key1!43))))))

(assert (= (and d!9219 (not res!27243)) b!46720))

(assert (= (and b!46720 res!27244) b!46721))

(assert (=> b!46721 m!41001))

(assert (=> d!9129 d!9219))

(declare-fun d!9223 () Bool)

(declare-fun res!27247 () Bool)

(declare-fun e!29795 () Bool)

(assert (=> d!9223 (=> res!27247 e!29795)))

(assert (=> d!9223 (= res!27247 (and ((_ is Cons!1247) lt!20338) (= (_1!868 (h!1827 lt!20338)) key2!27)))))

(assert (=> d!9223 (= (containsKey!91 lt!20338 key2!27) e!29795)))

(declare-fun b!46724 () Bool)

(declare-fun e!29796 () Bool)

(assert (=> b!46724 (= e!29795 e!29796)))

(declare-fun res!27248 () Bool)

(assert (=> b!46724 (=> (not res!27248) (not e!29796))))

(assert (=> b!46724 (= res!27248 (and (or (not ((_ is Cons!1247) lt!20338)) (bvsle (_1!868 (h!1827 lt!20338)) key2!27)) ((_ is Cons!1247) lt!20338) (bvslt (_1!868 (h!1827 lt!20338)) key2!27)))))

(declare-fun b!46725 () Bool)

(assert (=> b!46725 (= e!29796 (containsKey!91 (t!4276 lt!20338) key2!27))))

(assert (= (and d!9223 (not res!27247)) b!46724))

(assert (= (and b!46724 res!27248) b!46725))

(declare-fun m!41089 () Bool)

(assert (=> b!46725 m!41089))

(assert (=> b!46591 d!9223))

(declare-fun d!9229 () Bool)

(assert (=> d!9229 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 l!812) key2!27) (h!1827 l!812)) (Cons!1247 (h!1827 l!812) (removeStrictlySorted!43 (t!4276 l!812) key2!27)))))

(assert (=> b!46558 d!9229))

(assert (=> b!46558 d!9135))

(assert (=> b!46630 d!9151))

(declare-fun d!9231 () Bool)

(declare-fun res!27250 () Bool)

(declare-fun e!29800 () Bool)

(assert (=> d!9231 (=> res!27250 e!29800)))

(assert (=> d!9231 (= res!27250 (and ((_ is Cons!1247) lt!20336) (= (_1!868 (h!1827 lt!20336)) key1!43)))))

(assert (=> d!9231 (= (containsKey!91 lt!20336 key1!43) e!29800)))

(declare-fun b!46731 () Bool)

(declare-fun e!29801 () Bool)

(assert (=> b!46731 (= e!29800 e!29801)))

(declare-fun res!27251 () Bool)

(assert (=> b!46731 (=> (not res!27251) (not e!29801))))

(assert (=> b!46731 (= res!27251 (and (or (not ((_ is Cons!1247) lt!20336)) (bvsle (_1!868 (h!1827 lt!20336)) key1!43)) ((_ is Cons!1247) lt!20336) (bvslt (_1!868 (h!1827 lt!20336)) key1!43)))))

(declare-fun b!46732 () Bool)

(assert (=> b!46732 (= e!29801 (containsKey!91 (t!4276 lt!20336) key1!43))))

(assert (= (and d!9231 (not res!27250)) b!46731))

(assert (= (and b!46731 res!27251) b!46732))

(declare-fun m!41101 () Bool)

(assert (=> b!46732 m!41101))

(assert (=> b!46586 d!9231))

(declare-fun d!9235 () Bool)

(declare-fun res!27254 () Bool)

(declare-fun e!29804 () Bool)

(assert (=> d!9235 (=> res!27254 e!29804)))

(assert (=> d!9235 (= res!27254 (and ((_ is Cons!1247) lt!20340) (= (_1!868 (h!1827 lt!20340)) key2!27)))))

(assert (=> d!9235 (= (containsKey!91 lt!20340 key2!27) e!29804)))

(declare-fun b!46735 () Bool)

(declare-fun e!29805 () Bool)

(assert (=> b!46735 (= e!29804 e!29805)))

(declare-fun res!27255 () Bool)

(assert (=> b!46735 (=> (not res!27255) (not e!29805))))

(assert (=> b!46735 (= res!27255 (and (or (not ((_ is Cons!1247) lt!20340)) (bvsle (_1!868 (h!1827 lt!20340)) key2!27)) ((_ is Cons!1247) lt!20340) (bvslt (_1!868 (h!1827 lt!20340)) key2!27)))))

(declare-fun b!46736 () Bool)

(assert (=> b!46736 (= e!29805 (containsKey!91 (t!4276 lt!20340) key2!27))))

(assert (= (and d!9235 (not res!27254)) b!46735))

(assert (= (and b!46735 res!27255) b!46736))

(declare-fun m!41105 () Bool)

(assert (=> b!46736 m!41105))

(assert (=> b!46601 d!9235))

(assert (=> d!9121 d!9151))

(declare-fun d!9239 () Bool)

(assert (=> d!9239 (= (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key1!43) key2!27) (removeStrictlySorted!43 (removeStrictlySorted!43 (t!4276 l!812) key2!27) key1!43))))

(assert (=> d!9239 true))

(declare-fun _$6!53 () Unit!1323)

(assert (=> d!9239 (= (choose!278 (t!4276 l!812) key1!43 key2!27) _$6!53)))

(declare-fun bs!2186 () Bool)

(assert (= bs!2186 d!9239))

(assert (=> bs!2186 m!40741))

(assert (=> bs!2186 m!40741))

(assert (=> bs!2186 m!40743))

(assert (=> bs!2186 m!40735))

(assert (=> bs!2186 m!40735))

(assert (=> bs!2186 m!40747))

(assert (=> d!9121 d!9239))

(assert (=> d!9121 d!9135))

(assert (=> d!9121 d!9129))

(assert (=> d!9121 d!9131))

(assert (=> d!9121 d!9133))

(declare-fun d!9255 () Bool)

(declare-fun res!27272 () Bool)

(declare-fun e!29822 () Bool)

(assert (=> d!9255 (=> res!27272 e!29822)))

(assert (=> d!9255 (= res!27272 (or ((_ is Nil!1248) lt!20325) ((_ is Nil!1248) (t!4276 lt!20325))))))

(assert (=> d!9255 (= (isStrictlySorted!242 lt!20325) e!29822)))

(declare-fun b!46753 () Bool)

(declare-fun e!29823 () Bool)

(assert (=> b!46753 (= e!29822 e!29823)))

(declare-fun res!27273 () Bool)

(assert (=> b!46753 (=> (not res!27273) (not e!29823))))

(assert (=> b!46753 (= res!27273 (bvslt (_1!868 (h!1827 lt!20325)) (_1!868 (h!1827 (t!4276 lt!20325)))))))

(declare-fun b!46754 () Bool)

(assert (=> b!46754 (= e!29823 (isStrictlySorted!242 (t!4276 lt!20325)))))

(assert (= (and d!9255 (not res!27272)) b!46753))

(assert (= (and b!46753 res!27273) b!46754))

(declare-fun m!41121 () Bool)

(assert (=> b!46754 m!41121))

(assert (=> d!9119 d!9255))

(assert (=> d!9119 d!9143))

(declare-fun d!9261 () Bool)

(declare-fun res!27275 () Bool)

(declare-fun e!29827 () Bool)

(assert (=> d!9261 (=> res!27275 e!29827)))

(assert (=> d!9261 (= res!27275 (or ((_ is Nil!1248) lt!20324) ((_ is Nil!1248) (t!4276 lt!20324))))))

(assert (=> d!9261 (= (isStrictlySorted!242 lt!20324) e!29827)))

(declare-fun b!46760 () Bool)

(declare-fun e!29828 () Bool)

(assert (=> b!46760 (= e!29827 e!29828)))

(declare-fun res!27276 () Bool)

(assert (=> b!46760 (=> (not res!27276) (not e!29828))))

(assert (=> b!46760 (= res!27276 (bvslt (_1!868 (h!1827 lt!20324)) (_1!868 (h!1827 (t!4276 lt!20324)))))))

(declare-fun b!46761 () Bool)

(assert (=> b!46761 (= e!29828 (isStrictlySorted!242 (t!4276 lt!20324)))))

(assert (= (and d!9261 (not res!27275)) b!46760))

(assert (= (and b!46760 res!27276) b!46761))

(declare-fun m!41127 () Bool)

(assert (=> b!46761 m!41127))

(assert (=> d!9117 d!9261))

(assert (=> d!9117 d!9143))

(declare-fun d!9263 () Bool)

(declare-fun res!27277 () Bool)

(declare-fun e!29829 () Bool)

(assert (=> d!9263 (=> res!27277 e!29829)))

(assert (=> d!9263 (= res!27277 (or ((_ is Nil!1248) lt!20333) ((_ is Nil!1248) (t!4276 lt!20333))))))

(assert (=> d!9263 (= (isStrictlySorted!242 lt!20333) e!29829)))

(declare-fun b!46762 () Bool)

(declare-fun e!29830 () Bool)

(assert (=> b!46762 (= e!29829 e!29830)))

(declare-fun res!27278 () Bool)

(assert (=> b!46762 (=> (not res!27278) (not e!29830))))

(assert (=> b!46762 (= res!27278 (bvslt (_1!868 (h!1827 lt!20333)) (_1!868 (h!1827 (t!4276 lt!20333)))))))

(declare-fun b!46763 () Bool)

(assert (=> b!46763 (= e!29830 (isStrictlySorted!242 (t!4276 lt!20333)))))

(assert (= (and d!9263 (not res!27277)) b!46762))

(assert (= (and b!46762 res!27278) b!46763))

(declare-fun m!41137 () Bool)

(assert (=> b!46763 m!41137))

(assert (=> d!9131 d!9263))

(assert (=> d!9131 d!9151))

(declare-fun d!9269 () Bool)

(assert (=> d!9269 (= ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key2!27) (h!1827 (t!4276 l!812))) (Cons!1247 (h!1827 (t!4276 l!812)) (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key2!27)))))

(assert (=> b!46593 d!9269))

(declare-fun d!9273 () Bool)

(declare-fun e!29838 () Bool)

(assert (=> d!9273 e!29838))

(declare-fun res!27285 () Bool)

(assert (=> d!9273 (=> (not res!27285) (not e!29838))))

(declare-fun lt!20354 () List!1251)

(assert (=> d!9273 (= res!27285 (isStrictlySorted!242 lt!20354))))

(declare-fun e!29837 () List!1251)

(assert (=> d!9273 (= lt!20354 e!29837)))

(declare-fun c!6344 () Bool)

(assert (=> d!9273 (= c!6344 (and ((_ is Cons!1247) (t!4276 (t!4276 l!812))) (= (_1!868 (h!1827 (t!4276 (t!4276 l!812)))) key2!27)))))

(assert (=> d!9273 (isStrictlySorted!242 (t!4276 (t!4276 l!812)))))

(assert (=> d!9273 (= (removeStrictlySorted!43 (t!4276 (t!4276 l!812)) key2!27) lt!20354)))

(declare-fun b!46770 () Bool)

(assert (=> b!46770 (= e!29837 (t!4276 (t!4276 (t!4276 l!812))))))

(declare-fun b!46771 () Bool)

(assert (=> b!46771 (= e!29838 (not (containsKey!91 lt!20354 key2!27)))))

(declare-fun b!46772 () Bool)

(declare-fun e!29839 () List!1251)

(assert (=> b!46772 (= e!29839 Nil!1248)))

(declare-fun b!46773 () Bool)

(assert (=> b!46773 (= e!29839 ($colon$colon!45 (removeStrictlySorted!43 (t!4276 (t!4276 (t!4276 l!812))) key2!27) (h!1827 (t!4276 (t!4276 l!812)))))))

(declare-fun b!46774 () Bool)

(assert (=> b!46774 (= e!29837 e!29839)))

(declare-fun c!6343 () Bool)

(assert (=> b!46774 (= c!6343 (and ((_ is Cons!1247) (t!4276 (t!4276 l!812))) (not (= (_1!868 (h!1827 (t!4276 (t!4276 l!812)))) key2!27))))))

(assert (= (and d!9273 c!6344) b!46770))

(assert (= (and d!9273 (not c!6344)) b!46774))

(assert (= (and b!46774 c!6343) b!46773))

(assert (= (and b!46774 (not c!6343)) b!46772))

(assert (= (and d!9273 res!27285) b!46771))

(declare-fun m!41143 () Bool)

(assert (=> d!9273 m!41143))

(assert (=> d!9273 m!40993))

(declare-fun m!41145 () Bool)

(assert (=> b!46771 m!41145))

(declare-fun m!41147 () Bool)

(assert (=> b!46773 m!41147))

(assert (=> b!46773 m!41147))

(declare-fun m!41149 () Bool)

(assert (=> b!46773 m!41149))

(assert (=> b!46593 d!9273))

(declare-fun b!46782 () Bool)

(declare-fun e!29845 () Bool)

(declare-fun tp!6153 () Bool)

(assert (=> b!46782 (= e!29845 (and tp_is_empty!1989 tp!6153))))

(assert (=> b!46643 (= tp!6151 e!29845)))

(assert (= (and b!46643 ((_ is Cons!1247) (t!4276 (t!4276 l!812)))) b!46782))

(check-sat (not b!46721) (not d!9161) (not b!46754) tp_is_empty!1989 (not b!46704) (not b!46675) (not b!46771) (not d!9165) (not b!46652) (not b!46655) (not b!46782) (not d!9239) (not b!46679) (not b!46763) (not d!9207) (not b!46666) (not b!46709) (not d!9199) (not b!46696) (not b!46773) (not b!46711) (not d!9211) (not b!46761) (not b!46673) (not b!46693) (not b!46681) (not b!46691) (not b!46683) (not b!46646) (not d!9273) (not b!46677) (not b!46736) (not b!46685) (not b!46650) (not b!46657) (not b!46732) (not b!46725) (not b!46719) (not b!46687) (not b!46648) (not b!46664) (not b!46702))
(check-sat)
