; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43790 () Bool)

(assert start!43790)

(declare-fun res!288368 () Bool)

(declare-fun e!284871 () Bool)

(assert (=> start!43790 (=> (not res!288368) (not e!284871))))

(declare-datatypes ((B!1120 0))(
  ( (B!1121 (val!7012 Int)) )
))
(declare-datatypes ((tuple2!9226 0))(
  ( (tuple2!9227 (_1!4624 (_ BitVec 64)) (_2!4624 B!1120)) )
))
(declare-datatypes ((List!9276 0))(
  ( (Nil!9273) (Cons!9272 (h!10128 tuple2!9226) (t!15498 List!9276)) )
))
(declare-fun l!956 () List!9276)

(declare-fun isStrictlySorted!415 (List!9276) Bool)

(assert (=> start!43790 (= res!288368 (isStrictlySorted!415 l!956))))

(assert (=> start!43790 e!284871))

(declare-fun e!284870 () Bool)

(assert (=> start!43790 e!284870))

(assert (=> start!43790 true))

(declare-fun b!483981 () Bool)

(declare-fun res!288367 () Bool)

(assert (=> b!483981 (=> (not res!288367) (not e!284871))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!378 (List!9276 (_ BitVec 64)) Bool)

(assert (=> b!483981 (= res!288367 (not (containsKey!378 l!956 key!251)))))

(declare-fun b!483982 () Bool)

(declare-fun ListPrimitiveSize!62 (List!9276) Int)

(assert (=> b!483982 (= e!284871 (< (ListPrimitiveSize!62 l!956) 0))))

(declare-fun b!483983 () Bool)

(declare-fun tp_is_empty!13929 () Bool)

(declare-fun tp!43483 () Bool)

(assert (=> b!483983 (= e!284870 (and tp_is_empty!13929 tp!43483))))

(assert (= (and start!43790 res!288368) b!483981))

(assert (= (and b!483981 res!288367) b!483982))

(get-info :version)

(assert (= (and start!43790 ((_ is Cons!9272) l!956)) b!483983))

(declare-fun m!464847 () Bool)

(assert (=> start!43790 m!464847))

(declare-fun m!464849 () Bool)

(assert (=> b!483981 m!464849))

(declare-fun m!464851 () Bool)

(assert (=> b!483982 m!464851))

(check-sat tp_is_empty!13929 (not b!483982) (not start!43790) (not b!483981) (not b!483983))
(check-sat)
(get-model)

(declare-fun d!77025 () Bool)

(declare-fun res!288387 () Bool)

(declare-fun e!284890 () Bool)

(assert (=> d!77025 (=> res!288387 e!284890)))

(assert (=> d!77025 (= res!288387 (or ((_ is Nil!9273) l!956) ((_ is Nil!9273) (t!15498 l!956))))))

(assert (=> d!77025 (= (isStrictlySorted!415 l!956) e!284890)))

(declare-fun b!484005 () Bool)

(declare-fun e!284891 () Bool)

(assert (=> b!484005 (= e!284890 e!284891)))

(declare-fun res!288388 () Bool)

(assert (=> b!484005 (=> (not res!288388) (not e!284891))))

(assert (=> b!484005 (= res!288388 (bvslt (_1!4624 (h!10128 l!956)) (_1!4624 (h!10128 (t!15498 l!956)))))))

(declare-fun b!484006 () Bool)

(assert (=> b!484006 (= e!284891 (isStrictlySorted!415 (t!15498 l!956)))))

(assert (= (and d!77025 (not res!288387)) b!484005))

(assert (= (and b!484005 res!288388) b!484006))

(declare-fun m!464859 () Bool)

(assert (=> b!484006 m!464859))

(assert (=> start!43790 d!77025))

(declare-fun d!77031 () Bool)

(declare-fun lt!219334 () Int)

(assert (=> d!77031 (>= lt!219334 0)))

(declare-fun e!284906 () Int)

(assert (=> d!77031 (= lt!219334 e!284906)))

(declare-fun c!58166 () Bool)

(assert (=> d!77031 (= c!58166 ((_ is Nil!9273) l!956))))

(assert (=> d!77031 (= (ListPrimitiveSize!62 l!956) lt!219334)))

(declare-fun b!484021 () Bool)

(assert (=> b!484021 (= e!284906 0)))

(declare-fun b!484022 () Bool)

(assert (=> b!484022 (= e!284906 (+ 1 (ListPrimitiveSize!62 (t!15498 l!956))))))

(assert (= (and d!77031 c!58166) b!484021))

(assert (= (and d!77031 (not c!58166)) b!484022))

(declare-fun m!464865 () Bool)

(assert (=> b!484022 m!464865))

(assert (=> b!483982 d!77031))

(declare-fun d!77037 () Bool)

(declare-fun res!288409 () Bool)

(declare-fun e!284919 () Bool)

(assert (=> d!77037 (=> res!288409 e!284919)))

(assert (=> d!77037 (= res!288409 (and ((_ is Cons!9272) l!956) (= (_1!4624 (h!10128 l!956)) key!251)))))

(assert (=> d!77037 (= (containsKey!378 l!956 key!251) e!284919)))

(declare-fun b!484041 () Bool)

(declare-fun e!284920 () Bool)

(assert (=> b!484041 (= e!284919 e!284920)))

(declare-fun res!288410 () Bool)

(assert (=> b!484041 (=> (not res!288410) (not e!284920))))

(assert (=> b!484041 (= res!288410 (and (or (not ((_ is Cons!9272) l!956)) (bvsle (_1!4624 (h!10128 l!956)) key!251)) ((_ is Cons!9272) l!956) (bvslt (_1!4624 (h!10128 l!956)) key!251)))))

(declare-fun b!484042 () Bool)

(assert (=> b!484042 (= e!284920 (containsKey!378 (t!15498 l!956) key!251))))

(assert (= (and d!77037 (not res!288409)) b!484041))

(assert (= (and b!484041 res!288410) b!484042))

(declare-fun m!464873 () Bool)

(assert (=> b!484042 m!464873))

(assert (=> b!483981 d!77037))

(declare-fun b!484060 () Bool)

(declare-fun e!284930 () Bool)

(declare-fun tp!43494 () Bool)

(assert (=> b!484060 (= e!284930 (and tp_is_empty!13929 tp!43494))))

(assert (=> b!483983 (= tp!43483 e!284930)))

(assert (= (and b!483983 ((_ is Cons!9272) (t!15498 l!956))) b!484060))

(check-sat tp_is_empty!13929 (not b!484022) (not b!484060) (not b!484042) (not b!484006))
(check-sat)
