; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43890 () Bool)

(assert start!43890)

(declare-fun res!288722 () Bool)

(declare-fun e!285331 () Bool)

(assert (=> start!43890 (=> (not res!288722) (not e!285331))))

(declare-datatypes ((B!1142 0))(
  ( (B!1143 (val!7023 Int)) )
))
(declare-datatypes ((tuple2!9248 0))(
  ( (tuple2!9249 (_1!4635 (_ BitVec 64)) (_2!4635 B!1142)) )
))
(declare-datatypes ((List!9287 0))(
  ( (Nil!9284) (Cons!9283 (h!10139 tuple2!9248) (t!15509 List!9287)) )
))
(declare-fun l!956 () List!9287)

(declare-fun isStrictlySorted!426 (List!9287) Bool)

(assert (=> start!43890 (= res!288722 (isStrictlySorted!426 l!956))))

(assert (=> start!43890 e!285331))

(declare-fun e!285332 () Bool)

(assert (=> start!43890 e!285332))

(assert (=> start!43890 true))

(declare-fun tp_is_empty!13951 () Bool)

(assert (=> start!43890 tp_is_empty!13951))

(declare-fun b!484686 () Bool)

(declare-fun e!285333 () Bool)

(assert (=> b!484686 (= e!285331 e!285333)))

(declare-fun res!288724 () Bool)

(assert (=> b!484686 (=> (not res!288724) (not e!285333))))

(declare-fun key!251 () (_ BitVec 64))

(assert (=> b!484686 (= res!288724 (and (is-Cons!9283 l!956) (bvslt (_1!4635 (h!10139 l!956)) key!251)))))

(declare-fun lt!219412 () List!9287)

(declare-fun value!166 () B!1142)

(declare-fun insertStrictlySorted!241 (List!9287 (_ BitVec 64) B!1142) List!9287)

(assert (=> b!484686 (= lt!219412 (insertStrictlySorted!241 l!956 key!251 value!166))))

(declare-fun b!484687 () Bool)

(declare-fun res!288725 () Bool)

(assert (=> b!484687 (=> (not res!288725) (not e!285333))))

(declare-fun containsKey!389 (List!9287 (_ BitVec 64)) Bool)

(assert (=> b!484687 (= res!288725 (not (containsKey!389 (t!15509 l!956) key!251)))))

(declare-fun b!484688 () Bool)

(declare-fun length!11 (List!9287) Int)

(assert (=> b!484688 (= e!285333 (not (= (length!11 lt!219412) (+ 1 (length!11 l!956)))))))

(assert (=> b!484688 (= (length!11 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)) (+ 1 (length!11 (t!15509 l!956))))))

(declare-datatypes ((Unit!14182 0))(
  ( (Unit!14183) )
))
(declare-fun lt!219411 () Unit!14182)

(declare-fun lemmaAddNewKeyIncrementSize!4 (List!9287 (_ BitVec 64) B!1142) Unit!14182)

(assert (=> b!484688 (= lt!219411 (lemmaAddNewKeyIncrementSize!4 (t!15509 l!956) key!251 value!166))))

(declare-fun b!484689 () Bool)

(declare-fun res!288721 () Bool)

(assert (=> b!484689 (=> (not res!288721) (not e!285331))))

(assert (=> b!484689 (= res!288721 (not (containsKey!389 l!956 key!251)))))

(declare-fun b!484690 () Bool)

(declare-fun res!288723 () Bool)

(assert (=> b!484690 (=> (not res!288723) (not e!285333))))

(assert (=> b!484690 (= res!288723 (isStrictlySorted!426 (t!15509 l!956)))))

(declare-fun b!484691 () Bool)

(declare-fun tp!43552 () Bool)

(assert (=> b!484691 (= e!285332 (and tp_is_empty!13951 tp!43552))))

(assert (= (and start!43890 res!288722) b!484689))

(assert (= (and b!484689 res!288721) b!484686))

(assert (= (and b!484686 res!288724) b!484690))

(assert (= (and b!484690 res!288723) b!484687))

(assert (= (and b!484687 res!288725) b!484688))

(assert (= (and start!43890 (is-Cons!9283 l!956)) b!484691))

(declare-fun m!465105 () Bool)

(assert (=> b!484687 m!465105))

(declare-fun m!465107 () Bool)

(assert (=> b!484689 m!465107))

(declare-fun m!465109 () Bool)

(assert (=> start!43890 m!465109))

(declare-fun m!465111 () Bool)

(assert (=> b!484690 m!465111))

(declare-fun m!465113 () Bool)

(assert (=> b!484686 m!465113))

(declare-fun m!465115 () Bool)

(assert (=> b!484688 m!465115))

(declare-fun m!465117 () Bool)

(assert (=> b!484688 m!465117))

(declare-fun m!465119 () Bool)

(assert (=> b!484688 m!465119))

(declare-fun m!465121 () Bool)

(assert (=> b!484688 m!465121))

(assert (=> b!484688 m!465117))

(declare-fun m!465123 () Bool)

(assert (=> b!484688 m!465123))

(declare-fun m!465125 () Bool)

(assert (=> b!484688 m!465125))

(push 1)

(assert (not b!484691))

(assert (not b!484686))

(assert (not b!484689))

(assert (not b!484687))

(assert tp_is_empty!13951)

(assert (not b!484688))

(assert (not start!43890))

