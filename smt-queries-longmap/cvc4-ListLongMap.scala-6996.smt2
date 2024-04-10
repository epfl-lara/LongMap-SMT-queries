; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88730 () Bool)

(assert start!88730)

(declare-fun b!1019169 () Bool)

(declare-fun e!573534 () Bool)

(declare-datatypes ((B!1686 0))(
  ( (B!1687 (val!11927 Int)) )
))
(declare-datatypes ((tuple2!15400 0))(
  ( (tuple2!15401 (_1!7711 (_ BitVec 64)) (_2!7711 B!1686)) )
))
(declare-datatypes ((List!21615 0))(
  ( (Nil!21612) (Cons!21611 (h!22809 tuple2!15400) (t!30619 List!21615)) )
))
(declare-fun l!996 () List!21615)

(declare-fun ListPrimitiveSize!138 (List!21615) Int)

(assert (=> b!1019169 (= e!573534 (>= (ListPrimitiveSize!138 (t!30619 l!996)) (ListPrimitiveSize!138 l!996)))))

(declare-fun res!683305 () Bool)

(declare-fun e!573533 () Bool)

(assert (=> start!88730 (=> (not res!683305) (not e!573533))))

(declare-fun isStrictlySorted!680 (List!21615) Bool)

(assert (=> start!88730 (= res!683305 (isStrictlySorted!680 l!996))))

(assert (=> start!88730 e!573533))

(declare-fun e!573532 () Bool)

(assert (=> start!88730 e!573532))

(assert (=> start!88730 true))

(declare-fun tp_is_empty!23753 () Bool)

(assert (=> start!88730 tp_is_empty!23753))

(declare-fun b!1019170 () Bool)

(declare-fun res!683303 () Bool)

(assert (=> b!1019170 (=> (not res!683303) (not e!573534))))

(assert (=> b!1019170 (= res!683303 (isStrictlySorted!680 (t!30619 l!996)))))

(declare-fun b!1019171 () Bool)

(declare-fun tp!71137 () Bool)

(assert (=> b!1019171 (= e!573532 (and tp_is_empty!23753 tp!71137))))

(declare-fun b!1019172 () Bool)

(assert (=> b!1019172 (= e!573533 e!573534)))

(declare-fun res!683304 () Bool)

(assert (=> b!1019172 (=> (not res!683304) (not e!573534))))

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1019172 (= res!683304 (and (is-Cons!21611 l!996) (bvslt (_1!7711 (h!22809 l!996)) key!261)))))

(declare-fun lt!449634 () List!21615)

(declare-fun value!172 () B!1686)

(declare-fun insertStrictlySorted!358 (List!21615 (_ BitVec 64) B!1686) List!21615)

(assert (=> b!1019172 (= lt!449634 (insertStrictlySorted!358 l!996 key!261 value!172))))

(declare-fun b!1019173 () Bool)

(declare-fun res!683302 () Bool)

(assert (=> b!1019173 (=> (not res!683302) (not e!573533))))

(declare-fun containsKey!540 (List!21615 (_ BitVec 64)) Bool)

(assert (=> b!1019173 (= res!683302 (containsKey!540 l!996 key!261))))

(declare-fun b!1019174 () Bool)

(declare-fun res!683306 () Bool)

(assert (=> b!1019174 (=> (not res!683306) (not e!573534))))

(assert (=> b!1019174 (= res!683306 (containsKey!540 (t!30619 l!996) key!261))))

(assert (= (and start!88730 res!683305) b!1019173))

(assert (= (and b!1019173 res!683302) b!1019172))

(assert (= (and b!1019172 res!683304) b!1019170))

(assert (= (and b!1019170 res!683303) b!1019174))

(assert (= (and b!1019174 res!683306) b!1019169))

(assert (= (and start!88730 (is-Cons!21611 l!996)) b!1019171))

(declare-fun m!939635 () Bool)

(assert (=> b!1019173 m!939635))

(declare-fun m!939637 () Bool)

(assert (=> b!1019170 m!939637))

