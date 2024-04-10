; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137368 () Bool)

(assert start!137368)

(declare-fun b!1581307 () Bool)

(declare-fun res!1080335 () Bool)

(declare-fun e!882317 () Bool)

(assert (=> b!1581307 (=> (not res!1080335) (not e!882317))))

(declare-datatypes ((B!2694 0))(
  ( (B!2695 (val!19709 Int)) )
))
(declare-datatypes ((tuple2!25572 0))(
  ( (tuple2!25573 (_1!12797 (_ BitVec 64)) (_2!12797 B!2694)) )
))
(declare-datatypes ((List!36829 0))(
  ( (Nil!36826) (Cons!36825 (h!38368 tuple2!25572) (t!51743 List!36829)) )
))
(declare-fun l!1390 () List!36829)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!933 (List!36829 (_ BitVec 64)) Bool)

(assert (=> b!1581307 (= res!1080335 (containsKey!933 (t!51743 l!1390) key!405))))

(declare-fun b!1581308 () Bool)

(declare-fun e!882316 () Bool)

(assert (=> b!1581308 (= e!882316 e!882317)))

(declare-fun res!1080331 () Bool)

(assert (=> b!1581308 (=> (not res!1080331) (not e!882317))))

(declare-fun e!882320 () Bool)

(assert (=> b!1581308 (= res!1080331 e!882320)))

(declare-fun res!1080329 () Bool)

(assert (=> b!1581308 (=> res!1080329 e!882320)))

(declare-datatypes ((tuple2!25574 0))(
  ( (tuple2!25575 (_1!12798 tuple2!25572) (_2!12798 List!36829)) )
))
(declare-datatypes ((Option!922 0))(
  ( (Some!921 (v!22434 tuple2!25574)) (None!920) )
))
(declare-fun lt!676916 () Option!922)

(declare-fun isEmpty!1180 (Option!922) Bool)

(assert (=> b!1581308 (= res!1080329 (isEmpty!1180 lt!676916))))

(declare-fun unapply!96 (List!36829) Option!922)

(assert (=> b!1581308 (= lt!676916 (unapply!96 l!1390))))

(declare-fun b!1581309 () Bool)

(declare-fun res!1080330 () Bool)

(assert (=> b!1581309 (=> (not res!1080330) (not e!882317))))

(declare-fun lt!676917 () tuple2!25572)

(declare-fun contains!10501 (List!36829 tuple2!25572) Bool)

(assert (=> b!1581309 (= res!1080330 (contains!10501 (t!51743 l!1390) lt!676917))))

(declare-fun b!1581310 () Bool)

(declare-fun res!1080336 () Bool)

(assert (=> b!1581310 (=> (not res!1080336) (not e!882317))))

(declare-fun isStrictlySorted!1087 (List!36829) Bool)

(assert (=> b!1581310 (= res!1080336 (isStrictlySorted!1087 (t!51743 l!1390)))))

(declare-fun b!1581311 () Bool)

(declare-fun ListPrimitiveSize!198 (List!36829) Int)

(assert (=> b!1581311 (= e!882317 (>= (ListPrimitiveSize!198 (t!51743 l!1390)) (ListPrimitiveSize!198 l!1390)))))

(declare-fun b!1581312 () Bool)

(declare-fun res!1080333 () Bool)

(declare-fun e!882319 () Bool)

(assert (=> b!1581312 (=> (not res!1080333) (not e!882319))))

(assert (=> b!1581312 (= res!1080333 (containsKey!933 l!1390 key!405))))

(declare-fun b!1581313 () Bool)

(declare-fun e!882318 () Bool)

(declare-fun tp_is_empty!39239 () Bool)

(declare-fun tp!114566 () Bool)

(assert (=> b!1581313 (= e!882318 (and tp_is_empty!39239 tp!114566))))

(declare-fun res!1080332 () Bool)

(assert (=> start!137368 (=> (not res!1080332) (not e!882319))))

(assert (=> start!137368 (= res!1080332 (isStrictlySorted!1087 l!1390))))

(assert (=> start!137368 e!882319))

(assert (=> start!137368 e!882318))

(assert (=> start!137368 true))

(assert (=> start!137368 tp_is_empty!39239))

(declare-fun b!1581314 () Bool)

(declare-fun res!1080328 () Bool)

(assert (=> b!1581314 (=> (not res!1080328) (not e!882317))))

(assert (=> b!1581314 (= res!1080328 (and (or (not (is-Cons!36825 l!1390)) (not (= (_1!12797 (h!38368 l!1390)) key!405))) (is-Cons!36825 l!1390)))))