(assert (not b!484690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77149 () Bool)

(declare-fun res!288766 () Bool)

(declare-fun e!285362 () Bool)

(assert (=> d!77149 (=> res!288766 e!285362)))

(assert (=> d!77149 (= res!288766 (and (is-Cons!9283 (t!15509 l!956)) (= (_1!4635 (h!10139 (t!15509 l!956))) key!251)))))

(assert (=> d!77149 (= (containsKey!389 (t!15509 l!956) key!251) e!285362)))

(declare-fun b!484738 () Bool)

(declare-fun e!285363 () Bool)

(assert (=> b!484738 (= e!285362 e!285363)))

(declare-fun res!288767 () Bool)

(assert (=> b!484738 (=> (not res!288767) (not e!285363))))

(assert (=> b!484738 (= res!288767 (and (or (not (is-Cons!9283 (t!15509 l!956))) (bvsle (_1!4635 (h!10139 (t!15509 l!956))) key!251)) (is-Cons!9283 (t!15509 l!956)) (bvslt (_1!4635 (h!10139 (t!15509 l!956))) key!251)))))

(declare-fun b!484739 () Bool)

(assert (=> b!484739 (= e!285363 (containsKey!389 (t!15509 (t!15509 l!956)) key!251))))

(assert (= (and d!77149 (not res!288766)) b!484738))

(assert (= (and b!484738 res!288767) b!484739))

(declare-fun m!465171 () Bool)

(assert (=> b!484739 m!465171))

(assert (=> b!484687 d!77149))

(declare-fun d!77155 () Bool)

(declare-fun res!288768 () Bool)

(declare-fun e!285364 () Bool)

(assert (=> d!77155 (=> res!288768 e!285364)))

(assert (=> d!77155 (= res!288768 (and (is-Cons!9283 l!956) (= (_1!4635 (h!10139 l!956)) key!251)))))

(assert (=> d!77155 (= (containsKey!389 l!956 key!251) e!285364)))

(declare-fun b!484740 () Bool)

(declare-fun e!285365 () Bool)

(assert (=> b!484740 (= e!285364 e!285365)))

(declare-fun res!288769 () Bool)

(assert (=> b!484740 (=> (not res!288769) (not e!285365))))

(assert (=> b!484740 (= res!288769 (and (or (not (is-Cons!9283 l!956)) (bvsle (_1!4635 (h!10139 l!956)) key!251)) (is-Cons!9283 l!956) (bvslt (_1!4635 (h!10139 l!956)) key!251)))))

(declare-fun b!484741 () Bool)

(assert (=> b!484741 (= e!285365 (containsKey!389 (t!15509 l!956) key!251))))

(assert (= (and d!77155 (not res!288768)) b!484740))

(assert (= (and b!484740 res!288769) b!484741))

(assert (=> b!484741 m!465105))

(assert (=> b!484689 d!77155))

(declare-fun b!484812 () Bool)

(declare-fun res!288784 () Bool)

(declare-fun e!285405 () Bool)

(assert (=> b!484812 (=> (not res!288784) (not e!285405))))

(declare-fun lt!219432 () List!9287)

(assert (=> b!484812 (= res!288784 (containsKey!389 lt!219432 key!251))))

(declare-fun b!484813 () Bool)

(declare-fun e!285403 () List!9287)

(declare-fun call!31172 () List!9287)

(assert (=> b!484813 (= e!285403 call!31172)))

(declare-fun e!285401 () List!9287)

(declare-fun b!484814 () Bool)

(assert (=> b!484814 (= e!285401 (insertStrictlySorted!241 (t!15509 (t!15509 l!956)) key!251 value!166))))

(declare-fun bm!31167 () Bool)

(declare-fun call!31170 () List!9287)

(assert (=> bm!31167 (= call!31170 call!31172)))

(declare-fun b!484815 () Bool)

(declare-fun e!285402 () List!9287)

(declare-fun call!31171 () List!9287)

(assert (=> b!484815 (= e!285402 call!31171)))

(declare-fun b!484816 () Bool)

(declare-fun c!58323 () Bool)

(declare-fun c!58321 () Bool)

(assert (=> b!484816 (= e!285401 (ite c!58323 (t!15509 (t!15509 l!956)) (ite c!58321 (Cons!9283 (h!10139 (t!15509 l!956)) (t!15509 (t!15509 l!956))) Nil!9284)))))

(declare-fun b!484817 () Bool)

(assert (=> b!484817 (= e!285402 call!31171)))

(declare-fun bm!31168 () Bool)

(assert (=> bm!31168 (= call!31171 call!31170)))

(declare-fun b!484818 () Bool)

(declare-fun contains!2684 (List!9287 tuple2!9248) Bool)

(assert (=> b!484818 (= e!285405 (contains!2684 lt!219432 (tuple2!9249 key!251 value!166)))))

(declare-fun d!77157 () Bool)

(assert (=> d!77157 e!285405))

(declare-fun res!288785 () Bool)

(assert (=> d!77157 (=> (not res!288785) (not e!285405))))

(assert (=> d!77157 (= res!288785 (isStrictlySorted!426 lt!219432))))

(assert (=> d!77157 (= lt!219432 e!285403)))

(declare-fun c!58324 () Bool)

(assert (=> d!77157 (= c!58324 (and (is-Cons!9283 (t!15509 l!956)) (bvslt (_1!4635 (h!10139 (t!15509 l!956))) key!251)))))

(assert (=> d!77157 (isStrictlySorted!426 (t!15509 l!956))))

(assert (=> d!77157 (= (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166) lt!219432)))

(declare-fun b!484819 () Bool)

(declare-fun e!285404 () List!9287)

(assert (=> b!484819 (= e!285404 call!31170)))

(declare-fun b!484820 () Bool)

(assert (=> b!484820 (= c!58321 (and (is-Cons!9283 (t!15509 l!956)) (bvsgt (_1!4635 (h!10139 (t!15509 l!956))) key!251)))))

(assert (=> b!484820 (= e!285404 e!285402)))

(declare-fun bm!31169 () Bool)

(declare-fun $colon$colon!127 (List!9287 tuple2!9248) List!9287)

(assert (=> bm!31169 (= call!31172 ($colon$colon!127 e!285401 (ite c!58324 (h!10139 (t!15509 l!956)) (tuple2!9249 key!251 value!166))))))

(declare-fun c!58322 () Bool)

(assert (=> bm!31169 (= c!58322 c!58324)))

(declare-fun b!484821 () Bool)

(assert (=> b!484821 (= e!285403 e!285404)))

(assert (=> b!484821 (= c!58323 (and (is-Cons!9283 (t!15509 l!956)) (= (_1!4635 (h!10139 (t!15509 l!956))) key!251)))))

(assert (= (and d!77157 c!58324) b!484813))

(assert (= (and d!77157 (not c!58324)) b!484821))

(assert (= (and b!484821 c!58323) b!484819))

(assert (= (and b!484821 (not c!58323)) b!484820))

(assert (= (and b!484820 c!58321) b!484817))

(assert (= (and b!484820 (not c!58321)) b!484815))

(assert (= (or b!484817 b!484815) bm!31168))

(assert (= (or b!484819 bm!31168) bm!31167))

(assert (= (or b!484813 bm!31167) bm!31169))

(assert (= (and bm!31169 c!58322) b!484814))

(assert (= (and bm!31169 (not c!58322)) b!484816))

(assert (= (and d!77157 res!288785) b!484812))

(assert (= (and b!484812 res!288784) b!484818))

(declare-fun m!465185 () Bool)

(assert (=> b!484818 m!465185))

(declare-fun m!465187 () Bool)

(assert (=> b!484814 m!465187))

(declare-fun m!465189 () Bool)

(assert (=> bm!31169 m!465189))

(declare-fun m!465191 () Bool)

(assert (=> d!77157 m!465191))

(assert (=> d!77157 m!465111))

(declare-fun m!465193 () Bool)

(assert (=> b!484812 m!465193))

(assert (=> b!484688 d!77157))

(declare-fun d!77163 () Bool)

(declare-fun size!15460 (List!9287) Int)

(assert (=> d!77163 (= (length!11 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)) (size!15460 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)))))