(declare-fun m!939639 () Bool)

(assert (=> b!1019169 m!939639))

(declare-fun m!939641 () Bool)

(assert (=> b!1019169 m!939641))

(declare-fun m!939643 () Bool)

(assert (=> b!1019174 m!939643))

(declare-fun m!939645 () Bool)

(assert (=> start!88730 m!939645))

(declare-fun m!939647 () Bool)

(assert (=> b!1019172 m!939647))

(push 1)

(assert (not b!1019169))

(assert (not b!1019173))

(assert (not b!1019172))

(assert tp_is_empty!23753)

(assert (not b!1019170))

(assert (not b!1019174))

(assert (not b!1019171))

(assert (not start!88730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122003 () Bool)

(declare-fun res!683321 () Bool)

(declare-fun e!573559 () Bool)

(assert (=> d!122003 (=> res!683321 e!573559)))

(assert (=> d!122003 (= res!683321 (and (is-Cons!21611 (t!30619 l!996)) (= (_1!7711 (h!22809 (t!30619 l!996))) key!261)))))

(assert (=> d!122003 (= (containsKey!540 (t!30619 l!996) key!261) e!573559)))

(declare-fun b!1019209 () Bool)

(declare-fun e!573560 () Bool)

(assert (=> b!1019209 (= e!573559 e!573560)))

(declare-fun res!683322 () Bool)

(assert (=> b!1019209 (=> (not res!683322) (not e!573560))))

(assert (=> b!1019209 (= res!683322 (and (or (not (is-Cons!21611 (t!30619 l!996))) (bvsle (_1!7711 (h!22809 (t!30619 l!996))) key!261)) (is-Cons!21611 (t!30619 l!996)) (bvslt (_1!7711 (h!22809 (t!30619 l!996))) key!261)))))

(declare-fun b!1019210 () Bool)

(assert (=> b!1019210 (= e!573560 (containsKey!540 (t!30619 (t!30619 l!996)) key!261))))

(assert (= (and d!122003 (not res!683321)) b!1019209))

(assert (= (and b!1019209 res!683322) b!1019210))

(declare-fun m!939653 () Bool)

(assert (=> b!1019210 m!939653))

(assert (=> b!1019174 d!122003))

(declare-fun d!122009 () Bool)

(declare-fun res!683325 () Bool)

(declare-fun e!573563 () Bool)

(assert (=> d!122009 (=> res!683325 e!573563)))

(assert (=> d!122009 (= res!683325 (and (is-Cons!21611 l!996) (= (_1!7711 (h!22809 l!996)) key!261)))))

(assert (=> d!122009 (= (containsKey!540 l!996 key!261) e!573563)))

(declare-fun b!1019213 () Bool)

(declare-fun e!573564 () Bool)

(assert (=> b!1019213 (= e!573563 e!573564)))

(declare-fun res!683326 () Bool)

(assert (=> b!1019213 (=> (not res!683326) (not e!573564))))

(assert (=> b!1019213 (= res!683326 (and (or (not (is-Cons!21611 l!996)) (bvsle (_1!7711 (h!22809 l!996)) key!261)) (is-Cons!21611 l!996) (bvslt (_1!7711 (h!22809 l!996)) key!261)))))

(declare-fun b!1019214 () Bool)

(assert (=> b!1019214 (= e!573564 (containsKey!540 (t!30619 l!996) key!261))))

(assert (= (and d!122009 (not res!683325)) b!1019213))

(assert (= (and b!1019213 res!683326) b!1019214))

(assert (=> b!1019214 m!939643))

(assert (=> b!1019173 d!122009))

(declare-fun d!122013 () Bool)

(declare-fun res!683335 () Bool)

(declare-fun e!573573 () Bool)

(assert (=> d!122013 (=> res!683335 e!573573)))

(assert (=> d!122013 (= res!683335 (or (is-Nil!21612 (t!30619 l!996)) (is-Nil!21612 (t!30619 (t!30619 l!996)))))))

(assert (=> d!122013 (= (isStrictlySorted!680 (t!30619 l!996)) e!573573)))

(declare-fun b!1019227 () Bool)

(declare-fun e!573574 () Bool)

(assert (=> b!1019227 (= e!573573 e!573574)))

(declare-fun res!683336 () Bool)

(assert (=> b!1019227 (=> (not res!683336) (not e!573574))))

(assert (=> b!1019227 (= res!683336 (bvslt (_1!7711 (h!22809 (t!30619 l!996))) (_1!7711 (h!22809 (t!30619 (t!30619 l!996))))))))

(declare-fun b!1019228 () Bool)

(assert (=> b!1019228 (= e!573574 (isStrictlySorted!680 (t!30619 (t!30619 l!996))))))

(assert (= (and d!122013 (not res!683335)) b!1019227))

(assert (= (and b!1019227 res!683336) b!1019228))

(declare-fun m!939655 () Bool)

(assert (=> b!1019228 m!939655))

(assert (=> b!1019170 d!122013))

(declare-fun d!122015 () Bool)

(declare-fun lt!449644 () Int)

(assert (=> d!122015 (>= lt!449644 0)))

(declare-fun e!573586 () Int)

(assert (=> d!122015 (= lt!449644 e!573586)))

(declare-fun c!103289 () Bool)

(assert (=> d!122015 (= c!103289 (is-Nil!21612 (t!30619 l!996)))))

(assert (=> d!122015 (= (ListPrimitiveSize!138 (t!30619 l!996)) lt!449644)))

(declare-fun b!1019247 () Bool)

(assert (=> b!1019247 (= e!573586 0)))

(declare-fun b!1019248 () Bool)

(assert (=> b!1019248 (= e!573586 (+ 1 (ListPrimitiveSize!138 (t!30619 (t!30619 l!996)))))))

(assert (= (and d!122015 c!103289) b!1019247))

(assert (= (and d!122015 (not c!103289)) b!1019248))

(declare-fun m!939667 () Bool)

(assert (=> b!1019248 m!939667))

(assert (=> b!1019169 d!122015))

(declare-fun d!122021 () Bool)

(declare-fun lt!449645 () Int)

(assert (=> d!122021 (>= lt!449645 0)))

(declare-fun e!573589 () Int)

(assert (=> d!122021 (= lt!449645 e!573589)))

(declare-fun c!103290 () Bool)

(assert (=> d!122021 (= c!103290 (is-Nil!21612 l!996))))

(assert (=> d!122021 (= (ListPrimitiveSize!138 l!996) lt!449645)))

(declare-fun b!1019251 () Bool)

(assert (=> b!1019251 (= e!573589 0)))

(declare-fun b!1019252 () Bool)

(assert (=> b!1019252 (= e!573589 (+ 1 (ListPrimitiveSize!138 (t!30619 l!996))))))

(assert (= (and d!122021 c!103290) b!1019251))

(assert (= (and d!122021 (not c!103290)) b!1019252))

(assert (=> b!1019252 m!939639))

(assert (=> b!1019169 d!122021))

(declare-fun e!573639 () List!21615)

(declare-fun bm!43069 () Bool)

(declare-fun call!43072 () List!21615)

(declare-fun c!103317 () Bool)

(declare-fun $colon$colon!588 (List!21615 tuple2!15400) List!21615)

(assert (=> bm!43069 (= call!43072 ($colon$colon!588 e!573639 (ite c!103317 (h!22809 l!996) (tuple2!15401 key!261 value!172))))))

(declare-fun c!103316 () Bool)

(assert (=> bm!43069 (= c!103316 c!103317)))

(declare-fun b!1019335 () Bool)

(declare-fun e!573643 () List!21615)

(declare-fun call!43074 () List!21615)

(assert (=> b!1019335 (= e!573643 call!43074)))

(declare-fun bm!43070 () Bool)

(declare-fun call!43073 () List!21615)

(assert (=> bm!43070 (= call!43073 call!43072)))

