; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133290 () Bool)

(assert start!133290)

(declare-fun b!1558598 () Bool)

(declare-fun e!868205 () Bool)

(declare-fun tp_is_empty!38353 () Bool)

(declare-fun tp!112407 () Bool)

(assert (=> b!1558598 (= e!868205 (and tp_is_empty!38353 tp!112407))))

(declare-fun b!1558596 () Bool)

(declare-fun res!1065514 () Bool)

(declare-fun e!868204 () Bool)

(assert (=> b!1558596 (=> (not res!1065514) (not e!868204))))

(declare-datatypes ((B!2342 0))(
  ( (B!2343 (val!19257 Int)) )
))
(declare-datatypes ((tuple2!24944 0))(
  ( (tuple2!24945 (_1!12483 (_ BitVec 64)) (_2!12483 B!2342)) )
))
(declare-datatypes ((List!36320 0))(
  ( (Nil!36317) (Cons!36316 (h!37780 tuple2!24944) (t!51033 List!36320)) )
))
(declare-fun l!1177 () List!36320)

(declare-fun isStrictlySorted!931 (List!36320) Bool)

(assert (=> b!1558596 (= res!1065514 (isStrictlySorted!931 (t!51033 l!1177)))))

(declare-fun b!1558597 () Bool)

(declare-fun ListPrimitiveSize!178 (List!36320) Int)

(assert (=> b!1558597 (= e!868204 (>= (ListPrimitiveSize!178 (t!51033 l!1177)) (ListPrimitiveSize!178 l!1177)))))

(declare-fun b!1558595 () Bool)

(declare-fun res!1065516 () Bool)

(assert (=> b!1558595 (=> (not res!1065516) (not e!868204))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558595 (= res!1065516 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36316) l!1177) (not (= (_1!12483 (h!37780 l!1177)) otherKey!50))))))

(declare-fun res!1065515 () Bool)

(assert (=> start!133290 (=> (not res!1065515) (not e!868204))))

(assert (=> start!133290 (= res!1065515 (isStrictlySorted!931 l!1177))))

(assert (=> start!133290 e!868204))

(assert (=> start!133290 e!868205))

(assert (=> start!133290 true))

(assert (= (and start!133290 res!1065515) b!1558595))

(assert (= (and b!1558595 res!1065516) b!1558596))

(assert (= (and b!1558596 res!1065514) b!1558597))

(assert (= (and start!133290 ((_ is Cons!36316) l!1177)) b!1558598))

(declare-fun m!1436051 () Bool)

(assert (=> b!1558596 m!1436051))

(declare-fun m!1436053 () Bool)

(assert (=> b!1558597 m!1436053))

(declare-fun m!1436055 () Bool)

(assert (=> b!1558597 m!1436055))

(declare-fun m!1436057 () Bool)

(assert (=> start!133290 m!1436057))

(check-sat (not b!1558597) tp_is_empty!38353 (not b!1558596) (not b!1558598) (not start!133290))
(check-sat)
(get-model)

(declare-fun d!162777 () Bool)

(declare-fun lt!671290 () Int)

(assert (=> d!162777 (>= lt!671290 0)))

(declare-fun e!868220 () Int)

(assert (=> d!162777 (= lt!671290 e!868220)))

(declare-fun c!144517 () Bool)

(assert (=> d!162777 (= c!144517 ((_ is Nil!36317) (t!51033 l!1177)))))

(assert (=> d!162777 (= (ListPrimitiveSize!178 (t!51033 l!1177)) lt!671290)))

(declare-fun b!1558627 () Bool)

(assert (=> b!1558627 (= e!868220 0)))

(declare-fun b!1558628 () Bool)

(assert (=> b!1558628 (= e!868220 (+ 1 (ListPrimitiveSize!178 (t!51033 (t!51033 l!1177)))))))

(assert (= (and d!162777 c!144517) b!1558627))

(assert (= (and d!162777 (not c!144517)) b!1558628))

(declare-fun m!1436075 () Bool)

(assert (=> b!1558628 m!1436075))

(assert (=> b!1558597 d!162777))

(declare-fun d!162781 () Bool)

(declare-fun lt!671291 () Int)

(assert (=> d!162781 (>= lt!671291 0)))