(declare-fun bs!15428 () Bool)

(assert (= bs!15428 d!77163))

(assert (=> bs!15428 m!465117))

(declare-fun m!465195 () Bool)

(assert (=> bs!15428 m!465195))

(assert (=> b!484688 d!77163))

(declare-fun d!77165 () Bool)

(assert (=> d!77165 (= (length!11 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)) (+ (length!11 (t!15509 l!956)) 1))))

(declare-fun lt!219440 () Unit!14182)

(declare-fun choose!1382 (List!9287 (_ BitVec 64) B!1142) Unit!14182)

(assert (=> d!77165 (= lt!219440 (choose!1382 (t!15509 l!956) key!251 value!166))))

(assert (=> d!77165 (isStrictlySorted!426 (t!15509 l!956))))

(assert (=> d!77165 (= (lemmaAddNewKeyIncrementSize!4 (t!15509 l!956) key!251 value!166) lt!219440)))

(declare-fun bs!15436 () Bool)

(assert (= bs!15436 d!77165))

(assert (=> bs!15436 m!465111))

(assert (=> bs!15436 m!465121))

(assert (=> bs!15436 m!465117))

(declare-fun m!465229 () Bool)

(assert (=> bs!15436 m!465229))

(assert (=> bs!15436 m!465117))

(assert (=> bs!15436 m!465119))

(assert (=> b!484688 d!77165))

(declare-fun d!77185 () Bool)

(assert (=> d!77185 (= (length!11 (t!15509 l!956)) (size!15460 (t!15509 l!956)))))

(declare-fun bs!15437 () Bool)

(assert (= bs!15437 d!77185))

(declare-fun m!465231 () Bool)

(assert (=> bs!15437 m!465231))

(assert (=> b!484688 d!77185))

(declare-fun d!77187 () Bool)

(assert (=> d!77187 (= (length!11 lt!219412) (size!15460 lt!219412))))

(declare-fun bs!15438 () Bool)

(assert (= bs!15438 d!77187))

(declare-fun m!465233 () Bool)

(assert (=> bs!15438 m!465233))

(assert (=> b!484688 d!77187))

(declare-fun d!77189 () Bool)

(assert (=> d!77189 (= (length!11 l!956) (size!15460 l!956))))

(declare-fun bs!15439 () Bool)

(assert (= bs!15439 d!77189))

(declare-fun m!465235 () Bool)

(assert (=> bs!15439 m!465235))

(assert (=> b!484688 d!77189))

(declare-fun d!77191 () Bool)

(declare-fun res!288800 () Bool)

(declare-fun e!285426 () Bool)

(assert (=> d!77191 (=> res!288800 e!285426)))

(assert (=> d!77191 (= res!288800 (or (is-Nil!9284 (t!15509 l!956)) (is-Nil!9284 (t!15509 (t!15509 l!956)))))))

(assert (=> d!77191 (= (isStrictlySorted!426 (t!15509 l!956)) e!285426)))

(declare-fun b!484852 () Bool)

(declare-fun e!285427 () Bool)

(assert (=> b!484852 (= e!285426 e!285427)))

(declare-fun res!288801 () Bool)

(assert (=> b!484852 (=> (not res!288801) (not e!285427))))

(assert (=> b!484852 (= res!288801 (bvslt (_1!4635 (h!10139 (t!15509 l!956))) (_1!4635 (h!10139 (t!15509 (t!15509 l!956))))))))

(declare-fun b!484853 () Bool)

(assert (=> b!484853 (= e!285427 (isStrictlySorted!426 (t!15509 (t!15509 l!956))))))

(assert (= (and d!77191 (not res!288800)) b!484852))

(assert (= (and b!484852 res!288801) b!484853))

(declare-fun m!465239 () Bool)

(assert (=> b!484853 m!465239))

(assert (=> b!484690 d!77191))

(declare-fun d!77195 () Bool)

(declare-fun res!288802 () Bool)

(declare-fun e!285428 () Bool)

(assert (=> d!77195 (=> res!288802 e!285428)))

(assert (=> d!77195 (= res!288802 (or (is-Nil!9284 l!956) (is-Nil!9284 (t!15509 l!956))))))

(assert (=> d!77195 (= (isStrictlySorted!426 l!956) e!285428)))

(declare-fun b!484854 () Bool)

(declare-fun e!285429 () Bool)

(assert (=> b!484854 (= e!285428 e!285429)))

(declare-fun res!288803 () Bool)

