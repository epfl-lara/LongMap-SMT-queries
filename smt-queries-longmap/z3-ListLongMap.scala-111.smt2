; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1928 () Bool)

(assert start!1928)

(declare-fun res!10293 () Bool)

(declare-fun e!7783 () Bool)

(assert (=> start!1928 (=> (not res!10293) (not e!7783))))

(declare-datatypes ((B!466 0))(
  ( (B!467 (val!331 Int)) )
))
(declare-datatypes ((tuple2!462 0))(
  ( (tuple2!463 (_1!231 (_ BitVec 64)) (_2!231 B!466)) )
))
(declare-datatypes ((List!386 0))(
  ( (Nil!383) (Cons!382 (h!948 tuple2!462) (t!2779 List!386)) )
))
(declare-fun l!522 () List!386)

(declare-fun isStrictlySorted!73 (List!386) Bool)

(assert (=> start!1928 (= res!10293 (isStrictlySorted!73 l!522))))

(assert (=> start!1928 e!7783))

(declare-fun e!7784 () Bool)

(assert (=> start!1928 e!7784))

(declare-fun tp_is_empty!645 () Bool)

(assert (=> start!1928 tp_is_empty!645))

(declare-fun b!12987 () Bool)

(declare-fun res!10294 () Bool)

(assert (=> b!12987 (=> (not res!10294) (not e!7783))))

(declare-fun value!159 () B!466)

(get-info :version)

(assert (=> b!12987 (= res!10294 (and ((_ is Cons!382) l!522) (= (_2!231 (h!948 l!522)) value!159)))))

(declare-fun b!12988 () Bool)

(assert (=> b!12988 (= e!7783 (not (isStrictlySorted!73 (t!2779 l!522))))))

(declare-fun b!12989 () Bool)

(declare-fun tp!2126 () Bool)

(assert (=> b!12989 (= e!7784 (and tp_is_empty!645 tp!2126))))

(assert (= (and start!1928 res!10293) b!12987))

(assert (= (and b!12987 res!10294) b!12988))

(assert (= (and start!1928 ((_ is Cons!382) l!522)) b!12989))

(declare-fun m!8913 () Bool)

(assert (=> start!1928 m!8913))

(declare-fun m!8915 () Bool)

(assert (=> b!12988 m!8915))

(check-sat (not b!12988) (not start!1928) (not b!12989) tp_is_empty!645)
(check-sat)
(get-model)

(declare-fun d!1937 () Bool)

(declare-fun res!10315 () Bool)

(declare-fun e!7805 () Bool)

(assert (=> d!1937 (=> res!10315 e!7805)))

(assert (=> d!1937 (= res!10315 (or ((_ is Nil!383) (t!2779 l!522)) ((_ is Nil!383) (t!2779 (t!2779 l!522)))))))

(assert (=> d!1937 (= (isStrictlySorted!73 (t!2779 l!522)) e!7805)))

(declare-fun b!13013 () Bool)

(declare-fun e!7807 () Bool)

(assert (=> b!13013 (= e!7805 e!7807)))

(declare-fun res!10317 () Bool)

(assert (=> b!13013 (=> (not res!10317) (not e!7807))))

(assert (=> b!13013 (= res!10317 (bvslt (_1!231 (h!948 (t!2779 l!522))) (_1!231 (h!948 (t!2779 (t!2779 l!522))))))))

(declare-fun b!13015 () Bool)

(assert (=> b!13015 (= e!7807 (isStrictlySorted!73 (t!2779 (t!2779 l!522))))))

(assert (= (and d!1937 (not res!10315)) b!13013))

(assert (= (and b!13013 res!10317) b!13015))

(declare-fun m!8921 () Bool)

(assert (=> b!13015 m!8921))

(assert (=> b!12988 d!1937))

(declare-fun d!1939 () Bool)

(declare-fun res!10319 () Bool)

(declare-fun e!7809 () Bool)

(assert (=> d!1939 (=> res!10319 e!7809)))

(assert (=> d!1939 (= res!10319 (or ((_ is Nil!383) l!522) ((_ is Nil!383) (t!2779 l!522))))))

(assert (=> d!1939 (= (isStrictlySorted!73 l!522) e!7809)))

(declare-fun b!13017 () Bool)

(declare-fun e!7810 () Bool)

(assert (=> b!13017 (= e!7809 e!7810)))

(declare-fun res!10320 () Bool)

(assert (=> b!13017 (=> (not res!10320) (not e!7810))))

(assert (=> b!13017 (= res!10320 (bvslt (_1!231 (h!948 l!522)) (_1!231 (h!948 (t!2779 l!522)))))))

(declare-fun b!13018 () Bool)

(assert (=> b!13018 (= e!7810 (isStrictlySorted!73 (t!2779 l!522)))))

(assert (= (and d!1939 (not res!10319)) b!13017))

(assert (= (and b!13017 res!10320) b!13018))

(assert (=> b!13018 m!8915))

(assert (=> start!1928 d!1939))

(declare-fun b!13035 () Bool)

(declare-fun e!7821 () Bool)

(declare-fun tp!2136 () Bool)

(assert (=> b!13035 (= e!7821 (and tp_is_empty!645 tp!2136))))

(assert (=> b!12989 (= tp!2126 e!7821)))

(assert (= (and b!12989 ((_ is Cons!382) (t!2779 l!522))) b!13035))

(check-sat (not b!13015) (not b!13018) (not b!13035) tp_is_empty!645)
(check-sat)
