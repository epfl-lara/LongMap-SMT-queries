; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5196 () Bool)

(assert start!5196)

(declare-fun res!22872 () Bool)

(declare-fun e!24057 () Bool)

(assert (=> start!5196 (=> (not res!22872) (not e!24057))))

(declare-datatypes ((B!784 0))(
  ( (B!785 (val!892 Int)) )
))
(declare-fun b!99 () B!784)

(declare-datatypes ((tuple2!1444 0))(
  ( (tuple2!1445 (_1!733 (_ BitVec 64)) (_2!733 B!784)) )
))
(declare-datatypes ((List!1002 0))(
  ( (Nil!999) (Cons!998 (h!1566 tuple2!1444) (t!3835 List!1002)) )
))
(declare-datatypes ((ListLongMap!1021 0))(
  ( (ListLongMap!1022 (toList!526 List!1002)) )
))
(declare-fun lm!264 () ListLongMap!1021)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!477 (List!1002 tuple2!1444) Bool)

(assert (=> start!5196 (= res!22872 (contains!477 (toList!526 lm!264) (tuple2!1445 a!526 b!99)))))

(assert (=> start!5196 e!24057))

(declare-fun e!24058 () Bool)

(declare-fun inv!1692 (ListLongMap!1021) Bool)

(assert (=> start!5196 (and (inv!1692 lm!264) e!24058)))

(assert (=> start!5196 true))

(declare-fun tp_is_empty!1707 () Bool)

(assert (=> start!5196 tp_is_empty!1707))

(declare-fun b!37905 () Bool)

(declare-fun isStrictlySorted!198 (List!1002) Bool)

(assert (=> b!37905 (= e!24057 (not (isStrictlySorted!198 (toList!526 lm!264))))))

(declare-fun containsKey!61 (List!1002 (_ BitVec 64)) Bool)

(assert (=> b!37905 (containsKey!61 (toList!526 lm!264) a!526)))

(declare-datatypes ((Unit!877 0))(
  ( (Unit!878) )
))
(declare-fun lt!13940 () Unit!877)

(declare-fun lemmaContainsTupleThenContainsKey!5 (List!1002 (_ BitVec 64) B!784) Unit!877)

(assert (=> b!37905 (= lt!13940 (lemmaContainsTupleThenContainsKey!5 (toList!526 lm!264) a!526 b!99))))

(declare-fun b!37906 () Bool)

(declare-fun tp!5627 () Bool)

(assert (=> b!37906 (= e!24058 tp!5627)))

(assert (= (and start!5196 res!22872) b!37905))

(assert (= start!5196 b!37906))

(declare-fun m!30611 () Bool)

(assert (=> start!5196 m!30611))

(declare-fun m!30613 () Bool)

(assert (=> start!5196 m!30613))

(declare-fun m!30615 () Bool)

(assert (=> b!37905 m!30615))

(declare-fun m!30617 () Bool)

(assert (=> b!37905 m!30617))

(declare-fun m!30619 () Bool)

(assert (=> b!37905 m!30619))

(check-sat (not start!5196) (not b!37905) (not b!37906) tp_is_empty!1707)
(check-sat)
(get-model)

(declare-fun lt!13949 () Bool)

(declare-fun d!6123 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!23 (List!1002) (InoxSet tuple2!1444))

(assert (=> d!6123 (= lt!13949 (select (content!23 (toList!526 lm!264)) (tuple2!1445 a!526 b!99)))))

(declare-fun e!24082 () Bool)

(assert (=> d!6123 (= lt!13949 e!24082)))

(declare-fun res!22893 () Bool)

(assert (=> d!6123 (=> (not res!22893) (not e!24082))))

(get-info :version)

(assert (=> d!6123 (= res!22893 ((_ is Cons!998) (toList!526 lm!264)))))

(assert (=> d!6123 (= (contains!477 (toList!526 lm!264) (tuple2!1445 a!526 b!99)) lt!13949)))

(declare-fun b!37929 () Bool)

(declare-fun e!24081 () Bool)

(assert (=> b!37929 (= e!24082 e!24081)))

(declare-fun res!22892 () Bool)

(assert (=> b!37929 (=> res!22892 e!24081)))

(assert (=> b!37929 (= res!22892 (= (h!1566 (toList!526 lm!264)) (tuple2!1445 a!526 b!99)))))

(declare-fun b!37930 () Bool)

(assert (=> b!37930 (= e!24081 (contains!477 (t!3835 (toList!526 lm!264)) (tuple2!1445 a!526 b!99)))))

(assert (= (and d!6123 res!22893) b!37929))

(assert (= (and b!37929 (not res!22892)) b!37930))