(assert (=> b!484854 (=> (not res!288803) (not e!285429))))

(assert (=> b!484854 (= res!288803 (bvslt (_1!4635 (h!10139 l!956)) (_1!4635 (h!10139 (t!15509 l!956)))))))

(declare-fun b!484855 () Bool)

(assert (=> b!484855 (= e!285429 (isStrictlySorted!426 (t!15509 l!956)))))

(assert (= (and d!77195 (not res!288802)) b!484854))

(assert (= (and b!484854 res!288803) b!484855))

(assert (=> b!484855 m!465111))

(assert (=> start!43890 d!77195))

(declare-fun b!484856 () Bool)

(declare-fun res!288804 () Bool)

(declare-fun e!285434 () Bool)

(assert (=> b!484856 (=> (not res!288804) (not e!285434))))

(declare-fun lt!219443 () List!9287)

(assert (=> b!484856 (= res!288804 (containsKey!389 lt!219443 key!251))))

(declare-fun b!484857 () Bool)

(declare-fun e!285432 () List!9287)

(declare-fun call!31181 () List!9287)

(assert (=> b!484857 (= e!285432 call!31181)))

(declare-fun b!484858 () Bool)

(declare-fun e!285430 () List!9287)

(assert (=> b!484858 (= e!285430 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166))))

(declare-fun bm!31176 () Bool)

(declare-fun call!31179 () List!9287)

(assert (=> bm!31176 (= call!31179 call!31181)))

(declare-fun b!484859 () Bool)

(declare-fun e!285431 () List!9287)

(declare-fun call!31180 () List!9287)

(assert (=> b!484859 (= e!285431 call!31180)))

(declare-fun c!58335 () Bool)

(declare-fun c!58333 () Bool)

(declare-fun b!484860 () Bool)

(assert (=> b!484860 (= e!285430 (ite c!58335 (t!15509 l!956) (ite c!58333 (Cons!9283 (h!10139 l!956) (t!15509 l!956)) Nil!9284)))))

(declare-fun b!484861 () Bool)

(assert (=> b!484861 (= e!285431 call!31180)))

(declare-fun bm!31177 () Bool)

(assert (=> bm!31177 (= call!31180 call!31179)))

(declare-fun b!484862 () Bool)

(assert (=> b!484862 (= e!285434 (contains!2684 lt!219443 (tuple2!9249 key!251 value!166)))))

(declare-fun d!77197 () Bool)

(assert (=> d!77197 e!285434))

(declare-fun res!288805 () Bool)

(assert (=> d!77197 (=> (not res!288805) (not e!285434))))

(assert (=> d!77197 (= res!288805 (isStrictlySorted!426 lt!219443))))

(assert (=> d!77197 (= lt!219443 e!285432)))

(declare-fun c!58336 () Bool)

(assert (=> d!77197 (= c!58336 (and (is-Cons!9283 l!956) (bvslt (_1!4635 (h!10139 l!956)) key!251)))))

(assert (=> d!77197 (isStrictlySorted!426 l!956)))

(assert (=> d!77197 (= (insertStrictlySorted!241 l!956 key!251 value!166) lt!219443)))

(declare-fun b!484863 () Bool)

(declare-fun e!285433 () List!9287)

(assert (=> b!484863 (= e!285433 call!31179)))

(declare-fun b!484864 () Bool)

(assert (=> b!484864 (= c!58333 (and (is-Cons!9283 l!956) (bvsgt (_1!4635 (h!10139 l!956)) key!251)))))

(assert (=> b!484864 (= e!285433 e!285431)))

(declare-fun bm!31178 () Bool)

(assert (=> bm!31178 (= call!31181 ($colon$colon!127 e!285430 (ite c!58336 (h!10139 l!956) (tuple2!9249 key!251 value!166))))))

(declare-fun c!58334 () Bool)

(assert (=> bm!31178 (= c!58334 c!58336)))

(declare-fun b!484865 () Bool)

(assert (=> b!484865 (= e!285432 e!285433)))

(assert (=> b!484865 (= c!58335 (and (is-Cons!9283 l!956) (= (_1!4635 (h!10139 l!956)) key!251)))))

(assert (= (and d!77197 c!58336) b!484857))

(assert (= (and d!77197 (not c!58336)) b!484865))

(assert (= (and b!484865 c!58335) b!484863))

(assert (= (and b!484865 (not c!58335)) b!484864))

(assert (= (and b!484864 c!58333) b!484861))

(assert (= (and b!484864 (not c!58333)) b!484859))

(assert (= (or b!484861 b!484859) bm!31177))

(assert (= (or b!484863 bm!31177) bm!31176))

(assert (= (or b!484857 bm!31176) bm!31178))

(assert (= (and bm!31178 c!58334) b!484858))

(assert (= (and bm!31178 (not c!58334)) b!484860))

(assert (= (and d!77197 res!288805) b!484856))

(assert (= (and b!484856 res!288804) b!484862))

(declare-fun m!465241 () Bool)

(assert (=> b!484862 m!465241))

(assert (=> b!484858 m!465117))

(declare-fun m!465243 () Bool)

(assert (=> bm!31178 m!465243))

(declare-fun m!465245 () Bool)

(assert (=> d!77197 m!465245))

(assert (=> d!77197 m!465109))

(declare-fun m!465247 () Bool)

(assert (=> b!484856 m!465247))

(assert (=> b!484686 d!77197))

(declare-fun b!484878 () Bool)

(declare-fun e!285445 () Bool)

(declare-fun tp!43561 () Bool)

(assert (=> b!484878 (= e!285445 (and tp_is_empty!13951 tp!43561))))

(assert (=> b!484691 (= tp!43552 e!285445)))

(assert (= (and b!484691 (is-Cons!9283 (t!15509 l!956))) b!484878))

(push 1)

(assert (not b!484818))

(assert (not b!484812))

(assert (not b!484862))

(assert (not b!484878))

(assert (not b!484856))

(assert (not d!77197))

(assert (not d!77187))

