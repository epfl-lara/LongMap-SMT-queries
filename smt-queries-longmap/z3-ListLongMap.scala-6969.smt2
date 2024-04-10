; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88052 () Bool)

(assert start!88052)

(declare-fun b!1016171 () Bool)

(assert (=> b!1016171 true))

(assert (=> b!1016171 true))

(declare-fun res!681615 () Bool)

(declare-fun e!571644 () Bool)

(assert (=> b!1016171 (=> (not res!681615) (not e!571644))))

(declare-datatypes ((List!21513 0))(
  ( (Nil!21510) (Cons!21509 (h!22707 (_ BitVec 64)) (t!30514 List!21513)) )
))
(declare-fun keys!40 () List!21513)

(declare-fun lambda!1004 () Int)

(declare-fun forall!275 (List!21513 Int) Bool)

(assert (=> b!1016171 (= res!681615 (forall!275 keys!40 lambda!1004))))

(declare-fun b!1016172 () Bool)

(declare-fun ListPrimitiveSize!122 (List!21513) Int)

(assert (=> b!1016172 (= e!571644 (< (ListPrimitiveSize!122 keys!40) 0))))

(declare-fun b!1016173 () Bool)

(declare-fun e!571645 () Bool)

(declare-fun tp_is_empty!23589 () Bool)

(declare-fun tp!70739 () Bool)

(assert (=> b!1016173 (= e!571645 (and tp_is_empty!23589 tp!70739))))

(declare-fun b!1016174 () Bool)

(declare-fun res!681614 () Bool)

(assert (=> b!1016174 (=> (not res!681614) (not e!571644))))

(declare-datatypes ((B!1522 0))(
  ( (B!1523 (val!11845 Int)) )
))
(declare-datatypes ((tuple2!15236 0))(
  ( (tuple2!15237 (_1!7629 (_ BitVec 64)) (_2!7629 B!1522)) )
))
(declare-datatypes ((List!21514 0))(
  ( (Nil!21511) (Cons!21510 (h!22708 tuple2!15236) (t!30515 List!21514)) )
))
(declare-fun l!1114 () List!21514)

(declare-fun isEmpty!875 (List!21514) Bool)

(assert (=> b!1016174 (= res!681614 (not (isEmpty!875 l!1114)))))

(declare-fun b!1016175 () Bool)

(declare-fun res!681612 () Bool)

(assert (=> b!1016175 (=> (not res!681612) (not e!571644))))

(declare-fun newHead!31 () tuple2!15236)

(declare-fun head!962 (List!21514) tuple2!15236)

(assert (=> b!1016175 (= res!681612 (bvslt (_1!7629 newHead!31) (_1!7629 (head!962 l!1114))))))

(declare-fun res!681613 () Bool)

(assert (=> start!88052 (=> (not res!681613) (not e!571644))))

(declare-fun isStrictlySorted!613 (List!21514) Bool)

(assert (=> start!88052 (= res!681613 (isStrictlySorted!613 l!1114))))

(assert (=> start!88052 e!571644))

(assert (=> start!88052 e!571645))

(assert (=> start!88052 true))

(assert (=> start!88052 tp_is_empty!23589))

(assert (= (and start!88052 res!681613) b!1016174))

(assert (= (and b!1016174 res!681614) b!1016171))

(assert (= (and b!1016171 res!681615) b!1016175))

(assert (= (and b!1016175 res!681612) b!1016172))

(get-info :version)

(assert (= (and start!88052 ((_ is Cons!21510) l!1114)) b!1016173))

(declare-fun m!937965 () Bool)

(assert (=> b!1016175 m!937965))

(declare-fun m!937967 () Bool)

(assert (=> b!1016174 m!937967))

(declare-fun m!937969 () Bool)

(assert (=> b!1016172 m!937969))

(declare-fun m!937971 () Bool)

(assert (=> b!1016171 m!937971))

(declare-fun m!937973 () Bool)

(assert (=> start!88052 m!937973))

(check-sat (not b!1016173) (not b!1016174) tp_is_empty!23589 (not b!1016172) (not b!1016171) (not b!1016175) (not start!88052))
(check-sat)
(get-model)

(declare-fun d!121149 () Bool)

(assert (=> d!121149 (= (head!962 l!1114) (h!22708 l!1114))))

(assert (=> b!1016175 d!121149))

(declare-fun d!121151 () Bool)

(declare-fun res!681632 () Bool)

(declare-fun e!571656 () Bool)

(assert (=> d!121151 (=> res!681632 e!571656)))

(assert (=> d!121151 (= res!681632 (or ((_ is Nil!21511) l!1114) ((_ is Nil!21511) (t!30515 l!1114))))))

(assert (=> d!121151 (= (isStrictlySorted!613 l!1114) e!571656)))

(declare-fun b!1016203 () Bool)

(declare-fun e!571657 () Bool)

(assert (=> b!1016203 (= e!571656 e!571657)))

