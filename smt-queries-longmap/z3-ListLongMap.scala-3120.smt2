; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43878 () Bool)

(assert start!43878)

(declare-fun b!484625 () Bool)

(declare-fun res!288714 () Bool)

(declare-fun e!285292 () Bool)

(assert (=> b!484625 (=> (not res!288714) (not e!285292))))

(declare-datatypes ((B!1142 0))(
  ( (B!1143 (val!7023 Int)) )
))
(declare-datatypes ((tuple2!9162 0))(
  ( (tuple2!9163 (_1!4592 (_ BitVec 64)) (_2!4592 B!1142)) )
))
(declare-datatypes ((List!9189 0))(
  ( (Nil!9186) (Cons!9185 (h!10041 tuple2!9162) (t!15403 List!9189)) )
))
(declare-fun l!956 () List!9189)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!389 (List!9189 (_ BitVec 64)) Bool)

(assert (=> b!484625 (= res!288714 (not (containsKey!389 (t!15403 l!956) key!251)))))

(declare-fun b!484626 () Bool)

(declare-fun lt!219423 () List!9189)

(declare-fun length!11 (List!9189) Int)

(assert (=> b!484626 (= e!285292 (not (= (length!11 lt!219423) (+ 1 (length!11 l!956)))))))

(declare-fun value!166 () B!1142)

(declare-fun insertStrictlySorted!242 (List!9189 (_ BitVec 64) B!1142) List!9189)

(assert (=> b!484626 (= (length!11 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)) (+ 1 (length!11 (t!15403 l!956))))))

(declare-datatypes ((Unit!14147 0))(
  ( (Unit!14148) )
))
(declare-fun lt!219424 () Unit!14147)

(declare-fun lemmaAddNewKeyIncrementSize!4 (List!9189 (_ BitVec 64) B!1142) Unit!14147)

(assert (=> b!484626 (= lt!219424 (lemmaAddNewKeyIncrementSize!4 (t!15403 l!956) key!251 value!166))))

(declare-fun b!484627 () Bool)

(declare-fun e!285294 () Bool)

(assert (=> b!484627 (= e!285294 e!285292)))

(declare-fun res!288716 () Bool)

(assert (=> b!484627 (=> (not res!288716) (not e!285292))))

(get-info :version)

(assert (=> b!484627 (= res!288716 (and ((_ is Cons!9185) l!956) (bvslt (_1!4592 (h!10041 l!956)) key!251)))))

(assert (=> b!484627 (= lt!219423 (insertStrictlySorted!242 l!956 key!251 value!166))))

(declare-fun b!484628 () Bool)

(declare-fun res!288717 () Bool)

(assert (=> b!484628 (=> (not res!288717) (not e!285292))))

(declare-fun isStrictlySorted!414 (List!9189) Bool)

(assert (=> b!484628 (= res!288717 (isStrictlySorted!414 (t!15403 l!956)))))

(declare-fun b!484629 () Bool)

(declare-fun res!288718 () Bool)

(assert (=> b!484629 (=> (not res!288718) (not e!285294))))

(assert (=> b!484629 (= res!288718 (not (containsKey!389 l!956 key!251)))))

(declare-fun b!484630 () Bool)

(declare-fun e!285293 () Bool)

(declare-fun tp_is_empty!13951 () Bool)

(declare-fun tp!43552 () Bool)

(assert (=> b!484630 (= e!285293 (and tp_is_empty!13951 tp!43552))))

(declare-fun res!288715 () Bool)

(assert (=> start!43878 (=> (not res!288715) (not e!285294))))

(assert (=> start!43878 (= res!288715 (isStrictlySorted!414 l!956))))

(assert (=> start!43878 e!285294))

(assert (=> start!43878 e!285293))

(assert (=> start!43878 true))

(assert (=> start!43878 tp_is_empty!13951))

(assert (= (and start!43878 res!288715) b!484629))

(assert (= (and b!484629 res!288718) b!484627))

(assert (= (and b!484627 res!288716) b!484628))

(assert (= (and b!484628 res!288717) b!484625))

(assert (= (and b!484625 res!288714) b!484626))

(assert (= (and start!43878 ((_ is Cons!9185) l!956)) b!484630))

(declare-fun m!465289 () Bool)

(assert (=> start!43878 m!465289))

(declare-fun m!465291 () Bool)

(assert (=> b!484628 m!465291))

(declare-fun m!465293 () Bool)

(assert (=> b!484627 m!465293))

(declare-fun m!465295 () Bool)

(assert (=> b!484626 m!465295))

(declare-fun m!465297 () Bool)

(assert (=> b!484626 m!465297))

(declare-fun m!465299 () Bool)

(assert (=> b!484626 m!465299))

(declare-fun m!465301 () Bool)

(assert (=> b!484626 m!465301))

(assert (=> b!484626 m!465297))

(declare-fun m!465303 () Bool)

(assert (=> b!484626 m!465303))

(declare-fun m!465305 () Bool)

(assert (=> b!484626 m!465305))

(declare-fun m!465307 () Bool)

(assert (=> b!484625 m!465307))

(declare-fun m!465309 () Bool)

(assert (=> b!484629 m!465309))

(check-sat (not start!43878) (not b!484627) (not b!484629) tp_is_empty!13951 (not b!484630) (not b!484625) (not b!484626) (not b!484628))
(check-sat)
(get-model)

(declare-fun bm!31144 () Bool)

(declare-fun call!31147 () List!9189)

(declare-fun call!31148 () List!9189)

(assert (=> bm!31144 (= call!31147 call!31148)))

(declare-fun b!484715 () Bool)

(declare-fun c!58283 () Bool)

(assert (=> b!484715 (= c!58283 (and ((_ is Cons!9185) (t!15403 l!956)) (bvsgt (_1!4592 (h!10041 (t!15403 l!956))) key!251)))))

(declare-fun e!285347 () List!9189)

(declare-fun e!285345 () List!9189)

(assert (=> b!484715 (= e!285347 e!285345)))