(assert (not d!77163))

(assert (not b!484814))

(assert (not bm!31178))

(assert (not b!484741))

(assert (not b!484858))

(assert tp_is_empty!13951)

(assert (not b!484739))

(assert (not d!77165))

(assert (not d!77189))

(assert (not bm!31169))

(assert (not d!77157))

(assert (not b!484853))

(assert (not b!484855))

(assert (not d!77185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!484741 d!77149))

(declare-fun lt!219459 () Bool)

(declare-fun d!77235 () Bool)

(declare-fun content!214 (List!9287) (Set tuple2!9248))

(assert (=> d!77235 (= lt!219459 (set.member (tuple2!9249 key!251 value!166) (content!214 lt!219443)))))

(declare-fun e!285505 () Bool)

(assert (=> d!77235 (= lt!219459 e!285505)))

(declare-fun res!288854 () Bool)

(assert (=> d!77235 (=> (not res!288854) (not e!285505))))

(assert (=> d!77235 (= res!288854 (is-Cons!9283 lt!219443))))

(assert (=> d!77235 (= (contains!2684 lt!219443 (tuple2!9249 key!251 value!166)) lt!219459)))

(declare-fun b!484957 () Bool)

(declare-fun e!285504 () Bool)

(assert (=> b!484957 (= e!285505 e!285504)))

(declare-fun res!288855 () Bool)

(assert (=> b!484957 (=> res!288855 e!285504)))

(assert (=> b!484957 (= res!288855 (= (h!10139 lt!219443) (tuple2!9249 key!251 value!166)))))

(declare-fun b!484958 () Bool)

(assert (=> b!484958 (= e!285504 (contains!2684 (t!15509 lt!219443) (tuple2!9249 key!251 value!166)))))

(assert (= (and d!77235 res!288854) b!484957))

(assert (= (and b!484957 (not res!288855)) b!484958))

(declare-fun m!465299 () Bool)

(assert (=> d!77235 m!465299))

(declare-fun m!465303 () Bool)

(assert (=> d!77235 m!465303))

(declare-fun m!465307 () Bool)

(assert (=> b!484958 m!465307))

(assert (=> b!484862 d!77235))

(declare-fun d!77247 () Bool)

(declare-fun res!288856 () Bool)

(declare-fun e!285506 () Bool)

(assert (=> d!77247 (=> res!288856 e!285506)))

(assert (=> d!77247 (= res!288856 (or (is-Nil!9284 (t!15509 (t!15509 l!956))) (is-Nil!9284 (t!15509 (t!15509 (t!15509 l!956))))))))

(assert (=> d!77247 (= (isStrictlySorted!426 (t!15509 (t!15509 l!956))) e!285506)))

(declare-fun b!484959 () Bool)

(declare-fun e!285507 () Bool)

(assert (=> b!484959 (= e!285506 e!285507)))

(declare-fun res!288857 () Bool)

(assert (=> b!484959 (=> (not res!288857) (not e!285507))))

(assert (=> b!484959 (= res!288857 (bvslt (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) (_1!4635 (h!10139 (t!15509 (t!15509 (t!15509 l!956)))))))))

(declare-fun b!484960 () Bool)

(assert (=> b!484960 (= e!285507 (isStrictlySorted!426 (t!15509 (t!15509 (t!15509 l!956)))))))

(assert (= (and d!77247 (not res!288856)) b!484959))

(assert (= (and b!484959 res!288857) b!484960))

(declare-fun m!465313 () Bool)

(assert (=> b!484960 m!465313))

(assert (=> b!484853 d!77247))

(declare-fun lt!219460 () Bool)

(declare-fun d!77249 () Bool)

(assert (=> d!77249 (= lt!219460 (set.member (tuple2!9249 key!251 value!166) (content!214 lt!219432)))))

(declare-fun e!285510 () Bool)

(assert (=> d!77249 (= lt!219460 e!285510)))

(declare-fun res!288858 () Bool)

(assert (=> d!77249 (=> (not res!288858) (not e!285510))))

(assert (=> d!77249 (= res!288858 (is-Cons!9283 lt!219432))))

(assert (=> d!77249 (= (contains!2684 lt!219432 (tuple2!9249 key!251 value!166)) lt!219460)))

(declare-fun b!484962 () Bool)

(declare-fun e!285509 () Bool)

(assert (=> b!484962 (= e!285510 e!285509)))

(declare-fun res!288859 () Bool)

(assert (=> b!484962 (=> res!288859 e!285509)))

(assert (=> b!484962 (= res!288859 (= (h!10139 lt!219432) (tuple2!9249 key!251 value!166)))))

(declare-fun b!484963 () Bool)

(assert (=> b!484963 (= e!285509 (contains!2684 (t!15509 lt!219432) (tuple2!9249 key!251 value!166)))))

(assert (= (and d!77249 res!288858) b!484962))

(assert (= (and b!484962 (not res!288859)) b!484963))

(declare-fun m!465315 () Bool)

(assert (=> d!77249 m!465315))

(declare-fun m!465317 () Bool)

(assert (=> d!77249 m!465317))

(declare-fun m!465319 () Bool)

(assert (=> b!484963 m!465319))

(assert (=> b!484818 d!77249))

(declare-fun d!77251 () Bool)

(declare-fun res!288860 () Bool)

(declare-fun e!285511 () Bool)

(assert (=> d!77251 (=> res!288860 e!285511)))

(assert (=> d!77251 (= res!288860 (and (is-Cons!9283 (t!15509 (t!15509 l!956))) (= (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) key!251)))))

(assert (=> d!77251 (= (containsKey!389 (t!15509 (t!15509 l!956)) key!251) e!285511)))

(declare-fun b!484964 () Bool)

(declare-fun e!285512 () Bool)

(assert (=> b!484964 (= e!285511 e!285512)))

(declare-fun res!288861 () Bool)

(assert (=> b!484964 (=> (not res!288861) (not e!285512))))

