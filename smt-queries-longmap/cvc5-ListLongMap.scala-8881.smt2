; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108050 () Bool)

(assert start!108050)

(declare-fun b!1276057 () Bool)

(declare-fun e!728373 () Bool)

(declare-fun e!728374 () Bool)

(assert (=> b!1276057 (= e!728373 e!728374)))

(declare-fun res!847901 () Bool)

(assert (=> b!1276057 (=> res!847901 e!728374)))

(declare-datatypes ((B!2160 0))(
  ( (B!2161 (val!16676 Int)) )
))
(declare-datatypes ((tuple2!21442 0))(
  ( (tuple2!21443 (_1!10732 (_ BitVec 64)) (_2!10732 B!2160)) )
))
(declare-datatypes ((List!28630 0))(
  ( (Nil!28627) (Cons!28626 (h!29844 tuple2!21442) (t!42155 List!28630)) )
))
(declare-fun l!595 () List!28630)

(declare-fun isStrictlySorted!843 (List!28630) Bool)

(assert (=> b!1276057 (= res!847901 (not (isStrictlySorted!843 (t!42155 l!595))))))

(declare-fun res!847899 () Bool)

(assert (=> start!108050 (=> (not res!847899) (not e!728373))))

(assert (=> start!108050 (= res!847899 (isStrictlySorted!843 l!595))))

(assert (=> start!108050 e!728373))

(declare-fun e!728375 () Bool)

(assert (=> start!108050 e!728375))

(assert (=> start!108050 true))

(declare-fun b!1276056 () Bool)

(declare-fun res!847900 () Bool)

(assert (=> b!1276056 (=> (not res!847900) (not e!728373))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1276056 (= res!847900 (and (is-Cons!28626 l!595) (= (_1!10732 (h!29844 l!595)) key!173)))))

(declare-fun b!1276059 () Bool)

(declare-fun tp_is_empty!33203 () Bool)

(declare-fun tp!98027 () Bool)

(assert (=> b!1276059 (= e!728375 (and tp_is_empty!33203 tp!98027))))

(declare-fun b!1276058 () Bool)

(declare-fun containsKey!702 (List!28630 (_ BitVec 64)) Bool)

(assert (=> b!1276058 (= e!728374 (containsKey!702 (t!42155 l!595) key!173))))

(assert (= (and start!108050 res!847899) b!1276056))

(assert (= (and b!1276056 res!847900) b!1276057))

(assert (= (and b!1276057 (not res!847901)) b!1276058))

(assert (= (and start!108050 (is-Cons!28626 l!595)) b!1276059))

(declare-fun m!1172957 () Bool)

(assert (=> b!1276057 m!1172957))

(declare-fun m!1172959 () Bool)

(assert (=> start!108050 m!1172959))

(declare-fun m!1172961 () Bool)

(assert (=> b!1276058 m!1172961))

(push 1)

(assert (not start!108050))

(assert (not b!1276058))

(assert tp_is_empty!33203)

(assert (not b!1276057))

