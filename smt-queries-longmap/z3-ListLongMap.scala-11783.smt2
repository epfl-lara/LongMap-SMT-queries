; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138828 () Bool)

(assert start!138828)

(declare-fun res!1084216 () Bool)

(declare-fun e!887309 () Bool)

(assert (=> start!138828 (=> (not res!1084216) (not e!887309))))

(declare-datatypes ((B!3026 0))(
  ( (B!3027 (val!19875 Int)) )
))
(declare-datatypes ((tuple2!25978 0))(
  ( (tuple2!25979 (_1!13000 (_ BitVec 64)) (_2!13000 B!3026)) )
))
(declare-datatypes ((List!37027 0))(
  ( (Nil!37024) (Cons!37023 (h!38584 tuple2!25978) (t!51950 List!37027)) )
))
(declare-fun l!636 () List!37027)

(declare-fun isStrictlySorted!1205 (List!37027) Bool)

(assert (=> start!138828 (= res!1084216 (isStrictlySorted!1205 l!636))))

(assert (=> start!138828 e!887309))

(declare-fun e!887310 () Bool)

(assert (=> start!138828 e!887310))

(declare-fun b!1588704 () Bool)

(declare-fun ListPrimitiveSize!229 (List!37027) Int)

(assert (=> b!1588704 (= e!887309 (< (ListPrimitiveSize!229 l!636) 0))))

(declare-fun b!1588705 () Bool)

(declare-fun tp_is_empty!39559 () Bool)

(declare-fun tp!115381 () Bool)

(assert (=> b!1588705 (= e!887310 (and tp_is_empty!39559 tp!115381))))

(assert (= (and start!138828 res!1084216) b!1588704))

(get-info :version)

(assert (= (and start!138828 ((_ is Cons!37023) l!636)) b!1588705))

(declare-fun m!1457005 () Bool)

(assert (=> start!138828 m!1457005))

(declare-fun m!1457007 () Bool)

(assert (=> b!1588704 m!1457007))

(check-sat (not start!138828) (not b!1588704) (not b!1588705) tp_is_empty!39559)
(check-sat)
(get-model)

(declare-fun d!168615 () Bool)

(declare-fun res!1084231 () Bool)

(declare-fun e!887331 () Bool)

(assert (=> d!168615 (=> res!1084231 e!887331)))

(assert (=> d!168615 (= res!1084231 (or ((_ is Nil!37024) l!636) ((_ is Nil!37024) (t!51950 l!636))))))

(assert (=> d!168615 (= (isStrictlySorted!1205 l!636) e!887331)))

(declare-fun b!1588726 () Bool)

(declare-fun e!887332 () Bool)

(assert (=> b!1588726 (= e!887331 e!887332)))

(declare-fun res!1084232 () Bool)

(assert (=> b!1588726 (=> (not res!1084232) (not e!887332))))

(assert (=> b!1588726 (= res!1084232 (bvslt (_1!13000 (h!38584 l!636)) (_1!13000 (h!38584 (t!51950 l!636)))))))

(declare-fun b!1588727 () Bool)

(assert (=> b!1588727 (= e!887332 (isStrictlySorted!1205 (t!51950 l!636)))))

(assert (= (and d!168615 (not res!1084231)) b!1588726))

(assert (= (and b!1588726 res!1084232) b!1588727))

(declare-fun m!1457017 () Bool)

(assert (=> b!1588727 m!1457017))

(assert (=> start!138828 d!168615))

(declare-fun d!168619 () Bool)

(declare-fun lt!678413 () Int)

(assert (=> d!168619 (>= lt!678413 0)))

(declare-fun e!887339 () Int)

(assert (=> d!168619 (= lt!678413 e!887339)))

(declare-fun c!147843 () Bool)

(assert (=> d!168619 (= c!147843 ((_ is Nil!37024) l!636))))

(assert (=> d!168619 (= (ListPrimitiveSize!229 l!636) lt!678413)))

(declare-fun b!1588738 () Bool)

(assert (=> b!1588738 (= e!887339 0)))

(declare-fun b!1588739 () Bool)

(assert (=> b!1588739 (= e!887339 (+ 1 (ListPrimitiveSize!229 (t!51950 l!636))))))

(assert (= (and d!168619 c!147843) b!1588738))

(assert (= (and d!168619 (not c!147843)) b!1588739))

(declare-fun m!1457021 () Bool)

(assert (=> b!1588739 m!1457021))

(assert (=> b!1588704 d!168619))

(declare-fun b!1588744 () Bool)

(declare-fun e!887342 () Bool)

(declare-fun tp!115390 () Bool)

(assert (=> b!1588744 (= e!887342 (and tp_is_empty!39559 tp!115390))))

(assert (=> b!1588705 (= tp!115381 e!887342)))

(assert (= (and b!1588705 ((_ is Cons!37023) (t!51950 l!636))) b!1588744))

(check-sat (not b!1588739) (not b!1588727) (not b!1588744) tp_is_empty!39559)
(check-sat)