(assert (=> b!484964 (= res!288861 (and (or (not (is-Cons!9283 (t!15509 (t!15509 l!956)))) (bvsle (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) key!251)) (is-Cons!9283 (t!15509 (t!15509 l!956))) (bvslt (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) key!251)))))

(declare-fun b!484965 () Bool)

(assert (=> b!484965 (= e!285512 (containsKey!389 (t!15509 (t!15509 (t!15509 l!956))) key!251))))

(assert (= (and d!77251 (not res!288860)) b!484964))

(assert (= (and b!484964 res!288861) b!484965))

(declare-fun m!465321 () Bool)

(assert (=> b!484965 m!465321))

(assert (=> b!484739 d!77251))

(declare-fun d!77253 () Bool)

(declare-fun lt!219463 () Int)

(assert (=> d!77253 (>= lt!219463 0)))

(declare-fun e!285515 () Int)

(assert (=> d!77253 (= lt!219463 e!285515)))

(declare-fun c!58353 () Bool)

(assert (=> d!77253 (= c!58353 (is-Nil!9284 l!956))))

(assert (=> d!77253 (= (size!15460 l!956) lt!219463)))

(declare-fun b!484970 () Bool)

(assert (=> b!484970 (= e!285515 0)))

(declare-fun b!484971 () Bool)

(assert (=> b!484971 (= e!285515 (+ 1 (size!15460 (t!15509 l!956))))))

(assert (= (and d!77253 c!58353) b!484970))

(assert (= (and d!77253 (not c!58353)) b!484971))

(assert (=> b!484971 m!465231))

(assert (=> d!77189 d!77253))

(declare-fun d!77255 () Bool)

(declare-fun lt!219464 () Int)

(assert (=> d!77255 (>= lt!219464 0)))

(declare-fun e!285516 () Int)

(assert (=> d!77255 (= lt!219464 e!285516)))

(declare-fun c!58354 () Bool)

(assert (=> d!77255 (= c!58354 (is-Nil!9284 (t!15509 l!956)))))

(assert (=> d!77255 (= (size!15460 (t!15509 l!956)) lt!219464)))

(declare-fun b!484972 () Bool)

(assert (=> b!484972 (= e!285516 0)))

(declare-fun b!484973 () Bool)

(assert (=> b!484973 (= e!285516 (+ 1 (size!15460 (t!15509 (t!15509 l!956)))))))

(assert (= (and d!77255 c!58354) b!484972))

(assert (= (and d!77255 (not c!58354)) b!484973))

(declare-fun m!465323 () Bool)

(assert (=> b!484973 m!465323))

(assert (=> d!77185 d!77255))

(declare-fun d!77257 () Bool)

(declare-fun res!288862 () Bool)

(declare-fun e!285517 () Bool)

(assert (=> d!77257 (=> res!288862 e!285517)))

(assert (=> d!77257 (= res!288862 (or (is-Nil!9284 lt!219432) (is-Nil!9284 (t!15509 lt!219432))))))

(assert (=> d!77257 (= (isStrictlySorted!426 lt!219432) e!285517)))

(declare-fun b!484974 () Bool)

(declare-fun e!285518 () Bool)

(assert (=> b!484974 (= e!285517 e!285518)))

(declare-fun res!288863 () Bool)

(assert (=> b!484974 (=> (not res!288863) (not e!285518))))

(assert (=> b!484974 (= res!288863 (bvslt (_1!4635 (h!10139 lt!219432)) (_1!4635 (h!10139 (t!15509 lt!219432)))))))

(declare-fun b!484975 () Bool)

(assert (=> b!484975 (= e!285518 (isStrictlySorted!426 (t!15509 lt!219432)))))

(assert (= (and d!77257 (not res!288862)) b!484974))

(assert (= (and b!484974 res!288863) b!484975))

(declare-fun m!465325 () Bool)

(assert (=> b!484975 m!465325))

(assert (=> d!77157 d!77257))

(assert (=> d!77157 d!77191))

(declare-fun d!77259 () Bool)

(declare-fun res!288864 () Bool)

(declare-fun e!285519 () Bool)

(assert (=> d!77259 (=> res!288864 e!285519)))

(assert (=> d!77259 (= res!288864 (and (is-Cons!9283 lt!219443) (= (_1!4635 (h!10139 lt!219443)) key!251)))))

(assert (=> d!77259 (= (containsKey!389 lt!219443 key!251) e!285519)))

(declare-fun b!484976 () Bool)

(declare-fun e!285520 () Bool)

(assert (=> b!484976 (= e!285519 e!285520)))

(declare-fun res!288865 () Bool)

(assert (=> b!484976 (=> (not res!288865) (not e!285520))))

(assert (=> b!484976 (= res!288865 (and (or (not (is-Cons!9283 lt!219443)) (bvsle (_1!4635 (h!10139 lt!219443)) key!251)) (is-Cons!9283 lt!219443) (bvslt (_1!4635 (h!10139 lt!219443)) key!251)))))

(declare-fun b!484977 () Bool)

(assert (=> b!484977 (= e!285520 (containsKey!389 (t!15509 lt!219443) key!251))))

(assert (= (and d!77259 (not res!288864)) b!484976))

(assert (= (and b!484976 res!288865) b!484977))

(declare-fun m!465327 () Bool)

(assert (=> b!484977 m!465327))

(assert (=> b!484856 d!77259))

(assert (=> d!77165 d!77157))

(assert (=> d!77165 d!77163))

(assert (=> d!77165 d!77191))

(assert (=> d!77165 d!77185))

(declare-fun d!77261 () Bool)

(assert (=> d!77261 (= (length!11 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)) (+ (length!11 (t!15509 l!956)) 1))))

(assert (=> d!77261 true))

(declare-fun _$9!29 () Unit!14182)

(assert (=> d!77261 (= (choose!1382 (t!15509 l!956) key!251 value!166) _$9!29)))

(declare-fun bs!15443 () Bool)

(assert (= bs!15443 d!77261))

(assert (=> bs!15443 m!465117))

(assert (=> bs!15443 m!465117))

