; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138594 () Bool)

(assert start!138594)

(declare-fun res!1083506 () Bool)

(declare-fun e!886465 () Bool)

(assert (=> start!138594 (=> (not res!1083506) (not e!886465))))

(declare-datatypes ((B!2936 0))(
  ( (B!2937 (val!19830 Int)) )
))
(declare-datatypes ((tuple2!25888 0))(
  ( (tuple2!25889 (_1!12955 (_ BitVec 64)) (_2!12955 B!2936)) )
))
(declare-datatypes ((List!36982 0))(
  ( (Nil!36979) (Cons!36978 (h!38539 tuple2!25888) (t!51893 List!36982)) )
))
(declare-fun l!556 () List!36982)

(declare-fun isStrictlySorted!1163 (List!36982) Bool)

(assert (=> start!138594 (= res!1083506 (isStrictlySorted!1163 l!556))))

(assert (=> start!138594 e!886465))

(declare-fun e!886466 () Bool)

(assert (=> start!138594 e!886466))

(assert (=> start!138594 true))

(declare-fun b!1587571 () Bool)

(declare-fun res!1083507 () Bool)

(assert (=> b!1587571 (=> (not res!1083507) (not e!886465))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1587571 (= res!1083507 (and ((_ is Cons!36978) l!556) (bvslt (_1!12955 (h!38539 l!556)) newKey!21)))))

(declare-fun b!1587572 () Bool)

(assert (=> b!1587572 (= e!886465 (not (isStrictlySorted!1163 (t!51893 l!556))))))

(declare-fun b!1587573 () Bool)

(declare-fun tp_is_empty!39469 () Bool)

(declare-fun tp!115162 () Bool)

(assert (=> b!1587573 (= e!886466 (and tp_is_empty!39469 tp!115162))))

(assert (= (and start!138594 res!1083506) b!1587571))

(assert (= (and b!1587571 res!1083507) b!1587572))

(assert (= (and start!138594 ((_ is Cons!36978) l!556)) b!1587573))

(declare-fun m!1456407 () Bool)

(assert (=> start!138594 m!1456407))

(declare-fun m!1456409 () Bool)

(assert (=> b!1587572 m!1456409))

(check-sat (not b!1587572) (not start!138594) (not b!1587573) tp_is_empty!39469)
(check-sat)
(get-model)

(declare-fun d!168349 () Bool)

(declare-fun res!1083529 () Bool)

(declare-fun e!886488 () Bool)

(assert (=> d!168349 (=> res!1083529 e!886488)))

(assert (=> d!168349 (= res!1083529 (or ((_ is Nil!36979) (t!51893 l!556)) ((_ is Nil!36979) (t!51893 (t!51893 l!556)))))))

(assert (=> d!168349 (= (isStrictlySorted!1163 (t!51893 l!556)) e!886488)))

(declare-fun b!1587601 () Bool)

(declare-fun e!886490 () Bool)

(assert (=> b!1587601 (= e!886488 e!886490)))

(declare-fun res!1083531 () Bool)

(assert (=> b!1587601 (=> (not res!1083531) (not e!886490))))

(assert (=> b!1587601 (= res!1083531 (bvslt (_1!12955 (h!38539 (t!51893 l!556))) (_1!12955 (h!38539 (t!51893 (t!51893 l!556))))))))

(declare-fun b!1587603 () Bool)

(assert (=> b!1587603 (= e!886490 (isStrictlySorted!1163 (t!51893 (t!51893 l!556))))))

(assert (= (and d!168349 (not res!1083529)) b!1587601))

(assert (= (and b!1587601 res!1083531) b!1587603))

(declare-fun m!1456419 () Bool)

(assert (=> b!1587603 m!1456419))

(assert (=> b!1587572 d!168349))

(declare-fun d!168353 () Bool)

(declare-fun res!1083532 () Bool)

(declare-fun e!886491 () Bool)

(assert (=> d!168353 (=> res!1083532 e!886491)))

(assert (=> d!168353 (= res!1083532 (or ((_ is Nil!36979) l!556) ((_ is Nil!36979) (t!51893 l!556))))))

(assert (=> d!168353 (= (isStrictlySorted!1163 l!556) e!886491)))

(declare-fun b!1587604 () Bool)

(declare-fun e!886492 () Bool)

(assert (=> b!1587604 (= e!886491 e!886492)))

(declare-fun res!1083533 () Bool)

(assert (=> b!1587604 (=> (not res!1083533) (not e!886492))))

(assert (=> b!1587604 (= res!1083533 (bvslt (_1!12955 (h!38539 l!556)) (_1!12955 (h!38539 (t!51893 l!556)))))))

(declare-fun b!1587605 () Bool)

(assert (=> b!1587605 (= e!886492 (isStrictlySorted!1163 (t!51893 l!556)))))

(assert (= (and d!168353 (not res!1083532)) b!1587604))

(assert (= (and b!1587604 res!1083533) b!1587605))

(assert (=> b!1587605 m!1456409))

(assert (=> start!138594 d!168353))

(declare-fun b!1587617 () Bool)

(declare-fun e!886500 () Bool)

(declare-fun tp!115174 () Bool)

(assert (=> b!1587617 (= e!886500 (and tp_is_empty!39469 tp!115174))))

(assert (=> b!1587573 (= tp!115162 e!886500)))

(assert (= (and b!1587573 ((_ is Cons!36978) (t!51893 l!556))) b!1587617))

(check-sat (not b!1587605) (not b!1587603) (not b!1587617) tp_is_empty!39469)
(check-sat)
