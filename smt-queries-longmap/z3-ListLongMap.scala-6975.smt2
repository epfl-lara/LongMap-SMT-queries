; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88366 () Bool)

(assert start!88366)

(declare-fun b!1017155 () Bool)

(assert (=> b!1017155 true))

(assert (=> b!1017155 true))

(declare-fun bs!29558 () Bool)

(declare-fun b!1017154 () Bool)

(assert (= bs!29558 (and b!1017154 b!1017155)))

(declare-fun lambda!1109 () Int)

(declare-datatypes ((B!1556 0))(
  ( (B!1557 (val!11862 Int)) )
))
(declare-datatypes ((tuple2!15350 0))(
  ( (tuple2!15351 (_1!7686 (_ BitVec 64)) (_2!7686 B!1556)) )
))
(declare-datatypes ((List!21582 0))(
  ( (Nil!21579) (Cons!21578 (h!22776 tuple2!15350) (t!30574 List!21582)) )
))
(declare-fun l!1114 () List!21582)

(declare-fun lambda!1108 () Int)

(declare-fun newHead!31 () tuple2!15350)

(assert (=> bs!29558 (= (= (Cons!21578 newHead!31 l!1114) l!1114) (= lambda!1109 lambda!1108))))

(assert (=> b!1017154 true))

(assert (=> b!1017154 true))

(assert (=> b!1017154 true))

(declare-fun b!1017152 () Bool)

(declare-fun res!682258 () Bool)

(declare-fun e!572255 () Bool)

(assert (=> b!1017152 (=> (not res!682258) (not e!572255))))

(declare-fun head!978 (List!21582) tuple2!15350)

(assert (=> b!1017152 (= res!682258 (bvslt (_1!7686 newHead!31) (_1!7686 (head!978 l!1114))))))

(declare-datatypes ((List!21583 0))(
  ( (Nil!21580) (Cons!21579 (h!22777 (_ BitVec 64)) (t!30575 List!21583)) )
))
(declare-fun keys!40 () List!21583)

(declare-fun forall!296 (List!21583 Int) Bool)

(assert (=> b!1017154 (= e!572255 (not (forall!296 keys!40 lambda!1109)))))

(declare-fun res!682259 () Bool)

(assert (=> b!1017155 (=> (not res!682259) (not e!572255))))

(assert (=> b!1017155 (= res!682259 (forall!296 keys!40 lambda!1108))))

(declare-fun b!1017156 () Bool)

(declare-fun res!682257 () Bool)

(assert (=> b!1017156 (=> (not res!682257) (not e!572255))))

(declare-fun isEmpty!909 (List!21582) Bool)

(assert (=> b!1017156 (= res!682257 (not (isEmpty!909 l!1114)))))

(declare-fun b!1017157 () Bool)

(declare-fun e!572256 () Bool)

(declare-fun tp_is_empty!23623 () Bool)

(declare-fun tp!70847 () Bool)

(assert (=> b!1017157 (= e!572256 (and tp_is_empty!23623 tp!70847))))

(declare-fun b!1017153 () Bool)

(declare-fun res!682255 () Bool)

(assert (=> b!1017153 (=> (not res!682255) (not e!572255))))

(get-info :version)

(assert (=> b!1017153 (= res!682255 (not ((_ is Cons!21579) keys!40)))))

(declare-fun res!682256 () Bool)

(assert (=> start!88366 (=> (not res!682256) (not e!572255))))

(declare-fun isStrictlySorted!626 (List!21582) Bool)

(assert (=> start!88366 (= res!682256 (isStrictlySorted!626 l!1114))))

(assert (=> start!88366 e!572255))

(assert (=> start!88366 e!572256))

(assert (=> start!88366 true))

(assert (=> start!88366 tp_is_empty!23623))

(assert (= (and start!88366 res!682256) b!1017156))

(assert (= (and b!1017156 res!682257) b!1017155))

(assert (= (and b!1017155 res!682259) b!1017152))

(assert (= (and b!1017152 res!682258) b!1017153))

(assert (= (and b!1017153 res!682255) b!1017154))

(assert (= (and start!88366 ((_ is Cons!21578) l!1114)) b!1017157))

(declare-fun m!938101 () Bool)

(assert (=> b!1017154 m!938101))

(declare-fun m!938103 () Bool)

(assert (=> b!1017156 m!938103))

(declare-fun m!938105 () Bool)

(assert (=> b!1017152 m!938105))

(declare-fun m!938107 () Bool)

(assert (=> b!1017155 m!938107))

(declare-fun m!938109 () Bool)

(assert (=> start!88366 m!938109))

(check-sat (not b!1017156) (not start!88366) (not b!1017152) (not b!1017157) (not b!1017154) (not b!1017155) tp_is_empty!23623)
(check-sat)
(get-model)

(declare-fun d!121429 () Bool)

(declare-fun res!682294 () Bool)

(declare-fun e!572273 () Bool)

(assert (=> d!121429 (=> res!682294 e!572273)))

(assert (=> d!121429 (= res!682294 ((_ is Nil!21580) keys!40))))

(assert (=> d!121429 (= (forall!296 keys!40 lambda!1109) e!572273)))

(declare-fun b!1017216 () Bool)

(declare-fun e!572274 () Bool)

(assert (=> b!1017216 (= e!572273 e!572274)))

(declare-fun res!682295 () Bool)

(assert (=> b!1017216 (=> (not res!682295) (not e!572274))))

(declare-fun dynLambda!1919 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017216 (= res!682295 (dynLambda!1919 lambda!1109 (h!22777 keys!40)))))

(declare-fun b!1017217 () Bool)

(assert (=> b!1017217 (= e!572274 (forall!296 (t!30575 keys!40) lambda!1109))))

