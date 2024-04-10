; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88022 () Bool)

(assert start!88022)

(declare-fun b!1016058 () Bool)

(assert (=> b!1016058 true))

(assert (=> b!1016058 true))

(declare-fun b!1016053 () Bool)

(declare-fun res!681532 () Bool)

(declare-fun e!571575 () Bool)

(assert (=> b!1016053 (=> (not res!681532) (not e!571575))))

(declare-datatypes ((B!1516 0))(
  ( (B!1517 (val!11842 Int)) )
))
(declare-datatypes ((tuple2!15230 0))(
  ( (tuple2!15231 (_1!7626 (_ BitVec 64)) (_2!7626 B!1516)) )
))
(declare-datatypes ((List!21507 0))(
  ( (Nil!21504) (Cons!21503 (h!22701 tuple2!15230) (t!30508 List!21507)) )
))
(declare-fun l!1114 () List!21507)

(declare-fun isEmpty!872 (List!21507) Bool)

(assert (=> b!1016053 (= res!681532 (not (isEmpty!872 l!1114)))))

(declare-fun res!681531 () Bool)

(assert (=> start!88022 (=> (not res!681531) (not e!571575))))

(declare-fun isStrictlySorted!610 (List!21507) Bool)

(assert (=> start!88022 (= res!681531 (isStrictlySorted!610 l!1114))))

(assert (=> start!88022 e!571575))

(declare-fun e!571576 () Bool)

(assert (=> start!88022 e!571576))

(assert (=> start!88022 true))

(declare-fun tp_is_empty!23583 () Bool)

(assert (=> start!88022 tp_is_empty!23583))

(declare-fun b!1016054 () Bool)

(declare-fun res!681533 () Bool)

(assert (=> b!1016054 (=> (not res!681533) (not e!571575))))

(declare-datatypes ((List!21508 0))(
  ( (Nil!21505) (Cons!21504 (h!22702 (_ BitVec 64)) (t!30509 List!21508)) )
))
(declare-fun keys!40 () List!21508)

(get-info :version)

(assert (=> b!1016054 (= res!681533 (not ((_ is Cons!21504) keys!40)))))

(declare-fun b!1016055 () Bool)

(declare-fun tp!70721 () Bool)

(assert (=> b!1016055 (= e!571576 (and tp_is_empty!23583 tp!70721))))

(declare-fun b!1016056 () Bool)

(declare-fun newHead!31 () tuple2!15230)

(assert (=> b!1016056 (= e!571575 (not (isStrictlySorted!610 (Cons!21503 newHead!31 l!1114))))))

(declare-fun b!1016057 () Bool)

(declare-fun res!681530 () Bool)

(assert (=> b!1016057 (=> (not res!681530) (not e!571575))))

(declare-fun head!959 (List!21507) tuple2!15230)

(assert (=> b!1016057 (= res!681530 (bvslt (_1!7626 newHead!31) (_1!7626 (head!959 l!1114))))))

(declare-fun res!681534 () Bool)

(assert (=> b!1016058 (=> (not res!681534) (not e!571575))))

(declare-fun lambda!995 () Int)

(declare-fun forall!272 (List!21508 Int) Bool)

(assert (=> b!1016058 (= res!681534 (forall!272 keys!40 lambda!995))))

(assert (= (and start!88022 res!681531) b!1016053))

(assert (= (and b!1016053 res!681532) b!1016058))

(assert (= (and b!1016058 res!681534) b!1016057))

(assert (= (and b!1016057 res!681530) b!1016054))

(assert (= (and b!1016054 res!681533) b!1016056))

(assert (= (and start!88022 ((_ is Cons!21503) l!1114)) b!1016055))

(declare-fun m!937905 () Bool)

(assert (=> start!88022 m!937905))

(declare-fun m!937907 () Bool)

(assert (=> b!1016058 m!937907))

(declare-fun m!937909 () Bool)

(assert (=> b!1016056 m!937909))

(declare-fun m!937911 () Bool)

(assert (=> b!1016057 m!937911))

(declare-fun m!937913 () Bool)

(assert (=> b!1016053 m!937913))

(check-sat (not b!1016056) (not b!1016058) (not b!1016057) (not b!1016053) (not start!88022) tp_is_empty!23583 (not b!1016055))
(check-sat)
(get-model)

(declare-fun d!121111 () Bool)

(assert (=> d!121111 (= (isEmpty!872 l!1114) ((_ is Nil!21504) l!1114))))

(assert (=> b!1016053 d!121111))

(declare-fun d!121113 () Bool)

(assert (=> d!121113 (= (head!959 l!1114) (h!22701 l!1114))))

(assert (=> b!1016057 d!121113))

(declare-fun d!121115 () Bool)

(declare-fun res!681554 () Bool)

(declare-fun e!571587 () Bool)

(assert (=> d!121115 (=> res!681554 e!571587)))

(assert (=> d!121115 (= res!681554 (or ((_ is Nil!21504) l!1114) ((_ is Nil!21504) (t!30508 l!1114))))))

(assert (=> d!121115 (= (isStrictlySorted!610 l!1114) e!571587)))

(declare-fun b!1016089 () Bool)

(declare-fun e!571588 () Bool)

