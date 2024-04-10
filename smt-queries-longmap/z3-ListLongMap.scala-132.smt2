; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2342 () Bool)

(assert start!2342)

(declare-fun b_free!471 () Bool)

(declare-fun b_next!471 () Bool)

(assert (=> start!2342 (= b_free!471 (not b_next!471))))

(declare-fun tp!2476 () Bool)

(declare-fun b_and!881 () Bool)

(assert (=> start!2342 (= tp!2476 b_and!881)))

(declare-fun res!11563 () Bool)

(declare-fun e!9215 () Bool)

(assert (=> start!2342 (=> (not res!11563) (not e!9215))))

(declare-datatypes ((B!592 0))(
  ( (B!593 (val!394 Int)) )
))
(declare-datatypes ((tuple2!588 0))(
  ( (tuple2!589 (_1!294 (_ BitVec 64)) (_2!294 B!592)) )
))
(declare-datatypes ((List!453 0))(
  ( (Nil!450) (Cons!449 (h!1015 tuple2!588) (t!2855 List!453)) )
))
(declare-datatypes ((ListLongMap!419 0))(
  ( (ListLongMap!420 (toList!225 List!453)) )
))
(declare-fun lm!238 () ListLongMap!419)

(declare-fun p!262 () Int)

(declare-fun forall!105 (List!453 Int) Bool)

(assert (=> start!2342 (= res!11563 (forall!105 (toList!225 lm!238) p!262))))

(assert (=> start!2342 e!9215))

(declare-fun e!9214 () Bool)

(declare-fun inv!761 (ListLongMap!419) Bool)

(assert (=> start!2342 (and (inv!761 lm!238) e!9214)))

(assert (=> start!2342 tp!2476))

(assert (=> start!2342 true))

(declare-fun b!15225 () Bool)

(declare-fun res!11562 () Bool)

(assert (=> b!15225 (=> (not res!11562) (not e!9215))))

(declare-datatypes ((List!454 0))(
  ( (Nil!451) (Cons!450 (h!1016 (_ BitVec 64)) (t!2856 List!454)) )
))
(declare-fun l!1612 () List!454)

(declare-fun isEmpty!118 (List!454) Bool)

(assert (=> b!15225 (= res!11562 (not (isEmpty!118 l!1612)))))

(declare-fun b!15226 () Bool)

(assert (=> b!15226 (= e!9215 (= l!1612 Nil!451))))

(declare-fun b!15227 () Bool)

(declare-fun tp!2477 () Bool)

(assert (=> b!15227 (= e!9214 tp!2477)))

(assert (= (and start!2342 res!11563) b!15225))

(assert (= (and b!15225 res!11562) b!15226))

(assert (= start!2342 b!15227))

(declare-fun m!10133 () Bool)

(assert (=> start!2342 m!10133))

(declare-fun m!10135 () Bool)

(assert (=> start!2342 m!10135))

(declare-fun m!10137 () Bool)

(assert (=> b!15225 m!10137))

(check-sat b_and!881 (not b_next!471) (not b!15225) (not b!15227) (not start!2342))
(check-sat b_and!881 (not b_next!471))
(get-model)

(declare-fun d!2553 () Bool)

(declare-fun res!11584 () Bool)

(declare-fun e!9236 () Bool)

(assert (=> d!2553 (=> res!11584 e!9236)))

(get-info :version)

(assert (=> d!2553 (= res!11584 ((_ is Nil!450) (toList!225 lm!238)))))

(assert (=> d!2553 (= (forall!105 (toList!225 lm!238) p!262) e!9236)))

(declare-fun b!15251 () Bool)

(declare-fun e!9237 () Bool)

(assert (=> b!15251 (= e!9236 e!9237)))

(declare-fun res!11585 () Bool)

(assert (=> b!15251 (=> (not res!11585) (not e!9237))))

(declare-fun dynLambda!97 (Int tuple2!588) Bool)

(assert (=> b!15251 (= res!11585 (dynLambda!97 p!262 (h!1015 (toList!225 lm!238))))))

(declare-fun b!15252 () Bool)

(assert (=> b!15252 (= e!9237 (forall!105 (t!2855 (toList!225 lm!238)) p!262))))

(assert (= (and d!2553 (not res!11584)) b!15251))

(assert (= (and b!15251 res!11585) b!15252))

(declare-fun b_lambda!973 () Bool)

(assert (=> (not b_lambda!973) (not b!15251)))

(declare-fun t!2862 () Bool)

(declare-fun tb!395 () Bool)

(assert (=> (and start!2342 (= p!262 p!262) t!2862) tb!395))

(declare-fun result!701 () Bool)

(assert (=> tb!395 (= result!701 true)))

(assert (=> b!15251 t!2862))

(declare-fun b_and!887 () Bool)

(assert (= b_and!881 (and (=> t!2862 result!701) b_and!887)))

(declare-fun m!10149 () Bool)

(assert (=> b!15251 m!10149))

(declare-fun m!10151 () Bool)

(assert (=> b!15252 m!10151))

(assert (=> start!2342 d!2553))

(declare-fun d!2559 () Bool)

(declare-fun isStrictlySorted!135 (List!453) Bool)

(assert (=> d!2559 (= (inv!761 lm!238) (isStrictlySorted!135 (toList!225 lm!238)))))

(declare-fun bs!643 () Bool)

(assert (= bs!643 d!2559))

(declare-fun m!10159 () Bool)

(assert (=> bs!643 m!10159))

(assert (=> start!2342 d!2559))

(declare-fun d!2565 () Bool)

(assert (=> d!2565 (= (isEmpty!118 l!1612) ((_ is Nil!451) l!1612))))

(assert (=> b!15225 d!2565))

(declare-fun b!15268 () Bool)

(declare-fun e!9247 () Bool)

(declare-fun tp_is_empty!771 () Bool)

(declare-fun tp!2491 () Bool)

(assert (=> b!15268 (= e!9247 (and tp_is_empty!771 tp!2491))))

(assert (=> b!15227 (= tp!2477 e!9247)))

(assert (= (and b!15227 ((_ is Cons!449) (toList!225 lm!238))) b!15268))

(declare-fun b_lambda!979 () Bool)

(assert (= b_lambda!973 (or (and start!2342 b_free!471) b_lambda!979)))

(check-sat (not b_next!471) b_and!887 (not d!2559) (not b!15268) (not b!15252) (not b_lambda!979) tp_is_empty!771)
(check-sat b_and!887 (not b_next!471))