(declare-fun b!484716 () Bool)

(assert (=> b!484716 (= e!285347 call!31147)))

(declare-fun e!285343 () Bool)

(declare-fun lt!219441 () List!9189)

(declare-fun b!484717 () Bool)

(declare-fun contains!2659 (List!9189 tuple2!9162) Bool)

(assert (=> b!484717 (= e!285343 (contains!2659 lt!219441 (tuple2!9163 key!251 value!166)))))

(declare-fun b!484718 () Bool)

(declare-fun e!285344 () List!9189)

(assert (=> b!484718 (= e!285344 call!31148)))

(declare-fun b!484720 () Bool)

(declare-fun e!285346 () List!9189)

(assert (=> b!484720 (= e!285346 (insertStrictlySorted!242 (t!15403 (t!15403 l!956)) key!251 value!166))))

(declare-fun bm!31145 () Bool)

(declare-fun c!58285 () Bool)

(declare-fun $colon$colon!122 (List!9189 tuple2!9162) List!9189)

(assert (=> bm!31145 (= call!31148 ($colon$colon!122 e!285346 (ite c!58285 (h!10041 (t!15403 l!956)) (tuple2!9163 key!251 value!166))))))

(declare-fun c!58284 () Bool)

(assert (=> bm!31145 (= c!58284 c!58285)))

(declare-fun b!484721 () Bool)

(declare-fun c!58282 () Bool)

(assert (=> b!484721 (= e!285346 (ite c!58282 (t!15403 (t!15403 l!956)) (ite c!58283 (Cons!9185 (h!10041 (t!15403 l!956)) (t!15403 (t!15403 l!956))) Nil!9186)))))

(declare-fun b!484719 () Bool)

(declare-fun res!288766 () Bool)

(assert (=> b!484719 (=> (not res!288766) (not e!285343))))

(assert (=> b!484719 (= res!288766 (containsKey!389 lt!219441 key!251))))

(declare-fun d!77177 () Bool)

(assert (=> d!77177 e!285343))

(declare-fun res!288765 () Bool)

(assert (=> d!77177 (=> (not res!288765) (not e!285343))))

(assert (=> d!77177 (= res!288765 (isStrictlySorted!414 lt!219441))))

(assert (=> d!77177 (= lt!219441 e!285344)))

(assert (=> d!77177 (= c!58285 (and ((_ is Cons!9185) (t!15403 l!956)) (bvslt (_1!4592 (h!10041 (t!15403 l!956))) key!251)))))

(assert (=> d!77177 (isStrictlySorted!414 (t!15403 l!956))))

(assert (=> d!77177 (= (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166) lt!219441)))

(declare-fun b!484722 () Bool)

(assert (=> b!484722 (= e!285344 e!285347)))

(assert (=> b!484722 (= c!58282 (and ((_ is Cons!9185) (t!15403 l!956)) (= (_1!4592 (h!10041 (t!15403 l!956))) key!251)))))

(declare-fun b!484723 () Bool)

(declare-fun call!31149 () List!9189)

(assert (=> b!484723 (= e!285345 call!31149)))

(declare-fun bm!31146 () Bool)

(assert (=> bm!31146 (= call!31149 call!31147)))

(declare-fun b!484724 () Bool)

(assert (=> b!484724 (= e!285345 call!31149)))

(assert (= (and d!77177 c!58285) b!484718))

(assert (= (and d!77177 (not c!58285)) b!484722))

(assert (= (and b!484722 c!58282) b!484716))

(assert (= (and b!484722 (not c!58282)) b!484715))

(assert (= (and b!484715 c!58283) b!484723))

(assert (= (and b!484715 (not c!58283)) b!484724))

(assert (= (or b!484723 b!484724) bm!31146))

(assert (= (or b!484716 bm!31146) bm!31144))

(assert (= (or b!484718 bm!31144) bm!31145))

(assert (= (and bm!31145 c!58284) b!484720))

(assert (= (and bm!31145 (not c!58284)) b!484721))

(assert (= (and d!77177 res!288765) b!484719))

(assert (= (and b!484719 res!288766) b!484717))

(declare-fun m!465357 () Bool)

(assert (=> b!484720 m!465357))

(declare-fun m!465359 () Bool)

(assert (=> bm!31145 m!465359))

(declare-fun m!465361 () Bool)

(assert (=> d!77177 m!465361))

(assert (=> d!77177 m!465291))

(declare-fun m!465363 () Bool)

(assert (=> b!484719 m!465363))

(declare-fun m!465365 () Bool)

(assert (=> b!484717 m!465365))

(assert (=> b!484626 d!77177))

(declare-fun d!77187 () Bool)

(declare-fun size!15455 (List!9189) Int)

(assert (=> d!77187 (= (length!11 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)) (size!15455 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)))))

(declare-fun bs!15443 () Bool)

(assert (= bs!15443 d!77187))

(assert (=> bs!15443 m!465297))

(declare-fun m!465367 () Bool)

(assert (=> bs!15443 m!465367))

(assert (=> b!484626 d!77187))

(declare-fun d!77189 () Bool)

(assert (=> d!77189 (= (length!11 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)) (+ (length!11 (t!15403 l!956)) 1))))

(declare-fun lt!219446 () Unit!14147)

(declare-fun choose!1388 (List!9189 (_ BitVec 64) B!1142) Unit!14147)

(assert (=> d!77189 (= lt!219446 (choose!1388 (t!15403 l!956) key!251 value!166))))

(assert (=> d!77189 (isStrictlySorted!414 (t!15403 l!956))))

(assert (=> d!77189 (= (lemmaAddNewKeyIncrementSize!4 (t!15403 l!956) key!251 value!166) lt!219446)))

(declare-fun bs!15445 () Bool)

(assert (= bs!15445 d!77189))

(assert (=> bs!15445 m!465297))

(assert (=> bs!15445 m!465299))

(assert (=> bs!15445 m!465301))

(declare-fun m!465379 () Bool)

