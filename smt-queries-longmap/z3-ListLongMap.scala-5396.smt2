; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72152 () Bool)

(assert start!72152)

(declare-fun res!569310 () Bool)

(declare-fun e!467107 () Bool)

(assert (=> start!72152 (=> (not res!569310) (not e!467107))))

(declare-datatypes ((B!1178 0))(
  ( (B!1179 (val!7671 Int)) )
))
(declare-datatypes ((tuple2!10126 0))(
  ( (tuple2!10127 (_1!5074 (_ BitVec 64)) (_2!5074 B!1178)) )
))
(declare-datatypes ((List!15880 0))(
  ( (Nil!15877) (Cons!15876 (h!17013 tuple2!10126) (t!22243 List!15880)) )
))
(declare-fun l!390 () List!15880)

(declare-fun isStrictlySorted!434 (List!15880) Bool)

(assert (=> start!72152 (= res!569310 (isStrictlySorted!434 l!390))))

(assert (=> start!72152 e!467107))

(declare-fun e!467106 () Bool)

(assert (=> start!72152 e!467106))

(declare-fun b!837160 () Bool)

(declare-fun res!569309 () Bool)

(assert (=> b!837160 (=> (not res!569309) (not e!467107))))

(get-info :version)

(assert (=> b!837160 (= res!569309 ((_ is Cons!15876) l!390))))

(declare-fun b!837161 () Bool)

(assert (=> b!837161 (= e!467107 (not (isStrictlySorted!434 (t!22243 l!390))))))

(declare-fun b!837162 () Bool)

(declare-fun tp_is_empty!15247 () Bool)

(declare-fun tp!47405 () Bool)

(assert (=> b!837162 (= e!467106 (and tp_is_empty!15247 tp!47405))))

(assert (= (and start!72152 res!569310) b!837160))

(assert (= (and b!837160 res!569309) b!837161))

(assert (= (and start!72152 ((_ is Cons!15876) l!390)) b!837162))

(declare-fun m!782929 () Bool)

(assert (=> start!72152 m!782929))

(declare-fun m!782931 () Bool)

(assert (=> b!837161 m!782931))

(check-sat (not b!837161) (not start!72152) (not b!837162) tp_is_empty!15247)
(check-sat)
(get-model)

(declare-fun d!107877 () Bool)

(declare-fun res!569337 () Bool)

(declare-fun e!467134 () Bool)

(assert (=> d!107877 (=> res!569337 e!467134)))

(assert (=> d!107877 (= res!569337 (or ((_ is Nil!15877) (t!22243 l!390)) ((_ is Nil!15877) (t!22243 (t!22243 l!390)))))))

(assert (=> d!107877 (= (isStrictlySorted!434 (t!22243 l!390)) e!467134)))

(declare-fun b!837195 () Bool)

(declare-fun e!467135 () Bool)

(assert (=> b!837195 (= e!467134 e!467135)))

(declare-fun res!569338 () Bool)

(assert (=> b!837195 (=> (not res!569338) (not e!467135))))

(assert (=> b!837195 (= res!569338 (bvslt (_1!5074 (h!17013 (t!22243 l!390))) (_1!5074 (h!17013 (t!22243 (t!22243 l!390))))))))

(declare-fun b!837196 () Bool)

(assert (=> b!837196 (= e!467135 (isStrictlySorted!434 (t!22243 (t!22243 l!390))))))

(assert (= (and d!107877 (not res!569337)) b!837195))

(assert (= (and b!837195 res!569338) b!837196))

(declare-fun m!782943 () Bool)

(assert (=> b!837196 m!782943))

(assert (=> b!837161 d!107877))

(declare-fun d!107883 () Bool)

(declare-fun res!569341 () Bool)

(declare-fun e!467138 () Bool)

(assert (=> d!107883 (=> res!569341 e!467138)))

(assert (=> d!107883 (= res!569341 (or ((_ is Nil!15877) l!390) ((_ is Nil!15877) (t!22243 l!390))))))

(assert (=> d!107883 (= (isStrictlySorted!434 l!390) e!467138)))

(declare-fun b!837199 () Bool)

(declare-fun e!467139 () Bool)

(assert (=> b!837199 (= e!467138 e!467139)))

(declare-fun res!569342 () Bool)

(assert (=> b!837199 (=> (not res!569342) (not e!467139))))

(assert (=> b!837199 (= res!569342 (bvslt (_1!5074 (h!17013 l!390)) (_1!5074 (h!17013 (t!22243 l!390)))))))

(declare-fun b!837200 () Bool)

(assert (=> b!837200 (= e!467139 (isStrictlySorted!434 (t!22243 l!390)))))

(assert (= (and d!107883 (not res!569341)) b!837199))

(assert (= (and b!837199 res!569342) b!837200))

(assert (=> b!837200 m!782931))

(assert (=> start!72152 d!107883))

(declare-fun b!837214 () Bool)

(declare-fun e!467149 () Bool)

(declare-fun tp!47417 () Bool)

(assert (=> b!837214 (= e!467149 (and tp_is_empty!15247 tp!47417))))

(assert (=> b!837162 (= tp!47405 e!467149)))

(assert (= (and b!837162 ((_ is Cons!15876) (t!22243 l!390))) b!837214))

(check-sat (not b!837200) (not b!837196) (not b!837214) tp_is_empty!15247)
(check-sat)
