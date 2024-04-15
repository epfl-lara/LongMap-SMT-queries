; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106236 () Bool)

(assert start!106236)

(declare-fun res!842112 () Bool)

(declare-fun e!720074 () Bool)

(assert (=> start!106236 (=> (not res!842112) (not e!720074))))

(declare-datatypes ((B!1916 0))(
  ( (B!1917 (val!16293 Int)) )
))
(declare-datatypes ((tuple2!21186 0))(
  ( (tuple2!21187 (_1!10604 (_ BitVec 64)) (_2!10604 B!1916)) )
))
(declare-datatypes ((List!28369 0))(
  ( (Nil!28366) (Cons!28365 (h!29574 tuple2!21186) (t!41881 List!28369)) )
))
(declare-datatypes ((ListLongMap!19059 0))(
  ( (ListLongMap!19060 (toList!9545 List!28369)) )
))
(declare-fun lm!212 () ListLongMap!19059)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7594 (ListLongMap!19059 (_ BitVec 64)) Bool)

(assert (=> start!106236 (= res!842112 (not (contains!7594 lm!212 a1!67)))))

(assert (=> start!106236 e!720074))

(declare-fun e!720073 () Bool)

(declare-fun inv!44080 (ListLongMap!19059) Bool)

(assert (=> start!106236 (and (inv!44080 lm!212) e!720073)))

(assert (=> start!106236 true))

(declare-fun b!1264501 () Bool)

(declare-fun res!842111 () Bool)

(assert (=> b!1264501 (=> (not res!842111) (not e!720074))))

(declare-fun isStrictlySorted!768 (List!28369) Bool)

(assert (=> b!1264501 (= res!842111 (isStrictlySorted!768 (toList!9545 lm!212)))))

(declare-fun b!1264502 () Bool)

(declare-fun containsKey!629 (List!28369 (_ BitVec 64)) Bool)

(assert (=> b!1264502 (= e!720074 (containsKey!629 (toList!9545 lm!212) a1!67))))

(declare-fun b!1264503 () Bool)

(declare-fun tp!96221 () Bool)

(assert (=> b!1264503 (= e!720073 tp!96221)))

(assert (= (and start!106236 res!842112) b!1264501))

(assert (= (and b!1264501 res!842111) b!1264502))

(assert (= start!106236 b!1264503))

(declare-fun m!1164599 () Bool)

(assert (=> start!106236 m!1164599))

(declare-fun m!1164601 () Bool)

(assert (=> start!106236 m!1164601))

(declare-fun m!1164603 () Bool)

(assert (=> b!1264501 m!1164603))

(declare-fun m!1164605 () Bool)

(assert (=> b!1264502 m!1164605))

(check-sat (not start!106236) (not b!1264501) (not b!1264502) (not b!1264503))
(check-sat)
(get-model)

(declare-fun d!138621 () Bool)

(declare-fun e!720100 () Bool)

(assert (=> d!138621 e!720100))

(declare-fun res!842132 () Bool)

(assert (=> d!138621 (=> res!842132 e!720100)))

(declare-fun lt!573693 () Bool)

(assert (=> d!138621 (= res!842132 (not lt!573693))))

(declare-fun lt!573687 () Bool)

(assert (=> d!138621 (= lt!573693 lt!573687)))

(declare-datatypes ((Unit!42003 0))(
  ( (Unit!42004) )
))
(declare-fun lt!573688 () Unit!42003)

(declare-fun e!720101 () Unit!42003)

(assert (=> d!138621 (= lt!573688 e!720101)))

(declare-fun c!123134 () Bool)

(assert (=> d!138621 (= c!123134 lt!573687)))

(assert (=> d!138621 (= lt!573687 (containsKey!629 (toList!9545 lm!212) a1!67))))

(assert (=> d!138621 (= (contains!7594 lm!212 a1!67) lt!573693)))

(declare-fun b!1264541 () Bool)

(declare-fun lt!573691 () Unit!42003)