(assert (=> bs!15445 m!465379))

(assert (=> bs!15445 m!465297))

(assert (=> bs!15445 m!465291))

(assert (=> b!484626 d!77189))

(declare-fun d!77195 () Bool)

(assert (=> d!77195 (= (length!11 lt!219423) (size!15455 lt!219423))))

(declare-fun bs!15446 () Bool)

(assert (= bs!15446 d!77195))

(declare-fun m!465385 () Bool)

(assert (=> bs!15446 m!465385))

(assert (=> b!484626 d!77195))

(declare-fun d!77197 () Bool)

(assert (=> d!77197 (= (length!11 (t!15403 l!956)) (size!15455 (t!15403 l!956)))))

(declare-fun bs!15447 () Bool)

(assert (= bs!15447 d!77197))

(declare-fun m!465393 () Bool)

(assert (=> bs!15447 m!465393))

(assert (=> b!484626 d!77197))

(declare-fun d!77201 () Bool)

(assert (=> d!77201 (= (length!11 l!956) (size!15455 l!956))))

(declare-fun bs!15449 () Bool)

(assert (= bs!15449 d!77201))

(declare-fun m!465395 () Bool)

(assert (=> bs!15449 m!465395))

(assert (=> b!484626 d!77201))

(declare-fun d!77205 () Bool)

(declare-fun res!288779 () Bool)

(declare-fun e!285370 () Bool)

(assert (=> d!77205 (=> res!288779 e!285370)))

(assert (=> d!77205 (= res!288779 (or ((_ is Nil!9186) (t!15403 l!956)) ((_ is Nil!9186) (t!15403 (t!15403 l!956)))))))

(assert (=> d!77205 (= (isStrictlySorted!414 (t!15403 l!956)) e!285370)))

(declare-fun b!484765 () Bool)

(declare-fun e!285371 () Bool)

(assert (=> b!484765 (= e!285370 e!285371)))

(declare-fun res!288780 () Bool)

(assert (=> b!484765 (=> (not res!288780) (not e!285371))))

(assert (=> b!484765 (= res!288780 (bvslt (_1!4592 (h!10041 (t!15403 l!956))) (_1!4592 (h!10041 (t!15403 (t!15403 l!956))))))))

(declare-fun b!484766 () Bool)

(assert (=> b!484766 (= e!285371 (isStrictlySorted!414 (t!15403 (t!15403 l!956))))))

(assert (= (and d!77205 (not res!288779)) b!484765))

(assert (= (and b!484765 res!288780) b!484766))

(declare-fun m!465399 () Bool)

(assert (=> b!484766 m!465399))

(assert (=> b!484628 d!77205))

(declare-fun bm!31159 () Bool)

(declare-fun call!31162 () List!9189)

(declare-fun call!31163 () List!9189)

(assert (=> bm!31159 (= call!31162 call!31163)))

(declare-fun b!484771 () Bool)

(declare-fun c!58303 () Bool)

(assert (=> b!484771 (= c!58303 (and ((_ is Cons!9185) l!956) (bvsgt (_1!4592 (h!10041 l!956)) key!251)))))

(declare-fun e!285378 () List!9189)

(declare-fun e!285376 () List!9189)

(assert (=> b!484771 (= e!285378 e!285376)))

(declare-fun b!484772 () Bool)

(assert (=> b!484772 (= e!285378 call!31162)))

(declare-fun b!484773 () Bool)

(declare-fun lt!219451 () List!9189)

(declare-fun e!285374 () Bool)

(assert (=> b!484773 (= e!285374 (contains!2659 lt!219451 (tuple2!9163 key!251 value!166)))))

(declare-fun b!484774 () Bool)

(declare-fun e!285375 () List!9189)

(assert (=> b!484774 (= e!285375 call!31163)))

(declare-fun b!484776 () Bool)

(declare-fun e!285377 () List!9189)

(assert (=> b!484776 (= e!285377 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166))))

(declare-fun c!58305 () Bool)

(declare-fun bm!31160 () Bool)

(assert (=> bm!31160 (= call!31163 ($colon$colon!122 e!285377 (ite c!58305 (h!10041 l!956) (tuple2!9163 key!251 value!166))))))

(declare-fun c!58304 () Bool)

(assert (=> bm!31160 (= c!58304 c!58305)))

(declare-fun b!484777 () Bool)

(declare-fun c!58302 () Bool)

(assert (=> b!484777 (= e!285377 (ite c!58302 (t!15403 l!956) (ite c!58303 (Cons!9185 (h!10041 l!956) (t!15403 l!956)) Nil!9186)))))

(declare-fun b!484775 () Bool)

(declare-fun res!288782 () Bool)

(assert (=> b!484775 (=> (not res!288782) (not e!285374))))

(assert (=> b!484775 (= res!288782 (containsKey!389 lt!219451 key!251))))

(declare-fun d!77207 () Bool)

(assert (=> d!77207 e!285374))

(declare-fun res!288781 () Bool)

(assert (=> d!77207 (=> (not res!288781) (not e!285374))))

(assert (=> d!77207 (= res!288781 (isStrictlySorted!414 lt!219451))))

(assert (=> d!77207 (= lt!219451 e!285375)))

(assert (=> d!77207 (= c!58305 (and ((_ is Cons!9185) l!956) (bvslt (_1!4592 (h!10041 l!956)) key!251)))))

(assert (=> d!77207 (isStrictlySorted!414 l!956)))

(assert (=> d!77207 (= (insertStrictlySorted!242 l!956 key!251 value!166) lt!219451)))

(declare-fun b!484778 () Bool)

(assert (=> b!484778 (= e!285375 e!285378)))

(assert (=> b!484778 (= c!58302 (and ((_ is Cons!9185) l!956) (= (_1!4592 (h!10041 l!956)) key!251)))))

(declare-fun b!484779 () Bool)

(declare-fun call!31164 () List!9189)

(assert (=> b!484779 (= e!285376 call!31164)))

(declare-fun bm!31161 () Bool)

