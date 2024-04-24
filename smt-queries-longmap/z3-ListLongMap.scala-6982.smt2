; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88710 () Bool)

(assert start!88710)

(declare-fun b!1019074 () Bool)

(declare-fun res!683063 () Bool)

(declare-fun e!573459 () Bool)

(assert (=> b!1019074 (=> (not res!683063) (not e!573459))))

(declare-datatypes ((B!1598 0))(
  ( (B!1599 (val!11883 Int)) )
))
(declare-datatypes ((tuple2!15316 0))(
  ( (tuple2!15317 (_1!7669 (_ BitVec 64)) (_2!7669 B!1598)) )
))
(declare-datatypes ((List!21560 0))(
  ( (Nil!21557) (Cons!21556 (h!22763 tuple2!15316) (t!30553 List!21560)) )
))
(declare-fun l!1036 () List!21560)

(declare-fun key!271 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1019074 (= res!683063 (and ((_ is Cons!21556) l!1036) (not (= (_1!7669 (h!22763 l!1036)) key!271))))))

(declare-fun b!1019076 () Bool)

(declare-fun res!683062 () Bool)

(assert (=> b!1019076 (=> (not res!683062) (not e!573459))))

(declare-datatypes ((Option!622 0))(
  ( (Some!621 (v!14472 B!1598)) (None!620) )
))
(declare-fun isDefined!421 (Option!622) Bool)

(declare-fun getValueByKey!571 (List!21560 (_ BitVec 64)) Option!622)

(assert (=> b!1019076 (= res!683062 (isDefined!421 (getValueByKey!571 l!1036 key!271)))))

(declare-fun b!1019077 () Bool)

(declare-fun e!573460 () Bool)

(declare-fun tp_is_empty!23665 () Bool)

(declare-fun tp!70937 () Bool)

(assert (=> b!1019077 (= e!573460 (and tp_is_empty!23665 tp!70937))))

(declare-fun b!1019078 () Bool)

(declare-fun res!683064 () Bool)

(assert (=> b!1019078 (=> (not res!683064) (not e!573459))))

(declare-fun isStrictlySorted!630 (List!21560) Bool)

(assert (=> b!1019078 (= res!683064 (isStrictlySorted!630 (t!30553 l!1036)))))

(declare-fun b!1019079 () Bool)

(declare-fun ListPrimitiveSize!130 (List!21560) Int)

(assert (=> b!1019079 (= e!573459 (>= (ListPrimitiveSize!130 (t!30553 l!1036)) (ListPrimitiveSize!130 l!1036)))))

(declare-fun res!683061 () Bool)

(assert (=> start!88710 (=> (not res!683061) (not e!573459))))

(assert (=> start!88710 (= res!683061 (isStrictlySorted!630 l!1036))))

(assert (=> start!88710 e!573459))

(assert (=> start!88710 e!573460))

(assert (=> start!88710 true))

(declare-fun b!1019075 () Bool)

(declare-fun res!683060 () Bool)

(assert (=> b!1019075 (=> (not res!683060) (not e!573459))))

(assert (=> b!1019075 (= res!683060 (isDefined!421 (getValueByKey!571 (t!30553 l!1036) key!271)))))

(assert (= (and start!88710 res!683061) b!1019076))

(assert (= (and b!1019076 res!683062) b!1019074))

(assert (= (and b!1019074 res!683063) b!1019078))

(assert (= (and b!1019078 res!683064) b!1019075))

(assert (= (and b!1019075 res!683060) b!1019079))

(assert (= (and start!88710 ((_ is Cons!21556) l!1036)) b!1019077))

(declare-fun m!940611 () Bool)

(assert (=> b!1019076 m!940611))

(assert (=> b!1019076 m!940611))

(declare-fun m!940613 () Bool)

(assert (=> b!1019076 m!940613))

(declare-fun m!940615 () Bool)

(assert (=> b!1019078 m!940615))

(declare-fun m!940617 () Bool)

(assert (=> start!88710 m!940617))

(declare-fun m!940619 () Bool)

(assert (=> b!1019075 m!940619))

(assert (=> b!1019075 m!940619))

(declare-fun m!940621 () Bool)

(assert (=> b!1019075 m!940621))

(declare-fun m!940623 () Bool)

(assert (=> b!1019079 m!940623))

(declare-fun m!940625 () Bool)

(assert (=> b!1019079 m!940625))

(check-sat (not start!88710) tp_is_empty!23665 (not b!1019076) (not b!1019078) (not b!1019079) (not b!1019077) (not b!1019075))
(check-sat)
(get-model)

(declare-fun d!122157 () Bool)

(declare-fun isEmpty!917 (Option!622) Bool)

