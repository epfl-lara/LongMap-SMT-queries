; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106690 () Bool)

(assert start!106690)

(declare-fun b!1267044 () Bool)

(declare-fun res!843269 () Bool)

(declare-fun e!721698 () Bool)

(assert (=> b!1267044 (=> (not res!843269) (not e!721698))))

(declare-datatypes ((B!1986 0))(
  ( (B!1987 (val!16328 Int)) )
))
(declare-datatypes ((tuple2!21184 0))(
  ( (tuple2!21185 (_1!10603 (_ BitVec 64)) (_2!10603 B!1986)) )
))
(declare-datatypes ((List!28356 0))(
  ( (Nil!28353) (Cons!28352 (h!29570 tuple2!21184) (t!41869 List!28356)) )
))
(declare-fun l!706 () List!28356)

(declare-fun isStrictlySorted!783 (List!28356) Bool)

(assert (=> b!1267044 (= res!843269 (isStrictlySorted!783 (t!41869 l!706)))))

(declare-fun b!1267045 () Bool)

(declare-fun e!721697 () Bool)

(declare-fun tp_is_empty!32519 () Bool)

(declare-fun tp!96380 () Bool)

(assert (=> b!1267045 (= e!721697 (and tp_is_empty!32519 tp!96380))))

(declare-fun b!1267046 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!654 (List!28356 (_ BitVec 64)) Bool)

(assert (=> b!1267046 (= e!721698 (containsKey!654 (t!41869 l!706) key1!31))))

(declare-fun res!843267 () Bool)

(assert (=> start!106690 (=> (not res!843267) (not e!721698))))

(assert (=> start!106690 (= res!843267 (isStrictlySorted!783 l!706))))

(assert (=> start!106690 e!721698))

(assert (=> start!106690 e!721697))

(assert (=> start!106690 true))

(declare-fun b!1267047 () Bool)

(declare-fun res!843268 () Bool)

(assert (=> b!1267047 (=> (not res!843268) (not e!721698))))

(assert (=> b!1267047 (= res!843268 (not (containsKey!654 l!706 key1!31)))))

(declare-fun b!1267048 () Bool)

(declare-fun res!843266 () Bool)

(assert (=> b!1267048 (=> (not res!843266) (not e!721698))))

(assert (=> b!1267048 (= res!843266 (is-Cons!28352 l!706))))

(assert (= (and start!106690 res!843267) b!1267047))

(assert (= (and b!1267047 res!843268) b!1267048))

(assert (= (and b!1267048 res!843266) b!1267044))

(assert (= (and b!1267044 res!843269) b!1267046))

(assert (= (and start!106690 (is-Cons!28352 l!706)) b!1267045))

(declare-fun m!1167341 () Bool)

(assert (=> b!1267044 m!1167341))

(declare-fun m!1167343 () Bool)

(assert (=> b!1267046 m!1167343))

(declare-fun m!1167345 () Bool)

(assert (=> start!106690 m!1167345))

(declare-fun m!1167347 () Bool)

(assert (=> b!1267047 m!1167347))

(push 1)

(assert (not start!106690))

(assert (not b!1267047))

(assert (not b!1267046))

(assert (not b!1267045))

(assert tp_is_empty!32519)

