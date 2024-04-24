; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7582 () Bool)

(assert start!7582)

(declare-fun b!48311 () Bool)

(declare-fun res!28023 () Bool)

(declare-fun e!31002 () Bool)

(assert (=> b!48311 (=> (not res!28023) (not e!31002))))

(declare-datatypes ((B!944 0))(
  ( (B!945 (val!1092 Int)) )
))
(declare-datatypes ((tuple2!1748 0))(
  ( (tuple2!1749 (_1!885 (_ BitVec 64)) (_2!885 B!944)) )
))
(declare-datatypes ((List!1275 0))(
  ( (Nil!1272) (Cons!1271 (h!1851 tuple2!1748) (t!4303 List!1275)) )
))
(declare-fun l!1333 () List!1275)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!105 (List!1275 (_ BitVec 64)) Bool)

(assert (=> b!48311 (= res!28023 (not (containsKey!105 l!1333 newKey!147)))))

(declare-fun b!48312 () Bool)

(declare-fun res!28024 () Bool)

(assert (=> b!48312 (=> (not res!28024) (not e!31002))))

(get-info :version)

(assert (=> b!48312 (= res!28024 (not ((_ is Nil!1272) l!1333)))))

(declare-fun b!48313 () Bool)

(declare-fun isStrictlySorted!244 (List!1275) Bool)

(assert (=> b!48313 (= e!31002 (not (isStrictlySorted!244 (t!4303 l!1333))))))

(declare-fun b!48314 () Bool)

(declare-fun e!31001 () Bool)

(declare-fun tp_is_empty!2095 () Bool)

(declare-fun tp!6383 () Bool)

(assert (=> b!48314 (= e!31001 (and tp_is_empty!2095 tp!6383))))

(declare-fun res!28022 () Bool)

(assert (=> start!7582 (=> (not res!28022) (not e!31002))))

(assert (=> start!7582 (= res!28022 (isStrictlySorted!244 l!1333))))

(assert (=> start!7582 e!31002))

(assert (=> start!7582 e!31001))

(assert (=> start!7582 true))

(assert (= (and start!7582 res!28022) b!48311))

(assert (= (and b!48311 res!28023) b!48312))

(assert (= (and b!48312 res!28024) b!48313))

(assert (= (and start!7582 ((_ is Cons!1271) l!1333)) b!48314))

(declare-fun m!42125 () Bool)

(assert (=> b!48311 m!42125))

(declare-fun m!42127 () Bool)

(assert (=> b!48313 m!42127))

(declare-fun m!42129 () Bool)

(assert (=> start!7582 m!42129))

(check-sat (not b!48313) (not b!48314) (not b!48311) tp_is_empty!2095 (not start!7582))
(check-sat)
(get-model)

(declare-fun d!9593 () Bool)

(declare-fun res!28047 () Bool)

(declare-fun e!31019 () Bool)

(assert (=> d!9593 (=> res!28047 e!31019)))

(assert (=> d!9593 (= res!28047 (and ((_ is Cons!1271) l!1333) (= (_1!885 (h!1851 l!1333)) newKey!147)))))

(assert (=> d!9593 (= (containsKey!105 l!1333 newKey!147) e!31019)))

(declare-fun b!48343 () Bool)

(declare-fun e!31020 () Bool)

(assert (=> b!48343 (= e!31019 e!31020)))

(declare-fun res!28048 () Bool)

(assert (=> b!48343 (=> (not res!28048) (not e!31020))))

(assert (=> b!48343 (= res!28048 (and (or (not ((_ is Cons!1271) l!1333)) (bvsle (_1!885 (h!1851 l!1333)) newKey!147)) ((_ is Cons!1271) l!1333) (bvslt (_1!885 (h!1851 l!1333)) newKey!147)))))

(declare-fun b!48344 () Bool)

(assert (=> b!48344 (= e!31020 (containsKey!105 (t!4303 l!1333) newKey!147))))

(assert (= (and d!9593 (not res!28047)) b!48343))

(assert (= (and b!48343 res!28048) b!48344))

(declare-fun m!42143 () Bool)

(assert (=> b!48344 m!42143))

(assert (=> b!48311 d!9593))

(declare-fun d!9595 () Bool)

(declare-fun res!28053 () Bool)

(declare-fun e!31025 () Bool)

(assert (=> d!9595 (=> res!28053 e!31025)))

(assert (=> d!9595 (= res!28053 (or ((_ is Nil!1272) l!1333) ((_ is Nil!1272) (t!4303 l!1333))))))

(assert (=> d!9595 (= (isStrictlySorted!244 l!1333) e!31025)))

(declare-fun b!48349 () Bool)

(declare-fun e!31026 () Bool)

(assert (=> b!48349 (= e!31025 e!31026)))

(declare-fun res!28054 () Bool)

(assert (=> b!48349 (=> (not res!28054) (not e!31026))))

(assert (=> b!48349 (= res!28054 (bvslt (_1!885 (h!1851 l!1333)) (_1!885 (h!1851 (t!4303 l!1333)))))))

(declare-fun b!48350 () Bool)

(assert (=> b!48350 (= e!31026 (isStrictlySorted!244 (t!4303 l!1333)))))

(assert (= (and d!9595 (not res!28053)) b!48349))

(assert (= (and b!48349 res!28054) b!48350))

(assert (=> b!48350 m!42127))

(assert (=> start!7582 d!9595))

(declare-fun d!9601 () Bool)

(declare-fun res!28061 () Bool)

(declare-fun e!31033 () Bool)

(assert (=> d!9601 (=> res!28061 e!31033)))

(assert (=> d!9601 (= res!28061 (or ((_ is Nil!1272) (t!4303 l!1333)) ((_ is Nil!1272) (t!4303 (t!4303 l!1333)))))))

(assert (=> d!9601 (= (isStrictlySorted!244 (t!4303 l!1333)) e!31033)))

(declare-fun b!48355 () Bool)

(declare-fun e!31034 () Bool)

(assert (=> b!48355 (= e!31033 e!31034)))

(declare-fun res!28062 () Bool)

(assert (=> b!48355 (=> (not res!28062) (not e!31034))))

(assert (=> b!48355 (= res!28062 (bvslt (_1!885 (h!1851 (t!4303 l!1333))) (_1!885 (h!1851 (t!4303 (t!4303 l!1333))))))))

(declare-fun b!48356 () Bool)

(assert (=> b!48356 (= e!31034 (isStrictlySorted!244 (t!4303 (t!4303 l!1333))))))

(assert (= (and d!9601 (not res!28061)) b!48355))

(assert (= (and b!48355 res!28062) b!48356))

(declare-fun m!42145 () Bool)

(assert (=> b!48356 m!42145))

(assert (=> b!48313 d!9601))

(declare-fun b!48365 () Bool)

(declare-fun e!31039 () Bool)

(declare-fun tp!6392 () Bool)

(assert (=> b!48365 (= e!31039 (and tp_is_empty!2095 tp!6392))))

(assert (=> b!48314 (= tp!6383 e!31039)))

(assert (= (and b!48314 ((_ is Cons!1271) (t!4303 l!1333))) b!48365))

(check-sat (not b!48365) (not b!48350) (not b!48356) tp_is_empty!2095 (not b!48344))
(check-sat)
