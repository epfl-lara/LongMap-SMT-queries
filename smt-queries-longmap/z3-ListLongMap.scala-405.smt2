; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7578 () Bool)

(assert start!7578)

(declare-fun b!48305 () Bool)

(declare-fun e!30996 () Bool)

(declare-fun tp_is_empty!2095 () Bool)

(declare-fun tp!6383 () Bool)

(assert (=> b!48305 (= e!30996 (and tp_is_empty!2095 tp!6383))))

(declare-fun b!48302 () Bool)

(declare-fun res!28028 () Bool)

(declare-fun e!30995 () Bool)

(assert (=> b!48302 (=> (not res!28028) (not e!30995))))

(declare-datatypes ((B!944 0))(
  ( (B!945 (val!1092 Int)) )
))
(declare-datatypes ((tuple2!1770 0))(
  ( (tuple2!1771 (_1!896 (_ BitVec 64)) (_2!896 B!944)) )
))
(declare-datatypes ((List!1285 0))(
  ( (Nil!1282) (Cons!1281 (h!1861 tuple2!1770) (t!4312 List!1285)) )
))
(declare-fun l!1333 () List!1285)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!103 (List!1285 (_ BitVec 64)) Bool)

(assert (=> b!48302 (= res!28028 (not (containsKey!103 l!1333 newKey!147)))))

(declare-fun b!48303 () Bool)

(declare-fun res!28029 () Bool)

(assert (=> b!48303 (=> (not res!28029) (not e!30995))))

(get-info :version)

(assert (=> b!48303 (= res!28029 (not ((_ is Nil!1282) l!1333)))))

(declare-fun res!28027 () Bool)

(assert (=> start!7578 (=> (not res!28027) (not e!30995))))

(declare-fun isStrictlySorted!251 (List!1285) Bool)

(assert (=> start!7578 (= res!28027 (isStrictlySorted!251 l!1333))))

(assert (=> start!7578 e!30995))

(assert (=> start!7578 e!30996))

(assert (=> start!7578 true))

(declare-fun b!48304 () Bool)

(assert (=> b!48304 (= e!30995 (not (isStrictlySorted!251 (t!4312 l!1333))))))

(assert (= (and start!7578 res!28027) b!48302))

(assert (= (and b!48302 res!28028) b!48303))

(assert (= (and b!48303 res!28029) b!48304))

(assert (= (and start!7578 ((_ is Cons!1281) l!1333)) b!48305))

(declare-fun m!42167 () Bool)

(assert (=> b!48302 m!42167))

(declare-fun m!42169 () Bool)

(assert (=> start!7578 m!42169))

(declare-fun m!42171 () Bool)

(assert (=> b!48304 m!42171))

(check-sat (not b!48302) (not b!48305) tp_is_empty!2095 (not b!48304) (not start!7578))
(check-sat)
(get-model)

(declare-fun d!9579 () Bool)

(declare-fun res!28054 () Bool)

(declare-fun e!31015 () Bool)

(assert (=> d!9579 (=> res!28054 e!31015)))

(assert (=> d!9579 (= res!28054 (or ((_ is Nil!1282) (t!4312 l!1333)) ((_ is Nil!1282) (t!4312 (t!4312 l!1333)))))))

(assert (=> d!9579 (= (isStrictlySorted!251 (t!4312 l!1333)) e!31015)))

(declare-fun b!48336 () Bool)

(declare-fun e!31016 () Bool)

(assert (=> b!48336 (= e!31015 e!31016)))

(declare-fun res!28055 () Bool)

(assert (=> b!48336 (=> (not res!28055) (not e!31016))))

(assert (=> b!48336 (= res!28055 (bvslt (_1!896 (h!1861 (t!4312 l!1333))) (_1!896 (h!1861 (t!4312 (t!4312 l!1333))))))))

(declare-fun b!48337 () Bool)

(assert (=> b!48337 (= e!31016 (isStrictlySorted!251 (t!4312 (t!4312 l!1333))))))

(assert (= (and d!9579 (not res!28054)) b!48336))

(assert (= (and b!48336 res!28055) b!48337))

(declare-fun m!42185 () Bool)

(assert (=> b!48337 m!42185))

(assert (=> b!48304 d!9579))

(declare-fun d!9585 () Bool)

(declare-fun res!28074 () Bool)

(declare-fun e!31035 () Bool)

(assert (=> d!9585 (=> res!28074 e!31035)))

(assert (=> d!9585 (= res!28074 (and ((_ is Cons!1281) l!1333) (= (_1!896 (h!1861 l!1333)) newKey!147)))))

(assert (=> d!9585 (= (containsKey!103 l!1333 newKey!147) e!31035)))

(declare-fun b!48356 () Bool)

(declare-fun e!31036 () Bool)

(assert (=> b!48356 (= e!31035 e!31036)))

(declare-fun res!28075 () Bool)

(assert (=> b!48356 (=> (not res!28075) (not e!31036))))

(assert (=> b!48356 (= res!28075 (and (or (not ((_ is Cons!1281) l!1333)) (bvsle (_1!896 (h!1861 l!1333)) newKey!147)) ((_ is Cons!1281) l!1333) (bvslt (_1!896 (h!1861 l!1333)) newKey!147)))))

(declare-fun b!48357 () Bool)

(assert (=> b!48357 (= e!31036 (containsKey!103 (t!4312 l!1333) newKey!147))))

(assert (= (and d!9585 (not res!28074)) b!48356))

(assert (= (and b!48356 res!28075) b!48357))

(declare-fun m!42191 () Bool)

(assert (=> b!48357 m!42191))

(assert (=> b!48302 d!9585))

(declare-fun d!9591 () Bool)

(declare-fun res!28076 () Bool)

(declare-fun e!31037 () Bool)

(assert (=> d!9591 (=> res!28076 e!31037)))

(assert (=> d!9591 (= res!28076 (or ((_ is Nil!1282) l!1333) ((_ is Nil!1282) (t!4312 l!1333))))))

(assert (=> d!9591 (= (isStrictlySorted!251 l!1333) e!31037)))

(declare-fun b!48358 () Bool)

(declare-fun e!31038 () Bool)

(assert (=> b!48358 (= e!31037 e!31038)))

(declare-fun res!28077 () Bool)

(assert (=> b!48358 (=> (not res!28077) (not e!31038))))

(assert (=> b!48358 (= res!28077 (bvslt (_1!896 (h!1861 l!1333)) (_1!896 (h!1861 (t!4312 l!1333)))))))

(declare-fun b!48359 () Bool)

(assert (=> b!48359 (= e!31038 (isStrictlySorted!251 (t!4312 l!1333)))))

(assert (= (and d!9591 (not res!28076)) b!48358))

(assert (= (and b!48358 res!28077) b!48359))

(assert (=> b!48359 m!42171))

(assert (=> start!7578 d!9591))

(declare-fun b!48368 () Bool)

(declare-fun e!31045 () Bool)

(declare-fun tp!6392 () Bool)

(assert (=> b!48368 (= e!31045 (and tp_is_empty!2095 tp!6392))))

(assert (=> b!48305 (= tp!6383 e!31045)))

(assert (= (and b!48305 ((_ is Cons!1281) (t!4312 l!1333))) b!48368))

(check-sat (not b!48368) (not b!48337) (not b!48359) (not b!48357) tp_is_empty!2095)
(check-sat)
