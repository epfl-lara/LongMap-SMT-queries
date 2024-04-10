; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133204 () Bool)

(assert start!133204)

(declare-fun b!1558265 () Bool)

(declare-fun res!1065734 () Bool)

(declare-fun e!868055 () Bool)

(assert (=> b!1558265 (=> (not res!1065734) (not e!868055))))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2428 0))(
  ( (B!2429 (val!19300 Int)) )
))
(declare-datatypes ((tuple2!24976 0))(
  ( (tuple2!24977 (_1!12499 (_ BitVec 64)) (_2!12499 B!2428)) )
))
(declare-datatypes ((List!36334 0))(
  ( (Nil!36331) (Cons!36330 (h!37776 tuple2!24976) (t!51061 List!36334)) )
))
(declare-fun l!1292 () List!36334)

(declare-fun otherKey!62 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558265 (= res!1065734 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36330) l!1292) (not (= (_1!12499 (h!37776 l!1292)) otherKey!62))))))

(declare-fun b!1558266 () Bool)

(declare-fun e!868054 () Bool)

(assert (=> b!1558266 (= e!868055 e!868054)))

(declare-fun res!1065736 () Bool)

(assert (=> b!1558266 (=> res!1065736 e!868054)))

(declare-fun isStrictlySorted!974 (List!36334) Bool)

(assert (=> b!1558266 (= res!1065736 (not (isStrictlySorted!974 (t!51061 l!1292))))))

(declare-fun b!1558267 () Bool)

(declare-fun containsKey!837 (List!36334 (_ BitVec 64)) Bool)

(assert (=> b!1558267 (= e!868054 (not (containsKey!837 (t!51061 l!1292) otherKey!62)))))

(declare-fun b!1558268 () Bool)

(declare-fun e!868053 () Bool)

(declare-fun tp_is_empty!38433 () Bool)

(declare-fun tp!112623 () Bool)

(assert (=> b!1558268 (= e!868053 (and tp_is_empty!38433 tp!112623))))

(declare-fun res!1065735 () Bool)

(assert (=> start!133204 (=> (not res!1065735) (not e!868055))))

(assert (=> start!133204 (= res!1065735 (isStrictlySorted!974 l!1292))))

(assert (=> start!133204 e!868055))

(assert (=> start!133204 e!868053))

(assert (=> start!133204 true))

(declare-fun b!1558264 () Bool)

(declare-fun res!1065733 () Bool)

(assert (=> b!1558264 (=> (not res!1065733) (not e!868055))))

(assert (=> b!1558264 (= res!1065733 (containsKey!837 l!1292 otherKey!62))))

(assert (= (and start!133204 res!1065735) b!1558264))

(assert (= (and b!1558264 res!1065733) b!1558265))

(assert (= (and b!1558265 res!1065734) b!1558266))

(assert (= (and b!1558266 (not res!1065736)) b!1558267))

(assert (= (and start!133204 ((_ is Cons!36330) l!1292)) b!1558268))

(declare-fun m!1435013 () Bool)

(assert (=> b!1558266 m!1435013))

(declare-fun m!1435015 () Bool)

(assert (=> b!1558267 m!1435015))

(declare-fun m!1435017 () Bool)

(assert (=> start!133204 m!1435017))

(declare-fun m!1435019 () Bool)

(assert (=> b!1558264 m!1435019))

(check-sat (not b!1558268) (not b!1558267) (not start!133204) (not b!1558266) (not b!1558264) tp_is_empty!38433)
(check-sat)
(get-model)

(declare-fun d!162615 () Bool)

(declare-fun res!1065753 () Bool)

(declare-fun e!868069 () Bool)

(assert (=> d!162615 (=> res!1065753 e!868069)))

(assert (=> d!162615 (= res!1065753 (or ((_ is Nil!36331) (t!51061 l!1292)) ((_ is Nil!36331) (t!51061 (t!51061 l!1292)))))))

(assert (=> d!162615 (= (isStrictlySorted!974 (t!51061 l!1292)) e!868069)))

(declare-fun b!1558288 () Bool)

(declare-fun e!868070 () Bool)

(assert (=> b!1558288 (= e!868069 e!868070)))

(declare-fun res!1065754 () Bool)

(assert (=> b!1558288 (=> (not res!1065754) (not e!868070))))

(assert (=> b!1558288 (= res!1065754 (bvslt (_1!12499 (h!37776 (t!51061 l!1292))) (_1!12499 (h!37776 (t!51061 (t!51061 l!1292))))))))

(declare-fun b!1558289 () Bool)

(assert (=> b!1558289 (= e!868070 (isStrictlySorted!974 (t!51061 (t!51061 l!1292))))))

(assert (= (and d!162615 (not res!1065753)) b!1558288))

(assert (= (and b!1558288 res!1065754) b!1558289))

(declare-fun m!1435029 () Bool)

(assert (=> b!1558289 m!1435029))

(assert (=> b!1558266 d!162615))