(assert (not b!1276059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140657 () Bool)

(declare-fun res!847923 () Bool)

(declare-fun e!728397 () Bool)

(assert (=> d!140657 (=> res!847923 e!728397)))

(assert (=> d!140657 (= res!847923 (and (is-Cons!28626 (t!42155 l!595)) (= (_1!10732 (h!29844 (t!42155 l!595))) key!173)))))

(assert (=> d!140657 (= (containsKey!702 (t!42155 l!595) key!173) e!728397)))

(declare-fun b!1276081 () Bool)

(declare-fun e!728399 () Bool)

(assert (=> b!1276081 (= e!728397 e!728399)))

(declare-fun res!847925 () Bool)

(assert (=> b!1276081 (=> (not res!847925) (not e!728399))))

(assert (=> b!1276081 (= res!847925 (and (or (not (is-Cons!28626 (t!42155 l!595))) (bvsle (_1!10732 (h!29844 (t!42155 l!595))) key!173)) (is-Cons!28626 (t!42155 l!595)) (bvslt (_1!10732 (h!29844 (t!42155 l!595))) key!173)))))

(declare-fun b!1276083 () Bool)

(assert (=> b!1276083 (= e!728399 (containsKey!702 (t!42155 (t!42155 l!595)) key!173))))

(assert (= (and d!140657 (not res!847923)) b!1276081))

(assert (= (and b!1276081 res!847925) b!1276083))

(declare-fun m!1172966 () Bool)

(assert (=> b!1276083 m!1172966))

(assert (=> b!1276058 d!140657))

(declare-fun d!140665 () Bool)

(declare-fun res!847937 () Bool)

(declare-fun e!728414 () Bool)

(assert (=> d!140665 (=> res!847937 e!728414)))

(assert (=> d!140665 (= res!847937 (or (is-Nil!28627 (t!42155 l!595)) (is-Nil!28627 (t!42155 (t!42155 l!595)))))))

(assert (=> d!140665 (= (isStrictlySorted!843 (t!42155 l!595)) e!728414)))

(declare-fun b!1276101 () Bool)

(declare-fun e!728416 () Bool)

(assert (=> b!1276101 (= e!728414 e!728416)))

(declare-fun res!847939 () Bool)

(assert (=> b!1276101 (=> (not res!847939) (not e!728416))))

(assert (=> b!1276101 (= res!847939 (bvslt (_1!10732 (h!29844 (t!42155 l!595))) (_1!10732 (h!29844 (t!42155 (t!42155 l!595))))))))

(declare-fun b!1276102 () Bool)

(assert (=> b!1276102 (= e!728416 (isStrictlySorted!843 (t!42155 (t!42155 l!595))))))

(assert (= (and d!140665 (not res!847937)) b!1276101))

(assert (= (and b!1276101 res!847939) b!1276102))

(declare-fun m!1172973 () Bool)

(assert (=> b!1276102 m!1172973))

(assert (=> b!1276057 d!140665))

(declare-fun d!140669 () Bool)

(declare-fun res!847942 () Bool)

(declare-fun e!728419 () Bool)

(assert (=> d!140669 (=> res!847942 e!728419)))

(assert (=> d!140669 (= res!847942 (or (is-Nil!28627 l!595) (is-Nil!28627 (t!42155 l!595))))))

(assert (=> d!140669 (= (isStrictlySorted!843 l!595) e!728419)))

(declare-fun b!1276105 () Bool)

(declare-fun e!728420 () Bool)

(assert (=> b!1276105 (= e!728419 e!728420)))

(declare-fun res!847943 () Bool)

(assert (=> b!1276105 (=> (not res!847943) (not e!728420))))

(assert (=> b!1276105 (= res!847943 (bvslt (_1!10732 (h!29844 l!595)) (_1!10732 (h!29844 (t!42155 l!595)))))))

(declare-fun b!1276106 () Bool)

(assert (=> b!1276106 (= e!728420 (isStrictlySorted!843 (t!42155 l!595)))))

(assert (= (and d!140669 (not res!847942)) b!1276105))

(assert (= (and b!1276105 res!847943) b!1276106))

(assert (=> b!1276106 m!1172957))

(assert (=> start!108050 d!140669))

(declare-fun b!1276116 () Bool)

(declare-fun e!728426 () Bool)

(declare-fun tp!98036 () Bool)

(assert (=> b!1276116 (= e!728426 (and tp_is_empty!33203 tp!98036))))

(assert (=> b!1276059 (= tp!98027 e!728426)))

(assert (= (and b!1276059 (is-Cons!28626 (t!42155 l!595))) b!1276116))

(push 1)

(assert (not b!1276083))

(assert (not b!1276106))

(assert (not b!1276116))

(assert (not b!1276102))

(assert tp_is_empty!33203)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

