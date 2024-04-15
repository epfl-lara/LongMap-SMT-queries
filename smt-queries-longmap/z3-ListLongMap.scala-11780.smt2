; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138338 () Bool)

(assert start!138338)

(declare-fun res!1083120 () Bool)

(declare-fun e!885494 () Bool)

(assert (=> start!138338 (=> (not res!1083120) (not e!885494))))

(declare-datatypes ((B!3020 0))(
  ( (B!3021 (val!19872 Int)) )
))
(declare-datatypes ((tuple2!25980 0))(
  ( (tuple2!25981 (_1!13001 (_ BitVec 64)) (_2!13001 B!3020)) )
))
(declare-datatypes ((List!37033 0))(
  ( (Nil!37030) (Cons!37029 (h!38573 tuple2!25980) (t!51955 List!37033)) )
))
(declare-fun l!636 () List!37033)

(declare-fun isStrictlySorted!1212 (List!37033) Bool)

(assert (=> start!138338 (= res!1083120 (isStrictlySorted!1212 l!636))))

(assert (=> start!138338 e!885494))

(declare-fun e!885495 () Bool)

(assert (=> start!138338 e!885495))

(assert (=> start!138338 true))

(declare-fun b!1585811 () Bool)

(declare-fun res!1083119 () Bool)

(assert (=> b!1585811 (=> (not res!1083119) (not e!885494))))

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585811 (= res!1083119 (and (or (not ((_ is Cons!37029) l!636)) (not (= (_1!13001 (h!38573 l!636)) key!185))) (or (not ((_ is Cons!37029) l!636)) (bvsle (_1!13001 (h!38573 l!636)) key!185)) ((_ is Cons!37029) l!636) (bvslt (_1!13001 (h!38573 l!636)) key!185)))))

(declare-fun b!1585812 () Bool)

(assert (=> b!1585812 (= e!885494 (not (isStrictlySorted!1212 (t!51955 l!636))))))

(declare-fun b!1585813 () Bool)

(declare-fun tp_is_empty!39553 () Bool)

(declare-fun tp!115362 () Bool)

(assert (=> b!1585813 (= e!885495 (and tp_is_empty!39553 tp!115362))))

(assert (= (and start!138338 res!1083120) b!1585811))

(assert (= (and b!1585811 res!1083119) b!1585812))

(assert (= (and start!138338 ((_ is Cons!37029) l!636)) b!1585813))

(declare-fun m!1453779 () Bool)

(assert (=> start!138338 m!1453779))

(declare-fun m!1453781 () Bool)

(assert (=> b!1585812 m!1453781))

(check-sat (not b!1585812) (not start!138338) (not b!1585813) tp_is_empty!39553)
(check-sat)
(get-model)

(declare-fun d!167629 () Bool)

(declare-fun res!1083141 () Bool)

(declare-fun e!885516 () Bool)

(assert (=> d!167629 (=> res!1083141 e!885516)))

(assert (=> d!167629 (= res!1083141 (or ((_ is Nil!37030) (t!51955 l!636)) ((_ is Nil!37030) (t!51955 (t!51955 l!636)))))))

(assert (=> d!167629 (= (isStrictlySorted!1212 (t!51955 l!636)) e!885516)))

(declare-fun b!1585840 () Bool)

(declare-fun e!885518 () Bool)

(assert (=> b!1585840 (= e!885516 e!885518)))

(declare-fun res!1083143 () Bool)

(assert (=> b!1585840 (=> (not res!1083143) (not e!885518))))

(assert (=> b!1585840 (= res!1083143 (bvslt (_1!13001 (h!38573 (t!51955 l!636))) (_1!13001 (h!38573 (t!51955 (t!51955 l!636))))))))

(declare-fun b!1585841 () Bool)

(assert (=> b!1585841 (= e!885518 (isStrictlySorted!1212 (t!51955 (t!51955 l!636))))))

(assert (= (and d!167629 (not res!1083141)) b!1585840))

(assert (= (and b!1585840 res!1083143) b!1585841))

(declare-fun m!1453793 () Bool)

(assert (=> b!1585841 m!1453793))

(assert (=> b!1585812 d!167629))

(declare-fun d!167632 () Bool)

(declare-fun res!1083145 () Bool)

(declare-fun e!885520 () Bool)

(assert (=> d!167632 (=> res!1083145 e!885520)))

(assert (=> d!167632 (= res!1083145 (or ((_ is Nil!37030) l!636) ((_ is Nil!37030) (t!51955 l!636))))))

(assert (=> d!167632 (= (isStrictlySorted!1212 l!636) e!885520)))

(declare-fun b!1585844 () Bool)

(declare-fun e!885522 () Bool)

(assert (=> b!1585844 (= e!885520 e!885522)))

(declare-fun res!1083147 () Bool)

(assert (=> b!1585844 (=> (not res!1083147) (not e!885522))))

(assert (=> b!1585844 (= res!1083147 (bvslt (_1!13001 (h!38573 l!636)) (_1!13001 (h!38573 (t!51955 l!636)))))))

(declare-fun b!1585846 () Bool)

(assert (=> b!1585846 (= e!885522 (isStrictlySorted!1212 (t!51955 l!636)))))

(assert (= (and d!167632 (not res!1083145)) b!1585844))

(assert (= (and b!1585844 res!1083147) b!1585846))

(assert (=> b!1585846 m!1453781))

(assert (=> start!138338 d!167632))

(declare-fun b!1585856 () Bool)

(declare-fun e!885528 () Bool)

(declare-fun tp!115373 () Bool)

(assert (=> b!1585856 (= e!885528 (and tp_is_empty!39553 tp!115373))))

(assert (=> b!1585813 (= tp!115362 e!885528)))

(assert (= (and b!1585813 ((_ is Cons!37029) (t!51955 l!636))) b!1585856))

(check-sat (not b!1585841) (not b!1585846) (not b!1585856) tp_is_empty!39553)
(check-sat)
