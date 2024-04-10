; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107916 () Bool)

(assert start!107916)

(declare-fun b!1275227 () Bool)

(declare-fun e!727908 () Bool)

(declare-fun tp_is_empty!33233 () Bool)

(declare-fun tp!98120 () Bool)

(assert (=> b!1275227 (= e!727908 (and tp_is_empty!33233 tp!98120))))

(declare-fun b!1275228 () Bool)

(declare-fun e!727909 () Bool)

(declare-datatypes ((B!2190 0))(
  ( (B!2191 (val!16691 Int)) )
))
(declare-datatypes ((tuple2!21464 0))(
  ( (tuple2!21465 (_1!10743 (_ BitVec 64)) (_2!10743 B!2190)) )
))
(declare-datatypes ((List!28617 0))(
  ( (Nil!28614) (Cons!28613 (h!29822 tuple2!21464) (t!42153 List!28617)) )
))
(declare-fun lt!575331 () List!28617)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!711 (List!28617 (_ BitVec 64)) Bool)

(assert (=> b!1275228 (= e!727909 (containsKey!711 lt!575331 key!173))))

(declare-fun b!1275229 () Bool)

(declare-fun res!847668 () Bool)

(declare-fun e!727907 () Bool)

(assert (=> b!1275229 (=> (not res!847668) (not e!727907))))

(declare-fun l!595 () List!28617)

(assert (=> b!1275229 (= res!847668 (and (or (not (is-Cons!28613 l!595)) (not (= (_1!10743 (h!29822 l!595)) key!173))) (or (not (is-Cons!28613 l!595)) (= (_1!10743 (h!29822 l!595)) key!173)) (not (is-Nil!28614 l!595))))))

(declare-fun b!1275230 () Bool)

(declare-fun e!727906 () Bool)

(declare-fun tp!98119 () Bool)

(assert (=> b!1275230 (= e!727906 (and tp_is_empty!33233 tp!98119))))

(declare-fun b!1275231 () Bool)

(assert (=> b!1275231 (= e!727907 e!727909)))

(declare-fun res!847669 () Bool)

(assert (=> b!1275231 (=> res!847669 e!727909)))

(declare-fun isStrictlySorted!869 (List!28617) Bool)

(assert (=> b!1275231 (= res!847669 (not (isStrictlySorted!869 lt!575331)))))

(declare-fun err!134 () List!28617)

(assert (=> b!1275231 (= lt!575331 err!134)))

(assert (=> b!1275231 true))

(assert (=> b!1275231 e!727906))

(declare-fun res!847667 () Bool)

(assert (=> start!107916 (=> (not res!847667) (not e!727907))))

(assert (=> start!107916 (= res!847667 (isStrictlySorted!869 l!595))))

(assert (=> start!107916 e!727907))

(assert (=> start!107916 e!727908))

(assert (=> start!107916 true))

(assert (= (and start!107916 res!847667) b!1275229))

(assert (= (and b!1275229 res!847668) b!1275231))

(assert (= (and b!1275231 (is-Cons!28613 err!134)) b!1275230))

(assert (= (and b!1275231 (not res!847669)) b!1275228))

(assert (= (and start!107916 (is-Cons!28613 l!595)) b!1275227))

(declare-fun m!1171561 () Bool)

(assert (=> b!1275228 m!1171561))

(declare-fun m!1171563 () Bool)

(assert (=> b!1275231 m!1171563))

(declare-fun m!1171565 () Bool)

(assert (=> start!107916 m!1171565))

(push 1)

(assert (not start!107916))

(assert (not b!1275228))

(assert (not b!1275231))

(assert (not b!1275230))

(assert tp_is_empty!33233)

(assert (not b!1275227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