(declare-fun m!30639 () Bool)

(assert (=> d!6123 m!30639))

(declare-fun m!30641 () Bool)

(assert (=> d!6123 m!30641))

(declare-fun m!30643 () Bool)

(assert (=> b!37930 m!30643))

(assert (=> start!5196 d!6123))

(declare-fun d!6133 () Bool)

(assert (=> d!6133 (= (inv!1692 lm!264) (isStrictlySorted!198 (toList!526 lm!264)))))

(declare-fun bs!1511 () Bool)

(assert (= bs!1511 d!6133))

(assert (=> bs!1511 m!30615))

(assert (=> start!5196 d!6133))

(declare-fun d!6135 () Bool)

(declare-fun res!22916 () Bool)

(declare-fun e!24105 () Bool)

(assert (=> d!6135 (=> res!22916 e!24105)))

(assert (=> d!6135 (= res!22916 (or ((_ is Nil!999) (toList!526 lm!264)) ((_ is Nil!999) (t!3835 (toList!526 lm!264)))))))

(assert (=> d!6135 (= (isStrictlySorted!198 (toList!526 lm!264)) e!24105)))

(declare-fun b!37953 () Bool)

(declare-fun e!24106 () Bool)

(assert (=> b!37953 (= e!24105 e!24106)))

(declare-fun res!22917 () Bool)

(assert (=> b!37953 (=> (not res!22917) (not e!24106))))

(assert (=> b!37953 (= res!22917 (bvslt (_1!733 (h!1566 (toList!526 lm!264))) (_1!733 (h!1566 (t!3835 (toList!526 lm!264))))))))

(declare-fun b!37954 () Bool)

(assert (=> b!37954 (= e!24106 (isStrictlySorted!198 (t!3835 (toList!526 lm!264))))))

(assert (= (and d!6135 (not res!22916)) b!37953))

(assert (= (and b!37953 res!22917) b!37954))

(declare-fun m!30651 () Bool)

(assert (=> b!37954 m!30651))

(assert (=> b!37905 d!6135))

(declare-fun d!6143 () Bool)

(declare-fun res!22928 () Bool)

(declare-fun e!24120 () Bool)

(assert (=> d!6143 (=> res!22928 e!24120)))

(assert (=> d!6143 (= res!22928 (and ((_ is Cons!998) (toList!526 lm!264)) (= (_1!733 (h!1566 (toList!526 lm!264))) a!526)))))

(assert (=> d!6143 (= (containsKey!61 (toList!526 lm!264) a!526) e!24120)))

(declare-fun b!37970 () Bool)

(declare-fun e!24121 () Bool)

(assert (=> b!37970 (= e!24120 e!24121)))

(declare-fun res!22929 () Bool)

(assert (=> b!37970 (=> (not res!22929) (not e!24121))))

(assert (=> b!37970 (= res!22929 (and (or (not ((_ is Cons!998) (toList!526 lm!264))) (bvsle (_1!733 (h!1566 (toList!526 lm!264))) a!526)) ((_ is Cons!998) (toList!526 lm!264)) (bvslt (_1!733 (h!1566 (toList!526 lm!264))) a!526)))))

(declare-fun b!37971 () Bool)

(assert (=> b!37971 (= e!24121 (containsKey!61 (t!3835 (toList!526 lm!264)) a!526))))

(assert (= (and d!6143 (not res!22928)) b!37970))

(assert (= (and b!37970 res!22929) b!37971))

(declare-fun m!30657 () Bool)

(assert (=> b!37971 m!30657))

(assert (=> b!37905 d!6143))

(declare-fun d!6147 () Bool)

(assert (=> d!6147 (containsKey!61 (toList!526 lm!264) a!526)))

(declare-fun lt!13961 () Unit!877)

(declare-fun choose!240 (List!1002 (_ BitVec 64) B!784) Unit!877)

(assert (=> d!6147 (= lt!13961 (choose!240 (toList!526 lm!264) a!526 b!99))))

(declare-fun e!24130 () Bool)

(assert (=> d!6147 e!24130))

(declare-fun res!22938 () Bool)

(assert (=> d!6147 (=> (not res!22938) (not e!24130))))

(assert (=> d!6147 (= res!22938 (isStrictlySorted!198 (toList!526 lm!264)))))

(assert (=> d!6147 (= (lemmaContainsTupleThenContainsKey!5 (toList!526 lm!264) a!526 b!99) lt!13961)))

(declare-fun b!37980 () Bool)

(assert (=> b!37980 (= e!24130 (contains!477 (toList!526 lm!264) (tuple2!1445 a!526 b!99)))))

