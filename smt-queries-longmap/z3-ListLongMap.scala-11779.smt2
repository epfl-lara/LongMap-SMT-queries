; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138774 () Bool)

(assert start!138774)

(declare-fun b!1588454 () Bool)

(declare-fun res!1084041 () Bool)

(declare-fun e!887113 () Bool)

(assert (=> b!1588454 (=> res!1084041 e!887113)))

(declare-datatypes ((B!3002 0))(
  ( (B!3003 (val!19863 Int)) )
))
(declare-datatypes ((tuple2!25954 0))(
  ( (tuple2!25955 (_1!12988 (_ BitVec 64)) (_2!12988 B!3002)) )
))
(declare-datatypes ((List!37015 0))(
  ( (Nil!37012) (Cons!37011 (h!38572 tuple2!25954) (t!51935 List!37015)) )
))
(declare-fun lt!678377 () List!37015)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1019 (List!37015 (_ BitVec 64)) Bool)

(assert (=> b!1588454 (= res!1084041 (not (containsKey!1019 lt!678377 newKey!21)))))

(declare-fun b!1588455 () Bool)

(declare-fun lt!678378 () tuple2!25954)

(declare-fun contains!10586 (List!37015 tuple2!25954) Bool)

(assert (=> b!1588455 (= e!887113 (not (contains!10586 lt!678377 lt!678378)))))

(declare-fun b!1588456 () Bool)

(declare-fun e!887114 () Bool)

(declare-fun tp_is_empty!39535 () Bool)

(declare-fun tp!115318 () Bool)

(assert (=> b!1588456 (= e!887114 (and tp_is_empty!39535 tp!115318))))

(declare-fun b!1588457 () Bool)

(declare-fun res!1084043 () Bool)

(declare-fun e!887112 () Bool)

(assert (=> b!1588457 (=> (not res!1084043) (not e!887112))))

(declare-fun l!556 () List!37015)

(get-info :version)

(assert (=> b!1588457 (= res!1084043 (and (or (not ((_ is Cons!37011) l!556)) (bvsge (_1!12988 (h!38572 l!556)) newKey!21)) (or (not ((_ is Cons!37011) l!556)) (not (= (_1!12988 (h!38572 l!556)) newKey!21))) (or (not ((_ is Cons!37011) l!556)) (bvsle (_1!12988 (h!38572 l!556)) newKey!21)) ((_ is Nil!37012) l!556)))))

(declare-fun res!1084044 () Bool)

(assert (=> start!138774 (=> (not res!1084044) (not e!887112))))

(declare-fun isStrictlySorted!1193 (List!37015) Bool)

(assert (=> start!138774 (= res!1084044 (isStrictlySorted!1193 l!556))))

(assert (=> start!138774 e!887112))

(assert (=> start!138774 e!887114))

(assert (=> start!138774 true))

(assert (=> start!138774 tp_is_empty!39535))

(declare-fun b!1588458 () Bool)

(assert (=> b!1588458 (= e!887112 e!887113)))

(declare-fun res!1084042 () Bool)

(assert (=> b!1588458 (=> res!1084042 e!887113)))

(assert (=> b!1588458 (= res!1084042 (not (isStrictlySorted!1193 lt!678377)))))

(declare-fun $colon$colon!1043 (List!37015 tuple2!25954) List!37015)

(assert (=> b!1588458 (= lt!678377 ($colon$colon!1043 Nil!37012 lt!678378))))

(declare-fun newValue!21 () B!3002)

(assert (=> b!1588458 (= lt!678378 (tuple2!25955 newKey!21 newValue!21))))

(assert (= (and start!138774 res!1084044) b!1588457))

(assert (= (and b!1588457 res!1084043) b!1588458))

(assert (= (and b!1588458 (not res!1084042)) b!1588454))

(assert (= (and b!1588454 (not res!1084041)) b!1588455))

(assert (= (and start!138774 ((_ is Cons!37011) l!556)) b!1588456))

(declare-fun m!1456893 () Bool)

(assert (=> b!1588454 m!1456893))

(declare-fun m!1456895 () Bool)

(assert (=> b!1588455 m!1456895))

(declare-fun m!1456897 () Bool)

(assert (=> start!138774 m!1456897))

(declare-fun m!1456899 () Bool)

(assert (=> b!1588458 m!1456899))

(declare-fun m!1456901 () Bool)

(assert (=> b!1588458 m!1456901))

(check-sat (not start!138774) (not b!1588456) (not b!1588454) (not b!1588455) (not b!1588458) tp_is_empty!39535)
(check-sat)
(get-model)

(declare-fun d!168567 () Bool)

(declare-fun res!1084073 () Bool)

(declare-fun e!887137 () Bool)

(assert (=> d!168567 (=> res!1084073 e!887137)))

(assert (=> d!168567 (= res!1084073 (or ((_ is Nil!37012) l!556) ((_ is Nil!37012) (t!51935 l!556))))))

(assert (=> d!168567 (= (isStrictlySorted!1193 l!556) e!887137)))

(declare-fun b!1588493 () Bool)

(declare-fun e!887138 () Bool)

(assert (=> b!1588493 (= e!887137 e!887138)))

(declare-fun res!1084074 () Bool)

(assert (=> b!1588493 (=> (not res!1084074) (not e!887138))))

(assert (=> b!1588493 (= res!1084074 (bvslt (_1!12988 (h!38572 l!556)) (_1!12988 (h!38572 (t!51935 l!556)))))))

(declare-fun b!1588494 () Bool)

(assert (=> b!1588494 (= e!887138 (isStrictlySorted!1193 (t!51935 l!556)))))

