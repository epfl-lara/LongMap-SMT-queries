; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87360 () Bool)

(assert start!87360)

(declare-fun res!679928 () Bool)

(declare-fun e!569414 () Bool)

(assert (=> start!87360 (=> (not res!679928) (not e!569414))))

(declare-datatypes ((B!1340 0))(
  ( (B!1341 (val!11754 Int)) )
))
(declare-datatypes ((tuple2!15134 0))(
  ( (tuple2!15135 (_1!7578 (_ BitVec 64)) (_2!7578 B!1340)) )
))
(declare-datatypes ((List!21393 0))(
  ( (Nil!21390) (Cons!21389 (h!22587 tuple2!15134) (t!30385 List!21393)) )
))
(declare-fun l!412 () List!21393)

(declare-fun isStrictlySorted!530 (List!21393) Bool)

(assert (=> start!87360 (= res!679928 (isStrictlySorted!530 l!412))))

(assert (=> start!87360 e!569414))

(declare-fun e!569413 () Bool)

(assert (=> start!87360 e!569413))

(declare-fun tp_is_empty!23407 () Bool)

(assert (=> start!87360 tp_is_empty!23407))

(declare-fun b!1012241 () Bool)

(declare-fun res!679927 () Bool)

(assert (=> b!1012241 (=> (not res!679927) (not e!569414))))

(declare-fun value!115 () B!1340)

(get-info :version)

(assert (=> b!1012241 (= res!679927 (and (not (= (_2!7578 (h!22587 l!412)) value!115)) ((_ is Cons!21389) l!412)))))

(declare-fun b!1012242 () Bool)

(assert (=> b!1012242 (= e!569414 (not (isStrictlySorted!530 (t!30385 l!412))))))

(declare-fun b!1012243 () Bool)

(declare-fun tp!70284 () Bool)

(assert (=> b!1012243 (= e!569413 (and tp_is_empty!23407 tp!70284))))

(assert (= (and start!87360 res!679928) b!1012241))

(assert (= (and b!1012241 res!679927) b!1012242))

(assert (= (and start!87360 ((_ is Cons!21389) l!412)) b!1012243))

(declare-fun m!935371 () Bool)

(assert (=> start!87360 m!935371))

(declare-fun m!935373 () Bool)

(assert (=> b!1012242 m!935373))

(check-sat (not start!87360) (not b!1012242) (not b!1012243) tp_is_empty!23407)
(check-sat)
(get-model)

(declare-fun d!120143 () Bool)

(declare-fun res!679945 () Bool)

(declare-fun e!569431 () Bool)

(assert (=> d!120143 (=> res!679945 e!569431)))

(assert (=> d!120143 (= res!679945 (or ((_ is Nil!21390) l!412) ((_ is Nil!21390) (t!30385 l!412))))))

(assert (=> d!120143 (= (isStrictlySorted!530 l!412) e!569431)))

(declare-fun b!1012266 () Bool)

(declare-fun e!569432 () Bool)

(assert (=> b!1012266 (= e!569431 e!569432)))

(declare-fun res!679946 () Bool)

(assert (=> b!1012266 (=> (not res!679946) (not e!569432))))

(assert (=> b!1012266 (= res!679946 (bvslt (_1!7578 (h!22587 l!412)) (_1!7578 (h!22587 (t!30385 l!412)))))))

(declare-fun b!1012267 () Bool)

(assert (=> b!1012267 (= e!569432 (isStrictlySorted!530 (t!30385 l!412)))))

(assert (= (and d!120143 (not res!679945)) b!1012266))

(assert (= (and b!1012266 res!679946) b!1012267))

(assert (=> b!1012267 m!935373))

(assert (=> start!87360 d!120143))

(declare-fun d!120149 () Bool)

(declare-fun res!679951 () Bool)

(declare-fun e!569437 () Bool)

(assert (=> d!120149 (=> res!679951 e!569437)))

(assert (=> d!120149 (= res!679951 (or ((_ is Nil!21390) (t!30385 l!412)) ((_ is Nil!21390) (t!30385 (t!30385 l!412)))))))

(assert (=> d!120149 (= (isStrictlySorted!530 (t!30385 l!412)) e!569437)))

(declare-fun b!1012270 () Bool)

(declare-fun e!569438 () Bool)

(assert (=> b!1012270 (= e!569437 e!569438)))

(declare-fun res!679952 () Bool)

(assert (=> b!1012270 (=> (not res!679952) (not e!569438))))

(assert (=> b!1012270 (= res!679952 (bvslt (_1!7578 (h!22587 (t!30385 l!412))) (_1!7578 (h!22587 (t!30385 (t!30385 l!412))))))))

(declare-fun b!1012271 () Bool)

(assert (=> b!1012271 (= e!569438 (isStrictlySorted!530 (t!30385 (t!30385 l!412))))))

(assert (= (and d!120149 (not res!679951)) b!1012270))

(assert (= (and b!1012270 res!679952) b!1012271))

(declare-fun m!935383 () Bool)

(assert (=> b!1012271 m!935383))

(assert (=> b!1012242 d!120149))

(declare-fun b!1012282 () Bool)

(declare-fun e!569445 () Bool)

(declare-fun tp!70293 () Bool)

(assert (=> b!1012282 (= e!569445 (and tp_is_empty!23407 tp!70293))))

(assert (=> b!1012243 (= tp!70284 e!569445)))

(assert (= (and b!1012243 ((_ is Cons!21389) (t!30385 l!412))) b!1012282))

(check-sat (not b!1012267) (not b!1012271) (not b!1012282) tp_is_empty!23407)
(check-sat)
