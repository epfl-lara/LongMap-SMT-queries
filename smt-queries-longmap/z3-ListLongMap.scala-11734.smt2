; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137990 () Bool)

(assert start!137990)

(declare-fun res!1081732 () Bool)

(declare-fun e!884380 () Bool)

(assert (=> start!137990 (=> (not res!1081732) (not e!884380))))

(declare-datatypes ((B!2732 0))(
  ( (B!2733 (val!19728 Int)) )
))
(declare-datatypes ((tuple2!25684 0))(
  ( (tuple2!25685 (_1!12853 (_ BitVec 64)) (_2!12853 B!2732)) )
))
(declare-datatypes ((List!36880 0))(
  ( (Nil!36877) (Cons!36876 (h!38437 tuple2!25684) (t!51786 List!36880)) )
))
(declare-fun l!1356 () List!36880)

(declare-fun isStrictlySorted!1091 (List!36880) Bool)

(assert (=> start!137990 (= res!1081732 (isStrictlySorted!1091 l!1356))))

(assert (=> start!137990 e!884380))

(declare-fun e!884381 () Bool)

(assert (=> start!137990 e!884381))

(assert (=> start!137990 true))

(declare-fun b!1584523 () Bool)

(declare-fun res!1081733 () Bool)

(assert (=> b!1584523 (=> (not res!1081733) (not e!884380))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!950 (List!36880 (_ BitVec 64)) Bool)

(assert (=> b!1584523 (= res!1081733 (not (containsKey!950 l!1356 key!387)))))

(declare-fun b!1584524 () Bool)

(declare-fun ListPrimitiveSize!199 (List!36880) Int)

(assert (=> b!1584524 (= e!884380 (< (ListPrimitiveSize!199 l!1356) 0))))

(declare-fun b!1584525 () Bool)

(declare-fun tp_is_empty!39277 () Bool)

(declare-fun tp!114660 () Bool)

(assert (=> b!1584525 (= e!884381 (and tp_is_empty!39277 tp!114660))))

(assert (= (and start!137990 res!1081732) b!1584523))

(assert (= (and b!1584523 res!1081733) b!1584524))

(get-info :version)

(assert (= (and start!137990 ((_ is Cons!36876) l!1356)) b!1584525))

(declare-fun m!1455021 () Bool)

(assert (=> start!137990 m!1455021))

(declare-fun m!1455023 () Bool)

(assert (=> b!1584523 m!1455023))

(declare-fun m!1455025 () Bool)

(assert (=> b!1584524 m!1455025))

(check-sat (not b!1584525) (not b!1584523) tp_is_empty!39277 (not b!1584524) (not start!137990))
(check-sat)
(get-model)

(declare-fun d!167621 () Bool)

(declare-fun lt!677946 () Int)

(assert (=> d!167621 (>= lt!677946 0)))

(declare-fun e!884400 () Int)

(assert (=> d!167621 (= lt!677946 e!884400)))

(declare-fun c!147440 () Bool)

(assert (=> d!167621 (= c!147440 ((_ is Nil!36877) l!1356))))

(assert (=> d!167621 (= (ListPrimitiveSize!199 l!1356) lt!677946)))

(declare-fun b!1584552 () Bool)

(assert (=> b!1584552 (= e!884400 0)))

(declare-fun b!1584553 () Bool)

(assert (=> b!1584553 (= e!884400 (+ 1 (ListPrimitiveSize!199 (t!51786 l!1356))))))

(assert (= (and d!167621 c!147440) b!1584552))

(assert (= (and d!167621 (not c!147440)) b!1584553))

(declare-fun m!1455039 () Bool)

(assert (=> b!1584553 m!1455039))

(assert (=> b!1584524 d!167621))

(declare-fun d!167627 () Bool)

(declare-fun res!1081766 () Bool)

(declare-fun e!884417 () Bool)

(assert (=> d!167627 (=> res!1081766 e!884417)))

(assert (=> d!167627 (= res!1081766 (and ((_ is Cons!36876) l!1356) (= (_1!12853 (h!38437 l!1356)) key!387)))))

(assert (=> d!167627 (= (containsKey!950 l!1356 key!387) e!884417)))

(declare-fun b!1584570 () Bool)

(declare-fun e!884418 () Bool)

(assert (=> b!1584570 (= e!884417 e!884418)))

(declare-fun res!1081767 () Bool)

(assert (=> b!1584570 (=> (not res!1081767) (not e!884418))))

(assert (=> b!1584570 (= res!1081767 (and (or (not ((_ is Cons!36876) l!1356)) (bvsle (_1!12853 (h!38437 l!1356)) key!387)) ((_ is Cons!36876) l!1356) (bvslt (_1!12853 (h!38437 l!1356)) key!387)))))

(declare-fun b!1584571 () Bool)

(assert (=> b!1584571 (= e!884418 (containsKey!950 (t!51786 l!1356) key!387))))

(assert (= (and d!167627 (not res!1081766)) b!1584570))

(assert (= (and b!1584570 res!1081767) b!1584571))

(declare-fun m!1455045 () Bool)

(assert (=> b!1584571 m!1455045))

(assert (=> b!1584523 d!167627))

(declare-fun d!167633 () Bool)

(declare-fun res!1081780 () Bool)

(declare-fun e!884433 () Bool)

(assert (=> d!167633 (=> res!1081780 e!884433)))

(assert (=> d!167633 (= res!1081780 (or ((_ is Nil!36877) l!1356) ((_ is Nil!36877) (t!51786 l!1356))))))

(assert (=> d!167633 (= (isStrictlySorted!1091 l!1356) e!884433)))

(declare-fun b!1584588 () Bool)

(declare-fun e!884434 () Bool)

(assert (=> b!1584588 (= e!884433 e!884434)))

(declare-fun res!1081781 () Bool)

(assert (=> b!1584588 (=> (not res!1081781) (not e!884434))))

(assert (=> b!1584588 (= res!1081781 (bvslt (_1!12853 (h!38437 l!1356)) (_1!12853 (h!38437 (t!51786 l!1356)))))))

(declare-fun b!1584589 () Bool)

(assert (=> b!1584589 (= e!884434 (isStrictlySorted!1091 (t!51786 l!1356)))))

(assert (= (and d!167633 (not res!1081780)) b!1584588))

(assert (= (and b!1584588 res!1081781) b!1584589))

(declare-fun m!1455051 () Bool)

(assert (=> b!1584589 m!1455051))

(assert (=> start!137990 d!167633))

(declare-fun b!1584604 () Bool)

(declare-fun e!884442 () Bool)

(declare-fun tp!114671 () Bool)

(assert (=> b!1584604 (= e!884442 (and tp_is_empty!39277 tp!114671))))

(assert (=> b!1584525 (= tp!114660 e!884442)))

(assert (= (and b!1584525 ((_ is Cons!36876) (t!51786 l!1356))) b!1584604))

(check-sat (not b!1584589) tp_is_empty!39277 (not b!1584604) (not b!1584571) (not b!1584553))
(check-sat)
