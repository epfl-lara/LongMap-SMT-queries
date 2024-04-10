; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88866 () Bool)

(assert start!88866)

(declare-fun b!1020014 () Bool)

(declare-fun res!683701 () Bool)

(declare-fun e!574095 () Bool)

(assert (=> b!1020014 (=> (not res!683701) (not e!574095))))

(declare-datatypes ((B!1702 0))(
  ( (B!1703 (val!11935 Int)) )
))
(declare-datatypes ((tuple2!15416 0))(
  ( (tuple2!15417 (_1!7719 (_ BitVec 64)) (_2!7719 B!1702)) )
))
(declare-datatypes ((List!21623 0))(
  ( (Nil!21620) (Cons!21619 (h!22817 tuple2!15416) (t!30633 List!21623)) )
))
(declare-fun l!996 () List!21623)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!548 (List!21623 (_ BitVec 64)) Bool)

(assert (=> b!1020014 (= res!683701 (containsKey!548 l!996 key!261))))

(declare-fun b!1020017 () Bool)

(declare-fun e!574094 () Bool)

(declare-fun tp_is_empty!23769 () Bool)

(declare-fun tp!71194 () Bool)

(assert (=> b!1020017 (= e!574094 (and tp_is_empty!23769 tp!71194))))

(declare-fun b!1020015 () Bool)

(declare-fun e!574093 () Bool)

(assert (=> b!1020015 (= e!574095 e!574093)))

(declare-fun res!683702 () Bool)

(assert (=> b!1020015 (=> (not res!683702) (not e!574093))))

(get-info :version)

(assert (=> b!1020015 (= res!683702 (and (or (not ((_ is Cons!21619) l!996)) (bvsge (_1!7719 (h!22817 l!996)) key!261)) (or (not ((_ is Cons!21619) l!996)) (not (= (_1!7719 (h!22817 l!996)) key!261)))))))

(declare-fun value!172 () B!1702)

(declare-fun lt!449775 () List!21623)

(declare-fun insertStrictlySorted!366 (List!21623 (_ BitVec 64) B!1702) List!21623)

(assert (=> b!1020015 (= lt!449775 (insertStrictlySorted!366 l!996 key!261 value!172))))

(declare-fun b!1020016 () Bool)

(declare-fun length!51 (List!21623) Int)

(assert (=> b!1020016 (= e!574093 (not (= (length!51 lt!449775) (length!51 l!996))))))

(declare-fun res!683700 () Bool)

(assert (=> start!88866 (=> (not res!683700) (not e!574095))))

(declare-fun isStrictlySorted!688 (List!21623) Bool)

(assert (=> start!88866 (= res!683700 (isStrictlySorted!688 l!996))))

(assert (=> start!88866 e!574095))

(assert (=> start!88866 e!574094))

(assert (=> start!88866 true))

(assert (=> start!88866 tp_is_empty!23769))

(assert (= (and start!88866 res!683700) b!1020014))

(assert (= (and b!1020014 res!683701) b!1020015))

(assert (= (and b!1020015 res!683702) b!1020016))

(assert (= (and start!88866 ((_ is Cons!21619) l!996)) b!1020017))

(declare-fun m!940157 () Bool)

(assert (=> b!1020014 m!940157))

(declare-fun m!940159 () Bool)

(assert (=> b!1020015 m!940159))

(declare-fun m!940161 () Bool)

(assert (=> b!1020016 m!940161))

(declare-fun m!940163 () Bool)

(assert (=> b!1020016 m!940163))

(declare-fun m!940165 () Bool)

(assert (=> start!88866 m!940165))

(check-sat tp_is_empty!23769 (not start!88866) (not b!1020017) (not b!1020016) (not b!1020015) (not b!1020014))
(check-sat)
(get-model)

(declare-fun b!1020104 () Bool)

(declare-fun e!574149 () List!21623)

(declare-fun e!574152 () List!21623)

(assert (=> b!1020104 (= e!574149 e!574152)))

(declare-fun c!103484 () Bool)

(assert (=> b!1020104 (= c!103484 (and ((_ is Cons!21619) l!996) (= (_1!7719 (h!22817 l!996)) key!261)))))

