; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87912 () Bool)

(assert start!87912)

(declare-fun b!1015400 () Bool)

(assert (=> b!1015400 true))

(assert (=> b!1015400 true))

(declare-fun b!1015402 () Bool)

(declare-fun e!571223 () Bool)

(declare-fun tp_is_empty!23551 () Bool)

(declare-fun tp!70656 () Bool)

(assert (=> b!1015402 (= e!571223 (and tp_is_empty!23551 tp!70656))))

(declare-fun b!1015401 () Bool)

(declare-fun e!571222 () Bool)

(declare-datatypes ((B!1484 0))(
  ( (B!1485 (val!11826 Int)) )
))
(declare-datatypes ((tuple2!15278 0))(
  ( (tuple2!15279 (_1!7650 (_ BitVec 64)) (_2!7650 B!1484)) )
))
(declare-datatypes ((List!21513 0))(
  ( (Nil!21510) (Cons!21509 (h!22707 tuple2!15278) (t!30505 List!21513)) )
))
(declare-fun l!1114 () List!21513)

(assert (=> b!1015401 (= e!571222 (= l!1114 Nil!21510))))

(declare-fun b!1015399 () Bool)

(declare-fun res!681119 () Bool)

(assert (=> b!1015399 (=> (not res!681119) (not e!571222))))

(declare-fun isEmpty!862 (List!21513) Bool)

(assert (=> b!1015399 (= res!681119 (not (isEmpty!862 l!1114)))))

(declare-fun res!681117 () Bool)

(assert (=> start!87912 (=> (not res!681117) (not e!571222))))

(declare-fun isStrictlySorted!593 (List!21513) Bool)

(assert (=> start!87912 (= res!681117 (isStrictlySorted!593 l!1114))))

(assert (=> start!87912 e!571222))

(assert (=> start!87912 e!571223))

(assert (=> start!87912 true))

(assert (=> start!87912 tp_is_empty!23551))

(declare-fun res!681118 () Bool)

(assert (=> b!1015400 (=> (not res!681118) (not e!571222))))

(declare-datatypes ((List!21514 0))(
  ( (Nil!21511) (Cons!21510 (h!22708 (_ BitVec 64)) (t!30506 List!21514)) )
))
(declare-fun keys!40 () List!21514)

(declare-fun lambda!911 () Int)

(declare-fun forall!263 (List!21514 Int) Bool)

(assert (=> b!1015400 (= res!681118 (forall!263 keys!40 lambda!911))))

(assert (= (and start!87912 res!681117) b!1015399))

(assert (= (and b!1015399 res!681119) b!1015400))

(assert (= (and b!1015400 res!681118) b!1015401))

(get-info :version)

(assert (= (and start!87912 ((_ is Cons!21509) l!1114)) b!1015402))

(declare-fun m!936955 () Bool)

(assert (=> b!1015399 m!936955))

(declare-fun m!936957 () Bool)

(assert (=> start!87912 m!936957))

(declare-fun m!936959 () Bool)

(assert (=> b!1015400 m!936959))

(check-sat tp_is_empty!23551 (not b!1015402) (not start!87912) (not b!1015399) (not b!1015400))
(check-sat)
(get-model)

(declare-fun d!120849 () Bool)

(declare-fun res!681152 () Bool)

(declare-fun e!571250 () Bool)

(assert (=> d!120849 (=> res!681152 e!571250)))

(assert (=> d!120849 (= res!681152 (or ((_ is Nil!21510) l!1114) ((_ is Nil!21510) (t!30505 l!1114))))))

(assert (=> d!120849 (= (isStrictlySorted!593 l!1114) e!571250)))

(declare-fun b!1015453 () Bool)

(declare-fun e!571251 () Bool)

(assert (=> b!1015453 (= e!571250 e!571251)))

(declare-fun res!681153 () Bool)

(assert (=> b!1015453 (=> (not res!681153) (not e!571251))))

(assert (=> b!1015453 (= res!681153 (bvslt (_1!7650 (h!22707 l!1114)) (_1!7650 (h!22707 (t!30505 l!1114)))))))

(declare-fun b!1015454 () Bool)

(assert (=> b!1015454 (= e!571251 (isStrictlySorted!593 (t!30505 l!1114)))))

(assert (= (and d!120849 (not res!681152)) b!1015453))

(assert (= (and b!1015453 res!681153) b!1015454))

(declare-fun m!936975 () Bool)

(assert (=> b!1015454 m!936975))

(assert (=> start!87912 d!120849))

(declare-fun d!120855 () Bool)

(assert (=> d!120855 (= (isEmpty!862 l!1114) ((_ is Nil!21510) l!1114))))

(assert (=> b!1015399 d!120855))

(declare-fun d!120861 () Bool)

(declare-fun res!681170 () Bool)

(declare-fun e!571268 () Bool)

(assert (=> d!120861 (=> res!681170 e!571268)))

(assert (=> d!120861 (= res!681170 ((_ is Nil!21511) keys!40))))

(assert (=> d!120861 (= (forall!263 keys!40 lambda!911) e!571268)))

(declare-fun b!1015471 () Bool)

(declare-fun e!571269 () Bool)

(assert (=> b!1015471 (= e!571268 e!571269)))

(declare-fun res!681171 () Bool)

(assert (=> b!1015471 (=> (not res!681171) (not e!571269))))

(declare-fun dynLambda!1895 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015471 (= res!681171 (dynLambda!1895 lambda!911 (h!22708 keys!40)))))

(declare-fun b!1015472 () Bool)

(assert (=> b!1015472 (= e!571269 (forall!263 (t!30506 keys!40) lambda!911))))

(assert (= (and d!120861 (not res!681170)) b!1015471))

(assert (= (and b!1015471 res!681171) b!1015472))

(declare-fun b_lambda!15413 () Bool)

(assert (=> (not b_lambda!15413) (not b!1015471)))

(declare-fun m!936985 () Bool)

(assert (=> b!1015471 m!936985))

(declare-fun m!936987 () Bool)

(assert (=> b!1015472 m!936987))

(assert (=> b!1015400 d!120861))

(declare-fun b!1015488 () Bool)

(declare-fun e!571279 () Bool)

(declare-fun tp!70670 () Bool)

(assert (=> b!1015488 (= e!571279 (and tp_is_empty!23551 tp!70670))))

(assert (=> b!1015402 (= tp!70656 e!571279)))

(assert (= (and b!1015402 ((_ is Cons!21509) (t!30505 l!1114))) b!1015488))

(declare-fun b_lambda!15417 () Bool)

(assert (= b_lambda!15413 (or b!1015400 b_lambda!15417)))

(declare-fun bs!29423 () Bool)

(declare-fun d!120865 () Bool)

(assert (= bs!29423 (and d!120865 b!1015400)))

(declare-fun value!178 () B!1484)

(declare-datatypes ((Option!591 0))(
  ( (Some!590 (v!14438 B!1484)) (None!589) )
))
(declare-fun getValueByKey!540 (List!21513 (_ BitVec 64)) Option!591)

(assert (=> bs!29423 (= (dynLambda!1895 lambda!911 (h!22708 keys!40)) (= (getValueByKey!540 l!1114 (h!22708 keys!40)) (Some!590 value!178)))))

(declare-fun m!936993 () Bool)

(assert (=> bs!29423 m!936993))

(assert (=> b!1015471 d!120865))

(check-sat (not b_lambda!15417) (not bs!29423) (not b!1015488) (not b!1015454) tp_is_empty!23551 (not b!1015472))
(check-sat)