(assert (=> bm!31161 (= call!31164 call!31162)))

(declare-fun b!484780 () Bool)

(assert (=> b!484780 (= e!285376 call!31164)))

(assert (= (and d!77207 c!58305) b!484774))

(assert (= (and d!77207 (not c!58305)) b!484778))

(assert (= (and b!484778 c!58302) b!484772))

(assert (= (and b!484778 (not c!58302)) b!484771))

(assert (= (and b!484771 c!58303) b!484779))

(assert (= (and b!484771 (not c!58303)) b!484780))

(assert (= (or b!484779 b!484780) bm!31161))

(assert (= (or b!484772 bm!31161) bm!31159))

(assert (= (or b!484774 bm!31159) bm!31160))

(assert (= (and bm!31160 c!58304) b!484776))

(assert (= (and bm!31160 (not c!58304)) b!484777))

(assert (= (and d!77207 res!288781) b!484775))

(assert (= (and b!484775 res!288782) b!484773))

(assert (=> b!484776 m!465297))

(declare-fun m!465401 () Bool)

(assert (=> bm!31160 m!465401))

(declare-fun m!465403 () Bool)

(assert (=> d!77207 m!465403))

(assert (=> d!77207 m!465289))

(declare-fun m!465405 () Bool)

(assert (=> b!484775 m!465405))

(declare-fun m!465407 () Bool)

(assert (=> b!484773 m!465407))

(assert (=> b!484627 d!77207))

(declare-fun d!77209 () Bool)

(declare-fun res!288797 () Bool)

(declare-fun e!285394 () Bool)

(assert (=> d!77209 (=> res!288797 e!285394)))

(assert (=> d!77209 (= res!288797 (and ((_ is Cons!9185) l!956) (= (_1!4592 (h!10041 l!956)) key!251)))))

(assert (=> d!77209 (= (containsKey!389 l!956 key!251) e!285394)))

(declare-fun b!484803 () Bool)

(declare-fun e!285395 () Bool)

(assert (=> b!484803 (= e!285394 e!285395)))

(declare-fun res!288798 () Bool)

(assert (=> b!484803 (=> (not res!288798) (not e!285395))))

(assert (=> b!484803 (= res!288798 (and (or (not ((_ is Cons!9185) l!956)) (bvsle (_1!4592 (h!10041 l!956)) key!251)) ((_ is Cons!9185) l!956) (bvslt (_1!4592 (h!10041 l!956)) key!251)))))

(declare-fun b!484804 () Bool)

(assert (=> b!484804 (= e!285395 (containsKey!389 (t!15403 l!956) key!251))))

(assert (= (and d!77209 (not res!288797)) b!484803))

(assert (= (and b!484803 res!288798) b!484804))

(assert (=> b!484804 m!465307))

(assert (=> b!484629 d!77209))

(declare-fun d!77217 () Bool)

(declare-fun res!288801 () Bool)

(declare-fun e!285398 () Bool)

(assert (=> d!77217 (=> res!288801 e!285398)))

(assert (=> d!77217 (= res!288801 (or ((_ is Nil!9186) l!956) ((_ is Nil!9186) (t!15403 l!956))))))

(assert (=> d!77217 (= (isStrictlySorted!414 l!956) e!285398)))

(declare-fun b!484807 () Bool)

(declare-fun e!285399 () Bool)

(assert (=> b!484807 (= e!285398 e!285399)))

(declare-fun res!288802 () Bool)

(assert (=> b!484807 (=> (not res!288802) (not e!285399))))

(assert (=> b!484807 (= res!288802 (bvslt (_1!4592 (h!10041 l!956)) (_1!4592 (h!10041 (t!15403 l!956)))))))

(declare-fun b!484808 () Bool)

(assert (=> b!484808 (= e!285399 (isStrictlySorted!414 (t!15403 l!956)))))

(assert (= (and d!77217 (not res!288801)) b!484807))

(assert (= (and b!484807 res!288802) b!484808))

(assert (=> b!484808 m!465291))

(assert (=> start!43878 d!77217))

(declare-fun d!77219 () Bool)

(declare-fun res!288805 () Bool)

(declare-fun e!285402 () Bool)

(assert (=> d!77219 (=> res!288805 e!285402)))

(assert (=> d!77219 (= res!288805 (and ((_ is Cons!9185) (t!15403 l!956)) (= (_1!4592 (h!10041 (t!15403 l!956))) key!251)))))

(assert (=> d!77219 (= (containsKey!389 (t!15403 l!956) key!251) e!285402)))

(declare-fun b!484811 () Bool)

(declare-fun e!285403 () Bool)

(assert (=> b!484811 (= e!285402 e!285403)))

(declare-fun res!288806 () Bool)

(assert (=> b!484811 (=> (not res!288806) (not e!285403))))

(assert (=> b!484811 (= res!288806 (and (or (not ((_ is Cons!9185) (t!15403 l!956))) (bvsle (_1!4592 (h!10041 (t!15403 l!956))) key!251)) ((_ is Cons!9185) (t!15403 l!956)) (bvslt (_1!4592 (h!10041 (t!15403 l!956))) key!251)))))

(declare-fun b!484812 () Bool)

(assert (=> b!484812 (= e!285403 (containsKey!389 (t!15403 (t!15403 l!956)) key!251))))

(assert (= (and d!77219 (not res!288805)) b!484811))

(assert (= (and b!484811 res!288806) b!484812))

(declare-fun m!465425 () Bool)

(assert (=> b!484812 m!465425))

(assert (=> b!484625 d!77219))

(declare-fun b!484827 () Bool)

(declare-fun e!285411 () Bool)

(declare-fun tp!43561 () Bool)

(assert (=> b!484827 (= e!285411 (and tp_is_empty!13951 tp!43561))))

(assert (=> b!484630 (= tp!43552 e!285411)))

(assert (= (and b!484630 ((_ is Cons!9185) (t!15403 l!956))) b!484827))