(declare-fun b!1020105 () Bool)

(declare-fun e!574150 () List!21623)

(declare-fun call!43171 () List!21623)

(assert (=> b!1020105 (= e!574150 call!43171)))

(declare-fun b!1020106 () Bool)

(declare-fun call!43172 () List!21623)

(assert (=> b!1020106 (= e!574149 call!43172)))

(declare-fun e!574148 () List!21623)

(declare-fun bm!43168 () Bool)

(declare-fun c!103483 () Bool)

(declare-fun $colon$colon!596 (List!21623 tuple2!15416) List!21623)

(assert (=> bm!43168 (= call!43172 ($colon$colon!596 e!574148 (ite c!103483 (h!22817 l!996) (tuple2!15417 key!261 value!172))))))

(declare-fun c!103486 () Bool)

(assert (=> bm!43168 (= c!103486 c!103483)))

(declare-fun c!103485 () Bool)

(declare-fun b!1020107 () Bool)

(assert (=> b!1020107 (= e!574148 (ite c!103484 (t!30633 l!996) (ite c!103485 (Cons!21619 (h!22817 l!996) (t!30633 l!996)) Nil!21620)))))

(declare-fun e!574151 () Bool)

(declare-fun lt!449786 () List!21623)

(declare-fun b!1020108 () Bool)

(declare-fun contains!5915 (List!21623 tuple2!15416) Bool)

(assert (=> b!1020108 (= e!574151 (contains!5915 lt!449786 (tuple2!15417 key!261 value!172)))))

(declare-fun b!1020109 () Bool)

(assert (=> b!1020109 (= e!574148 (insertStrictlySorted!366 (t!30633 l!996) key!261 value!172))))

(declare-fun b!1020110 () Bool)

(declare-fun call!43173 () List!21623)

(assert (=> b!1020110 (= e!574152 call!43173)))

(declare-fun bm!43169 () Bool)

(assert (=> bm!43169 (= call!43171 call!43173)))

(declare-fun bm!43170 () Bool)

(assert (=> bm!43170 (= call!43173 call!43172)))

(declare-fun d!122291 () Bool)

(assert (=> d!122291 e!574151))

(declare-fun res!683734 () Bool)

(assert (=> d!122291 (=> (not res!683734) (not e!574151))))

(assert (=> d!122291 (= res!683734 (isStrictlySorted!688 lt!449786))))

(assert (=> d!122291 (= lt!449786 e!574149)))

(assert (=> d!122291 (= c!103483 (and ((_ is Cons!21619) l!996) (bvslt (_1!7719 (h!22817 l!996)) key!261)))))

(assert (=> d!122291 (isStrictlySorted!688 l!996)))

(assert (=> d!122291 (= (insertStrictlySorted!366 l!996 key!261 value!172) lt!449786)))

(declare-fun b!1020111 () Bool)

(assert (=> b!1020111 (= e!574150 call!43171)))

(declare-fun b!1020112 () Bool)

(assert (=> b!1020112 (= c!103485 (and ((_ is Cons!21619) l!996) (bvsgt (_1!7719 (h!22817 l!996)) key!261)))))

(assert (=> b!1020112 (= e!574152 e!574150)))

(declare-fun b!1020113 () Bool)

(declare-fun res!683735 () Bool)

(assert (=> b!1020113 (=> (not res!683735) (not e!574151))))

(assert (=> b!1020113 (= res!683735 (containsKey!548 lt!449786 key!261))))

(assert (= (and d!122291 c!103483) b!1020106))

(assert (= (and d!122291 (not c!103483)) b!1020104))

(assert (= (and b!1020104 c!103484) b!1020110))

(assert (= (and b!1020104 (not c!103484)) b!1020112))

(assert (= (and b!1020112 c!103485) b!1020105))

(assert (= (and b!1020112 (not c!103485)) b!1020111))

(assert (= (or b!1020105 b!1020111) bm!43169))

(assert (= (or b!1020110 bm!43169) bm!43170))

(assert (= (or b!1020106 bm!43170) bm!43168))

(assert (= (and bm!43168 c!103486) b!1020109))

(assert (= (and bm!43168 (not c!103486)) b!1020107))

