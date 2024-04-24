; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134844 () Bool)

(assert start!134844)

(declare-fun res!1073543 () Bool)

(declare-fun e!876527 () Bool)

(assert (=> start!134844 (=> (not res!1073543) (not e!876527))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134844 (= res!1073543 (not (= key1!37 key2!21)))))

(assert (=> start!134844 e!876527))

(assert (=> start!134844 true))

(declare-fun e!876526 () Bool)

(assert (=> start!134844 e!876526))

(declare-fun b!1572064 () Bool)

(declare-fun res!1073542 () Bool)

(assert (=> b!1572064 (=> (not res!1073542) (not e!876527))))

(declare-datatypes ((B!2522 0))(
  ( (B!2523 (val!19623 Int)) )
))
(declare-datatypes ((tuple2!25408 0))(
  ( (tuple2!25409 (_1!12715 (_ BitVec 64)) (_2!12715 B!2522)) )
))
(declare-datatypes ((List!36775 0))(
  ( (Nil!36772) (Cons!36771 (h!38236 tuple2!25408) (t!51675 List!36775)) )
))
(declare-fun l!750 () List!36775)

(declare-fun isStrictlySorted!998 (List!36775) Bool)

(assert (=> b!1572064 (= res!1073542 (isStrictlySorted!998 l!750))))

(declare-fun b!1572065 () Bool)

(declare-fun ListPrimitiveSize!187 (List!36775) Int)

(assert (=> b!1572065 (= e!876527 (< (ListPrimitiveSize!187 l!750) 0))))

(declare-fun b!1572066 () Bool)

(declare-fun tp_is_empty!39073 () Bool)

(declare-fun tp!114147 () Bool)

(assert (=> b!1572066 (= e!876526 (and tp_is_empty!39073 tp!114147))))

(assert (= (and start!134844 res!1073543) b!1572064))

(assert (= (and b!1572064 res!1073542) b!1572065))

(get-info :version)

(assert (= (and start!134844 ((_ is Cons!36771) l!750)) b!1572066))

(declare-fun m!1446117 () Bool)

(assert (=> b!1572064 m!1446117))

(declare-fun m!1446119 () Bool)

(assert (=> b!1572065 m!1446119))

(check-sat (not b!1572065) (not b!1572064) (not b!1572066) tp_is_empty!39073)
(check-sat)
(get-model)

(declare-fun d!164619 () Bool)

(declare-fun lt!674228 () Int)

(assert (=> d!164619 (>= lt!674228 0)))

(declare-fun e!876548 () Int)

(assert (=> d!164619 (= lt!674228 e!876548)))

(declare-fun c!145579 () Bool)

(assert (=> d!164619 (= c!145579 ((_ is Nil!36772) l!750))))

(assert (=> d!164619 (= (ListPrimitiveSize!187 l!750) lt!674228)))

(declare-fun b!1572097 () Bool)

(assert (=> b!1572097 (= e!876548 0)))

(declare-fun b!1572098 () Bool)

(assert (=> b!1572098 (= e!876548 (+ 1 (ListPrimitiveSize!187 (t!51675 l!750))))))

(assert (= (and d!164619 c!145579) b!1572097))

(assert (= (and d!164619 (not c!145579)) b!1572098))

(declare-fun m!1446129 () Bool)

(assert (=> b!1572098 m!1446129))

(assert (=> b!1572065 d!164619))

(declare-fun d!164625 () Bool)

(declare-fun res!1073570 () Bool)

(declare-fun e!876562 () Bool)

(assert (=> d!164625 (=> res!1073570 e!876562)))

(assert (=> d!164625 (= res!1073570 (or ((_ is Nil!36772) l!750) ((_ is Nil!36772) (t!51675 l!750))))))

(assert (=> d!164625 (= (isStrictlySorted!998 l!750) e!876562)))

(declare-fun b!1572115 () Bool)

(declare-fun e!876563 () Bool)

(assert (=> b!1572115 (= e!876562 e!876563)))

(declare-fun res!1073571 () Bool)

(assert (=> b!1572115 (=> (not res!1073571) (not e!876563))))

(assert (=> b!1572115 (= res!1073571 (bvslt (_1!12715 (h!38236 l!750)) (_1!12715 (h!38236 (t!51675 l!750)))))))

(declare-fun b!1572116 () Bool)

(assert (=> b!1572116 (= e!876563 (isStrictlySorted!998 (t!51675 l!750)))))

(assert (= (and d!164625 (not res!1073570)) b!1572115))

(assert (= (and b!1572115 res!1073571) b!1572116))

(declare-fun m!1446135 () Bool)

(assert (=> b!1572116 m!1446135))

(assert (=> b!1572064 d!164625))

(declare-fun b!1572131 () Bool)

(declare-fun e!876571 () Bool)

(declare-fun tp!114158 () Bool)

(assert (=> b!1572131 (= e!876571 (and tp_is_empty!39073 tp!114158))))

(assert (=> b!1572066 (= tp!114147 e!876571)))

(assert (= (and b!1572066 ((_ is Cons!36771) (t!51675 l!750))) b!1572131))

(check-sat (not b!1572116) (not b!1572098) (not b!1572131) tp_is_empty!39073)
(check-sat)
