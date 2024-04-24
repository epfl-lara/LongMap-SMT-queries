; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106442 () Bool)

(assert start!106442)

(declare-fun res!842636 () Bool)

(declare-fun e!720908 () Bool)

(assert (=> start!106442 (=> (not res!842636) (not e!720908))))

(declare-datatypes ((B!1912 0))(
  ( (B!1913 (val!16291 Int)) )
))
(declare-datatypes ((tuple2!21110 0))(
  ( (tuple2!21111 (_1!10566 (_ BitVec 64)) (_2!10566 B!1912)) )
))
(declare-datatypes ((List!28319 0))(
  ( (Nil!28316) (Cons!28315 (h!29533 tuple2!21110) (t!41832 List!28319)) )
))
(declare-datatypes ((ListLongMap!18991 0))(
  ( (ListLongMap!18992 (toList!9511 List!28319)) )
))
(declare-fun lm!212 () ListLongMap!18991)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7648 (ListLongMap!18991 (_ BitVec 64)) Bool)

(assert (=> start!106442 (= res!842636 (not (contains!7648 lm!212 a1!67)))))

(assert (=> start!106442 e!720908))

(declare-fun e!720909 () Bool)

(declare-fun inv!44073 (ListLongMap!18991) Bool)

(assert (=> start!106442 (and (inv!44073 lm!212) e!720909)))

(assert (=> start!106442 true))

(declare-fun b!1265814 () Bool)

(declare-fun isStrictlySorted!758 (List!28319) Bool)

(assert (=> b!1265814 (= e!720908 (not (isStrictlySorted!758 (toList!9511 lm!212))))))

(declare-fun b!1265815 () Bool)

(declare-fun tp!96206 () Bool)

(assert (=> b!1265815 (= e!720909 tp!96206)))

(assert (= (and start!106442 res!842636) b!1265814))

(assert (= start!106442 b!1265815))

(declare-fun m!1166689 () Bool)

(assert (=> start!106442 m!1166689))

(declare-fun m!1166691 () Bool)

(assert (=> start!106442 m!1166691))

(declare-fun m!1166693 () Bool)

(assert (=> b!1265814 m!1166693))

(push 1)

(assert (not start!106442))

(assert (not b!1265814))

