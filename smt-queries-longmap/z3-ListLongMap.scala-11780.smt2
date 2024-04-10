; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138376 () Bool)

(assert start!138376)

(declare-fun res!1083256 () Bool)

(declare-fun e!885702 () Bool)

(assert (=> start!138376 (=> (not res!1083256) (not e!885702))))

(declare-datatypes ((B!3022 0))(
  ( (B!3023 (val!19873 Int)) )
))
(declare-datatypes ((tuple2!25914 0))(
  ( (tuple2!25915 (_1!12968 (_ BitVec 64)) (_2!12968 B!3022)) )
))
(declare-datatypes ((List!36993 0))(
  ( (Nil!36990) (Cons!36989 (h!38532 tuple2!25914) (t!51923 List!36993)) )
))
(declare-fun l!636 () List!36993)

(declare-fun isStrictlySorted!1215 (List!36993) Bool)

(assert (=> start!138376 (= res!1083256 (isStrictlySorted!1215 l!636))))

(assert (=> start!138376 e!885702))

(declare-fun e!885701 () Bool)

(assert (=> start!138376 e!885701))

(assert (=> start!138376 true))

(declare-fun b!1586136 () Bool)

(declare-fun res!1083257 () Bool)

(assert (=> b!1586136 (=> (not res!1083257) (not e!885702))))

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1586136 (= res!1083257 (and (or (not ((_ is Cons!36989) l!636)) (not (= (_1!12968 (h!38532 l!636)) key!185))) (or (not ((_ is Cons!36989) l!636)) (bvsle (_1!12968 (h!38532 l!636)) key!185)) ((_ is Cons!36989) l!636) (bvslt (_1!12968 (h!38532 l!636)) key!185)))))

(declare-fun b!1586137 () Bool)

(assert (=> b!1586137 (= e!885702 (not (isStrictlySorted!1215 (t!51923 l!636))))))

(declare-fun b!1586138 () Bool)

(declare-fun tp_is_empty!39555 () Bool)

(declare-fun tp!115365 () Bool)

(assert (=> b!1586138 (= e!885701 (and tp_is_empty!39555 tp!115365))))

(assert (= (and start!138376 res!1083256) b!1586136))

(assert (= (and b!1586136 res!1083257) b!1586137))

(assert (= (and start!138376 ((_ is Cons!36989) l!636)) b!1586138))

(declare-fun m!1454665 () Bool)

(assert (=> start!138376 m!1454665))

(declare-fun m!1454667 () Bool)

(assert (=> b!1586137 m!1454667))

(check-sat (not start!138376) (not b!1586137) (not b!1586138) tp_is_empty!39555)
(check-sat)
(get-model)

(declare-fun d!167870 () Bool)

(declare-fun res!1083272 () Bool)

(declare-fun e!885717 () Bool)

(assert (=> d!167870 (=> res!1083272 e!885717)))

(assert (=> d!167870 (= res!1083272 (or ((_ is Nil!36990) l!636) ((_ is Nil!36990) (t!51923 l!636))))))

(assert (=> d!167870 (= (isStrictlySorted!1215 l!636) e!885717)))

(declare-fun b!1586156 () Bool)

(declare-fun e!885719 () Bool)

(assert (=> b!1586156 (= e!885717 e!885719)))

(declare-fun res!1083274 () Bool)

(assert (=> b!1586156 (=> (not res!1083274) (not e!885719))))

(assert (=> b!1586156 (= res!1083274 (bvslt (_1!12968 (h!38532 l!636)) (_1!12968 (h!38532 (t!51923 l!636)))))))

(declare-fun b!1586158 () Bool)

(assert (=> b!1586158 (= e!885719 (isStrictlySorted!1215 (t!51923 l!636)))))

(assert (= (and d!167870 (not res!1083272)) b!1586156))

(assert (= (and b!1586156 res!1083274) b!1586158))

(assert (=> b!1586158 m!1454667))

(assert (=> start!138376 d!167870))

(declare-fun d!167873 () Bool)

(declare-fun res!1083276 () Bool)

(declare-fun e!885721 () Bool)

(assert (=> d!167873 (=> res!1083276 e!885721)))

(assert (=> d!167873 (= res!1083276 (or ((_ is Nil!36990) (t!51923 l!636)) ((_ is Nil!36990) (t!51923 (t!51923 l!636)))))))

(assert (=> d!167873 (= (isStrictlySorted!1215 (t!51923 l!636)) e!885721)))

(declare-fun b!1586160 () Bool)

(declare-fun e!885722 () Bool)

(assert (=> b!1586160 (= e!885721 e!885722)))

(declare-fun res!1083277 () Bool)

(assert (=> b!1586160 (=> (not res!1083277) (not e!885722))))

(assert (=> b!1586160 (= res!1083277 (bvslt (_1!12968 (h!38532 (t!51923 l!636))) (_1!12968 (h!38532 (t!51923 (t!51923 l!636))))))))

(declare-fun b!1586161 () Bool)

(assert (=> b!1586161 (= e!885722 (isStrictlySorted!1215 (t!51923 (t!51923 l!636))))))

(assert (= (and d!167873 (not res!1083276)) b!1586160))

(assert (= (and b!1586160 res!1083277) b!1586161))

(declare-fun m!1454675 () Bool)

(assert (=> b!1586161 m!1454675))

(assert (=> b!1586137 d!167873))

(declare-fun b!1586172 () Bool)

(declare-fun e!885729 () Bool)

(declare-fun tp!115373 () Bool)

(assert (=> b!1586172 (= e!885729 (and tp_is_empty!39555 tp!115373))))

(assert (=> b!1586138 (= tp!115365 e!885729)))

(assert (= (and b!1586138 ((_ is Cons!36989) (t!51923 l!636))) b!1586172))

(check-sat (not b!1586161) (not b!1586158) (not b!1586172) tp_is_empty!39555)
(check-sat)