(check-sat (not b!484773) (not d!77177) (not b!484719) (not d!77189) tp_is_empty!13951 (not b!484827) (not bm!31160) (not b!484804) (not bm!31145) (not d!77197) (not d!77201) (not d!77187) (not b!484766) (not b!484775) (not b!484776) (not b!484808) (not d!77195) (not b!484812) (not d!77207) (not b!484720) (not b!484717))
(check-sat)
(get-model)

(declare-fun d!77243 () Bool)

(declare-fun lt!219460 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!215 (List!9189) (InoxSet tuple2!9162))

(assert (=> d!77243 (= lt!219460 (select (content!215 lt!219451) (tuple2!9163 key!251 value!166)))))

(declare-fun e!285435 () Bool)

(assert (=> d!77243 (= lt!219460 e!285435)))

(declare-fun res!288826 () Bool)

(assert (=> d!77243 (=> (not res!288826) (not e!285435))))

(assert (=> d!77243 (= res!288826 ((_ is Cons!9185) lt!219451))))

(assert (=> d!77243 (= (contains!2659 lt!219451 (tuple2!9163 key!251 value!166)) lt!219460)))

(declare-fun b!484854 () Bool)

(declare-fun e!285434 () Bool)

(assert (=> b!484854 (= e!285435 e!285434)))

(declare-fun res!288825 () Bool)

(assert (=> b!484854 (=> res!288825 e!285434)))

(assert (=> b!484854 (= res!288825 (= (h!10041 lt!219451) (tuple2!9163 key!251 value!166)))))

(declare-fun b!484855 () Bool)

(assert (=> b!484855 (= e!285434 (contains!2659 (t!15403 lt!219451) (tuple2!9163 key!251 value!166)))))

(assert (= (and d!77243 res!288826) b!484854))

(assert (= (and b!484854 (not res!288825)) b!484855))

(declare-fun m!465451 () Bool)

(assert (=> d!77243 m!465451))

(declare-fun m!465453 () Bool)

(assert (=> d!77243 m!465453))

(declare-fun m!465455 () Bool)

(assert (=> b!484855 m!465455))

(assert (=> b!484773 d!77243))

(declare-fun d!77245 () Bool)

(assert (=> d!77245 (= ($colon$colon!122 e!285346 (ite c!58285 (h!10041 (t!15403 l!956)) (tuple2!9163 key!251 value!166))) (Cons!9185 (ite c!58285 (h!10041 (t!15403 l!956)) (tuple2!9163 key!251 value!166)) e!285346))))

(assert (=> bm!31145 d!77245))

(declare-fun d!77247 () Bool)

(declare-fun res!288827 () Bool)

(declare-fun e!285436 () Bool)

(assert (=> d!77247 (=> res!288827 e!285436)))

(assert (=> d!77247 (= res!288827 (and ((_ is Cons!9185) (t!15403 (t!15403 l!956))) (= (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) key!251)))))

(assert (=> d!77247 (= (containsKey!389 (t!15403 (t!15403 l!956)) key!251) e!285436)))

(declare-fun b!484856 () Bool)

(declare-fun e!285437 () Bool)

(assert (=> b!484856 (= e!285436 e!285437)))

(declare-fun res!288828 () Bool)

(assert (=> b!484856 (=> (not res!288828) (not e!285437))))

(assert (=> b!484856 (= res!288828 (and (or (not ((_ is Cons!9185) (t!15403 (t!15403 l!956)))) (bvsle (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) key!251)) ((_ is Cons!9185) (t!15403 (t!15403 l!956))) (bvslt (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) key!251)))))

(declare-fun b!484857 () Bool)

(assert (=> b!484857 (= e!285437 (containsKey!389 (t!15403 (t!15403 (t!15403 l!956))) key!251))))

(assert (= (and d!77247 (not res!288827)) b!484856))

(assert (= (and b!484856 res!288828) b!484857))

(declare-fun m!465457 () Bool)

(assert (=> b!484857 m!465457))

(assert (=> b!484812 d!77247))

(assert (=> b!484776 d!77177))

(assert (=> d!77189 d!77177))

(assert (=> d!77189 d!77187))

(assert (=> d!77189 d!77205))

(assert (=> d!77189 d!77197))

(declare-fun d!77249 () Bool)

(assert (=> d!77249 (= (length!11 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)) (+ (length!11 (t!15403 l!956)) 1))))

(assert (=> d!77249 true))

(declare-fun _$9!26 () Unit!14147)

(assert (=> d!77249 (= (choose!1388 (t!15403 l!956) key!251 value!166) _$9!26)))

(declare-fun bs!15458 () Bool)

(assert (= bs!15458 d!77249))

(assert (=> bs!15458 m!465297))

(assert (=> bs!15458 m!465297))

(assert (=> bs!15458 m!465299))

(assert (=> bs!15458 m!465301))

(assert (=> d!77189 d!77249))

(declare-fun d!77251 () Bool)

(declare-fun res!288829 () Bool)

(declare-fun e!285438 () Bool)

(assert (=> d!77251 (=> res!288829 e!285438)))

(assert (=> d!77251 (= res!288829 (or ((_ is Nil!9186) (t!15403 (t!15403 l!956))) ((_ is Nil!9186) (t!15403 (t!15403 (t!15403 l!956))))))))

(assert (=> d!77251 (= (isStrictlySorted!414 (t!15403 (t!15403 l!956))) e!285438)))

(declare-fun b!484858 () Bool)

(declare-fun e!285439 () Bool)

(assert (=> b!484858 (= e!285438 e!285439)))

(declare-fun res!288830 () Bool)

(assert (=> b!484858 (=> (not res!288830) (not e!285439))))

(assert (=> b!484858 (= res!288830 (bvslt (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) (_1!4592 (h!10041 (t!15403 (t!15403 (t!15403 l!956)))))))))

(declare-fun b!484859 () Bool)

(assert (=> b!484859 (= e!285439 (isStrictlySorted!414 (t!15403 (t!15403 (t!15403 l!956)))))))