(assert (= (and d!168567 (not res!1084073)) b!1588493))

(assert (= (and b!1588493 res!1084074) b!1588494))

(declare-fun m!1456923 () Bool)

(assert (=> b!1588494 m!1456923))

(assert (=> start!138774 d!168567))

(declare-fun d!168571 () Bool)

(declare-fun res!1084075 () Bool)

(declare-fun e!887139 () Bool)

(assert (=> d!168571 (=> res!1084075 e!887139)))

(assert (=> d!168571 (= res!1084075 (or ((_ is Nil!37012) lt!678377) ((_ is Nil!37012) (t!51935 lt!678377))))))

(assert (=> d!168571 (= (isStrictlySorted!1193 lt!678377) e!887139)))

(declare-fun b!1588495 () Bool)

(declare-fun e!887140 () Bool)

(assert (=> b!1588495 (= e!887139 e!887140)))

(declare-fun res!1084076 () Bool)

(assert (=> b!1588495 (=> (not res!1084076) (not e!887140))))

(assert (=> b!1588495 (= res!1084076 (bvslt (_1!12988 (h!38572 lt!678377)) (_1!12988 (h!38572 (t!51935 lt!678377)))))))

(declare-fun b!1588496 () Bool)

(assert (=> b!1588496 (= e!887140 (isStrictlySorted!1193 (t!51935 lt!678377)))))

(assert (= (and d!168571 (not res!1084075)) b!1588495))

(assert (= (and b!1588495 res!1084076) b!1588496))

(declare-fun m!1456925 () Bool)

(assert (=> b!1588496 m!1456925))

(assert (=> b!1588458 d!168571))

(declare-fun d!168575 () Bool)

(assert (=> d!168575 (= ($colon$colon!1043 Nil!37012 lt!678378) (Cons!37011 lt!678378 Nil!37012))))

(assert (=> b!1588458 d!168575))

(declare-fun d!168577 () Bool)

(declare-fun lt!678396 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!861 (List!37015) (InoxSet tuple2!25954))

(assert (=> d!168577 (= lt!678396 (select (content!861 lt!678377) lt!678378))))

(declare-fun e!887161 () Bool)

(assert (=> d!168577 (= lt!678396 e!887161)))

(declare-fun res!1084097 () Bool)

(assert (=> d!168577 (=> (not res!1084097) (not e!887161))))

(assert (=> d!168577 (= res!1084097 ((_ is Cons!37011) lt!678377))))

(assert (=> d!168577 (= (contains!10586 lt!678377 lt!678378) lt!678396)))

(declare-fun b!1588517 () Bool)

(declare-fun e!887162 () Bool)

(assert (=> b!1588517 (= e!887161 e!887162)))

(declare-fun res!1084098 () Bool)

(assert (=> b!1588517 (=> res!1084098 e!887162)))

(assert (=> b!1588517 (= res!1084098 (= (h!38572 lt!678377) lt!678378))))

(declare-fun b!1588518 () Bool)

(assert (=> b!1588518 (= e!887162 (contains!10586 (t!51935 lt!678377) lt!678378))))

(assert (= (and d!168577 res!1084097) b!1588517))

(assert (= (and b!1588517 (not res!1084098)) b!1588518))

(declare-fun m!1456935 () Bool)

(assert (=> d!168577 m!1456935))

(declare-fun m!1456937 () Bool)

(assert (=> d!168577 m!1456937))

(declare-fun m!1456939 () Bool)

(assert (=> b!1588518 m!1456939))

(assert (=> b!1588455 d!168577))

(declare-fun d!168585 () Bool)

(declare-fun res!1084115 () Bool)

(declare-fun e!887179 () Bool)

(assert (=> d!168585 (=> res!1084115 e!887179)))

(assert (=> d!168585 (= res!1084115 (and ((_ is Cons!37011) lt!678377) (= (_1!12988 (h!38572 lt!678377)) newKey!21)))))

(assert (=> d!168585 (= (containsKey!1019 lt!678377 newKey!21) e!887179)))

(declare-fun b!1588535 () Bool)

(declare-fun e!887180 () Bool)

(assert (=> b!1588535 (= e!887179 e!887180)))

(declare-fun res!1084116 () Bool)

(assert (=> b!1588535 (=> (not res!1084116) (not e!887180))))

(assert (=> b!1588535 (= res!1084116 (and (or (not ((_ is Cons!37011) lt!678377)) (bvsle (_1!12988 (h!38572 lt!678377)) newKey!21)) ((_ is Cons!37011) lt!678377) (bvslt (_1!12988 (h!38572 lt!678377)) newKey!21)))))

(declare-fun b!1588536 () Bool)

(assert (=> b!1588536 (= e!887180 (containsKey!1019 (t!51935 lt!678377) newKey!21))))

(assert (= (and d!168585 (not res!1084115)) b!1588535))

(assert (= (and b!1588535 res!1084116) b!1588536))

(declare-fun m!1456945 () Bool)

(assert (=> b!1588536 m!1456945))

(assert (=> b!1588454 d!168585))

(declare-fun b!1588545 () Bool)

(declare-fun e!887187 () Bool)

(declare-fun tp!115327 () Bool)

(assert (=> b!1588545 (= e!887187 (and tp_is_empty!39535 tp!115327))))

(assert (=> b!1588456 (= tp!115318 e!887187)))

(assert (= (and b!1588456 ((_ is Cons!37011) (t!51935 l!556))) b!1588545))

(check-sat (not b!1588494) (not b!1588518) (not d!168577) (not b!1588545) (not b!1588496) tp_is_empty!39535 (not b!1588536))
(check-sat)