(assert (= (and d!122291 res!683734) b!1020113))

(assert (= (and b!1020113 res!683735) b!1020108))

(declare-fun m!940199 () Bool)

(assert (=> d!122291 m!940199))

(assert (=> d!122291 m!940165))

(declare-fun m!940201 () Bool)

(assert (=> bm!43168 m!940201))

(declare-fun m!940203 () Bool)

(assert (=> b!1020108 m!940203))

(declare-fun m!940205 () Bool)

(assert (=> b!1020113 m!940205))

(declare-fun m!940207 () Bool)

(assert (=> b!1020109 m!940207))

(assert (=> b!1020015 d!122291))

(declare-fun d!122311 () Bool)

(declare-fun res!683750 () Bool)

(declare-fun e!574170 () Bool)

(assert (=> d!122311 (=> res!683750 e!574170)))

(assert (=> d!122311 (= res!683750 (and ((_ is Cons!21619) l!996) (= (_1!7719 (h!22817 l!996)) key!261)))))

(assert (=> d!122311 (= (containsKey!548 l!996 key!261) e!574170)))

(declare-fun b!1020137 () Bool)

(declare-fun e!574171 () Bool)

(assert (=> b!1020137 (= e!574170 e!574171)))

(declare-fun res!683751 () Bool)

(assert (=> b!1020137 (=> (not res!683751) (not e!574171))))

(assert (=> b!1020137 (= res!683751 (and (or (not ((_ is Cons!21619) l!996)) (bvsle (_1!7719 (h!22817 l!996)) key!261)) ((_ is Cons!21619) l!996) (bvslt (_1!7719 (h!22817 l!996)) key!261)))))

(declare-fun b!1020138 () Bool)

(assert (=> b!1020138 (= e!574171 (containsKey!548 (t!30633 l!996) key!261))))

(assert (= (and d!122311 (not res!683750)) b!1020137))

(assert (= (and b!1020137 res!683751) b!1020138))

(declare-fun m!940211 () Bool)

(assert (=> b!1020138 m!940211))

(assert (=> b!1020014 d!122311))

(declare-fun d!122313 () Bool)

(declare-fun size!31165 (List!21623) Int)

(assert (=> d!122313 (= (length!51 lt!449775) (size!31165 lt!449775))))

(declare-fun bs!29720 () Bool)

(assert (= bs!29720 d!122313))

(declare-fun m!940213 () Bool)

(assert (=> bs!29720 m!940213))

(assert (=> b!1020016 d!122313))

(declare-fun d!122315 () Bool)

(assert (=> d!122315 (= (length!51 l!996) (size!31165 l!996))))

(declare-fun bs!29721 () Bool)

(assert (= bs!29721 d!122315))

(declare-fun m!940215 () Bool)

(assert (=> bs!29721 m!940215))

(assert (=> b!1020016 d!122315))

(declare-fun d!122317 () Bool)

(declare-fun res!683758 () Bool)

(declare-fun e!574181 () Bool)

(assert (=> d!122317 (=> res!683758 e!574181)))

(assert (=> d!122317 (= res!683758 (or ((_ is Nil!21620) l!996) ((_ is Nil!21620) (t!30633 l!996))))))

(assert (=> d!122317 (= (isStrictlySorted!688 l!996) e!574181)))

(declare-fun b!1020153 () Bool)

(declare-fun e!574182 () Bool)

(assert (=> b!1020153 (= e!574181 e!574182)))

(declare-fun res!683759 () Bool)

(assert (=> b!1020153 (=> (not res!683759) (not e!574182))))

(assert (=> b!1020153 (= res!683759 (bvslt (_1!7719 (h!22817 l!996)) (_1!7719 (h!22817 (t!30633 l!996)))))))

(declare-fun b!1020154 () Bool)

(assert (=> b!1020154 (= e!574182 (isStrictlySorted!688 (t!30633 l!996)))))

(assert (= (and d!122317 (not res!683758)) b!1020153))

(assert (= (and b!1020153 res!683759) b!1020154))

(declare-fun m!940227 () Bool)

(assert (=> b!1020154 m!940227))

(assert (=> start!88866 d!122317))