(assert (= (and d!121429 (not res!682294)) b!1017216))

(assert (= (and b!1017216 res!682295) b!1017217))

(declare-fun b_lambda!15605 () Bool)

(assert (=> (not b_lambda!15605) (not b!1017216)))

(declare-fun m!938131 () Bool)

(assert (=> b!1017216 m!938131))

(declare-fun m!938133 () Bool)

(assert (=> b!1017217 m!938133))

(assert (=> b!1017154 d!121429))

(declare-fun d!121431 () Bool)

(assert (=> d!121431 (= (head!978 l!1114) (h!22776 l!1114))))

(assert (=> b!1017152 d!121431))

(declare-fun d!121433 () Bool)

(assert (=> d!121433 (= (isEmpty!909 l!1114) ((_ is Nil!21579) l!1114))))

(assert (=> b!1017156 d!121433))

(declare-fun d!121435 () Bool)

(declare-fun res!682300 () Bool)

(declare-fun e!572279 () Bool)

(assert (=> d!121435 (=> res!682300 e!572279)))

(assert (=> d!121435 (= res!682300 (or ((_ is Nil!21579) l!1114) ((_ is Nil!21579) (t!30574 l!1114))))))

(assert (=> d!121435 (= (isStrictlySorted!626 l!1114) e!572279)))

(declare-fun b!1017222 () Bool)

(declare-fun e!572280 () Bool)

(assert (=> b!1017222 (= e!572279 e!572280)))

(declare-fun res!682301 () Bool)

(assert (=> b!1017222 (=> (not res!682301) (not e!572280))))

(assert (=> b!1017222 (= res!682301 (bvslt (_1!7686 (h!22776 l!1114)) (_1!7686 (h!22776 (t!30574 l!1114)))))))

(declare-fun b!1017223 () Bool)

(assert (=> b!1017223 (= e!572280 (isStrictlySorted!626 (t!30574 l!1114)))))

(assert (= (and d!121435 (not res!682300)) b!1017222))

(assert (= (and b!1017222 res!682301) b!1017223))

(declare-fun m!938135 () Bool)

(assert (=> b!1017223 m!938135))

(assert (=> start!88366 d!121435))

(declare-fun d!121439 () Bool)

(declare-fun res!682302 () Bool)

(declare-fun e!572281 () Bool)

(assert (=> d!121439 (=> res!682302 e!572281)))

(assert (=> d!121439 (= res!682302 ((_ is Nil!21580) keys!40))))

(assert (=> d!121439 (= (forall!296 keys!40 lambda!1108) e!572281)))

(declare-fun b!1017224 () Bool)

(declare-fun e!572282 () Bool)

(assert (=> b!1017224 (= e!572281 e!572282)))

(declare-fun res!682303 () Bool)

(assert (=> b!1017224 (=> (not res!682303) (not e!572282))))

(assert (=> b!1017224 (= res!682303 (dynLambda!1919 lambda!1108 (h!22777 keys!40)))))

(declare-fun b!1017225 () Bool)

(assert (=> b!1017225 (= e!572282 (forall!296 (t!30575 keys!40) lambda!1108))))

(assert (= (and d!121439 (not res!682302)) b!1017224))

(assert (= (and b!1017224 res!682303) b!1017225))

(declare-fun b_lambda!15607 () Bool)

(assert (=> (not b_lambda!15607) (not b!1017224)))

(declare-fun m!938137 () Bool)

(assert (=> b!1017224 m!938137))

(declare-fun m!938139 () Bool)

(assert (=> b!1017225 m!938139))

(assert (=> b!1017155 d!121439))

(declare-fun b!1017232 () Bool)

(declare-fun e!572287 () Bool)

(declare-fun tp!70856 () Bool)

(assert (=> b!1017232 (= e!572287 (and tp_is_empty!23623 tp!70856))))

(assert (=> b!1017157 (= tp!70847 e!572287)))

(assert (= (and b!1017157 ((_ is Cons!21578) (t!30574 l!1114))) b!1017232))

(declare-fun b_lambda!15609 () Bool)

(assert (= b_lambda!15607 (or b!1017155 b_lambda!15609)))

(declare-fun bs!29561 () Bool)

(declare-fun d!121441 () Bool)

(assert (= bs!29561 (and d!121441 b!1017155)))

(declare-fun value!178 () B!1556)

(declare-datatypes ((Option!618 0))(
  ( (Some!617 (v!14465 B!1556)) (None!616) )
))
(declare-fun getValueByKey!567 (List!21582 (_ BitVec 64)) Option!618)

(assert (=> bs!29561 (= (dynLambda!1919 lambda!1108 (h!22777 keys!40)) (= (getValueByKey!567 l!1114 (h!22777 keys!40)) (Some!617 value!178)))))

(declare-fun m!938141 () Bool)

(assert (=> bs!29561 m!938141))

(assert (=> b!1017224 d!121441))

(declare-fun b_lambda!15611 () Bool)

(assert (= b_lambda!15605 (or b!1017154 b_lambda!15611)))

(declare-fun bs!29562 () Bool)

(declare-fun d!121443 () Bool)

(assert (= bs!29562 (and d!121443 b!1017154)))

(assert (=> bs!29562 (= (dynLambda!1919 lambda!1109 (h!22777 keys!40)) (= (getValueByKey!567 (Cons!21578 newHead!31 l!1114) (h!22777 keys!40)) (Some!617 value!178)))))

(declare-fun m!938143 () Bool)

(assert (=> bs!29562 m!938143))

(assert (=> b!1017216 d!121443))

(check-sat (not b!1017223) (not b!1017225) (not bs!29561) (not b_lambda!15609) (not b_lambda!15611) (not b!1017217) tp_is_empty!23623 (not bs!29562) (not b!1017232))
(check-sat)