(assert (=> d!122157 (= (isDefined!421 (getValueByKey!571 (t!30553 l!1036) key!271)) (not (isEmpty!917 (getValueByKey!571 (t!30553 l!1036) key!271))))))

(declare-fun bs!29646 () Bool)

(assert (= bs!29646 d!122157))

(assert (=> bs!29646 m!940619))

(declare-fun m!940659 () Bool)

(assert (=> bs!29646 m!940659))

(assert (=> b!1019075 d!122157))

(declare-fun b!1019128 () Bool)

(declare-fun e!573480 () Option!622)

(assert (=> b!1019128 (= e!573480 (getValueByKey!571 (t!30553 (t!30553 l!1036)) key!271))))

(declare-fun b!1019129 () Bool)

(assert (=> b!1019129 (= e!573480 None!620)))

(declare-fun d!122159 () Bool)

(declare-fun c!103477 () Bool)

(assert (=> d!122159 (= c!103477 (and ((_ is Cons!21556) (t!30553 l!1036)) (= (_1!7669 (h!22763 (t!30553 l!1036))) key!271)))))

(declare-fun e!573479 () Option!622)

(assert (=> d!122159 (= (getValueByKey!571 (t!30553 l!1036) key!271) e!573479)))

(declare-fun b!1019127 () Bool)

(assert (=> b!1019127 (= e!573479 e!573480)))

(declare-fun c!103478 () Bool)

(assert (=> b!1019127 (= c!103478 (and ((_ is Cons!21556) (t!30553 l!1036)) (not (= (_1!7669 (h!22763 (t!30553 l!1036))) key!271))))))

(declare-fun b!1019126 () Bool)

(assert (=> b!1019126 (= e!573479 (Some!621 (_2!7669 (h!22763 (t!30553 l!1036)))))))

(assert (= (and d!122159 c!103477) b!1019126))

(assert (= (and d!122159 (not c!103477)) b!1019127))

(assert (= (and b!1019127 c!103478) b!1019128))

(assert (= (and b!1019127 (not c!103478)) b!1019129))

(declare-fun m!940663 () Bool)

(assert (=> b!1019128 m!940663))

(assert (=> b!1019075 d!122159))

(declare-fun d!122167 () Bool)

(assert (=> d!122167 (= (isDefined!421 (getValueByKey!571 l!1036 key!271)) (not (isEmpty!917 (getValueByKey!571 l!1036 key!271))))))

(declare-fun bs!29648 () Bool)

(assert (= bs!29648 d!122167))

(assert (=> bs!29648 m!940611))

(declare-fun m!940665 () Bool)

(assert (=> bs!29648 m!940665))

(assert (=> b!1019076 d!122167))

(declare-fun b!1019134 () Bool)

(declare-fun e!573484 () Option!622)

(assert (=> b!1019134 (= e!573484 (getValueByKey!571 (t!30553 l!1036) key!271))))

(declare-fun b!1019135 () Bool)

(assert (=> b!1019135 (= e!573484 None!620)))

(declare-fun d!122169 () Bool)

(declare-fun c!103479 () Bool)

(assert (=> d!122169 (= c!103479 (and ((_ is Cons!21556) l!1036) (= (_1!7669 (h!22763 l!1036)) key!271)))))

(declare-fun e!573483 () Option!622)

(assert (=> d!122169 (= (getValueByKey!571 l!1036 key!271) e!573483)))

(declare-fun b!1019133 () Bool)

(assert (=> b!1019133 (= e!573483 e!573484)))

(declare-fun c!103480 () Bool)

(assert (=> b!1019133 (= c!103480 (and ((_ is Cons!21556) l!1036) (not (= (_1!7669 (h!22763 l!1036)) key!271))))))

(declare-fun b!1019132 () Bool)

(assert (=> b!1019132 (= e!573483 (Some!621 (_2!7669 (h!22763 l!1036))))))

(assert (= (and d!122169 c!103479) b!1019132))

(assert (= (and d!122169 (not c!103479)) b!1019133))

(assert (= (and b!1019133 c!103480) b!1019134))

(assert (= (and b!1019133 (not c!103480)) b!1019135))

(assert (=> b!1019134 m!940619))

(assert (=> b!1019076 d!122169))

(declare-fun d!122171 () Bool)

(declare-fun lt!449984 () Int)

(assert (=> d!122171 (>= lt!449984 0)))

(declare-fun e!573495 () Int)

(assert (=> d!122171 (= lt!449984 e!573495)))

(declare-fun c!103487 () Bool)

(assert (=> d!122171 (= c!103487 ((_ is Nil!21557) (t!30553 l!1036)))))

(assert (=> d!122171 (= (ListPrimitiveSize!130 (t!30553 l!1036)) lt!449984)))

(declare-fun b!1019152 () Bool)

(assert (=> b!1019152 (= e!573495 0)))