(assert (= (and d!77251 (not res!288829)) b!484858))

(assert (= (and b!484858 res!288830) b!484859))

(declare-fun m!465459 () Bool)

(assert (=> b!484859 m!465459))

(assert (=> b!484766 d!77251))

(declare-fun d!77253 () Bool)

(declare-fun res!288831 () Bool)

(declare-fun e!285440 () Bool)

(assert (=> d!77253 (=> res!288831 e!285440)))

(assert (=> d!77253 (= res!288831 (or ((_ is Nil!9186) lt!219451) ((_ is Nil!9186) (t!15403 lt!219451))))))

(assert (=> d!77253 (= (isStrictlySorted!414 lt!219451) e!285440)))

(declare-fun b!484860 () Bool)

(declare-fun e!285441 () Bool)

(assert (=> b!484860 (= e!285440 e!285441)))

(declare-fun res!288832 () Bool)

(assert (=> b!484860 (=> (not res!288832) (not e!285441))))

(assert (=> b!484860 (= res!288832 (bvslt (_1!4592 (h!10041 lt!219451)) (_1!4592 (h!10041 (t!15403 lt!219451)))))))

(declare-fun b!484861 () Bool)

(assert (=> b!484861 (= e!285441 (isStrictlySorted!414 (t!15403 lt!219451)))))

(assert (= (and d!77253 (not res!288831)) b!484860))

(assert (= (and b!484860 res!288832) b!484861))

(declare-fun m!465461 () Bool)

(assert (=> b!484861 m!465461))

(assert (=> d!77207 d!77253))

(assert (=> d!77207 d!77217))

(declare-fun d!77255 () Bool)

(declare-fun res!288833 () Bool)

(declare-fun e!285442 () Bool)

(assert (=> d!77255 (=> res!288833 e!285442)))

(assert (=> d!77255 (= res!288833 (and ((_ is Cons!9185) lt!219451) (= (_1!4592 (h!10041 lt!219451)) key!251)))))

(assert (=> d!77255 (= (containsKey!389 lt!219451 key!251) e!285442)))

(declare-fun b!484862 () Bool)

(declare-fun e!285443 () Bool)

(assert (=> b!484862 (= e!285442 e!285443)))

(declare-fun res!288834 () Bool)

(assert (=> b!484862 (=> (not res!288834) (not e!285443))))

(assert (=> b!484862 (= res!288834 (and (or (not ((_ is Cons!9185) lt!219451)) (bvsle (_1!4592 (h!10041 lt!219451)) key!251)) ((_ is Cons!9185) lt!219451) (bvslt (_1!4592 (h!10041 lt!219451)) key!251)))))

(declare-fun b!484863 () Bool)

(assert (=> b!484863 (= e!285443 (containsKey!389 (t!15403 lt!219451) key!251))))

(assert (= (and d!77255 (not res!288833)) b!484862))

(assert (= (and b!484862 res!288834) b!484863))

(declare-fun m!465463 () Bool)

(assert (=> b!484863 m!465463))

(assert (=> b!484775 d!77255))

(assert (=> b!484804 d!77219))

(declare-fun d!77257 () Bool)

(assert (=> d!77257 (= ($colon$colon!122 e!285377 (ite c!58305 (h!10041 l!956) (tuple2!9163 key!251 value!166))) (Cons!9185 (ite c!58305 (h!10041 l!956) (tuple2!9163 key!251 value!166)) e!285377))))

(assert (=> bm!31160 d!77257))

(declare-fun d!77259 () Bool)

(declare-fun res!288835 () Bool)

(declare-fun e!285444 () Bool)

(assert (=> d!77259 (=> res!288835 e!285444)))

(assert (=> d!77259 (= res!288835 (or ((_ is Nil!9186) lt!219441) ((_ is Nil!9186) (t!15403 lt!219441))))))

(assert (=> d!77259 (= (isStrictlySorted!414 lt!219441) e!285444)))

(declare-fun b!484864 () Bool)

(declare-fun e!285445 () Bool)

(assert (=> b!484864 (= e!285444 e!285445)))

(declare-fun res!288836 () Bool)

(assert (=> b!484864 (=> (not res!288836) (not e!285445))))

(assert (=> b!484864 (= res!288836 (bvslt (_1!4592 (h!10041 lt!219441)) (_1!4592 (h!10041 (t!15403 lt!219441)))))))

(declare-fun b!484865 () Bool)

(assert (=> b!484865 (= e!285445 (isStrictlySorted!414 (t!15403 lt!219441)))))

(assert (= (and d!77259 (not res!288835)) b!484864))

(assert (= (and b!484864 res!288836) b!484865))

(declare-fun m!465465 () Bool)

(assert (=> b!484865 m!465465))

(assert (=> d!77177 d!77259))

(assert (=> d!77177 d!77205))

(declare-fun d!77261 () Bool)

(declare-fun lt!219463 () Int)

(assert (=> d!77261 (>= lt!219463 0)))

(declare-fun e!285448 () Int)

(assert (=> d!77261 (= lt!219463 e!285448)))

(declare-fun c!58316 () Bool)

(assert (=> d!77261 (= c!58316 ((_ is Nil!9186) (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)))))

(assert (=> d!77261 (= (size!15455 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)) lt!219463)))

(declare-fun b!484870 () Bool)

(assert (=> b!484870 (= e!285448 0)))

(declare-fun b!484871 () Bool)

(assert (=> b!484871 (= e!285448 (+ 1 (size!15455 (t!15403 (insertStrictlySorted!242 (t!15403 l!956) key!251 value!166)))))))

(assert (= (and d!77261 c!58316) b!484870))

(assert (= (and d!77261 (not c!58316)) b!484871))

(declare-fun m!465467 () Bool)

(assert (=> b!484871 m!465467))

(assert (=> d!77187 d!77261))

(declare-fun d!77263 () Bool)

(declare-fun lt!219464 () Int)

(assert (=> d!77263 (>= lt!219464 0)))

