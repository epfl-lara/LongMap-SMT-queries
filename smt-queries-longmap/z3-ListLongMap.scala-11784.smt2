; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138846 () Bool)

(assert start!138846)

(declare-fun res!1084246 () Bool)

(declare-fun e!887363 () Bool)

(assert (=> start!138846 (=> (not res!1084246) (not e!887363))))

(declare-datatypes ((B!3032 0))(
  ( (B!3033 (val!19878 Int)) )
))
(declare-datatypes ((tuple2!25984 0))(
  ( (tuple2!25985 (_1!13003 (_ BitVec 64)) (_2!13003 B!3032)) )
))
(declare-datatypes ((List!37030 0))(
  ( (Nil!37027) (Cons!37026 (h!38587 tuple2!25984) (t!51953 List!37030)) )
))
(declare-fun l!636 () List!37030)

(declare-fun isStrictlySorted!1208 (List!37030) Bool)

(assert (=> start!138846 (= res!1084246 (isStrictlySorted!1208 l!636))))

(assert (=> start!138846 e!887363))

(declare-fun e!887364 () Bool)

(assert (=> start!138846 e!887364))

(assert (=> start!138846 true))

(declare-fun b!1588775 () Bool)

(declare-fun res!1084245 () Bool)

(assert (=> b!1588775 (=> (not res!1084245) (not e!887363))))

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1588775 (= res!1084245 (and (or (not ((_ is Cons!37026) l!636)) (not (= (_1!13003 (h!38587 l!636)) key!185))) (or (not ((_ is Cons!37026) l!636)) (bvsle (_1!13003 (h!38587 l!636)) key!185)) ((_ is Cons!37026) l!636) (bvslt (_1!13003 (h!38587 l!636)) key!185)))))

(declare-fun b!1588776 () Bool)

(declare-fun ListPrimitiveSize!232 (List!37030) Int)

(assert (=> b!1588776 (= e!887363 (>= (ListPrimitiveSize!232 (t!51953 l!636)) (ListPrimitiveSize!232 l!636)))))

(declare-fun b!1588777 () Bool)

(declare-fun tp_is_empty!39565 () Bool)

(declare-fun tp!115399 () Bool)

(assert (=> b!1588777 (= e!887364 (and tp_is_empty!39565 tp!115399))))

(assert (= (and start!138846 res!1084246) b!1588775))

(assert (= (and b!1588775 res!1084245) b!1588776))

(assert (= (and start!138846 ((_ is Cons!37026) l!636)) b!1588777))

(declare-fun m!1457027 () Bool)

(assert (=> start!138846 m!1457027))

(declare-fun m!1457029 () Bool)

(assert (=> b!1588776 m!1457029))

(declare-fun m!1457031 () Bool)

(assert (=> b!1588776 m!1457031))

(check-sat (not start!138846) (not b!1588776) (not b!1588777) tp_is_empty!39565)
(check-sat)
(get-model)

(declare-fun d!168631 () Bool)

(declare-fun res!1084268 () Bool)

(declare-fun e!887386 () Bool)

(assert (=> d!168631 (=> res!1084268 e!887386)))

(assert (=> d!168631 (= res!1084268 (or ((_ is Nil!37027) l!636) ((_ is Nil!37027) (t!51953 l!636))))))

(assert (=> d!168631 (= (isStrictlySorted!1208 l!636) e!887386)))

(declare-fun b!1588805 () Bool)

(declare-fun e!887388 () Bool)

(assert (=> b!1588805 (= e!887386 e!887388)))

(declare-fun res!1084270 () Bool)

(assert (=> b!1588805 (=> (not res!1084270) (not e!887388))))

(assert (=> b!1588805 (= res!1084270 (bvslt (_1!13003 (h!38587 l!636)) (_1!13003 (h!38587 (t!51953 l!636)))))))

(declare-fun b!1588807 () Bool)

(assert (=> b!1588807 (= e!887388 (isStrictlySorted!1208 (t!51953 l!636)))))

(assert (= (and d!168631 (not res!1084268)) b!1588805))

(assert (= (and b!1588805 res!1084270) b!1588807))

(declare-fun m!1457046 () Bool)

(assert (=> b!1588807 m!1457046))

(assert (=> start!138846 d!168631))

(declare-fun d!168634 () Bool)

(declare-fun lt!678422 () Int)

(assert (=> d!168634 (>= lt!678422 0)))

(declare-fun e!887393 () Int)

(assert (=> d!168634 (= lt!678422 e!887393)))

(declare-fun c!147852 () Bool)

(assert (=> d!168634 (= c!147852 ((_ is Nil!37027) (t!51953 l!636)))))

(assert (=> d!168634 (= (ListPrimitiveSize!232 (t!51953 l!636)) lt!678422)))

(declare-fun b!1588816 () Bool)

(assert (=> b!1588816 (= e!887393 0)))

(declare-fun b!1588817 () Bool)

(assert (=> b!1588817 (= e!887393 (+ 1 (ListPrimitiveSize!232 (t!51953 (t!51953 l!636)))))))

(assert (= (and d!168634 c!147852) b!1588816))

(assert (= (and d!168634 (not c!147852)) b!1588817))

(declare-fun m!1457049 () Bool)

(assert (=> b!1588817 m!1457049))

(assert (=> b!1588776 d!168634))

(declare-fun d!168637 () Bool)

(declare-fun lt!678424 () Int)

(assert (=> d!168637 (>= lt!678424 0)))

(declare-fun e!887395 () Int)

(assert (=> d!168637 (= lt!678424 e!887395)))

(declare-fun c!147854 () Bool)

(assert (=> d!168637 (= c!147854 ((_ is Nil!37027) l!636))))

(assert (=> d!168637 (= (ListPrimitiveSize!232 l!636) lt!678424)))

(declare-fun b!1588820 () Bool)

(assert (=> b!1588820 (= e!887395 0)))

(declare-fun b!1588821 () Bool)

(assert (=> b!1588821 (= e!887395 (+ 1 (ListPrimitiveSize!232 (t!51953 l!636))))))

(assert (= (and d!168637 c!147854) b!1588820))

(assert (= (and d!168637 (not c!147854)) b!1588821))

(assert (=> b!1588821 m!1457029))

(assert (=> b!1588776 d!168637))

(declare-fun b!1588832 () Bool)

(declare-fun e!887401 () Bool)

(declare-fun tp!115410 () Bool)

(assert (=> b!1588832 (= e!887401 (and tp_is_empty!39565 tp!115410))))

(assert (=> b!1588777 (= tp!115399 e!887401)))

(assert (= (and b!1588777 ((_ is Cons!37026) (t!51953 l!636))) b!1588832))

(check-sat (not b!1588817) tp_is_empty!39565 (not b!1588832) (not b!1588821) (not b!1588807))
(check-sat)
