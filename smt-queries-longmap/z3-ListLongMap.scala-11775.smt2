; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138654 () Bool)

(assert start!138654)

(declare-fun res!1083647 () Bool)

(declare-fun e!886652 () Bool)

(assert (=> start!138654 (=> (not res!1083647) (not e!886652))))

(declare-datatypes ((B!2978 0))(
  ( (B!2979 (val!19851 Int)) )
))
(declare-datatypes ((tuple2!25930 0))(
  ( (tuple2!25931 (_1!12976 (_ BitVec 64)) (_2!12976 B!2978)) )
))
(declare-datatypes ((List!37003 0))(
  ( (Nil!37000) (Cons!36999 (h!38560 tuple2!25930) (t!51914 List!37003)) )
))
(declare-fun l!556 () List!37003)

(declare-fun isStrictlySorted!1181 (List!37003) Bool)

(assert (=> start!138654 (= res!1083647 (isStrictlySorted!1181 l!556))))

(assert (=> start!138654 e!886652))

(declare-fun e!886651 () Bool)

(assert (=> start!138654 e!886651))

(assert (=> start!138654 true))

(declare-fun b!1587823 () Bool)

(declare-fun res!1083648 () Bool)

(assert (=> b!1587823 (=> (not res!1083648) (not e!886652))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1587823 (= res!1083648 (and ((_ is Cons!36999) l!556) (bvslt (_1!12976 (h!38560 l!556)) newKey!21)))))

(declare-fun b!1587824 () Bool)

(declare-fun ListPrimitiveSize!226 (List!37003) Int)

(assert (=> b!1587824 (= e!886652 (>= (ListPrimitiveSize!226 (t!51914 l!556)) (ListPrimitiveSize!226 l!556)))))

(declare-fun b!1587825 () Bool)

(declare-fun tp_is_empty!39511 () Bool)

(declare-fun tp!115243 () Bool)

(assert (=> b!1587825 (= e!886651 (and tp_is_empty!39511 tp!115243))))

(assert (= (and start!138654 res!1083647) b!1587823))

(assert (= (and b!1587823 res!1083648) b!1587824))

(assert (= (and start!138654 ((_ is Cons!36999) l!556)) b!1587825))

(declare-fun m!1456527 () Bool)

(assert (=> start!138654 m!1456527))

(declare-fun m!1456529 () Bool)

(assert (=> b!1587824 m!1456529))

(declare-fun m!1456531 () Bool)

(assert (=> b!1587824 m!1456531))

(check-sat (not start!138654) (not b!1587824) (not b!1587825) tp_is_empty!39511)
(check-sat)
(get-model)

(declare-fun d!168385 () Bool)

(declare-fun res!1083665 () Bool)

(declare-fun e!886669 () Bool)

(assert (=> d!168385 (=> res!1083665 e!886669)))

(assert (=> d!168385 (= res!1083665 (or ((_ is Nil!37000) l!556) ((_ is Nil!37000) (t!51914 l!556))))))

(assert (=> d!168385 (= (isStrictlySorted!1181 l!556) e!886669)))

(declare-fun b!1587848 () Bool)

(declare-fun e!886670 () Bool)

(assert (=> b!1587848 (= e!886669 e!886670)))

(declare-fun res!1083666 () Bool)

(assert (=> b!1587848 (=> (not res!1083666) (not e!886670))))

(assert (=> b!1587848 (= res!1083666 (bvslt (_1!12976 (h!38560 l!556)) (_1!12976 (h!38560 (t!51914 l!556)))))))

(declare-fun b!1587849 () Bool)

(assert (=> b!1587849 (= e!886670 (isStrictlySorted!1181 (t!51914 l!556)))))

(assert (= (and d!168385 (not res!1083665)) b!1587848))

(assert (= (and b!1587848 res!1083666) b!1587849))

(declare-fun m!1456545 () Bool)

(assert (=> b!1587849 m!1456545))

(assert (=> start!138654 d!168385))

(declare-fun d!168389 () Bool)

(declare-fun lt!678273 () Int)

(assert (=> d!168389 (>= lt!678273 0)))

(declare-fun e!886677 () Int)

(assert (=> d!168389 (= lt!678273 e!886677)))

(declare-fun c!147772 () Bool)

(assert (=> d!168389 (= c!147772 ((_ is Nil!37000) (t!51914 l!556)))))

(assert (=> d!168389 (= (ListPrimitiveSize!226 (t!51914 l!556)) lt!678273)))

(declare-fun b!1587858 () Bool)

(assert (=> b!1587858 (= e!886677 0)))

(declare-fun b!1587859 () Bool)

(assert (=> b!1587859 (= e!886677 (+ 1 (ListPrimitiveSize!226 (t!51914 (t!51914 l!556)))))))

(assert (= (and d!168389 c!147772) b!1587858))

(assert (= (and d!168389 (not c!147772)) b!1587859))

(declare-fun m!1456547 () Bool)

(assert (=> b!1587859 m!1456547))

(assert (=> b!1587824 d!168389))

(declare-fun d!168391 () Bool)

(declare-fun lt!678274 () Int)

(assert (=> d!168391 (>= lt!678274 0)))

(declare-fun e!886680 () Int)

(assert (=> d!168391 (= lt!678274 e!886680)))

(declare-fun c!147773 () Bool)

(assert (=> d!168391 (= c!147773 ((_ is Nil!37000) l!556))))

(assert (=> d!168391 (= (ListPrimitiveSize!226 l!556) lt!678274)))

(declare-fun b!1587862 () Bool)

(assert (=> b!1587862 (= e!886680 0)))

(declare-fun b!1587863 () Bool)

(assert (=> b!1587863 (= e!886680 (+ 1 (ListPrimitiveSize!226 (t!51914 l!556))))))

(assert (= (and d!168391 c!147773) b!1587862))

(assert (= (and d!168391 (not c!147773)) b!1587863))

(assert (=> b!1587863 m!1456529))

(assert (=> b!1587824 d!168391))

(declare-fun b!1587868 () Bool)

(declare-fun e!886683 () Bool)

(declare-fun tp!115252 () Bool)

(assert (=> b!1587868 (= e!886683 (and tp_is_empty!39511 tp!115252))))

(assert (=> b!1587825 (= tp!115243 e!886683)))

(assert (= (and b!1587825 ((_ is Cons!36999) (t!51914 l!556))) b!1587868))

(check-sat (not b!1587859) tp_is_empty!39511 (not b!1587863) (not b!1587868) (not b!1587849))
(check-sat)