(declare-fun e!285449 () Int)

(assert (=> d!77263 (= lt!219464 e!285449)))

(declare-fun c!58317 () Bool)

(assert (=> d!77263 (= c!58317 ((_ is Nil!9186) l!956))))

(assert (=> d!77263 (= (size!15455 l!956) lt!219464)))

(declare-fun b!484872 () Bool)

(assert (=> b!484872 (= e!285449 0)))

(declare-fun b!484873 () Bool)

(assert (=> b!484873 (= e!285449 (+ 1 (size!15455 (t!15403 l!956))))))

(assert (= (and d!77263 c!58317) b!484872))

(assert (= (and d!77263 (not c!58317)) b!484873))

(assert (=> b!484873 m!465393))

(assert (=> d!77201 d!77263))

(declare-fun d!77265 () Bool)

(declare-fun lt!219465 () Int)

(assert (=> d!77265 (>= lt!219465 0)))

(declare-fun e!285450 () Int)

(assert (=> d!77265 (= lt!219465 e!285450)))

(declare-fun c!58318 () Bool)

(assert (=> d!77265 (= c!58318 ((_ is Nil!9186) lt!219423))))

(assert (=> d!77265 (= (size!15455 lt!219423) lt!219465)))

(declare-fun b!484874 () Bool)

(assert (=> b!484874 (= e!285450 0)))

(declare-fun b!484875 () Bool)

(assert (=> b!484875 (= e!285450 (+ 1 (size!15455 (t!15403 lt!219423))))))

(assert (= (and d!77265 c!58318) b!484874))

(assert (= (and d!77265 (not c!58318)) b!484875))

(declare-fun m!465469 () Bool)

(assert (=> b!484875 m!465469))

(assert (=> d!77195 d!77265))

(declare-fun d!77267 () Bool)

(declare-fun lt!219466 () Int)

(assert (=> d!77267 (>= lt!219466 0)))

(declare-fun e!285451 () Int)

(assert (=> d!77267 (= lt!219466 e!285451)))

(declare-fun c!58319 () Bool)

(assert (=> d!77267 (= c!58319 ((_ is Nil!9186) (t!15403 l!956)))))

(assert (=> d!77267 (= (size!15455 (t!15403 l!956)) lt!219466)))

(declare-fun b!484876 () Bool)

(assert (=> b!484876 (= e!285451 0)))

(declare-fun b!484877 () Bool)

(assert (=> b!484877 (= e!285451 (+ 1 (size!15455 (t!15403 (t!15403 l!956)))))))

(assert (= (and d!77267 c!58319) b!484876))

(assert (= (and d!77267 (not c!58319)) b!484877))

(declare-fun m!465471 () Bool)

(assert (=> b!484877 m!465471))

(assert (=> d!77197 d!77267))

(declare-fun lt!219467 () Bool)

(declare-fun d!77269 () Bool)

(assert (=> d!77269 (= lt!219467 (select (content!215 lt!219441) (tuple2!9163 key!251 value!166)))))

(declare-fun e!285453 () Bool)

(assert (=> d!77269 (= lt!219467 e!285453)))

(declare-fun res!288838 () Bool)

(assert (=> d!77269 (=> (not res!288838) (not e!285453))))

(assert (=> d!77269 (= res!288838 ((_ is Cons!9185) lt!219441))))

(assert (=> d!77269 (= (contains!2659 lt!219441 (tuple2!9163 key!251 value!166)) lt!219467)))

(declare-fun b!484878 () Bool)

(declare-fun e!285452 () Bool)

(assert (=> b!484878 (= e!285453 e!285452)))

(declare-fun res!288837 () Bool)

(assert (=> b!484878 (=> res!288837 e!285452)))

(assert (=> b!484878 (= res!288837 (= (h!10041 lt!219441) (tuple2!9163 key!251 value!166)))))

(declare-fun b!484879 () Bool)

(assert (=> b!484879 (= e!285452 (contains!2659 (t!15403 lt!219441) (tuple2!9163 key!251 value!166)))))

(assert (= (and d!77269 res!288838) b!484878))

(assert (= (and b!484878 (not res!288837)) b!484879))

(declare-fun m!465473 () Bool)

(assert (=> d!77269 m!465473))

(declare-fun m!465475 () Bool)

(assert (=> d!77269 m!465475))

(declare-fun m!465477 () Bool)

(assert (=> b!484879 m!465477))

(assert (=> b!484717 d!77269))

(assert (=> b!484808 d!77205))

(declare-fun bm!31168 () Bool)

(declare-fun call!31171 () List!9189)

(declare-fun call!31172 () List!9189)

(assert (=> bm!31168 (= call!31171 call!31172)))

(declare-fun b!484880 () Bool)

(declare-fun c!58321 () Bool)

(assert (=> b!484880 (= c!58321 (and ((_ is Cons!9185) (t!15403 (t!15403 l!956))) (bvsgt (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) key!251)))))

(declare-fun e!285458 () List!9189)

(declare-fun e!285456 () List!9189)

(assert (=> b!484880 (= e!285458 e!285456)))

(declare-fun b!484881 () Bool)

(assert (=> b!484881 (= e!285458 call!31171)))

(declare-fun b!484882 () Bool)

(declare-fun lt!219468 () List!9189)

(declare-fun e!285454 () Bool)

(assert (=> b!484882 (= e!285454 (contains!2659 lt!219468 (tuple2!9163 key!251 value!166)))))

(declare-fun b!484883 () Bool)

(declare-fun e!285455 () List!9189)

(assert (=> b!484883 (= e!285455 call!31172)))

(declare-fun e!285457 () List!9189)

(declare-fun b!484885 () Bool)

(assert (=> b!484885 (= e!285457 (insertStrictlySorted!242 (t!15403 (t!15403 (t!15403 l!956))) key!251 value!166))))

(declare-fun bm!31169 () Bool)

(declare-fun c!58323 () Bool)

