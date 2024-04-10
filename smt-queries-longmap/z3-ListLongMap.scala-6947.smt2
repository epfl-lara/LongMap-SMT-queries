; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87476 () Bool)

(assert start!87476)

(declare-fun res!680292 () Bool)

(declare-fun e!569916 () Bool)

(assert (=> start!87476 (=> (not res!680292) (not e!569916))))

(declare-datatypes ((B!1390 0))(
  ( (B!1391 (val!11779 Int)) )
))
(declare-datatypes ((tuple2!15104 0))(
  ( (tuple2!15105 (_1!7563 (_ BitVec 64)) (_2!7563 B!1390)) )
))
(declare-datatypes ((List!21398 0))(
  ( (Nil!21395) (Cons!21394 (h!22592 tuple2!15104) (t!30399 List!21398)) )
))
(declare-fun l!412 () List!21398)

(declare-fun isStrictlySorted!553 (List!21398) Bool)

(assert (=> start!87476 (= res!680292 (isStrictlySorted!553 l!412))))

(assert (=> start!87476 e!569916))

(declare-fun e!569917 () Bool)

(assert (=> start!87476 e!569917))

(declare-fun b!1013140 () Bool)

(declare-fun ListPrimitiveSize!98 (List!21398) Int)

(assert (=> b!1013140 (= e!569916 (< (ListPrimitiveSize!98 l!412) 0))))

(declare-fun b!1013141 () Bool)

(declare-fun tp_is_empty!23457 () Bool)

(declare-fun tp!70394 () Bool)

(assert (=> b!1013141 (= e!569917 (and tp_is_empty!23457 tp!70394))))

(assert (= (and start!87476 res!680292) b!1013140))

(get-info :version)

(assert (= (and start!87476 ((_ is Cons!21394) l!412)) b!1013141))

(declare-fun m!936307 () Bool)

(assert (=> start!87476 m!936307))

(declare-fun m!936309 () Bool)

(assert (=> b!1013140 m!936309))

(check-sat (not start!87476) (not b!1013140) (not b!1013141) tp_is_empty!23457)
(check-sat)
(get-model)

(declare-fun d!120394 () Bool)

(declare-fun res!680300 () Bool)

(declare-fun e!569934 () Bool)

(assert (=> d!120394 (=> res!680300 e!569934)))

(assert (=> d!120394 (= res!680300 (or ((_ is Nil!21395) l!412) ((_ is Nil!21395) (t!30399 l!412))))))

(assert (=> d!120394 (= (isStrictlySorted!553 l!412) e!569934)))

(declare-fun b!1013164 () Bool)

(declare-fun e!569935 () Bool)

(assert (=> b!1013164 (= e!569934 e!569935)))

(declare-fun res!680301 () Bool)

(assert (=> b!1013164 (=> (not res!680301) (not e!569935))))

(assert (=> b!1013164 (= res!680301 (bvslt (_1!7563 (h!22592 l!412)) (_1!7563 (h!22592 (t!30399 l!412)))))))

(declare-fun b!1013165 () Bool)

(assert (=> b!1013165 (= e!569935 (isStrictlySorted!553 (t!30399 l!412)))))

(assert (= (and d!120394 (not res!680300)) b!1013164))

(assert (= (and b!1013164 res!680301) b!1013165))

(declare-fun m!936319 () Bool)

(assert (=> b!1013165 m!936319))

(assert (=> start!87476 d!120394))

(declare-fun d!120403 () Bool)

(declare-fun lt!447882 () Int)

(assert (=> d!120403 (>= lt!447882 0)))

(declare-fun e!569953 () Int)

(assert (=> d!120403 (= lt!447882 e!569953)))

(declare-fun c!102411 () Bool)

(assert (=> d!120403 (= c!102411 ((_ is Nil!21395) l!412))))

(assert (=> d!120403 (= (ListPrimitiveSize!98 l!412) lt!447882)))

(declare-fun b!1013187 () Bool)

(assert (=> b!1013187 (= e!569953 0)))

(declare-fun b!1013188 () Bool)

(assert (=> b!1013188 (= e!569953 (+ 1 (ListPrimitiveSize!98 (t!30399 l!412))))))

(assert (= (and d!120403 c!102411) b!1013187))

(assert (= (and d!120403 (not c!102411)) b!1013188))

(declare-fun m!936325 () Bool)

(assert (=> b!1013188 m!936325))

(assert (=> b!1013140 d!120403))

(declare-fun b!1013198 () Bool)

(declare-fun e!569959 () Bool)

(declare-fun tp!70406 () Bool)

(assert (=> b!1013198 (= e!569959 (and tp_is_empty!23457 tp!70406))))

(assert (=> b!1013141 (= tp!70394 e!569959)))

(assert (= (and b!1013141 ((_ is Cons!21394) (t!30399 l!412))) b!1013198))

(check-sat (not b!1013188) (not b!1013165) (not b!1013198) tp_is_empty!23457)
(check-sat)