(assert (not b!1267044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139419 () Bool)

(declare-fun res!843288 () Bool)

(declare-fun e!721717 () Bool)

(assert (=> d!139419 (=> res!843288 e!721717)))

(assert (=> d!139419 (= res!843288 (or (is-Nil!28353 l!706) (is-Nil!28353 (t!41869 l!706))))))

(assert (=> d!139419 (= (isStrictlySorted!783 l!706) e!721717)))

(declare-fun b!1267067 () Bool)

(declare-fun e!721718 () Bool)

(assert (=> b!1267067 (= e!721717 e!721718)))

(declare-fun res!843289 () Bool)

(assert (=> b!1267067 (=> (not res!843289) (not e!721718))))

(assert (=> b!1267067 (= res!843289 (bvslt (_1!10603 (h!29570 l!706)) (_1!10603 (h!29570 (t!41869 l!706)))))))

(declare-fun b!1267068 () Bool)

(assert (=> b!1267068 (= e!721718 (isStrictlySorted!783 (t!41869 l!706)))))

(assert (= (and d!139419 (not res!843288)) b!1267067))

(assert (= (and b!1267067 res!843289) b!1267068))

(assert (=> b!1267068 m!1167341))

(assert (=> start!106690 d!139419))

(declare-fun d!139427 () Bool)

(declare-fun res!843308 () Bool)

(declare-fun e!721737 () Bool)

(assert (=> d!139427 (=> res!843308 e!721737)))

(assert (=> d!139427 (= res!843308 (and (is-Cons!28352 l!706) (= (_1!10603 (h!29570 l!706)) key1!31)))))

(assert (=> d!139427 (= (containsKey!654 l!706 key1!31) e!721737)))

(declare-fun b!1267087 () Bool)

(declare-fun e!721738 () Bool)

(assert (=> b!1267087 (= e!721737 e!721738)))

(declare-fun res!843309 () Bool)

(assert (=> b!1267087 (=> (not res!843309) (not e!721738))))

(assert (=> b!1267087 (= res!843309 (and (or (not (is-Cons!28352 l!706)) (bvsle (_1!10603 (h!29570 l!706)) key1!31)) (is-Cons!28352 l!706) (bvslt (_1!10603 (h!29570 l!706)) key1!31)))))

(declare-fun b!1267088 () Bool)

(assert (=> b!1267088 (= e!721738 (containsKey!654 (t!41869 l!706) key1!31))))

(assert (= (and d!139427 (not res!843308)) b!1267087))

(assert (= (and b!1267087 res!843309) b!1267088))

(assert (=> b!1267088 m!1167343))

(assert (=> b!1267047 d!139427))

(declare-fun d!139435 () Bool)

(declare-fun res!843314 () Bool)

(declare-fun e!721743 () Bool)

(assert (=> d!139435 (=> res!843314 e!721743)))

(assert (=> d!139435 (= res!843314 (or (is-Nil!28353 (t!41869 l!706)) (is-Nil!28353 (t!41869 (t!41869 l!706)))))))

(assert (=> d!139435 (= (isStrictlySorted!783 (t!41869 l!706)) e!721743)))

(declare-fun b!1267093 () Bool)

(declare-fun e!721744 () Bool)

(assert (=> b!1267093 (= e!721743 e!721744)))

(declare-fun res!843315 () Bool)

(assert (=> b!1267093 (=> (not res!843315) (not e!721744))))

(assert (=> b!1267093 (= res!843315 (bvslt (_1!10603 (h!29570 (t!41869 l!706))) (_1!10603 (h!29570 (t!41869 (t!41869 l!706))))))))

(declare-fun b!1267094 () Bool)

(assert (=> b!1267094 (= e!721744 (isStrictlySorted!783 (t!41869 (t!41869 l!706))))))

(assert (= (and d!139435 (not res!843314)) b!1267093))

(assert (= (and b!1267093 res!843315) b!1267094))

(declare-fun m!1167357 () Bool)

(assert (=> b!1267094 m!1167357))

(assert (=> b!1267044 d!139435))

(declare-fun d!139437 () Bool)

(declare-fun res!843316 () Bool)

(declare-fun e!721749 () Bool)

(assert (=> d!139437 (=> res!843316 e!721749)))

(assert (=> d!139437 (= res!843316 (and (is-Cons!28352 (t!41869 l!706)) (= (_1!10603 (h!29570 (t!41869 l!706))) key1!31)))))

(assert (=> d!139437 (= (containsKey!654 (t!41869 l!706) key1!31) e!721749)))

(declare-fun b!1267103 () Bool)

(declare-fun e!721750 () Bool)

(assert (=> b!1267103 (= e!721749 e!721750)))

(declare-fun res!843317 () Bool)

(assert (=> b!1267103 (=> (not res!843317) (not e!721750))))

(assert (=> b!1267103 (= res!843317 (and (or (not (is-Cons!28352 (t!41869 l!706))) (bvsle (_1!10603 (h!29570 (t!41869 l!706))) key1!31)) (is-Cons!28352 (t!41869 l!706)) (bvslt (_1!10603 (h!29570 (t!41869 l!706))) key1!31)))))

(declare-fun b!1267104 () Bool)

(assert (=> b!1267104 (= e!721750 (containsKey!654 (t!41869 (t!41869 l!706)) key1!31))))

(assert (= (and d!139437 (not res!843316)) b!1267103))

(assert (= (and b!1267103 res!843317) b!1267104))

(declare-fun m!1167359 () Bool)

(assert (=> b!1267104 m!1167359))

(assert (=> b!1267046 d!139437))

(declare-fun b!1267111 () Bool)

(declare-fun e!721755 () Bool)

(declare-fun tp!96389 () Bool)

(assert (=> b!1267111 (= e!721755 (and tp_is_empty!32519 tp!96389))))

(assert (=> b!1267045 (= tp!96380 e!721755)))

(assert (= (and b!1267045 (is-Cons!28352 (t!41869 l!706))) b!1267111))

(push 1)

(assert (not b!1267111))

(assert (not b!1267104))

(assert (not b!1267094))

(assert tp_is_empty!32519)

(assert (not b!1267088))

(assert (not b!1267068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