(assert (=> bm!31169 (= call!31172 ($colon$colon!122 e!285457 (ite c!58323 (h!10041 (t!15403 (t!15403 l!956))) (tuple2!9163 key!251 value!166))))))

(declare-fun c!58322 () Bool)

(assert (=> bm!31169 (= c!58322 c!58323)))

(declare-fun b!484886 () Bool)

(declare-fun c!58320 () Bool)

(assert (=> b!484886 (= e!285457 (ite c!58320 (t!15403 (t!15403 (t!15403 l!956))) (ite c!58321 (Cons!9185 (h!10041 (t!15403 (t!15403 l!956))) (t!15403 (t!15403 (t!15403 l!956)))) Nil!9186)))))

(declare-fun b!484884 () Bool)

(declare-fun res!288840 () Bool)

(assert (=> b!484884 (=> (not res!288840) (not e!285454))))

(assert (=> b!484884 (= res!288840 (containsKey!389 lt!219468 key!251))))

(declare-fun d!77271 () Bool)

(assert (=> d!77271 e!285454))

(declare-fun res!288839 () Bool)

(assert (=> d!77271 (=> (not res!288839) (not e!285454))))

(assert (=> d!77271 (= res!288839 (isStrictlySorted!414 lt!219468))))

(assert (=> d!77271 (= lt!219468 e!285455)))

(assert (=> d!77271 (= c!58323 (and ((_ is Cons!9185) (t!15403 (t!15403 l!956))) (bvslt (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) key!251)))))

(assert (=> d!77271 (isStrictlySorted!414 (t!15403 (t!15403 l!956)))))

(assert (=> d!77271 (= (insertStrictlySorted!242 (t!15403 (t!15403 l!956)) key!251 value!166) lt!219468)))

(declare-fun b!484887 () Bool)

(assert (=> b!484887 (= e!285455 e!285458)))

(assert (=> b!484887 (= c!58320 (and ((_ is Cons!9185) (t!15403 (t!15403 l!956))) (= (_1!4592 (h!10041 (t!15403 (t!15403 l!956)))) key!251)))))

(declare-fun b!484888 () Bool)

(declare-fun call!31173 () List!9189)

(assert (=> b!484888 (= e!285456 call!31173)))

(declare-fun bm!31170 () Bool)

(assert (=> bm!31170 (= call!31173 call!31171)))

(declare-fun b!484889 () Bool)

(assert (=> b!484889 (= e!285456 call!31173)))

(assert (= (and d!77271 c!58323) b!484883))

(assert (= (and d!77271 (not c!58323)) b!484887))

(assert (= (and b!484887 c!58320) b!484881))

(assert (= (and b!484887 (not c!58320)) b!484880))

(assert (= (and b!484880 c!58321) b!484888))

(assert (= (and b!484880 (not c!58321)) b!484889))

(assert (= (or b!484888 b!484889) bm!31170))

(assert (= (or b!484881 bm!31170) bm!31168))

(assert (= (or b!484883 bm!31168) bm!31169))

(assert (= (and bm!31169 c!58322) b!484885))

(assert (= (and bm!31169 (not c!58322)) b!484886))

(assert (= (and d!77271 res!288839) b!484884))

(assert (= (and b!484884 res!288840) b!484882))

(declare-fun m!465479 () Bool)

(assert (=> b!484885 m!465479))

(declare-fun m!465481 () Bool)

(assert (=> bm!31169 m!465481))

(declare-fun m!465483 () Bool)

(assert (=> d!77271 m!465483))

(assert (=> d!77271 m!465399))

(declare-fun m!465485 () Bool)

(assert (=> b!484884 m!465485))

(declare-fun m!465487 () Bool)

(assert (=> b!484882 m!465487))

(assert (=> b!484720 d!77271))

(declare-fun d!77273 () Bool)

(declare-fun res!288841 () Bool)

(declare-fun e!285459 () Bool)

(assert (=> d!77273 (=> res!288841 e!285459)))

(assert (=> d!77273 (= res!288841 (and ((_ is Cons!9185) lt!219441) (= (_1!4592 (h!10041 lt!219441)) key!251)))))

(assert (=> d!77273 (= (containsKey!389 lt!219441 key!251) e!285459)))

(declare-fun b!484890 () Bool)

(declare-fun e!285460 () Bool)

(assert (=> b!484890 (= e!285459 e!285460)))

(declare-fun res!288842 () Bool)

(assert (=> b!484890 (=> (not res!288842) (not e!285460))))

(assert (=> b!484890 (= res!288842 (and (or (not ((_ is Cons!9185) lt!219441)) (bvsle (_1!4592 (h!10041 lt!219441)) key!251)) ((_ is Cons!9185) lt!219441) (bvslt (_1!4592 (h!10041 lt!219441)) key!251)))))

(declare-fun b!484891 () Bool)

(assert (=> b!484891 (= e!285460 (containsKey!389 (t!15403 lt!219441) key!251))))

(assert (= (and d!77273 (not res!288841)) b!484890))

(assert (= (and b!484890 res!288842) b!484891))

(declare-fun m!465489 () Bool)

(assert (=> b!484891 m!465489))

(assert (=> b!484719 d!77273))

(declare-fun b!484892 () Bool)

(declare-fun e!285461 () Bool)

(declare-fun tp!43568 () Bool)

(assert (=> b!484892 (= e!285461 (and tp_is_empty!13951 tp!43568))))

(assert (=> b!484827 (= tp!43561 e!285461)))

(assert (= (and b!484827 ((_ is Cons!9185) (t!15403 (t!15403 l!956)))) b!484892))

(check-sat (not d!77249) (not b!484857) (not b!484861) (not b!484877) tp_is_empty!13951 (not b!484859) (not b!484873) (not b!484863) (not b!484885) (not b!484865) (not bm!31169) (not b!484891) (not b!484879) (not d!77243) (not b!484855) (not b!484892) (not b!484882) (not d!77269) (not b!484875) (not b!484871) (not b!484884) (not d!77271))
(check-sat)