(declare-fun d!162617 () Bool)

(declare-fun res!1065763 () Bool)

(declare-fun e!868079 () Bool)

(assert (=> d!162617 (=> res!1065763 e!868079)))

(assert (=> d!162617 (= res!1065763 (and ((_ is Cons!36330) (t!51061 l!1292)) (= (_1!12499 (h!37776 (t!51061 l!1292))) otherKey!62)))))

(assert (=> d!162617 (= (containsKey!837 (t!51061 l!1292) otherKey!62) e!868079)))

(declare-fun b!1558298 () Bool)

(declare-fun e!868080 () Bool)

(assert (=> b!1558298 (= e!868079 e!868080)))

(declare-fun res!1065764 () Bool)

(assert (=> b!1558298 (=> (not res!1065764) (not e!868080))))

(assert (=> b!1558298 (= res!1065764 (and (or (not ((_ is Cons!36330) (t!51061 l!1292))) (bvsle (_1!12499 (h!37776 (t!51061 l!1292))) otherKey!62)) ((_ is Cons!36330) (t!51061 l!1292)) (bvslt (_1!12499 (h!37776 (t!51061 l!1292))) otherKey!62)))))

(declare-fun b!1558299 () Bool)

(assert (=> b!1558299 (= e!868080 (containsKey!837 (t!51061 (t!51061 l!1292)) otherKey!62))))

(assert (= (and d!162617 (not res!1065763)) b!1558298))

(assert (= (and b!1558298 res!1065764) b!1558299))

(declare-fun m!1435031 () Bool)

(assert (=> b!1558299 m!1435031))

(assert (=> b!1558267 d!162617))

(declare-fun d!162623 () Bool)

(declare-fun res!1065765 () Bool)

(declare-fun e!868081 () Bool)

(assert (=> d!162623 (=> res!1065765 e!868081)))

(assert (=> d!162623 (= res!1065765 (and ((_ is Cons!36330) l!1292) (= (_1!12499 (h!37776 l!1292)) otherKey!62)))))

(assert (=> d!162623 (= (containsKey!837 l!1292 otherKey!62) e!868081)))

(declare-fun b!1558300 () Bool)

(declare-fun e!868082 () Bool)

(assert (=> b!1558300 (= e!868081 e!868082)))

(declare-fun res!1065766 () Bool)

(assert (=> b!1558300 (=> (not res!1065766) (not e!868082))))

(assert (=> b!1558300 (= res!1065766 (and (or (not ((_ is Cons!36330) l!1292)) (bvsle (_1!12499 (h!37776 l!1292)) otherKey!62)) ((_ is Cons!36330) l!1292) (bvslt (_1!12499 (h!37776 l!1292)) otherKey!62)))))

(declare-fun b!1558301 () Bool)

(assert (=> b!1558301 (= e!868082 (containsKey!837 (t!51061 l!1292) otherKey!62))))

(assert (= (and d!162623 (not res!1065765)) b!1558300))

(assert (= (and b!1558300 res!1065766) b!1558301))

(assert (=> b!1558301 m!1435015))

(assert (=> b!1558264 d!162623))

(declare-fun d!162625 () Bool)

(declare-fun res!1065771 () Bool)

(declare-fun e!868087 () Bool)

(assert (=> d!162625 (=> res!1065771 e!868087)))

(assert (=> d!162625 (= res!1065771 (or ((_ is Nil!36331) l!1292) ((_ is Nil!36331) (t!51061 l!1292))))))

(assert (=> d!162625 (= (isStrictlySorted!974 l!1292) e!868087)))

(declare-fun b!1558304 () Bool)

(declare-fun e!868088 () Bool)

(assert (=> b!1558304 (= e!868087 e!868088)))

(declare-fun res!1065772 () Bool)

(assert (=> b!1558304 (=> (not res!1065772) (not e!868088))))

(assert (=> b!1558304 (= res!1065772 (bvslt (_1!12499 (h!37776 l!1292)) (_1!12499 (h!37776 (t!51061 l!1292)))))))

(declare-fun b!1558305 () Bool)

(assert (=> b!1558305 (= e!868088 (isStrictlySorted!974 (t!51061 l!1292)))))

(assert (= (and d!162625 (not res!1065771)) b!1558304))

(assert (= (and b!1558304 res!1065772) b!1558305))

(assert (=> b!1558305 m!1435013))

(assert (=> start!133204 d!162625))

(declare-fun b!1558314 () Bool)

(declare-fun e!868093 () Bool)

(declare-fun tp!112629 () Bool)

(assert (=> b!1558314 (= e!868093 (and tp_is_empty!38433 tp!112629))))

(assert (=> b!1558268 (= tp!112623 e!868093)))

(assert (= (and b!1558268 ((_ is Cons!36330) (t!51061 l!1292))) b!1558314))

(check-sat (not b!1558301) (not b!1558299) (not b!1558314) (not b!1558289) tp_is_empty!38433 (not b!1558305))
(check-sat)
