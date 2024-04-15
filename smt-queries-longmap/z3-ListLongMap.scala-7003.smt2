; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88910 () Bool)

(assert start!88910)

(declare-fun res!683794 () Bool)

(declare-fun e!574184 () Bool)

(assert (=> start!88910 (=> (not res!683794) (not e!574184))))

(declare-datatypes ((B!1724 0))(
  ( (B!1725 (val!11946 Int)) )
))
(declare-datatypes ((tuple2!15518 0))(
  ( (tuple2!15519 (_1!7770 (_ BitVec 64)) (_2!7770 B!1724)) )
))
(declare-datatypes ((List!21669 0))(
  ( (Nil!21666) (Cons!21665 (h!22863 tuple2!15518) (t!30670 List!21669)) )
))
(declare-fun l!1367 () List!21669)

(declare-fun isStrictlySorted!695 (List!21669) Bool)

(assert (=> start!88910 (= res!683794 (isStrictlySorted!695 l!1367))))

(assert (=> start!88910 e!574184))

(declare-fun e!574183 () Bool)

(assert (=> start!88910 e!574183))

(assert (=> start!88910 true))

(declare-fun tp_is_empty!23791 () Bool)

(assert (=> start!88910 tp_is_empty!23791))

(declare-fun b!1020149 () Bool)

(declare-fun res!683793 () Bool)

(assert (=> b!1020149 (=> (not res!683793) (not e!574184))))

(declare-fun value!188 () B!1724)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun contains!5901 (List!21669 tuple2!15518) Bool)

(assert (=> b!1020149 (= res!683793 (contains!5901 l!1367 (tuple2!15519 key!393 value!188)))))

(declare-fun b!1020150 () Bool)

(declare-fun ListPrimitiveSize!139 (List!21669) Int)

(assert (=> b!1020150 (= e!574184 (< (ListPrimitiveSize!139 l!1367) 0))))

(declare-fun b!1020151 () Bool)

(declare-fun tp!71236 () Bool)

(assert (=> b!1020151 (= e!574183 (and tp_is_empty!23791 tp!71236))))

(assert (= (and start!88910 res!683794) b!1020149))

(assert (= (and b!1020149 res!683793) b!1020150))

(get-info :version)

(assert (= (and start!88910 ((_ is Cons!21665) l!1367)) b!1020151))

(declare-fun m!939683 () Bool)

(assert (=> start!88910 m!939683))

(declare-fun m!939685 () Bool)

(assert (=> b!1020149 m!939685))

(declare-fun m!939687 () Bool)

(assert (=> b!1020150 m!939687))

(check-sat tp_is_empty!23791 (not start!88910) (not b!1020150) (not b!1020149) (not b!1020151))
(check-sat)
(get-model)

(declare-fun d!122183 () Bool)

(declare-fun lt!449637 () Int)

(assert (=> d!122183 (>= lt!449637 0)))

(declare-fun e!574207 () Int)

(assert (=> d!122183 (= lt!449637 e!574207)))

(declare-fun c!103459 () Bool)

(assert (=> d!122183 (= c!103459 ((_ is Nil!21666) l!1367))))

(assert (=> d!122183 (= (ListPrimitiveSize!139 l!1367) lt!449637)))

(declare-fun b!1020182 () Bool)

(assert (=> b!1020182 (= e!574207 0)))

(declare-fun b!1020183 () Bool)

(assert (=> b!1020183 (= e!574207 (+ 1 (ListPrimitiveSize!139 (t!30670 l!1367))))))

(assert (= (and d!122183 c!103459) b!1020182))

(assert (= (and d!122183 (not c!103459)) b!1020183))

(declare-fun m!939701 () Bool)

(assert (=> b!1020183 m!939701))

(assert (=> b!1020150 d!122183))

(declare-fun d!122185 () Bool)

(declare-fun lt!449644 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!494 (List!21669) (InoxSet tuple2!15518))

(assert (=> d!122185 (= lt!449644 (select (content!494 l!1367) (tuple2!15519 key!393 value!188)))))

(declare-fun e!574223 () Bool)

(assert (=> d!122185 (= lt!449644 e!574223)))

(declare-fun res!683828 () Bool)

(assert (=> d!122185 (=> (not res!683828) (not e!574223))))

(assert (=> d!122185 (= res!683828 ((_ is Cons!21665) l!1367))))

(assert (=> d!122185 (= (contains!5901 l!1367 (tuple2!15519 key!393 value!188)) lt!449644)))

(declare-fun b!1020202 () Bool)

(declare-fun e!574224 () Bool)

(assert (=> b!1020202 (= e!574223 e!574224)))

(declare-fun res!683827 () Bool)

(assert (=> b!1020202 (=> res!683827 e!574224)))

(assert (=> b!1020202 (= res!683827 (= (h!22863 l!1367) (tuple2!15519 key!393 value!188)))))

(declare-fun b!1020203 () Bool)

(assert (=> b!1020203 (= e!574224 (contains!5901 (t!30670 l!1367) (tuple2!15519 key!393 value!188)))))

(assert (= (and d!122185 res!683828) b!1020202))

(assert (= (and b!1020202 (not res!683827)) b!1020203))

(declare-fun m!939713 () Bool)

(assert (=> d!122185 m!939713))

(declare-fun m!939715 () Bool)

(assert (=> d!122185 m!939715))

(declare-fun m!939717 () Bool)

(assert (=> b!1020203 m!939717))

(assert (=> b!1020149 d!122185))

(declare-fun d!122193 () Bool)

(declare-fun res!683841 () Bool)

(declare-fun e!574240 () Bool)

(assert (=> d!122193 (=> res!683841 e!574240)))

(assert (=> d!122193 (= res!683841 (or ((_ is Nil!21666) l!1367) ((_ is Nil!21666) (t!30670 l!1367))))))

(assert (=> d!122193 (= (isStrictlySorted!695 l!1367) e!574240)))

(declare-fun b!1020222 () Bool)

(declare-fun e!574241 () Bool)

(assert (=> b!1020222 (= e!574240 e!574241)))

(declare-fun res!683842 () Bool)

(assert (=> b!1020222 (=> (not res!683842) (not e!574241))))

(assert (=> b!1020222 (= res!683842 (bvslt (_1!7770 (h!22863 l!1367)) (_1!7770 (h!22863 (t!30670 l!1367)))))))

(declare-fun b!1020223 () Bool)

(assert (=> b!1020223 (= e!574241 (isStrictlySorted!695 (t!30670 l!1367)))))

(assert (= (and d!122193 (not res!683841)) b!1020222))

(assert (= (and b!1020222 res!683842) b!1020223))

(declare-fun m!939725 () Bool)

(assert (=> b!1020223 m!939725))

(assert (=> start!88910 d!122193))

(declare-fun b!1020237 () Bool)

(declare-fun e!574249 () Bool)

(declare-fun tp!71250 () Bool)

(assert (=> b!1020237 (= e!574249 (and tp_is_empty!23791 tp!71250))))

(assert (=> b!1020151 (= tp!71236 e!574249)))

(assert (= (and b!1020151 ((_ is Cons!21665) (t!30670 l!1367))) b!1020237))

(check-sat (not b!1020183) (not b!1020223) (not b!1020237) tp_is_empty!23791 (not b!1020203) (not d!122185))
(check-sat)