(declare-fun b!1581315 () Bool)

(declare-fun get!26815 (Option!922) tuple2!25574)

(assert (=> b!1581315 (= e!882320 (not (is-Nil!36826 (_2!12798 (get!26815 lt!676916)))))))

(declare-fun b!1581316 () Bool)

(assert (=> b!1581316 (= e!882319 e!882316)))

(declare-fun res!1080334 () Bool)

(assert (=> b!1581316 (=> (not res!1080334) (not e!882316))))

(assert (=> b!1581316 (= res!1080334 (contains!10501 l!1390 lt!676917))))

(declare-fun value!194 () B!2694)

(assert (=> b!1581316 (= lt!676917 (tuple2!25573 key!405 value!194))))

(assert (= (and start!137368 res!1080332) b!1581312))

(assert (= (and b!1581312 res!1080333) b!1581316))

(assert (= (and b!1581316 res!1080334) b!1581308))

(assert (= (and b!1581308 (not res!1080329)) b!1581315))

(assert (= (and b!1581308 res!1080331) b!1581314))

(assert (= (and b!1581314 res!1080328) b!1581310))

(assert (= (and b!1581310 res!1080336) b!1581307))

(assert (= (and b!1581307 res!1080335) b!1581309))

(assert (= (and b!1581309 res!1080330) b!1581311))

(assert (= (and start!137368 (is-Cons!36825 l!1390)) b!1581313))

(declare-fun m!1452343 () Bool)

(assert (=> b!1581316 m!1452343))

(declare-fun m!1452345 () Bool)

(assert (=> b!1581312 m!1452345))

(declare-fun m!1452347 () Bool)

(assert (=> b!1581315 m!1452347))

(declare-fun m!1452349 () Bool)

(assert (=> start!137368 m!1452349))

(declare-fun m!1452351 () Bool)

(assert (=> b!1581311 m!1452351))

(declare-fun m!1452353 () Bool)

(assert (=> b!1581311 m!1452353))

(declare-fun m!1452355 () Bool)

(assert (=> b!1581310 m!1452355))

(declare-fun m!1452357 () Bool)

(assert (=> b!1581307 m!1452357))

(declare-fun m!1452359 () Bool)

(assert (=> b!1581308 m!1452359))

(declare-fun m!1452361 () Bool)

(assert (=> b!1581308 m!1452361))

(declare-fun m!1452363 () Bool)

(assert (=> b!1581309 m!1452363))

(push 1)

(assert (not b!1581311))

(assert (not b!1581312))

(assert (not b!1581310))

(assert (not b!1581308))

(assert (not b!1581315))

(assert (not b!1581309))

(assert tp_is_empty!39239)

(assert (not b!1581307))

(assert (not b!1581316))

(assert (not b!1581313))

