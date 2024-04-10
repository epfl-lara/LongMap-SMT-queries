; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75154 () Bool)

(assert start!75154)

(declare-fun res!601471 () Bool)

(declare-fun e!492986 () Bool)

(assert (=> start!75154 (=> (not res!601471) (not e!492986))))

(declare-datatypes ((B!1280 0))(
  ( (B!1281 (val!8946 Int)) )
))
(declare-datatypes ((tuple2!11886 0))(
  ( (tuple2!11887 (_1!5954 (_ BitVec 64)) (_2!5954 B!1280)) )
))
(declare-datatypes ((List!17662 0))(
  ( (Nil!17659) (Cons!17658 (h!18789 tuple2!11886) (t!24939 List!17662)) )
))
(declare-fun l!906 () List!17662)

(declare-fun isStrictlySorted!480 (List!17662) Bool)

(assert (=> start!75154 (= res!601471 (isStrictlySorted!480 l!906))))

(assert (=> start!75154 e!492986))

(declare-fun e!492987 () Bool)

(assert (=> start!75154 e!492987))

(declare-fun b!885768 () Bool)

(declare-fun ListPrimitiveSize!85 (List!17662) Int)

(assert (=> b!885768 (= e!492986 (< (ListPrimitiveSize!85 l!906) 0))))

(declare-fun b!885769 () Bool)

(declare-fun tp_is_empty!17791 () Bool)

(declare-fun tp!54311 () Bool)

(assert (=> b!885769 (= e!492987 (and tp_is_empty!17791 tp!54311))))

(assert (= (and start!75154 res!601471) b!885768))

(assert (= (and start!75154 (is-Cons!17658 l!906)) b!885769))

(declare-fun m!825841 () Bool)

(assert (=> start!75154 m!825841))

(declare-fun m!825843 () Bool)

(assert (=> b!885768 m!825843))

(push 1)

(assert (not b!885768))

(assert (not start!75154))

(assert (not b!885769))

(assert tp_is_empty!17791)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109447 () Bool)

(declare-fun lt!401053 () Int)

(assert (=> d!109447 (>= lt!401053 0)))

(declare-fun e!493008 () Int)

(assert (=> d!109447 (= lt!401053 e!493008)))

(declare-fun c!93362 () Bool)

(assert (=> d!109447 (= c!93362 (is-Nil!17659 l!906))))

(assert (=> d!109447 (= (ListPrimitiveSize!85 l!906) lt!401053)))

(declare-fun b!885798 () Bool)

(assert (=> b!885798 (= e!493008 0)))

(declare-fun b!885799 () Bool)

(assert (=> b!885799 (= e!493008 (+ 1 (ListPrimitiveSize!85 (t!24939 l!906))))))

(assert (= (and d!109447 c!93362) b!885798))

(assert (= (and d!109447 (not c!93362)) b!885799))

(declare-fun m!825857 () Bool)

(assert (=> b!885799 m!825857))

(assert (=> b!885768 d!109447))

(declare-fun d!109453 () Bool)

(declare-fun res!601494 () Bool)

(declare-fun e!493027 () Bool)

(assert (=> d!109453 (=> res!601494 e!493027)))

(assert (=> d!109453 (= res!601494 (or (is-Nil!17659 l!906) (is-Nil!17659 (t!24939 l!906))))))

(assert (=> d!109453 (= (isStrictlySorted!480 l!906) e!493027)))

(declare-fun b!885820 () Bool)

(declare-fun e!493028 () Bool)

(assert (=> b!885820 (= e!493027 e!493028)))

(declare-fun res!601495 () Bool)

(assert (=> b!885820 (=> (not res!601495) (not e!493028))))

(assert (=> b!885820 (= res!601495 (bvslt (_1!5954 (h!18789 l!906)) (_1!5954 (h!18789 (t!24939 l!906)))))))

(declare-fun b!885821 () Bool)

(assert (=> b!885821 (= e!493028 (isStrictlySorted!480 (t!24939 l!906)))))

(assert (= (and d!109453 (not res!601494)) b!885820))

(assert (= (and b!885820 res!601495) b!885821))

(declare-fun m!825863 () Bool)

(assert (=> b!885821 m!825863))

(assert (=> start!75154 d!109453))

(declare-fun b!885832 () Bool)

(declare-fun e!493035 () Bool)

(declare-fun tp!54326 () Bool)

(assert (=> b!885832 (= e!493035 (and tp_is_empty!17791 tp!54326))))

(assert (=> b!885769 (= tp!54311 e!493035)))

(assert (= (and b!885769 (is-Cons!17658 (t!24939 l!906))) b!885832))

(push 1)