(assert (not b!1265815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139181 () Bool)

(declare-fun e!720927 () Bool)

(assert (=> d!139181 e!720927))

(declare-fun res!842648 () Bool)

(assert (=> d!139181 (=> res!842648 e!720927)))

(declare-fun lt!574297 () Bool)

(assert (=> d!139181 (= res!842648 (not lt!574297))))

(declare-fun lt!574298 () Bool)

(assert (=> d!139181 (= lt!574297 lt!574298)))

(declare-datatypes ((Unit!42118 0))(
  ( (Unit!42119) )
))
(declare-fun lt!574300 () Unit!42118)

(declare-fun e!720926 () Unit!42118)

(assert (=> d!139181 (= lt!574300 e!720926)))

(declare-fun c!123539 () Bool)

(assert (=> d!139181 (= c!123539 lt!574298)))

(declare-fun containsKey!628 (List!28319 (_ BitVec 64)) Bool)

(assert (=> d!139181 (= lt!574298 (containsKey!628 (toList!9511 lm!212) a1!67))))

(assert (=> d!139181 (= (contains!7648 lm!212 a1!67) lt!574297)))

(declare-fun b!1265834 () Bool)

(declare-fun lt!574299 () Unit!42118)

(assert (=> b!1265834 (= e!720926 lt!574299)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!437 (List!28319 (_ BitVec 64)) Unit!42118)

(assert (=> b!1265834 (= lt!574299 (lemmaContainsKeyImpliesGetValueByKeyDefined!437 (toList!9511 lm!212) a1!67))))

(declare-datatypes ((Option!717 0))(
  ( (Some!716 (v!18994 B!1912)) (None!715) )
))
(declare-fun isDefined!475 (Option!717) Bool)

(declare-fun getValueByKey!666 (List!28319 (_ BitVec 64)) Option!717)

(assert (=> b!1265834 (isDefined!475 (getValueByKey!666 (toList!9511 lm!212) a1!67))))

(declare-fun b!1265835 () Bool)

(declare-fun Unit!42120 () Unit!42118)

(assert (=> b!1265835 (= e!720926 Unit!42120)))

(declare-fun b!1265836 () Bool)

(assert (=> b!1265836 (= e!720927 (isDefined!475 (getValueByKey!666 (toList!9511 lm!212) a1!67)))))

(assert (= (and d!139181 c!123539) b!1265834))

(assert (= (and d!139181 (not c!123539)) b!1265835))

(assert (= (and d!139181 (not res!842648)) b!1265836))

(declare-fun m!1166703 () Bool)

(assert (=> d!139181 m!1166703))

(declare-fun m!1166705 () Bool)

(assert (=> b!1265834 m!1166705))

(declare-fun m!1166707 () Bool)

(assert (=> b!1265834 m!1166707))

(assert (=> b!1265834 m!1166707))

(declare-fun m!1166709 () Bool)

(assert (=> b!1265834 m!1166709))

(assert (=> b!1265836 m!1166707))

(assert (=> b!1265836 m!1166707))

(assert (=> b!1265836 m!1166709))

(assert (=> start!106442 d!139181))

(declare-fun d!139189 () Bool)

(assert (=> d!139189 (= (inv!44073 lm!212) (isStrictlySorted!758 (toList!9511 lm!212)))))

(declare-fun bs!35790 () Bool)

(assert (= bs!35790 d!139189))

(assert (=> bs!35790 m!1166693))

(assert (=> start!106442 d!139189))

(declare-fun d!139191 () Bool)

(declare-fun res!842655 () Bool)

(declare-fun e!720936 () Bool)

(assert (=> d!139191 (=> res!842655 e!720936)))

(assert (=> d!139191 (= res!842655 (or (is-Nil!28316 (toList!9511 lm!212)) (is-Nil!28316 (t!41832 (toList!9511 lm!212)))))))

(assert (=> d!139191 (= (isStrictlySorted!758 (toList!9511 lm!212)) e!720936)))

(declare-fun b!1265847 () Bool)

(declare-fun e!720937 () Bool)

(assert (=> b!1265847 (= e!720936 e!720937)))

(declare-fun res!842656 () Bool)

(assert (=> b!1265847 (=> (not res!842656) (not e!720937))))

(assert (=> b!1265847 (= res!842656 (bvslt (_1!10566 (h!29533 (toList!9511 lm!212))) (_1!10566 (h!29533 (t!41832 (toList!9511 lm!212))))))))

(declare-fun b!1265848 () Bool)

(assert (=> b!1265848 (= e!720937 (isStrictlySorted!758 (t!41832 (toList!9511 lm!212))))))

(assert (= (and d!139191 (not res!842655)) b!1265847))

(assert (= (and b!1265847 res!842656) b!1265848))

(declare-fun m!1166711 () Bool)

(assert (=> b!1265848 m!1166711))

(assert (=> b!1265814 d!139191))

(declare-fun b!1265856 () Bool)

(declare-fun e!720942 () Bool)

(declare-fun tp_is_empty!32443 () Bool)

(declare-fun tp!96212 () Bool)

(assert (=> b!1265856 (= e!720942 (and tp_is_empty!32443 tp!96212))))

(assert (=> b!1265815 (= tp!96206 e!720942)))

(assert (= (and b!1265815 (is-Cons!28315 (toList!9511 lm!212))) b!1265856))

(push 1)

(assert (not b!1265856))

(assert (not d!139181))

(assert tp_is_empty!32443)

(assert (not d!139189))

(assert (not b!1265848))

(assert (not b!1265836))

(assert (not b!1265834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