(assert (=> bs!15443 m!465119))

(assert (=> bs!15443 m!465121))

(assert (=> d!77165 d!77261))

(declare-fun d!77263 () Bool)

(assert (=> d!77263 (= ($colon$colon!127 e!285430 (ite c!58336 (h!10139 l!956) (tuple2!9249 key!251 value!166))) (Cons!9283 (ite c!58336 (h!10139 l!956) (tuple2!9249 key!251 value!166)) e!285430))))

(assert (=> bm!31178 d!77263))

(declare-fun d!77265 () Bool)

(declare-fun res!288866 () Bool)

(declare-fun e!285521 () Bool)

(assert (=> d!77265 (=> res!288866 e!285521)))

(assert (=> d!77265 (= res!288866 (and (is-Cons!9283 lt!219432) (= (_1!4635 (h!10139 lt!219432)) key!251)))))

(assert (=> d!77265 (= (containsKey!389 lt!219432 key!251) e!285521)))

(declare-fun b!484978 () Bool)

(declare-fun e!285522 () Bool)

(assert (=> b!484978 (= e!285521 e!285522)))

(declare-fun res!288867 () Bool)

(assert (=> b!484978 (=> (not res!288867) (not e!285522))))

(assert (=> b!484978 (= res!288867 (and (or (not (is-Cons!9283 lt!219432)) (bvsle (_1!4635 (h!10139 lt!219432)) key!251)) (is-Cons!9283 lt!219432) (bvslt (_1!4635 (h!10139 lt!219432)) key!251)))))

(declare-fun b!484979 () Bool)

(assert (=> b!484979 (= e!285522 (containsKey!389 (t!15509 lt!219432) key!251))))

(assert (= (and d!77265 (not res!288866)) b!484978))

(assert (= (and b!484978 res!288867) b!484979))

(declare-fun m!465329 () Bool)

(assert (=> b!484979 m!465329))

(assert (=> b!484812 d!77265))

(declare-fun d!77267 () Bool)

(assert (=> d!77267 (= ($colon$colon!127 e!285401 (ite c!58324 (h!10139 (t!15509 l!956)) (tuple2!9249 key!251 value!166))) (Cons!9283 (ite c!58324 (h!10139 (t!15509 l!956)) (tuple2!9249 key!251 value!166)) e!285401))))

(assert (=> bm!31169 d!77267))

(assert (=> b!484858 d!77157))

(declare-fun b!484980 () Bool)

(declare-fun res!288868 () Bool)

(declare-fun e!285527 () Bool)

(assert (=> b!484980 (=> (not res!288868) (not e!285527))))

(declare-fun lt!219465 () List!9287)

(assert (=> b!484980 (= res!288868 (containsKey!389 lt!219465 key!251))))

(declare-fun b!484981 () Bool)

(declare-fun e!285525 () List!9287)

(declare-fun call!31190 () List!9287)

(assert (=> b!484981 (= e!285525 call!31190)))

(declare-fun e!285523 () List!9287)

(declare-fun b!484982 () Bool)

(assert (=> b!484982 (= e!285523 (insertStrictlySorted!241 (t!15509 (t!15509 (t!15509 l!956))) key!251 value!166))))

(declare-fun bm!31185 () Bool)

(declare-fun call!31188 () List!9287)

(assert (=> bm!31185 (= call!31188 call!31190)))

(declare-fun b!484983 () Bool)

(declare-fun e!285524 () List!9287)

(declare-fun call!31189 () List!9287)

(assert (=> b!484983 (= e!285524 call!31189)))

(declare-fun c!58355 () Bool)

(declare-fun c!58357 () Bool)

(declare-fun b!484984 () Bool)

(assert (=> b!484984 (= e!285523 (ite c!58357 (t!15509 (t!15509 (t!15509 l!956))) (ite c!58355 (Cons!9283 (h!10139 (t!15509 (t!15509 l!956))) (t!15509 (t!15509 (t!15509 l!956)))) Nil!9284)))))

(declare-fun b!484985 () Bool)

(assert (=> b!484985 (= e!285524 call!31189)))

(declare-fun bm!31186 () Bool)

(assert (=> bm!31186 (= call!31189 call!31188)))

(declare-fun b!484986 () Bool)

(assert (=> b!484986 (= e!285527 (contains!2684 lt!219465 (tuple2!9249 key!251 value!166)))))

(declare-fun d!77269 () Bool)

(assert (=> d!77269 e!285527))

(declare-fun res!288869 () Bool)

(assert (=> d!77269 (=> (not res!288869) (not e!285527))))

(assert (=> d!77269 (= res!288869 (isStrictlySorted!426 lt!219465))))

(assert (=> d!77269 (= lt!219465 e!285525)))

(declare-fun c!58358 () Bool)

(assert (=> d!77269 (= c!58358 (and (is-Cons!9283 (t!15509 (t!15509 l!956))) (bvslt (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) key!251)))))

(assert (=> d!77269 (isStrictlySorted!426 (t!15509 (t!15509 l!956)))))

(assert (=> d!77269 (= (insertStrictlySorted!241 (t!15509 (t!15509 l!956)) key!251 value!166) lt!219465)))

(declare-fun b!484987 () Bool)

(declare-fun e!285526 () List!9287)

(assert (=> b!484987 (= e!285526 call!31188)))

(declare-fun b!484988 () Bool)

(assert (=> b!484988 (= c!58355 (and (is-Cons!9283 (t!15509 (t!15509 l!956))) (bvsgt (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) key!251)))))

(assert (=> b!484988 (= e!285526 e!285524)))

(declare-fun bm!31187 () Bool)

(assert (=> bm!31187 (= call!31190 ($colon$colon!127 e!285523 (ite c!58358 (h!10139 (t!15509 (t!15509 l!956))) (tuple2!9249 key!251 value!166))))))

(declare-fun c!58356 () Bool)

(assert (=> bm!31187 (= c!58356 c!58358)))

(declare-fun b!484989 () Bool)

