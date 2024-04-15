; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132816 () Bool)

(assert start!132816)

(declare-fun res!1064482 () Bool)

(declare-fun e!866447 () Bool)

(assert (=> start!132816 (=> (not res!1064482) (not e!866447))))

(declare-datatypes ((B!2336 0))(
  ( (B!2337 (val!19254 Int)) )
))
(declare-datatypes ((tuple2!24956 0))(
  ( (tuple2!24957 (_1!12489 (_ BitVec 64)) (_2!12489 B!2336)) )
))
(declare-datatypes ((List!36333 0))(
  ( (Nil!36330) (Cons!36329 (h!37776 tuple2!24956) (t!51046 List!36333)) )
))
(declare-fun l!1177 () List!36333)

(declare-fun isStrictlySorted!939 (List!36333) Bool)

(assert (=> start!132816 (= res!1064482 (isStrictlySorted!939 l!1177))))

(assert (=> start!132816 e!866447))

(declare-fun e!866446 () Bool)

(assert (=> start!132816 e!866446))

(assert (=> start!132816 true))

(declare-fun b!1555778 () Bool)

(declare-fun res!1064481 () Bool)

(assert (=> b!1555778 (=> (not res!1064481) (not e!866447))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555778 (= res!1064481 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36329) l!1177) (not (= (_1!12489 (h!37776 l!1177)) otherKey!50))))))

(declare-fun b!1555779 () Bool)

(assert (=> b!1555779 (= e!866447 (not (isStrictlySorted!939 (t!51046 l!1177))))))

(declare-fun b!1555780 () Bool)

(declare-fun tp_is_empty!38347 () Bool)

(declare-fun tp!112390 () Bool)

(assert (=> b!1555780 (= e!866446 (and tp_is_empty!38347 tp!112390))))

(assert (= (and start!132816 res!1064482) b!1555778))

(assert (= (and b!1555778 res!1064481) b!1555779))

(assert (= (and start!132816 ((_ is Cons!36329) l!1177)) b!1555780))

(declare-fun m!1432883 () Bool)

(assert (=> start!132816 m!1432883))

(declare-fun m!1432885 () Bool)

(assert (=> b!1555779 m!1432885))

(check-sat (not start!132816) (not b!1555779) (not b!1555780) tp_is_empty!38347)
(check-sat)
(get-model)

(declare-fun d!161809 () Bool)

(declare-fun res!1064503 () Bool)

(declare-fun e!866468 () Bool)

(assert (=> d!161809 (=> res!1064503 e!866468)))

(assert (=> d!161809 (= res!1064503 (or ((_ is Nil!36330) l!1177) ((_ is Nil!36330) (t!51046 l!1177))))))

(assert (=> d!161809 (= (isStrictlySorted!939 l!1177) e!866468)))

(declare-fun b!1555807 () Bool)

(declare-fun e!866469 () Bool)

(assert (=> b!1555807 (= e!866468 e!866469)))

(declare-fun res!1064504 () Bool)

(assert (=> b!1555807 (=> (not res!1064504) (not e!866469))))

(assert (=> b!1555807 (= res!1064504 (bvslt (_1!12489 (h!37776 l!1177)) (_1!12489 (h!37776 (t!51046 l!1177)))))))

(declare-fun b!1555808 () Bool)

(assert (=> b!1555808 (= e!866469 (isStrictlySorted!939 (t!51046 l!1177)))))

(assert (= (and d!161809 (not res!1064503)) b!1555807))

(assert (= (and b!1555807 res!1064504) b!1555808))

(assert (=> b!1555808 m!1432885))

(assert (=> start!132816 d!161809))

(declare-fun d!161815 () Bool)

(declare-fun res!1064505 () Bool)

(declare-fun e!866470 () Bool)

(assert (=> d!161815 (=> res!1064505 e!866470)))

(assert (=> d!161815 (= res!1064505 (or ((_ is Nil!36330) (t!51046 l!1177)) ((_ is Nil!36330) (t!51046 (t!51046 l!1177)))))))

(assert (=> d!161815 (= (isStrictlySorted!939 (t!51046 l!1177)) e!866470)))

(declare-fun b!1555809 () Bool)

(declare-fun e!866471 () Bool)

(assert (=> b!1555809 (= e!866470 e!866471)))

(declare-fun res!1064506 () Bool)

(assert (=> b!1555809 (=> (not res!1064506) (not e!866471))))

(assert (=> b!1555809 (= res!1064506 (bvslt (_1!12489 (h!37776 (t!51046 l!1177))) (_1!12489 (h!37776 (t!51046 (t!51046 l!1177))))))))

(declare-fun b!1555810 () Bool)

(assert (=> b!1555810 (= e!866471 (isStrictlySorted!939 (t!51046 (t!51046 l!1177))))))

(assert (= (and d!161815 (not res!1064505)) b!1555809))

(assert (= (and b!1555809 res!1064506) b!1555810))

(declare-fun m!1432895 () Bool)

(assert (=> b!1555810 m!1432895))

(assert (=> b!1555779 d!161815))

(declare-fun b!1555825 () Bool)

(declare-fun e!866484 () Bool)

(declare-fun tp!112399 () Bool)

(assert (=> b!1555825 (= e!866484 (and tp_is_empty!38347 tp!112399))))

(assert (=> b!1555780 (= tp!112390 e!866484)))

(assert (= (and b!1555780 ((_ is Cons!36329) (t!51046 l!1177))) b!1555825))

(check-sat (not b!1555810) (not b!1555808) (not b!1555825) tp_is_empty!38347)
(check-sat)
