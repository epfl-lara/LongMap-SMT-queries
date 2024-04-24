; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138636 () Bool)

(assert start!138636)

(declare-fun res!1083618 () Bool)

(declare-fun e!886597 () Bool)

(assert (=> start!138636 (=> (not res!1083618) (not e!886597))))

(declare-datatypes ((B!2972 0))(
  ( (B!2973 (val!19848 Int)) )
))
(declare-datatypes ((tuple2!25924 0))(
  ( (tuple2!25925 (_1!12973 (_ BitVec 64)) (_2!12973 B!2972)) )
))
(declare-datatypes ((List!37000 0))(
  ( (Nil!36997) (Cons!36996 (h!38557 tuple2!25924) (t!51911 List!37000)) )
))
(declare-fun l!556 () List!37000)

(declare-fun isStrictlySorted!1178 (List!37000) Bool)

(assert (=> start!138636 (= res!1083618 (isStrictlySorted!1178 l!556))))

(assert (=> start!138636 e!886597))

(declare-fun e!886598 () Bool)

(assert (=> start!138636 e!886598))

(declare-fun b!1587752 () Bool)

(declare-fun ListPrimitiveSize!223 (List!37000) Int)

(assert (=> b!1587752 (= e!886597 (< (ListPrimitiveSize!223 l!556) 0))))

(declare-fun b!1587753 () Bool)

(declare-fun tp_is_empty!39505 () Bool)

(declare-fun tp!115225 () Bool)

(assert (=> b!1587753 (= e!886598 (and tp_is_empty!39505 tp!115225))))

(assert (= (and start!138636 res!1083618) b!1587752))

(get-info :version)

(assert (= (and start!138636 ((_ is Cons!36996) l!556)) b!1587753))

(declare-fun m!1456503 () Bool)

(assert (=> start!138636 m!1456503))

(declare-fun m!1456505 () Bool)

(assert (=> b!1587752 m!1456505))

(check-sat (not b!1587752) (not start!138636) (not b!1587753) tp_is_empty!39505)
(check-sat)
(get-model)

(declare-fun d!168371 () Bool)

(declare-fun lt!678268 () Int)

(assert (=> d!168371 (>= lt!678268 0)))

(declare-fun e!886617 () Int)

(assert (=> d!168371 (= lt!678268 e!886617)))

(declare-fun c!147767 () Bool)

(assert (=> d!168371 (= c!147767 ((_ is Nil!36997) l!556))))

(assert (=> d!168371 (= (ListPrimitiveSize!223 l!556) lt!678268)))

(declare-fun b!1587778 () Bool)

(assert (=> b!1587778 (= e!886617 0)))

(declare-fun b!1587779 () Bool)

(assert (=> b!1587779 (= e!886617 (+ 1 (ListPrimitiveSize!223 (t!51911 l!556))))))

(assert (= (and d!168371 c!147767) b!1587778))

(assert (= (and d!168371 (not c!147767)) b!1587779))

(declare-fun m!1456515 () Bool)

(assert (=> b!1587779 m!1456515))

(assert (=> b!1587752 d!168371))

(declare-fun d!168377 () Bool)

(declare-fun res!1083637 () Bool)

(declare-fun e!886632 () Bool)

(assert (=> d!168377 (=> res!1083637 e!886632)))

(assert (=> d!168377 (= res!1083637 (or ((_ is Nil!36997) l!556) ((_ is Nil!36997) (t!51911 l!556))))))

(assert (=> d!168377 (= (isStrictlySorted!1178 l!556) e!886632)))

(declare-fun b!1587796 () Bool)

(declare-fun e!886633 () Bool)

(assert (=> b!1587796 (= e!886632 e!886633)))

(declare-fun res!1083638 () Bool)

(assert (=> b!1587796 (=> (not res!1083638) (not e!886633))))

(assert (=> b!1587796 (= res!1083638 (bvslt (_1!12973 (h!38557 l!556)) (_1!12973 (h!38557 (t!51911 l!556)))))))

(declare-fun b!1587797 () Bool)

(assert (=> b!1587797 (= e!886633 (isStrictlySorted!1178 (t!51911 l!556)))))

(assert (= (and d!168377 (not res!1083637)) b!1587796))

(assert (= (and b!1587796 res!1083638) b!1587797))

(declare-fun m!1456521 () Bool)

(assert (=> b!1587797 m!1456521))

(assert (=> start!138636 d!168377))

(declare-fun b!1587810 () Bool)

(declare-fun e!886642 () Bool)

(declare-fun tp!115236 () Bool)

(assert (=> b!1587810 (= e!886642 (and tp_is_empty!39505 tp!115236))))

(assert (=> b!1587753 (= tp!115225 e!886642)))

(assert (= (and b!1587753 ((_ is Cons!36996) (t!51911 l!556))) b!1587810))

(check-sat (not b!1587797) (not b!1587779) (not b!1587810) tp_is_empty!39505)
(check-sat)