(assert (=> b!1016089 (= e!571587 e!571588)))

(declare-fun res!681555 () Bool)

(assert (=> b!1016089 (=> (not res!681555) (not e!571588))))

(assert (=> b!1016089 (= res!681555 (bvslt (_1!7626 (h!22701 l!1114)) (_1!7626 (h!22701 (t!30508 l!1114)))))))

(declare-fun b!1016090 () Bool)

(assert (=> b!1016090 (= e!571588 (isStrictlySorted!610 (t!30508 l!1114)))))

(assert (= (and d!121115 (not res!681554)) b!1016089))

(assert (= (and b!1016089 res!681555) b!1016090))

(declare-fun m!937925 () Bool)

(assert (=> b!1016090 m!937925))

(assert (=> start!88022 d!121115))

(declare-fun d!121121 () Bool)

(declare-fun res!681570 () Bool)

(declare-fun e!571603 () Bool)

(assert (=> d!121121 (=> res!681570 e!571603)))

(assert (=> d!121121 (= res!681570 ((_ is Nil!21505) keys!40))))

(assert (=> d!121121 (= (forall!272 keys!40 lambda!995) e!571603)))

(declare-fun b!1016105 () Bool)

(declare-fun e!571604 () Bool)

(assert (=> b!1016105 (= e!571603 e!571604)))

(declare-fun res!681571 () Bool)

(assert (=> b!1016105 (=> (not res!681571) (not e!571604))))

(declare-fun dynLambda!1907 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016105 (= res!681571 (dynLambda!1907 lambda!995 (h!22702 keys!40)))))

(declare-fun b!1016106 () Bool)

(assert (=> b!1016106 (= e!571604 (forall!272 (t!30509 keys!40) lambda!995))))

(assert (= (and d!121121 (not res!681570)) b!1016105))

(assert (= (and b!1016105 res!681571) b!1016106))

(declare-fun b_lambda!15477 () Bool)

(assert (=> (not b_lambda!15477) (not b!1016105)))

(declare-fun m!937931 () Bool)

(assert (=> b!1016105 m!937931))

(declare-fun m!937933 () Bool)

(assert (=> b!1016106 m!937933))

(assert (=> b!1016058 d!121121))

(declare-fun d!121129 () Bool)

(declare-fun res!681572 () Bool)

(declare-fun e!571605 () Bool)

(assert (=> d!121129 (=> res!681572 e!571605)))

(assert (=> d!121129 (= res!681572 (or ((_ is Nil!21504) (Cons!21503 newHead!31 l!1114)) ((_ is Nil!21504) (t!30508 (Cons!21503 newHead!31 l!1114)))))))

(assert (=> d!121129 (= (isStrictlySorted!610 (Cons!21503 newHead!31 l!1114)) e!571605)))

(declare-fun b!1016107 () Bool)

(declare-fun e!571606 () Bool)

(assert (=> b!1016107 (= e!571605 e!571606)))

(declare-fun res!681573 () Bool)

(assert (=> b!1016107 (=> (not res!681573) (not e!571606))))

(assert (=> b!1016107 (= res!681573 (bvslt (_1!7626 (h!22701 (Cons!21503 newHead!31 l!1114))) (_1!7626 (h!22701 (t!30508 (Cons!21503 newHead!31 l!1114))))))))

(declare-fun b!1016108 () Bool)

(assert (=> b!1016108 (= e!571606 (isStrictlySorted!610 (t!30508 (Cons!21503 newHead!31 l!1114))))))

(assert (= (and d!121129 (not res!681572)) b!1016107))

(assert (= (and b!1016107 res!681573) b!1016108))

(declare-fun m!937935 () Bool)

(assert (=> b!1016108 m!937935))

(assert (=> b!1016056 d!121129))

(declare-fun b!1016119 () Bool)

(declare-fun e!571615 () Bool)

(declare-fun tp!70727 () Bool)

(assert (=> b!1016119 (= e!571615 (and tp_is_empty!23583 tp!70727))))

(assert (=> b!1016055 (= tp!70721 e!571615)))

(assert (= (and b!1016055 ((_ is Cons!21503) (t!30508 l!1114))) b!1016119))

(declare-fun b_lambda!15481 () Bool)

(assert (= b_lambda!15477 (or b!1016058 b_lambda!15481)))

(declare-fun bs!29498 () Bool)

(declare-fun d!121133 () Bool)

(assert (= bs!29498 (and d!121133 b!1016058)))

(declare-fun value!178 () B!1516)

(declare-datatypes ((Option!595 0))(
  ( (Some!594 (v!14445 B!1516)) (None!593) )
))
(declare-fun getValueByKey!544 (List!21507 (_ BitVec 64)) Option!595)

(assert (=> bs!29498 (= (dynLambda!1907 lambda!995 (h!22702 keys!40)) (= (getValueByKey!544 l!1114 (h!22702 keys!40)) (Some!594 value!178)))))

(declare-fun m!937943 () Bool)

(assert (=> bs!29498 m!937943))

(assert (=> b!1016105 d!121133))

(check-sat (not b!1016106) (not b_lambda!15481) (not bs!29498) tp_is_empty!23583 (not b!1016108) (not b!1016119) (not b!1016090))