(declare-fun e!868221 () Int)

(assert (=> d!162781 (= lt!671291 e!868221)))

(declare-fun c!144518 () Bool)

(assert (=> d!162781 (= c!144518 ((_ is Nil!36317) l!1177))))

(assert (=> d!162781 (= (ListPrimitiveSize!178 l!1177) lt!671291)))

(declare-fun b!1558629 () Bool)

(assert (=> b!1558629 (= e!868221 0)))

(declare-fun b!1558630 () Bool)

(assert (=> b!1558630 (= e!868221 (+ 1 (ListPrimitiveSize!178 (t!51033 l!1177))))))

(assert (= (and d!162781 c!144518) b!1558629))

(assert (= (and d!162781 (not c!144518)) b!1558630))

(assert (=> b!1558630 m!1436053))

(assert (=> b!1558597 d!162781))

(declare-fun d!162783 () Bool)

(declare-fun res!1065545 () Bool)

(declare-fun e!868235 () Bool)

(assert (=> d!162783 (=> res!1065545 e!868235)))

(assert (=> d!162783 (= res!1065545 (or ((_ is Nil!36317) l!1177) ((_ is Nil!36317) (t!51033 l!1177))))))

(assert (=> d!162783 (= (isStrictlySorted!931 l!1177) e!868235)))

(declare-fun b!1558647 () Bool)

(declare-fun e!868236 () Bool)

(assert (=> b!1558647 (= e!868235 e!868236)))

(declare-fun res!1065546 () Bool)

(assert (=> b!1558647 (=> (not res!1065546) (not e!868236))))

(assert (=> b!1558647 (= res!1065546 (bvslt (_1!12483 (h!37780 l!1177)) (_1!12483 (h!37780 (t!51033 l!1177)))))))

(declare-fun b!1558648 () Bool)

(assert (=> b!1558648 (= e!868236 (isStrictlySorted!931 (t!51033 l!1177)))))

(assert (= (and d!162783 (not res!1065545)) b!1558647))

(assert (= (and b!1558647 res!1065546) b!1558648))

(assert (=> b!1558648 m!1436051))

(assert (=> start!133290 d!162783))

(declare-fun d!162791 () Bool)

(declare-fun res!1065547 () Bool)

(declare-fun e!868240 () Bool)

(assert (=> d!162791 (=> res!1065547 e!868240)))

(assert (=> d!162791 (= res!1065547 (or ((_ is Nil!36317) (t!51033 l!1177)) ((_ is Nil!36317) (t!51033 (t!51033 l!1177)))))))

(assert (=> d!162791 (= (isStrictlySorted!931 (t!51033 l!1177)) e!868240)))

(declare-fun b!1558655 () Bool)

(declare-fun e!868241 () Bool)

(assert (=> b!1558655 (= e!868240 e!868241)))

(declare-fun res!1065548 () Bool)

(assert (=> b!1558655 (=> (not res!1065548) (not e!868241))))

(assert (=> b!1558655 (= res!1065548 (bvslt (_1!12483 (h!37780 (t!51033 l!1177))) (_1!12483 (h!37780 (t!51033 (t!51033 l!1177))))))))

(declare-fun b!1558656 () Bool)

(assert (=> b!1558656 (= e!868241 (isStrictlySorted!931 (t!51033 (t!51033 l!1177))))))

(assert (= (and d!162791 (not res!1065547)) b!1558655))

(assert (= (and b!1558655 res!1065548) b!1558656))

(declare-fun m!1436081 () Bool)

(assert (=> b!1558656 m!1436081))

(assert (=> b!1558596 d!162791))

(declare-fun b!1558661 () Bool)

(declare-fun e!868244 () Bool)

(declare-fun tp!112416 () Bool)

(assert (=> b!1558661 (= e!868244 (and tp_is_empty!38353 tp!112416))))

(assert (=> b!1558598 (= tp!112407 e!868244)))

(assert (= (and b!1558598 ((_ is Cons!36316) (t!51033 l!1177))) b!1558661))

(check-sat (not b!1558630) tp_is_empty!38353 (not b!1558648) (not b!1558628) (not b!1558661) (not b!1558656))
(check-sat)
