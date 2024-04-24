; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2340 () Bool)

(assert start!2340)

(declare-fun b_free!469 () Bool)

(declare-fun b_next!469 () Bool)

(assert (=> start!2340 (= b_free!469 (not b_next!469))))

(declare-fun tp!2471 () Bool)

(declare-fun b_and!879 () Bool)

(assert (=> start!2340 (= tp!2471 b_and!879)))

(declare-fun res!11554 () Bool)

(declare-fun e!9205 () Bool)

(assert (=> start!2340 (=> (not res!11554) (not e!9205))))

(declare-datatypes ((B!590 0))(
  ( (B!591 (val!393 Int)) )
))
(declare-datatypes ((tuple2!582 0))(
  ( (tuple2!583 (_1!291 (_ BitVec 64)) (_2!291 B!590)) )
))
(declare-datatypes ((List!447 0))(
  ( (Nil!444) (Cons!443 (h!1009 tuple2!582) (t!2849 List!447)) )
))
(declare-datatypes ((ListLongMap!413 0))(
  ( (ListLongMap!414 (toList!222 List!447)) )
))
(declare-fun lm!238 () ListLongMap!413)

(declare-fun p!262 () Int)

(declare-fun forall!104 (List!447 Int) Bool)

(assert (=> start!2340 (= res!11554 (forall!104 (toList!222 lm!238) p!262))))

(assert (=> start!2340 e!9205))

(declare-fun e!9204 () Bool)

(declare-fun inv!760 (ListLongMap!413) Bool)

(assert (=> start!2340 (and (inv!760 lm!238) e!9204)))

(assert (=> start!2340 tp!2471))

(assert (=> start!2340 true))

(declare-fun b!15210 () Bool)

(declare-fun res!11555 () Bool)

(assert (=> b!15210 (=> (not res!11555) (not e!9205))))

(declare-datatypes ((List!448 0))(
  ( (Nil!445) (Cons!444 (h!1010 (_ BitVec 64)) (t!2850 List!448)) )
))
(declare-fun l!1612 () List!448)

(declare-fun isEmpty!117 (List!448) Bool)

(assert (=> b!15210 (= res!11555 (not (isEmpty!117 l!1612)))))

(declare-fun b!15211 () Bool)

(assert (=> b!15211 (= e!9205 (= l!1612 Nil!445))))

(declare-fun b!15212 () Bool)

(declare-fun tp!2470 () Bool)

(assert (=> b!15212 (= e!9204 tp!2470)))

(assert (= (and start!2340 res!11554) b!15210))

(assert (= (and b!15210 res!11555) b!15211))

(assert (= start!2340 b!15212))

(declare-fun m!10119 () Bool)

(assert (=> start!2340 m!10119))

(declare-fun m!10121 () Bool)

(assert (=> start!2340 m!10121))

(declare-fun m!10123 () Bool)

(assert (=> b!15210 m!10123))

(check-sat b_and!879 (not b_next!469) (not b!15212) (not start!2340) (not b!15210))
(check-sat b_and!879 (not b_next!469))
(get-model)

(declare-fun d!2549 () Bool)

(get-info :version)

(assert (=> d!2549 (= (isEmpty!117 l!1612) ((_ is Nil!445) l!1612))))

(assert (=> b!15210 d!2549))

(declare-fun d!2553 () Bool)

(declare-fun res!11578 () Bool)

(declare-fun e!9228 () Bool)

(assert (=> d!2553 (=> res!11578 e!9228)))

(assert (=> d!2553 (= res!11578 ((_ is Nil!444) (toList!222 lm!238)))))

(assert (=> d!2553 (= (forall!104 (toList!222 lm!238) p!262) e!9228)))

(declare-fun b!15241 () Bool)

(declare-fun e!9229 () Bool)

(assert (=> b!15241 (= e!9228 e!9229)))

(declare-fun res!11579 () Bool)

(assert (=> b!15241 (=> (not res!11579) (not e!9229))))

(declare-fun dynLambda!95 (Int tuple2!582) Bool)

(assert (=> b!15241 (= res!11579 (dynLambda!95 p!262 (h!1009 (toList!222 lm!238))))))

(declare-fun b!15242 () Bool)

(assert (=> b!15242 (= e!9229 (forall!104 (t!2849 (toList!222 lm!238)) p!262))))

(assert (= (and d!2553 (not res!11578)) b!15241))

(assert (= (and b!15241 res!11579) b!15242))

(declare-fun b_lambda!973 () Bool)

(assert (=> (not b_lambda!973) (not b!15241)))

(declare-fun t!2858 () Bool)

(declare-fun tb!395 () Bool)

(assert (=> (and start!2340 (= p!262 p!262) t!2858) tb!395))

(declare-fun result!701 () Bool)

(assert (=> tb!395 (= result!701 true)))

(assert (=> b!15241 t!2858))

(declare-fun b_and!887 () Bool)

(assert (= b_and!879 (and (=> t!2858 result!701) b_and!887)))

(declare-fun m!10139 () Bool)

(assert (=> b!15241 m!10139))

(declare-fun m!10143 () Bool)

(assert (=> b!15242 m!10143))

(assert (=> start!2340 d!2553))

(declare-fun d!2561 () Bool)

(declare-fun isStrictlySorted!129 (List!447) Bool)

(assert (=> d!2561 (= (inv!760 lm!238) (isStrictlySorted!129 (toList!222 lm!238)))))

(declare-fun bs!643 () Bool)

(assert (= bs!643 d!2561))

(declare-fun m!10147 () Bool)

(assert (=> bs!643 m!10147))

(assert (=> start!2340 d!2561))

(declare-fun b!15258 () Bool)

(declare-fun e!9241 () Bool)

(declare-fun tp_is_empty!770 () Bool)

(declare-fun tp!2489 () Bool)

(assert (=> b!15258 (= e!9241 (and tp_is_empty!770 tp!2489))))

(assert (=> b!15212 (= tp!2470 e!9241)))

(assert (= (and b!15212 ((_ is Cons!443) (toList!222 lm!238))) b!15258))

(declare-fun b_lambda!979 () Bool)

(assert (= b_lambda!973 (or (and start!2340 b_free!469) b_lambda!979)))

(check-sat (not b_lambda!979) b_and!887 (not b!15258) tp_is_empty!770 (not b_next!469) (not d!2561) (not b!15242))
(check-sat b_and!887 (not b_next!469))
