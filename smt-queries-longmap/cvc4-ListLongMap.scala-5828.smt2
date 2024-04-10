; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75176 () Bool)

(assert start!75176)

(declare-fun res!601513 () Bool)

(declare-fun e!493053 () Bool)

(assert (=> start!75176 (=> (not res!601513) (not e!493053))))

(declare-datatypes ((B!1290 0))(
  ( (B!1291 (val!8951 Int)) )
))
(declare-datatypes ((tuple2!11896 0))(
  ( (tuple2!11897 (_1!5959 (_ BitVec 64)) (_2!5959 B!1290)) )
))
(declare-datatypes ((List!17667 0))(
  ( (Nil!17664) (Cons!17663 (h!18794 tuple2!11896) (t!24944 List!17667)) )
))
(declare-fun l!906 () List!17667)

(declare-fun isStrictlySorted!485 (List!17667) Bool)

(assert (=> start!75176 (= res!601513 (isStrictlySorted!485 l!906))))

(assert (=> start!75176 e!493053))

(declare-fun e!493052 () Bool)

(assert (=> start!75176 e!493052))

(assert (=> start!75176 true))

(declare-fun b!885857 () Bool)

(declare-fun res!601512 () Bool)

(assert (=> b!885857 (=> (not res!601512) (not e!493053))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885857 (= res!601512 (and (is-Cons!17663 l!906) (bvslt (_1!5959 (h!18794 l!906)) key1!49)))))

(declare-fun b!885858 () Bool)

(assert (=> b!885858 (= e!493053 (not (isStrictlySorted!485 (t!24944 l!906))))))

(declare-fun b!885859 () Bool)

(declare-fun tp_is_empty!17801 () Bool)

(declare-fun tp!54335 () Bool)

(assert (=> b!885859 (= e!493052 (and tp_is_empty!17801 tp!54335))))

(assert (= (and start!75176 res!601513) b!885857))

(assert (= (and b!885857 res!601512) b!885858))

(assert (= (and start!75176 (is-Cons!17663 l!906)) b!885859))

(declare-fun m!825873 () Bool)

(assert (=> start!75176 m!825873))

(declare-fun m!825875 () Bool)

(assert (=> b!885858 m!825875))

(push 1)

(assert (not start!75176))

(assert (not b!885858))

(assert (not b!885859))

(assert tp_is_empty!17801)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109463 () Bool)

(declare-fun res!601534 () Bool)

(declare-fun e!493080 () Bool)

(assert (=> d!109463 (=> res!601534 e!493080)))

(assert (=> d!109463 (= res!601534 (or (is-Nil!17664 l!906) (is-Nil!17664 (t!24944 l!906))))))

(assert (=> d!109463 (= (isStrictlySorted!485 l!906) e!493080)))

(declare-fun b!885890 () Bool)

(declare-fun e!493081 () Bool)

(assert (=> b!885890 (= e!493080 e!493081)))

(declare-fun res!601535 () Bool)

(assert (=> b!885890 (=> (not res!601535) (not e!493081))))

(assert (=> b!885890 (= res!601535 (bvslt (_1!5959 (h!18794 l!906)) (_1!5959 (h!18794 (t!24944 l!906)))))))

(declare-fun b!885891 () Bool)

(assert (=> b!885891 (= e!493081 (isStrictlySorted!485 (t!24944 l!906)))))

(assert (= (and d!109463 (not res!601534)) b!885890))

(assert (= (and b!885890 res!601535) b!885891))

(assert (=> b!885891 m!825875))

(assert (=> start!75176 d!109463))

(declare-fun d!109467 () Bool)

(declare-fun res!601536 () Bool)

(declare-fun e!493082 () Bool)

