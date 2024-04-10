; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88936 () Bool)

(assert start!88936)

(declare-fun b!1020394 () Bool)

(declare-fun e!574350 () Bool)

(declare-fun tp_is_empty!23797 () Bool)

(declare-fun tp!71254 () Bool)

(assert (=> b!1020394 (= e!574350 (and tp_is_empty!23797 tp!71254))))

(declare-fun b!1020395 () Bool)

(declare-fun e!574347 () Bool)

(declare-fun e!574349 () Bool)

(assert (=> b!1020395 (= e!574347 e!574349)))

(declare-fun res!683919 () Bool)

(assert (=> b!1020395 (=> res!683919 e!574349)))

(declare-datatypes ((B!1730 0))(
  ( (B!1731 (val!11949 Int)) )
))
(declare-datatypes ((tuple2!15444 0))(
  ( (tuple2!15445 (_1!7733 (_ BitVec 64)) (_2!7733 B!1730)) )
))
(declare-datatypes ((List!21637 0))(
  ( (Nil!21634) (Cons!21633 (h!22831 tuple2!15444) (t!30647 List!21637)) )
))
(declare-fun l!1367 () List!21637)

(declare-fun isStrictlySorted!702 (List!21637) Bool)

(assert (=> b!1020395 (= res!683919 (not (isStrictlySorted!702 (t!30647 l!1367))))))

(declare-fun b!1020396 () Bool)

(declare-fun lt!449853 () tuple2!15444)

(declare-fun contains!5928 (List!21637 tuple2!15444) Bool)

(assert (=> b!1020396 (= e!574349 (not (contains!5928 (t!30647 l!1367) lt!449853)))))

(declare-fun res!683918 () Bool)

(declare-fun e!574348 () Bool)

(assert (=> start!88936 (=> (not res!683918) (not e!574348))))

(assert (=> start!88936 (= res!683918 (isStrictlySorted!702 l!1367))))

(assert (=> start!88936 e!574348))

(assert (=> start!88936 e!574350))

(assert (=> start!88936 true))

(assert (=> start!88936 tp_is_empty!23797))

(declare-fun b!1020397 () Bool)

(declare-fun res!683921 () Bool)

(assert (=> b!1020397 (=> (not res!683921) (not e!574347))))

(assert (=> b!1020397 (= res!683921 (and (is-Cons!21633 l!1367) (not (= (h!22831 l!1367) lt!449853))))))

(declare-fun b!1020398 () Bool)

(assert (=> b!1020398 (= e!574348 e!574347)))

(declare-fun res!683920 () Bool)

(assert (=> b!1020398 (=> (not res!683920) (not e!574347))))

