; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138196 () Bool)

(assert start!138196)

(declare-fun res!1082693 () Bool)

(declare-fun e!885038 () Bool)

(assert (=> start!138196 (=> (not res!1082693) (not e!885038))))

(declare-datatypes ((B!2974 0))(
  ( (B!2975 (val!19849 Int)) )
))
(declare-datatypes ((tuple2!25866 0))(
  ( (tuple2!25867 (_1!12944 (_ BitVec 64)) (_2!12944 B!2974)) )
))
(declare-datatypes ((List!36969 0))(
  ( (Nil!36966) (Cons!36965 (h!38508 tuple2!25866) (t!51887 List!36969)) )
))
(declare-fun l!556 () List!36969)

(declare-fun isStrictlySorted!1191 (List!36969) Bool)

(assert (=> start!138196 (= res!1082693 (isStrictlySorted!1191 l!556))))

(assert (=> start!138196 e!885038))

(declare-fun e!885039 () Bool)

(assert (=> start!138196 e!885039))

(declare-fun b!1585243 () Bool)

(declare-fun ListPrimitiveSize!224 (List!36969) Int)

(assert (=> b!1585243 (= e!885038 (< (ListPrimitiveSize!224 l!556) 0))))

(declare-fun b!1585244 () Bool)

(declare-fun tp_is_empty!39507 () Bool)

(declare-fun tp!115227 () Bool)

(assert (=> b!1585244 (= e!885039 (and tp_is_empty!39507 tp!115227))))

(assert (= (and start!138196 res!1082693) b!1585243))

(get-info :version)

(assert (= (and start!138196 ((_ is Cons!36965) l!556)) b!1585244))

(declare-fun m!1454179 () Bool)

(assert (=> start!138196 m!1454179))

(declare-fun m!1454181 () Bool)

(assert (=> b!1585243 m!1454181))

(check-sat (not start!138196) (not b!1585243) (not b!1585244) tp_is_empty!39507)
(check-sat)
(get-model)

(declare-fun d!167637 () Bool)

(declare-fun res!1082701 () Bool)

(declare-fun e!885054 () Bool)

(assert (=> d!167637 (=> res!1082701 e!885054)))

(assert (=> d!167637 (= res!1082701 (or ((_ is Nil!36966) l!556) ((_ is Nil!36966) (t!51887 l!556))))))

(assert (=> d!167637 (= (isStrictlySorted!1191 l!556) e!885054)))

(declare-fun b!1585263 () Bool)

(declare-fun e!885055 () Bool)

(assert (=> b!1585263 (= e!885054 e!885055)))

(declare-fun res!1082702 () Bool)

(assert (=> b!1585263 (=> (not res!1082702) (not e!885055))))

(assert (=> b!1585263 (= res!1082702 (bvslt (_1!12944 (h!38508 l!556)) (_1!12944 (h!38508 (t!51887 l!556)))))))

(declare-fun b!1585264 () Bool)

(assert (=> b!1585264 (= e!885055 (isStrictlySorted!1191 (t!51887 l!556)))))

(assert (= (and d!167637 (not res!1082701)) b!1585263))

(assert (= (and b!1585263 res!1082702) b!1585264))

(declare-fun m!1454187 () Bool)

(assert (=> b!1585264 m!1454187))

(assert (=> start!138196 d!167637))

(declare-fun d!167643 () Bool)

(declare-fun lt!677358 () Int)

(assert (=> d!167643 (>= lt!677358 0)))

(declare-fun e!885064 () Int)

(assert (=> d!167643 (= lt!677358 e!885064)))

(declare-fun c!146964 () Bool)

(assert (=> d!167643 (= c!146964 ((_ is Nil!36966) l!556))))

(assert (=> d!167643 (= (ListPrimitiveSize!224 l!556) lt!677358)))

(declare-fun b!1585277 () Bool)

(assert (=> b!1585277 (= e!885064 0)))

(declare-fun b!1585278 () Bool)

(assert (=> b!1585278 (= e!885064 (+ 1 (ListPrimitiveSize!224 (t!51887 l!556))))))

(assert (= (and d!167643 c!146964) b!1585277))

(assert (= (and d!167643 (not c!146964)) b!1585278))

(declare-fun m!1454193 () Bool)

(assert (=> b!1585278 m!1454193))

(assert (=> b!1585243 d!167643))

(declare-fun b!1585287 () Bool)

(declare-fun e!885071 () Bool)

(declare-fun tp!115233 () Bool)

(assert (=> b!1585287 (= e!885071 (and tp_is_empty!39507 tp!115233))))

(assert (=> b!1585244 (= tp!115227 e!885071)))

(assert (= (and b!1585244 ((_ is Cons!36965) (t!51887 l!556))) b!1585287))

(check-sat (not b!1585278) (not b!1585264) (not b!1585287) tp_is_empty!39507)
(check-sat)
