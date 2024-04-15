; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71966 () Bool)

(assert start!71966)

(declare-fun res!568857 () Bool)

(declare-fun e!466378 () Bool)

(assert (=> start!71966 (=> (not res!568857) (not e!466378))))

(declare-datatypes ((B!1178 0))(
  ( (B!1179 (val!7671 Int)) )
))
(declare-datatypes ((tuple2!10210 0))(
  ( (tuple2!10211 (_1!5116 (_ BitVec 64)) (_2!5116 B!1178)) )
))
(declare-datatypes ((List!15975 0))(
  ( (Nil!15972) (Cons!15971 (h!17102 tuple2!10210) (t!22337 List!15975)) )
))
(declare-fun l!390 () List!15975)

(declare-fun isStrictlySorted!442 (List!15975) Bool)

(assert (=> start!71966 (= res!568857 (isStrictlySorted!442 l!390))))

(assert (=> start!71966 e!466378))

(declare-fun e!466379 () Bool)

(assert (=> start!71966 e!466379))

(declare-fun b!836020 () Bool)

(declare-fun res!568858 () Bool)

(assert (=> b!836020 (=> (not res!568858) (not e!466378))))

(get-info :version)

(assert (=> b!836020 (= res!568858 ((_ is Cons!15971) l!390))))

(declare-fun b!836021 () Bool)

(assert (=> b!836021 (= e!466378 (not (isStrictlySorted!442 (t!22337 l!390))))))

(declare-fun b!836022 () Bool)

(declare-fun tp_is_empty!15247 () Bool)

(declare-fun tp!47405 () Bool)

(assert (=> b!836022 (= e!466379 (and tp_is_empty!15247 tp!47405))))

(assert (= (and start!71966 res!568857) b!836020))

(assert (= (and b!836020 res!568858) b!836021))

(assert (= (and start!71966 ((_ is Cons!15971) l!390)) b!836022))

(declare-fun m!780887 () Bool)

(assert (=> start!71966 m!780887))

(declare-fun m!780889 () Bool)

(assert (=> b!836021 m!780889))

(check-sat (not start!71966) (not b!836021) (not b!836022) tp_is_empty!15247)
(check-sat)
(get-model)

(declare-fun d!107360 () Bool)

(declare-fun res!568883 () Bool)

(declare-fun e!466404 () Bool)

(assert (=> d!107360 (=> res!568883 e!466404)))

(assert (=> d!107360 (= res!568883 (or ((_ is Nil!15972) l!390) ((_ is Nil!15972) (t!22337 l!390))))))

(assert (=> d!107360 (= (isStrictlySorted!442 l!390) e!466404)))

(declare-fun b!836053 () Bool)

(declare-fun e!466405 () Bool)

(assert (=> b!836053 (= e!466404 e!466405)))

(declare-fun res!568884 () Bool)

(assert (=> b!836053 (=> (not res!568884) (not e!466405))))

(assert (=> b!836053 (= res!568884 (bvslt (_1!5116 (h!17102 l!390)) (_1!5116 (h!17102 (t!22337 l!390)))))))

(declare-fun b!836054 () Bool)

(assert (=> b!836054 (= e!466405 (isStrictlySorted!442 (t!22337 l!390)))))

(assert (= (and d!107360 (not res!568883)) b!836053))

(assert (= (and b!836053 res!568884) b!836054))

(assert (=> b!836054 m!780889))

(assert (=> start!71966 d!107360))

(declare-fun d!107367 () Bool)

(declare-fun res!568889 () Bool)

(declare-fun e!466410 () Bool)

(assert (=> d!107367 (=> res!568889 e!466410)))

(assert (=> d!107367 (= res!568889 (or ((_ is Nil!15972) (t!22337 l!390)) ((_ is Nil!15972) (t!22337 (t!22337 l!390)))))))

(assert (=> d!107367 (= (isStrictlySorted!442 (t!22337 l!390)) e!466410)))

(declare-fun b!836059 () Bool)

(declare-fun e!466411 () Bool)

(assert (=> b!836059 (= e!466410 e!466411)))

(declare-fun res!568890 () Bool)

(assert (=> b!836059 (=> (not res!568890) (not e!466411))))

(assert (=> b!836059 (= res!568890 (bvslt (_1!5116 (h!17102 (t!22337 l!390))) (_1!5116 (h!17102 (t!22337 (t!22337 l!390))))))))

(declare-fun b!836060 () Bool)

(assert (=> b!836060 (= e!466411 (isStrictlySorted!442 (t!22337 (t!22337 l!390))))))

(assert (= (and d!107367 (not res!568889)) b!836059))

(assert (= (and b!836059 res!568890) b!836060))

(declare-fun m!780901 () Bool)

(assert (=> b!836060 m!780901))

(assert (=> b!836021 d!107367))

(declare-fun b!836077 () Bool)

(declare-fun e!466422 () Bool)

(declare-fun tp!47418 () Bool)

(assert (=> b!836077 (= e!466422 (and tp_is_empty!15247 tp!47418))))

(assert (=> b!836022 (= tp!47405 e!466422)))

(assert (= (and b!836022 ((_ is Cons!15971) (t!22337 l!390))) b!836077))

(check-sat (not b!836054) (not b!836060) (not b!836077) tp_is_empty!15247)
(check-sat)
