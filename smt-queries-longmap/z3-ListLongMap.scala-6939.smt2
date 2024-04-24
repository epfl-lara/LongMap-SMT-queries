; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87598 () Bool)

(assert start!87598)

(declare-fun res!680507 () Bool)

(declare-fun e!570347 () Bool)

(assert (=> start!87598 (=> (not res!680507) (not e!570347))))

(declare-datatypes ((B!1340 0))(
  ( (B!1341 (val!11754 Int)) )
))
(declare-datatypes ((tuple2!15058 0))(
  ( (tuple2!15059 (_1!7540 (_ BitVec 64)) (_2!7540 B!1340)) )
))
(declare-datatypes ((List!21347 0))(
  ( (Nil!21344) (Cons!21343 (h!22550 tuple2!15058) (t!30340 List!21347)) )
))
(declare-fun l!412 () List!21347)

(declare-fun isStrictlySorted!522 (List!21347) Bool)

(assert (=> start!87598 (= res!680507 (isStrictlySorted!522 l!412))))

(assert (=> start!87598 e!570347))

(declare-fun e!570348 () Bool)

(assert (=> start!87598 e!570348))

(declare-fun tp_is_empty!23407 () Bool)

(assert (=> start!87598 tp_is_empty!23407))

(declare-fun b!1013705 () Bool)

(declare-fun res!680506 () Bool)

(assert (=> b!1013705 (=> (not res!680506) (not e!570347))))

(declare-fun value!115 () B!1340)

(get-info :version)

(assert (=> b!1013705 (= res!680506 (and (not (= (_2!7540 (h!22550 l!412)) value!115)) ((_ is Cons!21343) l!412)))))

(declare-fun b!1013706 () Bool)

(assert (=> b!1013706 (= e!570347 (not (isStrictlySorted!522 (t!30340 l!412))))))

(declare-fun b!1013707 () Bool)

(declare-fun tp!70284 () Bool)

(assert (=> b!1013707 (= e!570348 (and tp_is_empty!23407 tp!70284))))

(assert (= (and start!87598 res!680507) b!1013705))

(assert (= (and b!1013705 res!680506) b!1013706))

(assert (= (and start!87598 ((_ is Cons!21343) l!412)) b!1013707))

(declare-fun m!937655 () Bool)

(assert (=> start!87598 m!937655))

(declare-fun m!937657 () Bool)

(assert (=> b!1013706 m!937657))

(check-sat (not b!1013706) (not start!87598) (not b!1013707) tp_is_empty!23407)
(check-sat)
(get-model)

(declare-fun d!120757 () Bool)

(declare-fun res!680532 () Bool)

(declare-fun e!570373 () Bool)

(assert (=> d!120757 (=> res!680532 e!570373)))

(assert (=> d!120757 (= res!680532 (or ((_ is Nil!21344) (t!30340 l!412)) ((_ is Nil!21344) (t!30340 (t!30340 l!412)))))))

(assert (=> d!120757 (= (isStrictlySorted!522 (t!30340 l!412)) e!570373)))

(declare-fun b!1013738 () Bool)

(declare-fun e!570374 () Bool)

(assert (=> b!1013738 (= e!570373 e!570374)))

(declare-fun res!680533 () Bool)

(assert (=> b!1013738 (=> (not res!680533) (not e!570374))))

(assert (=> b!1013738 (= res!680533 (bvslt (_1!7540 (h!22550 (t!30340 l!412))) (_1!7540 (h!22550 (t!30340 (t!30340 l!412))))))))

(declare-fun b!1013739 () Bool)

(assert (=> b!1013739 (= e!570374 (isStrictlySorted!522 (t!30340 (t!30340 l!412))))))

(assert (= (and d!120757 (not res!680532)) b!1013738))

(assert (= (and b!1013738 res!680533) b!1013739))

(declare-fun m!937667 () Bool)

(assert (=> b!1013739 m!937667))

(assert (=> b!1013706 d!120757))

(declare-fun d!120763 () Bool)

(declare-fun res!680538 () Bool)

(declare-fun e!570379 () Bool)

(assert (=> d!120763 (=> res!680538 e!570379)))

(assert (=> d!120763 (= res!680538 (or ((_ is Nil!21344) l!412) ((_ is Nil!21344) (t!30340 l!412))))))

(assert (=> d!120763 (= (isStrictlySorted!522 l!412) e!570379)))

(declare-fun b!1013744 () Bool)

(declare-fun e!570380 () Bool)

(assert (=> b!1013744 (= e!570379 e!570380)))

(declare-fun res!680539 () Bool)

(assert (=> b!1013744 (=> (not res!680539) (not e!570380))))

(assert (=> b!1013744 (= res!680539 (bvslt (_1!7540 (h!22550 l!412)) (_1!7540 (h!22550 (t!30340 l!412)))))))

(declare-fun b!1013745 () Bool)

(assert (=> b!1013745 (= e!570380 (isStrictlySorted!522 (t!30340 l!412)))))

(assert (= (and d!120763 (not res!680538)) b!1013744))

(assert (= (and b!1013744 res!680539) b!1013745))

(assert (=> b!1013745 m!937657))

(assert (=> start!87598 d!120763))

(declare-fun b!1013762 () Bool)

(declare-fun e!570391 () Bool)

(declare-fun tp!70297 () Bool)

(assert (=> b!1013762 (= e!570391 (and tp_is_empty!23407 tp!70297))))

(assert (=> b!1013707 (= tp!70284 e!570391)))

(assert (= (and b!1013707 ((_ is Cons!21343) (t!30340 l!412))) b!1013762))

(check-sat (not b!1013745) (not b!1013739) (not b!1013762) tp_is_empty!23407)
(check-sat)