(assert (=> b!1020398 (= res!683920 (contains!5928 l!1367 lt!449853))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1730)

(assert (=> b!1020398 (= lt!449853 (tuple2!15445 key!393 value!188))))

(assert (= (and start!88936 res!683918) b!1020398))

(assert (= (and b!1020398 res!683920) b!1020397))

(assert (= (and b!1020397 res!683921) b!1020395))

(assert (= (and b!1020395 (not res!683919)) b!1020396))

(assert (= (and start!88936 (is-Cons!21633 l!1367)) b!1020394))

(declare-fun m!940351 () Bool)

(assert (=> b!1020395 m!940351))

(declare-fun m!940353 () Bool)

(assert (=> b!1020396 m!940353))

(declare-fun m!940355 () Bool)

(assert (=> start!88936 m!940355))

(declare-fun m!940357 () Bool)

(assert (=> b!1020398 m!940357))

(push 1)

(assert (not b!1020396))

(assert (not start!88936))

(assert (not b!1020395))

(assert (not b!1020394))

(assert tp_is_empty!23797)

(assert (not b!1020398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122351 () Bool)

(declare-fun res!683956 () Bool)

(declare-fun e!574385 () Bool)

(assert (=> d!122351 (=> res!683956 e!574385)))

(assert (=> d!122351 (= res!683956 (or (is-Nil!21634 (t!30647 l!1367)) (is-Nil!21634 (t!30647 (t!30647 l!1367)))))))

(assert (=> d!122351 (= (isStrictlySorted!702 (t!30647 l!1367)) e!574385)))

(declare-fun b!1020439 () Bool)

(declare-fun e!574386 () Bool)

(assert (=> b!1020439 (= e!574385 e!574386)))

(declare-fun res!683957 () Bool)

(assert (=> b!1020439 (=> (not res!683957) (not e!574386))))

(assert (=> b!1020439 (= res!683957 (bvslt (_1!7733 (h!22831 (t!30647 l!1367))) (_1!7733 (h!22831 (t!30647 (t!30647 l!1367))))))))

(declare-fun b!1020440 () Bool)

(assert (=> b!1020440 (= e!574386 (isStrictlySorted!702 (t!30647 (t!30647 l!1367))))))

(assert (= (and d!122351 (not res!683956)) b!1020439))

(assert (= (and b!1020439 res!683957) b!1020440))

(declare-fun m!940375 () Bool)

(assert (=> b!1020440 m!940375))

(assert (=> b!1020395 d!122351))

(declare-fun d!122357 () Bool)

(declare-fun res!683958 () Bool)

(declare-fun e!574387 () Bool)

(assert (=> d!122357 (=> res!683958 e!574387)))

(assert (=> d!122357 (= res!683958 (or (is-Nil!21634 l!1367) (is-Nil!21634 (t!30647 l!1367))))))

(assert (=> d!122357 (= (isStrictlySorted!702 l!1367) e!574387)))

(declare-fun b!1020441 () Bool)

(declare-fun e!574388 () Bool)

(assert (=> b!1020441 (= e!574387 e!574388)))

(declare-fun res!683959 () Bool)

(assert (=> b!1020441 (=> (not res!683959) (not e!574388))))

(assert (=> b!1020441 (= res!683959 (bvslt (_1!7733 (h!22831 l!1367)) (_1!7733 (h!22831 (t!30647 l!1367)))))))

(declare-fun b!1020442 () Bool)

(assert (=> b!1020442 (= e!574388 (isStrictlySorted!702 (t!30647 l!1367)))))

(assert (= (and d!122357 (not res!683958)) b!1020441))

(assert (= (and b!1020441 res!683959) b!1020442))

(assert (=> b!1020442 m!940351))

(assert (=> start!88936 d!122357))

(declare-fun d!122359 () Bool)

(declare-fun lt!449869 () Bool)

(declare-fun content!498 (List!21637) (Set tuple2!15444))

(assert (=> d!122359 (= lt!449869 (set.member lt!449853 (content!498 l!1367)))))

(declare-fun e!574416 () Bool)

(assert (=> d!122359 (= lt!449869 e!574416)))

(declare-fun res!683984 () Bool)

(assert (=> d!122359 (=> (not res!683984) (not e!574416))))

(assert (=> d!122359 (= res!683984 (is-Cons!21633 l!1367))))

(assert (=> d!122359 (= (contains!5928 l!1367 lt!449853) lt!449869)))

(declare-fun b!1020469 () Bool)

(declare-fun e!574415 () Bool)

(assert (=> b!1020469 (= e!574416 e!574415)))

(declare-fun res!683985 () Bool)

(assert (=> b!1020469 (=> res!683985 e!574415)))

(assert (=> b!1020469 (= res!683985 (= (h!22831 l!1367) lt!449853))))

(declare-fun b!1020470 () Bool)

(assert (=> b!1020470 (= e!574415 (contains!5928 (t!30647 l!1367) lt!449853))))

(assert (= (and d!122359 res!683984) b!1020469))

(assert (= (and b!1020469 (not res!683985)) b!1020470))

(declare-fun m!940393 () Bool)

(assert (=> d!122359 m!940393))

(declare-fun m!940395 () Bool)

(assert (=> d!122359 m!940395))

(assert (=> b!1020470 m!940353))

(assert (=> b!1020398 d!122359))

(declare-fun d!122367 () Bool)

(declare-fun lt!449870 () Bool)

(assert (=> d!122367 (= lt!449870 (set.member lt!449853 (content!498 (t!30647 l!1367))))))

(declare-fun e!574419 () Bool)

(assert (=> d!122367 (= lt!449870 e!574419)))

(declare-fun res!683986 () Bool)

(assert (=> d!122367 (=> (not res!683986) (not e!574419))))

(assert (=> d!122367 (= res!683986 (is-Cons!21633 (t!30647 l!1367)))))

(assert (=> d!122367 (= (contains!5928 (t!30647 l!1367) lt!449853) lt!449870)))

(declare-fun b!1020474 () Bool)

(declare-fun e!574418 () Bool)

(assert (=> b!1020474 (= e!574419 e!574418)))

(declare-fun res!683987 () Bool)

(assert (=> b!1020474 (=> res!683987 e!574418)))

(assert (=> b!1020474 (= res!683987 (= (h!22831 (t!30647 l!1367)) lt!449853))))

(declare-fun b!1020475 () Bool)

(assert (=> b!1020475 (= e!574418 (contains!5928 (t!30647 (t!30647 l!1367)) lt!449853))))

(assert (= (and d!122367 res!683986) b!1020474))

(assert (= (and b!1020474 (not res!683987)) b!1020475))

(declare-fun m!940397 () Bool)

(assert (=> d!122367 m!940397))

(declare-fun m!940399 () Bool)

(assert (=> d!122367 m!940399))

(declare-fun m!940401 () Bool)

(assert (=> b!1020475 m!940401))

(assert (=> b!1020396 d!122367))

(declare-fun b!1020484 () Bool)

(declare-fun e!574426 () Bool)

(declare-fun tp!71266 () Bool)

(assert (=> b!1020484 (= e!574426 (and tp_is_empty!23797 tp!71266))))

(assert (=> b!1020394 (= tp!71254 e!574426)))

