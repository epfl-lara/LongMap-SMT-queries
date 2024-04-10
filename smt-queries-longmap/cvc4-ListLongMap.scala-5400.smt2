; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72086 () Bool)

(assert start!72086)

(declare-fun b!836688 () Bool)

(declare-fun e!466845 () Bool)

(declare-fun e!466843 () Bool)

(assert (=> b!836688 (= e!466845 e!466843)))

(declare-fun res!569182 () Bool)

(assert (=> b!836688 (=> res!569182 e!466843)))

(assert (=> b!836688 (= res!569182 false)))

(declare-fun b!836687 () Bool)

(declare-fun res!569181 () Bool)

(assert (=> b!836687 (=> (not res!569181) (not e!466845))))

(declare-datatypes ((B!1206 0))(
  ( (B!1207 (val!7685 Int)) )
))
(declare-datatypes ((tuple2!10230 0))(
  ( (tuple2!10231 (_1!5126 (_ BitVec 64)) (_2!5126 B!1206)) )
))
(declare-datatypes ((List!15995 0))(
  ( (Nil!15992) (Cons!15991 (h!17122 tuple2!10230) (t!22366 List!15995)) )
))
(declare-fun l!390 () List!15995)

(assert (=> b!836687 (= res!569181 (not (is-Cons!15991 l!390)))))

(declare-fun b!836690 () Bool)

(declare-fun e!466844 () Bool)

(declare-fun tp_is_empty!15275 () Bool)

(declare-fun tp!47486 () Bool)

(assert (=> b!836690 (= e!466844 (and tp_is_empty!15275 tp!47486))))

(declare-fun res!569183 () Bool)

(assert (=> start!72086 (=> (not res!569183) (not e!466845))))

(declare-fun isStrictlySorted!460 (List!15995) Bool)

(assert (=> start!72086 (= res!569183 (isStrictlySorted!460 l!390))))

(assert (=> start!72086 e!466845))

(assert (=> start!72086 e!466844))

(declare-fun b!836689 () Bool)

(declare-datatypes ((List!15996 0))(
  ( (Nil!15993) (Cons!15992 (h!17123 (_ BitVec 64)) (t!22367 List!15996)) )
))
(declare-fun length!27 (List!15996) Int)

(declare-fun length!28 (List!15995) Int)

(assert (=> b!836689 (= e!466843 (not (= (length!27 Nil!15993) (length!28 l!390))))))

(assert (= (and start!72086 res!569183) b!836687))

(assert (= (and b!836687 res!569181) b!836688))

(assert (= (and b!836688 (not res!569182)) b!836689))

(assert (= (and start!72086 (is-Cons!15991 l!390)) b!836690))

(declare-fun m!781861 () Bool)

(assert (=> start!72086 m!781861))

(declare-fun m!781863 () Bool)

(assert (=> b!836689 m!781863))

(declare-fun m!781865 () Bool)

(assert (=> b!836689 m!781865))

(push 1)

(assert (not b!836689))

(assert (not start!72086))

(assert (not b!836690))

(assert tp_is_empty!15275)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107679 () Bool)

(declare-fun size!22900 (List!15996) Int)

(assert (=> d!107679 (= (length!27 Nil!15993) (size!22900 Nil!15993))))

(declare-fun bs!23501 () Bool)

(assert (= bs!23501 d!107679))

(declare-fun m!781867 () Bool)

(assert (=> bs!23501 m!781867))

(assert (=> b!836689 d!107679))

(declare-fun d!107683 () Bool)

(declare-fun size!22901 (List!15995) Int)

(assert (=> d!107683 (= (length!28 l!390) (size!22901 l!390))))

(declare-fun bs!23502 () Bool)

(assert (= bs!23502 d!107683))

(declare-fun m!781869 () Bool)

(assert (=> bs!23502 m!781869))

(assert (=> b!836689 d!107683))

(declare-fun d!107685 () Bool)

(declare-fun res!569194 () Bool)

(declare-fun e!466856 () Bool)

(assert (=> d!107685 (=> res!569194 e!466856)))

(assert (=> d!107685 (= res!569194 (or (is-Nil!15992 l!390) (is-Nil!15992 (t!22366 l!390))))))

(assert (=> d!107685 (= (isStrictlySorted!460 l!390) e!466856)))

(declare-fun b!836701 () Bool)

(declare-fun e!466857 () Bool)

(assert (=> b!836701 (= e!466856 e!466857)))

(declare-fun res!569195 () Bool)

(assert (=> b!836701 (=> (not res!569195) (not e!466857))))