(declare-fun res!681633 () Bool)

(assert (=> b!1016203 (=> (not res!681633) (not e!571657))))

(assert (=> b!1016203 (= res!681633 (bvslt (_1!7629 (h!22708 l!1114)) (_1!7629 (h!22708 (t!30515 l!1114)))))))

(declare-fun b!1016204 () Bool)

(assert (=> b!1016204 (= e!571657 (isStrictlySorted!613 (t!30515 l!1114)))))

(assert (= (and d!121151 (not res!681632)) b!1016203))

(assert (= (and b!1016203 res!681633) b!1016204))

(declare-fun m!937985 () Bool)

(assert (=> b!1016204 m!937985))

(assert (=> start!88052 d!121151))

(declare-fun d!121157 () Bool)

(assert (=> d!121157 (= (isEmpty!875 l!1114) ((_ is Nil!21511) l!1114))))

(assert (=> b!1016174 d!121157))

(declare-fun d!121159 () Bool)

(declare-fun res!681644 () Bool)

(declare-fun e!571671 () Bool)

(assert (=> d!121159 (=> res!681644 e!571671)))

(assert (=> d!121159 (= res!681644 ((_ is Nil!21510) keys!40))))

(assert (=> d!121159 (= (forall!275 keys!40 lambda!1004) e!571671)))

(declare-fun b!1016221 () Bool)

(declare-fun e!571672 () Bool)

(assert (=> b!1016221 (= e!571671 e!571672)))

(declare-fun res!681645 () Bool)

(assert (=> b!1016221 (=> (not res!681645) (not e!571672))))

(declare-fun dynLambda!1911 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016221 (= res!681645 (dynLambda!1911 lambda!1004 (h!22707 keys!40)))))

(declare-fun b!1016222 () Bool)

(assert (=> b!1016222 (= e!571672 (forall!275 (t!30514 keys!40) lambda!1004))))

(assert (= (and d!121159 (not res!681644)) b!1016221))

(assert (= (and b!1016221 res!681645) b!1016222))

(declare-fun b_lambda!15489 () Bool)

(assert (=> (not b_lambda!15489) (not b!1016221)))

(declare-fun m!937993 () Bool)

(assert (=> b!1016221 m!937993))

(declare-fun m!937995 () Bool)

(assert (=> b!1016222 m!937995))

(assert (=> b!1016171 d!121159))

(declare-fun d!121165 () Bool)

(declare-fun lt!449255 () Int)

(assert (=> d!121165 (>= lt!449255 0)))

(declare-fun e!571681 () Int)

(assert (=> d!121165 (= lt!449255 e!571681)))

(declare-fun c!102917 () Bool)

(assert (=> d!121165 (= c!102917 ((_ is Nil!21510) keys!40))))

(assert (=> d!121165 (= (ListPrimitiveSize!122 keys!40) lt!449255)))

(declare-fun b!1016235 () Bool)

(assert (=> b!1016235 (= e!571681 0)))

(declare-fun b!1016236 () Bool)

(assert (=> b!1016236 (= e!571681 (+ 1 (ListPrimitiveSize!122 (t!30514 keys!40))))))

(assert (= (and d!121165 c!102917) b!1016235))

(assert (= (and d!121165 (not c!102917)) b!1016236))

(declare-fun m!937997 () Bool)

(assert (=> b!1016236 m!937997))

(assert (=> b!1016172 d!121165))

(declare-fun b!1016247 () Bool)

(declare-fun e!571687 () Bool)

(declare-fun tp!70745 () Bool)

(assert (=> b!1016247 (= e!571687 (and tp_is_empty!23589 tp!70745))))

(assert (=> b!1016173 (= tp!70739 e!571687)))

(assert (= (and b!1016173 ((_ is Cons!21510) (t!30515 l!1114))) b!1016247))

(declare-fun b_lambda!15491 () Bool)

(assert (= b_lambda!15489 (or b!1016171 b_lambda!15491)))

(declare-fun bs!29504 () Bool)

(declare-fun d!121173 () Bool)

(assert (= bs!29504 (and d!121173 b!1016171)))

(declare-fun value!178 () B!1522)

(declare-datatypes ((Option!598 0))(
  ( (Some!597 (v!14448 B!1522)) (None!596) )
))
(declare-fun getValueByKey!547 (List!21514 (_ BitVec 64)) Option!598)

(assert (=> bs!29504 (= (dynLambda!1911 lambda!1004 (h!22707 keys!40)) (= (getValueByKey!547 l!1114 (h!22707 keys!40)) (Some!597 value!178)))))

(declare-fun m!938003 () Bool)

(assert (=> bs!29504 m!938003))

(assert (=> b!1016221 d!121173))

(check-sat (not b!1016247) (not b_lambda!15491) (not bs!29504) (not b!1016222) (not b!1016236) tp_is_empty!23589 (not b!1016204))
(check-sat)