(assert (=> b!484989 (= e!285525 e!285526)))

(assert (=> b!484989 (= c!58357 (and (is-Cons!9283 (t!15509 (t!15509 l!956))) (= (_1!4635 (h!10139 (t!15509 (t!15509 l!956)))) key!251)))))

(assert (= (and d!77269 c!58358) b!484981))

(assert (= (and d!77269 (not c!58358)) b!484989))

(assert (= (and b!484989 c!58357) b!484987))

(assert (= (and b!484989 (not c!58357)) b!484988))

(assert (= (and b!484988 c!58355) b!484985))

(assert (= (and b!484988 (not c!58355)) b!484983))

(assert (= (or b!484985 b!484983) bm!31186))

(assert (= (or b!484987 bm!31186) bm!31185))

(assert (= (or b!484981 bm!31185) bm!31187))

(assert (= (and bm!31187 c!58356) b!484982))

(assert (= (and bm!31187 (not c!58356)) b!484984))

(assert (= (and d!77269 res!288869) b!484980))

(assert (= (and b!484980 res!288868) b!484986))

(declare-fun m!465331 () Bool)

(assert (=> b!484986 m!465331))

(declare-fun m!465333 () Bool)

(assert (=> b!484982 m!465333))

(declare-fun m!465335 () Bool)

(assert (=> bm!31187 m!465335))

(declare-fun m!465337 () Bool)

(assert (=> d!77269 m!465337))

(assert (=> d!77269 m!465239))

(declare-fun m!465339 () Bool)

(assert (=> b!484980 m!465339))

(assert (=> b!484814 d!77269))

(assert (=> b!484855 d!77191))

(declare-fun d!77271 () Bool)

(declare-fun lt!219466 () Int)

(assert (=> d!77271 (>= lt!219466 0)))

(declare-fun e!285528 () Int)

(assert (=> d!77271 (= lt!219466 e!285528)))

(declare-fun c!58359 () Bool)

(assert (=> d!77271 (= c!58359 (is-Nil!9284 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)))))

(assert (=> d!77271 (= (size!15460 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)) lt!219466)))

(declare-fun b!484990 () Bool)

(assert (=> b!484990 (= e!285528 0)))

(declare-fun b!484991 () Bool)

(assert (=> b!484991 (= e!285528 (+ 1 (size!15460 (t!15509 (insertStrictlySorted!241 (t!15509 l!956) key!251 value!166)))))))

(assert (= (and d!77271 c!58359) b!484990))

(assert (= (and d!77271 (not c!58359)) b!484991))

(declare-fun m!465341 () Bool)

(assert (=> b!484991 m!465341))

(assert (=> d!77163 d!77271))

(declare-fun d!77273 () Bool)

(declare-fun lt!219467 () Int)

(assert (=> d!77273 (>= lt!219467 0)))

(declare-fun e!285529 () Int)

(assert (=> d!77273 (= lt!219467 e!285529)))

(declare-fun c!58360 () Bool)

(assert (=> d!77273 (= c!58360 (is-Nil!9284 lt!219412))))

(assert (=> d!77273 (= (size!15460 lt!219412) lt!219467)))

(declare-fun b!484992 () Bool)

(assert (=> b!484992 (= e!285529 0)))

(declare-fun b!484993 () Bool)

(assert (=> b!484993 (= e!285529 (+ 1 (size!15460 (t!15509 lt!219412))))))

(assert (= (and d!77273 c!58360) b!484992))

(assert (= (and d!77273 (not c!58360)) b!484993))

(declare-fun m!465343 () Bool)

(assert (=> b!484993 m!465343))

(assert (=> d!77187 d!77273))

(declare-fun d!77275 () Bool)

(declare-fun res!288870 () Bool)

(declare-fun e!285530 () Bool)

(assert (=> d!77275 (=> res!288870 e!285530)))

(assert (=> d!77275 (= res!288870 (or (is-Nil!9284 lt!219443) (is-Nil!9284 (t!15509 lt!219443))))))

(assert (=> d!77275 (= (isStrictlySorted!426 lt!219443) e!285530)))

(declare-fun b!484994 () Bool)

(declare-fun e!285531 () Bool)

(assert (=> b!484994 (= e!285530 e!285531)))

(declare-fun res!288871 () Bool)

(assert (=> b!484994 (=> (not res!288871) (not e!285531))))

(assert (=> b!484994 (= res!288871 (bvslt (_1!4635 (h!10139 lt!219443)) (_1!4635 (h!10139 (t!15509 lt!219443)))))))

(declare-fun b!484995 () Bool)

(assert (=> b!484995 (= e!285531 (isStrictlySorted!426 (t!15509 lt!219443)))))

(assert (= (and d!77275 (not res!288870)) b!484994))

(assert (= (and b!484994 res!288871) b!484995))

(declare-fun m!465345 () Bool)

(assert (=> b!484995 m!465345))

(assert (=> d!77197 d!77275))

(assert (=> d!77197 d!77195))

(declare-fun b!484996 () Bool)

(declare-fun e!285532 () Bool)

(declare-fun tp!43569 () Bool)

(assert (=> b!484996 (= e!285532 (and tp_is_empty!13951 tp!43569))))

(assert (=> b!484878 (= tp!43561 e!285532)))

(assert (= (and b!484878 (is-Cons!9283 (t!15509 (t!15509 l!956)))) b!484996))

(push 1)

(assert (not d!77249))

(assert (not b!484982))

(assert (not b!484975))

(assert (not b!484996))

(assert tp_is_empty!13951)

(assert (not b!484979))

(assert (not b!484963))

(assert (not b!484960))

(assert (not b!484995))

(assert (not b!484993))

(assert (not d!77235))

(assert (not b!484980))

(assert (not b!484971))

(assert (not b!484977))

(assert (not bm!31187))

(assert (not b!484965))

(assert (not b!484973))

(assert (not d!77261))

(assert (not b!484991))

(assert (not b!484958))

(assert (not d!77269))

(assert (not b!484986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