(assert (=> b!836701 (= res!569195 (bvslt (_1!5126 (h!17122 l!390)) (_1!5126 (h!17122 (t!22366 l!390)))))))

(declare-fun b!836702 () Bool)

(assert (=> b!836702 (= e!466857 (isStrictlySorted!460 (t!22366 l!390)))))

(assert (= (and d!107685 (not res!569194)) b!836701))

(assert (= (and b!836701 res!569195) b!836702))

(declare-fun m!781877 () Bool)

(assert (=> b!836702 m!781877))

(assert (=> start!72086 d!107685))

(declare-fun b!836711 () Bool)

(declare-fun e!466862 () Bool)

(declare-fun tp!47491 () Bool)

(assert (=> b!836711 (= e!466862 (and tp_is_empty!15275 tp!47491))))

(assert (=> b!836690 (= tp!47486 e!466862)))

(assert (= (and b!836690 (is-Cons!15991 (t!22366 l!390))) b!836711))

(push 1)

(assert (not d!107683))

(assert tp_is_empty!15275)

(assert (not b!836702))

(assert (not d!107679))

(assert (not b!836711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107703 () Bool)

(declare-fun lt!380458 () Int)

(assert (=> d!107703 (>= lt!380458 0)))

(declare-fun e!466884 () Int)

(assert (=> d!107703 (= lt!380458 e!466884)))

(declare-fun c!91091 () Bool)

(assert (=> d!107703 (= c!91091 (is-Nil!15993 Nil!15993))))

(assert (=> d!107703 (= (size!22900 Nil!15993) lt!380458)))

(declare-fun b!836743 () Bool)

(assert (=> b!836743 (= e!466884 0)))

(declare-fun b!836744 () Bool)

(assert (=> b!836744 (= e!466884 (+ 1 (size!22900 (t!22367 Nil!15993))))))

(assert (= (and d!107703 c!91091) b!836743))

(assert (= (and d!107703 (not c!91091)) b!836744))

(declare-fun m!781891 () Bool)

(assert (=> b!836744 m!781891))

(assert (=> d!107679 d!107703))

(declare-fun d!107705 () Bool)

(declare-fun lt!380461 () Int)

(assert (=> d!107705 (>= lt!380461 0)))

(declare-fun e!466887 () Int)

(assert (=> d!107705 (= lt!380461 e!466887)))

(declare-fun c!91094 () Bool)

(assert (=> d!107705 (= c!91094 (is-Nil!15992 l!390))))

(assert (=> d!107705 (= (size!22901 l!390) lt!380461)))

(declare-fun b!836749 () Bool)

(assert (=> b!836749 (= e!466887 0)))

(declare-fun b!836750 () Bool)

(assert (=> b!836750 (= e!466887 (+ 1 (size!22901 (t!22366 l!390))))))

(assert (= (and d!107705 c!91094) b!836749))

(assert (= (and d!107705 (not c!91094)) b!836750))

(declare-fun m!781893 () Bool)

(assert (=> b!836750 m!781893))

(assert (=> d!107683 d!107705))

(declare-fun d!107707 () Bool)

(declare-fun res!569204 () Bool)

(declare-fun e!466888 () Bool)

(assert (=> d!107707 (=> res!569204 e!466888)))

(assert (=> d!107707 (= res!569204 (or (is-Nil!15992 (t!22366 l!390)) (is-Nil!15992 (t!22366 (t!22366 l!390)))))))

(assert (=> d!107707 (= (isStrictlySorted!460 (t!22366 l!390)) e!466888)))

(declare-fun b!836751 () Bool)

(declare-fun e!466889 () Bool)

(assert (=> b!836751 (= e!466888 e!466889)))

(declare-fun res!569205 () Bool)

(assert (=> b!836751 (=> (not res!569205) (not e!466889))))

(assert (=> b!836751 (= res!569205 (bvslt (_1!5126 (h!17122 (t!22366 l!390))) (_1!5126 (h!17122 (t!22366 (t!22366 l!390))))))))

(declare-fun b!836752 () Bool)

(assert (=> b!836752 (= e!466889 (isStrictlySorted!460 (t!22366 (t!22366 l!390))))))

(assert (= (and d!107707 (not res!569204)) b!836751))

(assert (= (and b!836751 res!569205) b!836752))

(declare-fun m!781895 () Bool)

(assert (=> b!836752 m!781895))

(assert (=> b!836702 d!107707))

(declare-fun b!836753 () Bool)

(declare-fun e!466890 () Bool)

(declare-fun tp!47497 () Bool)

(assert (=> b!836753 (= e!466890 (and tp_is_empty!15275 tp!47497))))