(declare-fun b!1019153 () Bool)

(assert (=> b!1019153 (= e!573495 (+ 1 (ListPrimitiveSize!130 (t!30553 (t!30553 l!1036)))))))

(assert (= (and d!122171 c!103487) b!1019152))

(assert (= (and d!122171 (not c!103487)) b!1019153))

(declare-fun m!940669 () Bool)

(assert (=> b!1019153 m!940669))

(assert (=> b!1019079 d!122171))

(declare-fun d!122177 () Bool)

(declare-fun lt!449985 () Int)

(assert (=> d!122177 (>= lt!449985 0)))

(declare-fun e!573496 () Int)

(assert (=> d!122177 (= lt!449985 e!573496)))

(declare-fun c!103488 () Bool)

(assert (=> d!122177 (= c!103488 ((_ is Nil!21557) l!1036))))

(assert (=> d!122177 (= (ListPrimitiveSize!130 l!1036) lt!449985)))

(declare-fun b!1019154 () Bool)

(assert (=> b!1019154 (= e!573496 0)))

(declare-fun b!1019155 () Bool)

(assert (=> b!1019155 (= e!573496 (+ 1 (ListPrimitiveSize!130 (t!30553 l!1036))))))

(assert (= (and d!122177 c!103488) b!1019154))

(assert (= (and d!122177 (not c!103488)) b!1019155))

(assert (=> b!1019155 m!940623))

(assert (=> b!1019079 d!122177))

(declare-fun d!122181 () Bool)

(declare-fun res!683107 () Bool)

(declare-fun e!573507 () Bool)

(assert (=> d!122181 (=> res!683107 e!573507)))

(assert (=> d!122181 (= res!683107 (or ((_ is Nil!21557) l!1036) ((_ is Nil!21557) (t!30553 l!1036))))))

(assert (=> d!122181 (= (isStrictlySorted!630 l!1036) e!573507)))

(declare-fun b!1019172 () Bool)

(declare-fun e!573508 () Bool)

(assert (=> b!1019172 (= e!573507 e!573508)))

(declare-fun res!683108 () Bool)

(assert (=> b!1019172 (=> (not res!683108) (not e!573508))))

(assert (=> b!1019172 (= res!683108 (bvslt (_1!7669 (h!22763 l!1036)) (_1!7669 (h!22763 (t!30553 l!1036)))))))

(declare-fun b!1019173 () Bool)

(assert (=> b!1019173 (= e!573508 (isStrictlySorted!630 (t!30553 l!1036)))))

(assert (= (and d!122181 (not res!683107)) b!1019172))

(assert (= (and b!1019172 res!683108) b!1019173))

(assert (=> b!1019173 m!940615))

(assert (=> start!88710 d!122181))

(declare-fun d!122185 () Bool)

(declare-fun res!683109 () Bool)

(declare-fun e!573509 () Bool)

(assert (=> d!122185 (=> res!683109 e!573509)))

(assert (=> d!122185 (= res!683109 (or ((_ is Nil!21557) (t!30553 l!1036)) ((_ is Nil!21557) (t!30553 (t!30553 l!1036)))))))

(assert (=> d!122185 (= (isStrictlySorted!630 (t!30553 l!1036)) e!573509)))

(declare-fun b!1019174 () Bool)

(declare-fun e!573510 () Bool)

(assert (=> b!1019174 (= e!573509 e!573510)))

(declare-fun res!683110 () Bool)

(assert (=> b!1019174 (=> (not res!683110) (not e!573510))))

(assert (=> b!1019174 (= res!683110 (bvslt (_1!7669 (h!22763 (t!30553 l!1036))) (_1!7669 (h!22763 (t!30553 (t!30553 l!1036))))))))

(declare-fun b!1019175 () Bool)

(assert (=> b!1019175 (= e!573510 (isStrictlySorted!630 (t!30553 (t!30553 l!1036))))))

(assert (= (and d!122185 (not res!683109)) b!1019174))

(assert (= (and b!1019174 res!683110) b!1019175))

(declare-fun m!940675 () Bool)

(assert (=> b!1019175 m!940675))

(assert (=> b!1019078 d!122185))

(declare-fun b!1019180 () Bool)

(declare-fun e!573513 () Bool)

(declare-fun tp!70946 () Bool)

(assert (=> b!1019180 (= e!573513 (and tp_is_empty!23665 tp!70946))))

(assert (=> b!1019077 (= tp!70937 e!573513)))

(assert (= (and b!1019077 ((_ is Cons!21556) (t!30553 l!1036))) b!1019180))

(check-sat (not b!1019175) (not b!1019155) tp_is_empty!23665 (not b!1019173) (not d!122157) (not b!1019180) (not b!1019128) (not b!1019134) (not d!122167) (not b!1019153))
(check-sat)