(assert (not start!137368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166675 () Bool)

(declare-fun res!1080355 () Bool)

(declare-fun e!882339 () Bool)

(assert (=> d!166675 (=> res!1080355 e!882339)))

(assert (=> d!166675 (= res!1080355 (and (is-Cons!36825 (t!51743 l!1390)) (= (_1!12797 (h!38368 (t!51743 l!1390))) key!405)))))

(assert (=> d!166675 (= (containsKey!933 (t!51743 l!1390) key!405) e!882339)))

(declare-fun b!1581335 () Bool)

(declare-fun e!882340 () Bool)

(assert (=> b!1581335 (= e!882339 e!882340)))

(declare-fun res!1080356 () Bool)

(assert (=> b!1581335 (=> (not res!1080356) (not e!882340))))

(assert (=> b!1581335 (= res!1080356 (and (or (not (is-Cons!36825 (t!51743 l!1390))) (bvsle (_1!12797 (h!38368 (t!51743 l!1390))) key!405)) (is-Cons!36825 (t!51743 l!1390)) (bvslt (_1!12797 (h!38368 (t!51743 l!1390))) key!405)))))

(declare-fun b!1581336 () Bool)

(assert (=> b!1581336 (= e!882340 (containsKey!933 (t!51743 (t!51743 l!1390)) key!405))))

(assert (= (and d!166675 (not res!1080355)) b!1581335))

(assert (= (and b!1581335 res!1080356) b!1581336))

(declare-fun m!1452375 () Bool)

(assert (=> b!1581336 m!1452375))

(assert (=> b!1581307 d!166675))

(declare-fun d!166687 () Bool)

(declare-fun res!1080357 () Bool)

(declare-fun e!882341 () Bool)

(assert (=> d!166687 (=> res!1080357 e!882341)))

(assert (=> d!166687 (= res!1080357 (and (is-Cons!36825 l!1390) (= (_1!12797 (h!38368 l!1390)) key!405)))))

(assert (=> d!166687 (= (containsKey!933 l!1390 key!405) e!882341)))

(declare-fun b!1581337 () Bool)

(declare-fun e!882342 () Bool)

(assert (=> b!1581337 (= e!882341 e!882342)))

(declare-fun res!1080358 () Bool)

(assert (=> b!1581337 (=> (not res!1080358) (not e!882342))))

(assert (=> b!1581337 (= res!1080358 (and (or (not (is-Cons!36825 l!1390)) (bvsle (_1!12797 (h!38368 l!1390)) key!405)) (is-Cons!36825 l!1390) (bvslt (_1!12797 (h!38368 l!1390)) key!405)))))

(declare-fun b!1581338 () Bool)

(assert (=> b!1581338 (= e!882342 (containsKey!933 (t!51743 l!1390) key!405))))

(assert (= (and d!166687 (not res!1080357)) b!1581337))

(assert (= (and b!1581337 res!1080358) b!1581338))

(assert (=> b!1581338 m!1452357))

(assert (=> b!1581312 d!166687))

(declare-fun d!166689 () Bool)

(assert (=> d!166689 (= (isEmpty!1180 lt!676916) (not (is-Some!921 lt!676916)))))

(assert (=> b!1581308 d!166689))

(declare-fun d!166691 () Bool)

(assert (=> d!166691 (= (unapply!96 l!1390) (ite (is-Nil!36826 l!1390) None!920 (Some!921 (tuple2!25575 (h!38368 l!1390) (t!51743 l!1390)))))))

(assert (=> b!1581308 d!166691))

(declare-fun d!166693 () Bool)

(declare-fun res!1080375 () Bool)

(declare-fun e!882359 () Bool)

(assert (=> d!166693 (=> res!1080375 e!882359)))

(assert (=> d!166693 (= res!1080375 (or (is-Nil!36826 l!1390) (is-Nil!36826 (t!51743 l!1390))))))

(assert (=> d!166693 (= (isStrictlySorted!1087 l!1390) e!882359)))

(declare-fun b!1581355 () Bool)

(declare-fun e!882360 () Bool)

(assert (=> b!1581355 (= e!882359 e!882360)))

(declare-fun res!1080376 () Bool)

(assert (=> b!1581355 (=> (not res!1080376) (not e!882360))))

(assert (=> b!1581355 (= res!1080376 (bvslt (_1!12797 (h!38368 l!1390)) (_1!12797 (h!38368 (t!51743 l!1390)))))))

(declare-fun b!1581356 () Bool)

(assert (=> b!1581356 (= e!882360 (isStrictlySorted!1087 (t!51743 l!1390)))))

(assert (= (and d!166693 (not res!1080375)) b!1581355))

(assert (= (and b!1581355 res!1080376) b!1581356))

(assert (=> b!1581356 m!1452355))

(assert (=> start!137368 d!166693))

(declare-fun d!166705 () Bool)

(declare-fun res!1080383 () Bool)

(declare-fun e!882367 () Bool)

(assert (=> d!166705 (=> res!1080383 e!882367)))

(assert (=> d!166705 (= res!1080383 (or (is-Nil!36826 (t!51743 l!1390)) (is-Nil!36826 (t!51743 (t!51743 l!1390)))))))

(assert (=> d!166705 (= (isStrictlySorted!1087 (t!51743 l!1390)) e!882367)))

(declare-fun b!1581363 () Bool)

(declare-fun e!882368 () Bool)

(assert (=> b!1581363 (= e!882367 e!882368)))

(declare-fun res!1080384 () Bool)

(assert (=> b!1581363 (=> (not res!1080384) (not e!882368))))

(assert (=> b!1581363 (= res!1080384 (bvslt (_1!12797 (h!38368 (t!51743 l!1390))) (_1!12797 (h!38368 (t!51743 (t!51743 l!1390))))))))

(declare-fun b!1581364 () Bool)

(assert (=> b!1581364 (= e!882368 (isStrictlySorted!1087 (t!51743 (t!51743 l!1390))))))

(assert (= (and d!166705 (not res!1080383)) b!1581363))

(assert (= (and b!1581363 res!1080384) b!1581364))

(declare-fun m!1452383 () Bool)

(assert (=> b!1581364 m!1452383))

(assert (=> b!1581310 d!166705))

(declare-fun d!166709 () Bool)

(assert (=> d!166709 (= (get!26815 lt!676916) (v!22434 lt!676916))))

(assert (=> b!1581315 d!166709))

(declare-fun d!166713 () Bool)

(declare-fun lt!676932 () Bool)

(declare-fun content!847 (List!36829) (Set tuple2!25572))

(assert (=> d!166713 (= lt!676932 (member lt!676917 (content!847 (t!51743 l!1390))))))

(declare-fun e!882390 () Bool)

(assert (=> d!166713 (= lt!676932 e!882390)))

(declare-fun res!1080396 () Bool)

(assert (=> d!166713 (=> (not res!1080396) (not e!882390))))

(assert (=> d!166713 (= res!1080396 (is-Cons!36825 (t!51743 l!1390)))))

(assert (=> d!166713 (= (contains!10501 (t!51743 l!1390) lt!676917) lt!676932)))

(declare-fun b!1581396 () Bool)

(declare-fun e!882391 () Bool)

(assert (=> b!1581396 (= e!882390 e!882391)))

(declare-fun res!1080395 () Bool)

(assert (=> b!1581396 (=> res!1080395 e!882391)))

(assert (=> b!1581396 (= res!1080395 (= (h!38368 (t!51743 l!1390)) lt!676917))))

(declare-fun b!1581397 () Bool)

(assert (=> b!1581397 (= e!882391 (contains!10501 (t!51743 (t!51743 l!1390)) lt!676917))))

(assert (= (and d!166713 res!1080396) b!1581396))

(assert (= (and b!1581396 (not res!1080395)) b!1581397))

(declare-fun m!1452391 () Bool)

(assert (=> d!166713 m!1452391))

(declare-fun m!1452393 () Bool)

(assert (=> d!166713 m!1452393))

(declare-fun m!1452395 () Bool)

(assert (=> b!1581397 m!1452395))

(assert (=> b!1581309 d!166713))

(declare-fun d!166725 () Bool)

(declare-fun lt!676935 () Int)

(assert (=> d!166725 (>= lt!676935 0)))

(declare-fun e!882394 () Int)

(assert (=> d!166725 (= lt!676935 e!882394)))

(declare-fun c!146589 () Bool)

(assert (=> d!166725 (= c!146589 (is-Nil!36826 (t!51743 l!1390)))))

(assert (=> d!166725 (= (ListPrimitiveSize!198 (t!51743 l!1390)) lt!676935)))

(declare-fun b!1581402 () Bool)

(assert (=> b!1581402 (= e!882394 0)))

(declare-fun b!1581403 () Bool)

(assert (=> b!1581403 (= e!882394 (+ 1 (ListPrimitiveSize!198 (t!51743 (t!51743 l!1390)))))))

(assert (= (and d!166725 c!146589) b!1581402))

(assert (= (and d!166725 (not c!146589)) b!1581403))

(declare-fun m!1452397 () Bool)

(assert (=> b!1581403 m!1452397))

(assert (=> b!1581311 d!166725))

(declare-fun d!166727 () Bool)

(declare-fun lt!676936 () Int)

(assert (=> d!166727 (>= lt!676936 0)))

(declare-fun e!882395 () Int)

(assert (=> d!166727 (= lt!676936 e!882395)))

(declare-fun c!146590 () Bool)

(assert (=> d!166727 (= c!146590 (is-Nil!36826 l!1390))))

(assert (=> d!166727 (= (ListPrimitiveSize!198 l!1390) lt!676936)))

(declare-fun b!1581404 () Bool)

(assert (=> b!1581404 (= e!882395 0)))

(declare-fun b!1581405 () Bool)

(assert (=> b!1581405 (= e!882395 (+ 1 (ListPrimitiveSize!198 (t!51743 l!1390))))))

(assert (= (and d!166727 c!146590) b!1581404))

(assert (= (and d!166727 (not c!146590)) b!1581405))

(assert (=> b!1581405 m!1452351))

(assert (=> b!1581311 d!166727))

(declare-fun d!166729 () Bool)

(declare-fun lt!676939 () Bool)

(assert (=> d!166729 (= lt!676939 (member lt!676917 (content!847 l!1390)))))

(declare-fun e!882398 () Bool)

(assert (=> d!166729 (= lt!676939 e!882398)))

(declare-fun res!1080400 () Bool)