(assert (=> b!1264541 (= e!720101 lt!573691)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!439 (List!28369 (_ BitVec 64)) Unit!42003)

(assert (=> b!1264541 (= lt!573691 (lemmaContainsKeyImpliesGetValueByKeyDefined!439 (toList!9545 lm!212) a1!67))))

(declare-datatypes ((Option!726 0))(
  ( (Some!725 (v!19000 B!1916)) (None!724) )
))
(declare-fun isDefined!482 (Option!726) Bool)

(declare-fun getValueByKey!675 (List!28369 (_ BitVec 64)) Option!726)

(assert (=> b!1264541 (isDefined!482 (getValueByKey!675 (toList!9545 lm!212) a1!67))))

(declare-fun b!1264543 () Bool)

(declare-fun Unit!42009 () Unit!42003)

(assert (=> b!1264543 (= e!720101 Unit!42009)))

(declare-fun b!1264545 () Bool)

(assert (=> b!1264545 (= e!720100 (isDefined!482 (getValueByKey!675 (toList!9545 lm!212) a1!67)))))

(assert (= (and d!138621 c!123134) b!1264541))

(assert (= (and d!138621 (not c!123134)) b!1264543))

(assert (= (and d!138621 (not res!842132)) b!1264545))

(assert (=> d!138621 m!1164605))

(declare-fun m!1164624 () Bool)

(assert (=> b!1264541 m!1164624))

(declare-fun m!1164627 () Bool)

(assert (=> b!1264541 m!1164627))

(assert (=> b!1264541 m!1164627))

(declare-fun m!1164631 () Bool)

(assert (=> b!1264541 m!1164631))

(assert (=> b!1264545 m!1164627))

(assert (=> b!1264545 m!1164627))

(assert (=> b!1264545 m!1164631))

(assert (=> start!106236 d!138621))

(declare-fun d!138627 () Bool)

(assert (=> d!138627 (= (inv!44080 lm!212) (isStrictlySorted!768 (toList!9545 lm!212)))))

(declare-fun bs!35752 () Bool)

(assert (= bs!35752 d!138627))

(assert (=> bs!35752 m!1164603))

(assert (=> start!106236 d!138627))

(declare-fun d!138633 () Bool)

(declare-fun res!842148 () Bool)

(declare-fun e!720119 () Bool)

(assert (=> d!138633 (=> res!842148 e!720119)))

(get-info :version)

(assert (=> d!138633 (= res!842148 (or ((_ is Nil!28366) (toList!9545 lm!212)) ((_ is Nil!28366) (t!41881 (toList!9545 lm!212)))))))

(assert (=> d!138633 (= (isStrictlySorted!768 (toList!9545 lm!212)) e!720119)))

(declare-fun b!1264563 () Bool)

(declare-fun e!720120 () Bool)

(assert (=> b!1264563 (= e!720119 e!720120)))

(declare-fun res!842149 () Bool)

(assert (=> b!1264563 (=> (not res!842149) (not e!720120))))

(assert (=> b!1264563 (= res!842149 (bvslt (_1!10604 (h!29574 (toList!9545 lm!212))) (_1!10604 (h!29574 (t!41881 (toList!9545 lm!212))))))))

(declare-fun b!1264564 () Bool)

(assert (=> b!1264564 (= e!720120 (isStrictlySorted!768 (t!41881 (toList!9545 lm!212))))))

(assert (= (and d!138633 (not res!842148)) b!1264563))

(assert (= (and b!1264563 res!842149) b!1264564))

(declare-fun m!1164643 () Bool)

(assert (=> b!1264564 m!1164643))

(assert (=> b!1264501 d!138633))

(declare-fun d!138641 () Bool)

(declare-fun res!842166 () Bool)

(declare-fun e!720137 () Bool)

(assert (=> d!138641 (=> res!842166 e!720137)))

(assert (=> d!138641 (= res!842166 (and ((_ is Cons!28365) (toList!9545 lm!212)) (= (_1!10604 (h!29574 (toList!9545 lm!212))) a1!67)))))

(assert (=> d!138641 (= (containsKey!629 (toList!9545 lm!212) a1!67) e!720137)))

(declare-fun b!1264581 () Bool)

(declare-fun e!720138 () Bool)

(assert (=> b!1264581 (= e!720137 e!720138)))

(declare-fun res!842167 () Bool)

(assert (=> b!1264581 (=> (not res!842167) (not e!720138))))

(assert (=> b!1264581 (= res!842167 (and (or (not ((_ is Cons!28365) (toList!9545 lm!212))) (bvsle (_1!10604 (h!29574 (toList!9545 lm!212))) a1!67)) ((_ is Cons!28365) (toList!9545 lm!212)) (bvslt (_1!10604 (h!29574 (toList!9545 lm!212))) a1!67)))))

(declare-fun b!1264582 () Bool)

(assert (=> b!1264582 (= e!720138 (containsKey!629 (t!41881 (toList!9545 lm!212)) a1!67))))

(assert (= (and d!138641 (not res!842166)) b!1264581))

(assert (= (and b!1264581 res!842167) b!1264582))

(declare-fun m!1164649 () Bool)

(assert (=> b!1264582 m!1164649))

(assert (=> b!1264502 d!138641))

(declare-fun b!1264597 () Bool)

(declare-fun e!720147 () Bool)

(declare-fun tp_is_empty!32451 () Bool)

(declare-fun tp!96234 () Bool)

(assert (=> b!1264597 (= e!720147 (and tp_is_empty!32451 tp!96234))))

(assert (=> b!1264503 (= tp!96221 e!720147)))

(assert (= (and b!1264503 ((_ is Cons!28365) (toList!9545 lm!212))) b!1264597))

(check-sat (not b!1264541) (not b!1264582) (not d!138621) (not b!1264564) tp_is_empty!32451 (not d!138627) (not b!1264597) (not b!1264545))
(check-sat)
