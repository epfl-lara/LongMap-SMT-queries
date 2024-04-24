; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133278 () Bool)

(assert start!133278)

(declare-fun res!1065471 () Bool)

(declare-fun e!868153 () Bool)

(assert (=> start!133278 (=> (not res!1065471) (not e!868153))))

(declare-datatypes ((B!2336 0))(
  ( (B!2337 (val!19254 Int)) )
))
(declare-datatypes ((tuple2!24938 0))(
  ( (tuple2!24939 (_1!12480 (_ BitVec 64)) (_2!12480 B!2336)) )
))
(declare-datatypes ((List!36317 0))(
  ( (Nil!36314) (Cons!36313 (h!37777 tuple2!24938) (t!51030 List!36317)) )
))
(declare-fun l!1177 () List!36317)

(declare-fun isStrictlySorted!928 (List!36317) Bool)

(assert (=> start!133278 (= res!1065471 (isStrictlySorted!928 l!1177))))

(assert (=> start!133278 e!868153))

(declare-fun e!868154 () Bool)

(assert (=> start!133278 e!868154))

(assert (=> start!133278 true))

(declare-fun b!1558527 () Bool)

(declare-fun res!1065470 () Bool)

(assert (=> b!1558527 (=> (not res!1065470) (not e!868153))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558527 (= res!1065470 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36313) l!1177) (not (= (_1!12480 (h!37777 l!1177)) otherKey!50))))))

(declare-fun b!1558528 () Bool)

(assert (=> b!1558528 (= e!868153 (not (isStrictlySorted!928 (t!51030 l!1177))))))

(declare-fun b!1558529 () Bool)

(declare-fun tp_is_empty!38347 () Bool)

(declare-fun tp!112389 () Bool)

(assert (=> b!1558529 (= e!868154 (and tp_is_empty!38347 tp!112389))))

(assert (= (and start!133278 res!1065471) b!1558527))

(assert (= (and b!1558527 res!1065470) b!1558528))

(assert (= (and start!133278 ((_ is Cons!36313) l!1177)) b!1558529))

(declare-fun m!1436033 () Bool)

(assert (=> start!133278 m!1436033))

(declare-fun m!1436035 () Bool)

(assert (=> b!1558528 m!1436035))

(check-sat (not start!133278) (not b!1558528) (not b!1558529) tp_is_empty!38347)
(check-sat)
(get-model)

(declare-fun d!162763 () Bool)

(declare-fun res!1065492 () Bool)

(declare-fun e!868175 () Bool)

(assert (=> d!162763 (=> res!1065492 e!868175)))

(assert (=> d!162763 (= res!1065492 (or ((_ is Nil!36314) l!1177) ((_ is Nil!36314) (t!51030 l!1177))))))

(assert (=> d!162763 (= (isStrictlySorted!928 l!1177) e!868175)))

(declare-fun b!1558556 () Bool)

(declare-fun e!868176 () Bool)

(assert (=> b!1558556 (= e!868175 e!868176)))

(declare-fun res!1065493 () Bool)

(assert (=> b!1558556 (=> (not res!1065493) (not e!868176))))

(assert (=> b!1558556 (= res!1065493 (bvslt (_1!12480 (h!37777 l!1177)) (_1!12480 (h!37777 (t!51030 l!1177)))))))

(declare-fun b!1558557 () Bool)

(assert (=> b!1558557 (= e!868176 (isStrictlySorted!928 (t!51030 l!1177)))))

(assert (= (and d!162763 (not res!1065492)) b!1558556))

(assert (= (and b!1558556 res!1065493) b!1558557))

(assert (=> b!1558557 m!1436035))

(assert (=> start!133278 d!162763))

(declare-fun d!162769 () Bool)

(declare-fun res!1065500 () Bool)

(declare-fun e!868183 () Bool)

(assert (=> d!162769 (=> res!1065500 e!868183)))

(assert (=> d!162769 (= res!1065500 (or ((_ is Nil!36314) (t!51030 l!1177)) ((_ is Nil!36314) (t!51030 (t!51030 l!1177)))))))

(assert (=> d!162769 (= (isStrictlySorted!928 (t!51030 l!1177)) e!868183)))

(declare-fun b!1558562 () Bool)

(declare-fun e!868184 () Bool)

(assert (=> b!1558562 (= e!868183 e!868184)))

(declare-fun res!1065501 () Bool)

(assert (=> b!1558562 (=> (not res!1065501) (not e!868184))))

(assert (=> b!1558562 (= res!1065501 (bvslt (_1!12480 (h!37777 (t!51030 l!1177))) (_1!12480 (h!37777 (t!51030 (t!51030 l!1177))))))))

(declare-fun b!1558563 () Bool)

(assert (=> b!1558563 (= e!868184 (isStrictlySorted!928 (t!51030 (t!51030 l!1177))))))

(assert (= (and d!162769 (not res!1065500)) b!1558562))

(assert (= (and b!1558562 res!1065501) b!1558563))

(declare-fun m!1436047 () Bool)

(assert (=> b!1558563 m!1436047))

(assert (=> b!1558528 d!162769))

(declare-fun b!1558577 () Bool)

(declare-fun e!868192 () Bool)

(declare-fun tp!112401 () Bool)

(assert (=> b!1558577 (= e!868192 (and tp_is_empty!38347 tp!112401))))

(assert (=> b!1558529 (= tp!112389 e!868192)))

(assert (= (and b!1558529 ((_ is Cons!36313) (t!51030 l!1177))) b!1558577))

(check-sat (not b!1558563) (not b!1558557) (not b!1558577) tp_is_empty!38347)
(check-sat)
