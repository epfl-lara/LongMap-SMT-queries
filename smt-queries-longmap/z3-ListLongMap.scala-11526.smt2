; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134628 () Bool)

(assert start!134628)

(declare-fun b!1570319 () Bool)

(declare-fun res!1072437 () Bool)

(declare-fun e!875529 () Bool)

(assert (=> b!1570319 (=> (not res!1072437) (not e!875529))))

(declare-datatypes ((List!36709 0))(
  ( (Nil!36706) (Cons!36705 (h!38170 (_ BitVec 64)) (t!51609 List!36709)) )
))
(declare-fun acc!619 () List!36709)

(declare-fun contains!10424 (List!36709 (_ BitVec 64)) Bool)

(assert (=> b!1570319 (= res!1072437 (not (contains!10424 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!104849 0))(
  ( (array!104850 (arr!50599 (Array (_ BitVec 32) (_ BitVec 64))) (size!51150 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104849)

(declare-fun b!1570320 () Bool)

(declare-fun e!875531 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(assert (=> b!1570320 (= e!875531 (not (contains!10424 acc!619 (select (arr!50599 a!3481) from!2856))))))

(declare-fun b!1570321 () Bool)

(declare-fun res!1072429 () Bool)

(declare-fun e!875533 () Bool)

(assert (=> b!1570321 (=> (not res!1072429) (not e!875533))))

(declare-fun lt!673976 () List!36709)

(declare-fun noDuplicate!2672 (List!36709) Bool)

(assert (=> b!1570321 (= res!1072429 (noDuplicate!2672 lt!673976))))

(declare-fun b!1570322 () Bool)

(declare-fun e!875532 () Bool)

(assert (=> b!1570322 (= e!875529 e!875532)))

(declare-fun res!1072430 () Bool)

(assert (=> b!1570322 (=> (not res!1072430) (not e!875532))))

(assert (=> b!1570322 (= res!1072430 e!875531)))

(declare-fun res!1072438 () Bool)

(assert (=> b!1570322 (=> res!1072438 e!875531)))

(declare-fun lt!673977 () Bool)

(assert (=> b!1570322 (= res!1072438 lt!673977)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570322 (= lt!673977 (not (validKeyInArray!0 (select (arr!50599 a!3481) from!2856))))))

(declare-fun b!1570323 () Bool)

(declare-fun res!1072436 () Bool)

(assert (=> b!1570323 (=> (not res!1072436) (not e!875529))))

(assert (=> b!1570323 (= res!1072436 (not (contains!10424 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072431 () Bool)

(assert (=> start!134628 (=> (not res!1072431) (not e!875529))))

(assert (=> start!134628 (= res!1072431 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51150 a!3481)) (bvslt (size!51150 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134628 e!875529))

(assert (=> start!134628 true))

(declare-fun array_inv!39554 (array!104849) Bool)

(assert (=> start!134628 (array_inv!39554 a!3481)))

(declare-fun b!1570324 () Bool)

(declare-fun e!875534 () Bool)

(assert (=> b!1570324 (= e!875534 (contains!10424 lt!673976 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570325 () Bool)

(assert (=> b!1570325 (= e!875532 e!875533)))

(declare-fun res!1072434 () Bool)

(assert (=> b!1570325 (=> (not res!1072434) (not e!875533))))

(assert (=> b!1570325 (= res!1072434 (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000))))

(assert (=> b!1570325 (= lt!673976 (Cons!36705 (select (arr!50599 a!3481) from!2856) acc!619))))

(declare-fun b!1570326 () Bool)

(declare-fun res!1072439 () Bool)

(assert (=> b!1570326 (=> (not res!1072439) (not e!875532))))

(assert (=> b!1570326 (= res!1072439 (not lt!673977))))

(declare-fun b!1570327 () Bool)

(assert (=> b!1570327 (= e!875533 e!875534)))

(declare-fun res!1072435 () Bool)

(assert (=> b!1570327 (=> res!1072435 e!875534)))

(assert (=> b!1570327 (= res!1072435 (contains!10424 lt!673976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570328 () Bool)

(declare-fun res!1072432 () Bool)

(assert (=> b!1570328 (=> (not res!1072432) (not e!875529))))

(assert (=> b!1570328 (= res!1072432 (bvslt from!2856 (size!51150 a!3481)))))

(declare-fun b!1570329 () Bool)

(declare-fun res!1072433 () Bool)

(assert (=> b!1570329 (=> (not res!1072433) (not e!875529))))

(assert (=> b!1570329 (= res!1072433 (noDuplicate!2672 acc!619))))

(assert (= (and start!134628 res!1072431) b!1570329))

(assert (= (and b!1570329 res!1072433) b!1570319))

(assert (= (and b!1570319 res!1072437) b!1570323))

(assert (= (and b!1570323 res!1072436) b!1570328))

(assert (= (and b!1570328 res!1072432) b!1570322))

(assert (= (and b!1570322 (not res!1072438)) b!1570320))

(assert (= (and b!1570322 res!1072430) b!1570326))

(assert (= (and b!1570326 res!1072439) b!1570325))

(assert (= (and b!1570325 res!1072434) b!1570321))

(assert (= (and b!1570321 res!1072429) b!1570327))

(assert (= (and b!1570327 (not res!1072435)) b!1570324))

(declare-fun m!1444893 () Bool)

(assert (=> b!1570319 m!1444893))

(declare-fun m!1444895 () Bool)

(assert (=> b!1570327 m!1444895))

(declare-fun m!1444897 () Bool)

(assert (=> b!1570325 m!1444897))

(declare-fun m!1444899 () Bool)

(assert (=> b!1570323 m!1444899))

(declare-fun m!1444901 () Bool)

(assert (=> b!1570321 m!1444901))

(declare-fun m!1444903 () Bool)

(assert (=> b!1570324 m!1444903))

(assert (=> b!1570320 m!1444897))

(assert (=> b!1570320 m!1444897))

(declare-fun m!1444905 () Bool)

(assert (=> b!1570320 m!1444905))

(declare-fun m!1444907 () Bool)

(assert (=> b!1570329 m!1444907))

(declare-fun m!1444909 () Bool)

(assert (=> start!134628 m!1444909))

(assert (=> b!1570322 m!1444897))

(assert (=> b!1570322 m!1444897))

(declare-fun m!1444911 () Bool)

(assert (=> b!1570322 m!1444911))

(check-sat (not b!1570329) (not b!1570322) (not b!1570327) (not b!1570320) (not b!1570324) (not b!1570321) (not b!1570319) (not b!1570323) (not start!134628))
(check-sat)
(get-model)

(declare-fun d!164377 () Bool)

(declare-fun lt!673992 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!804 (List!36709) (InoxSet (_ BitVec 64)))

(assert (=> d!164377 (= lt!673992 (select (content!804 lt!673976) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!875576 () Bool)

(assert (=> d!164377 (= lt!673992 e!875576)))

(declare-fun res!1072511 () Bool)

(assert (=> d!164377 (=> (not res!1072511) (not e!875576))))

(get-info :version)

(assert (=> d!164377 (= res!1072511 ((_ is Cons!36705) lt!673976))))

(assert (=> d!164377 (= (contains!10424 lt!673976 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673992)))

(declare-fun b!1570400 () Bool)

(declare-fun e!875575 () Bool)

(assert (=> b!1570400 (= e!875576 e!875575)))

(declare-fun res!1072510 () Bool)

(assert (=> b!1570400 (=> res!1072510 e!875575)))

(assert (=> b!1570400 (= res!1072510 (= (h!38170 lt!673976) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570401 () Bool)

(assert (=> b!1570401 (= e!875575 (contains!10424 (t!51609 lt!673976) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164377 res!1072511) b!1570400))

(assert (= (and b!1570400 (not res!1072510)) b!1570401))

(declare-fun m!1444953 () Bool)

(assert (=> d!164377 m!1444953))

(declare-fun m!1444955 () Bool)

(assert (=> d!164377 m!1444955))

(declare-fun m!1444957 () Bool)

(assert (=> b!1570401 m!1444957))

(assert (=> b!1570327 d!164377))

(declare-fun d!164379 () Bool)

(declare-fun res!1072520 () Bool)

(declare-fun e!875585 () Bool)

(assert (=> d!164379 (=> res!1072520 e!875585)))

(assert (=> d!164379 (= res!1072520 ((_ is Nil!36706) lt!673976))))

(assert (=> d!164379 (= (noDuplicate!2672 lt!673976) e!875585)))

(declare-fun b!1570410 () Bool)

(declare-fun e!875586 () Bool)

(assert (=> b!1570410 (= e!875585 e!875586)))

(declare-fun res!1072521 () Bool)

(assert (=> b!1570410 (=> (not res!1072521) (not e!875586))))

(assert (=> b!1570410 (= res!1072521 (not (contains!10424 (t!51609 lt!673976) (h!38170 lt!673976))))))

(declare-fun b!1570411 () Bool)

(assert (=> b!1570411 (= e!875586 (noDuplicate!2672 (t!51609 lt!673976)))))

(assert (= (and d!164379 (not res!1072520)) b!1570410))

(assert (= (and b!1570410 res!1072521) b!1570411))

(declare-fun m!1444959 () Bool)

(assert (=> b!1570410 m!1444959))

(declare-fun m!1444961 () Bool)

(assert (=> b!1570411 m!1444961))

(assert (=> b!1570321 d!164379))

(declare-fun d!164383 () Bool)

(declare-fun lt!673995 () Bool)

(assert (=> d!164383 (= lt!673995 (select (content!804 acc!619) (select (arr!50599 a!3481) from!2856)))))

(declare-fun e!875588 () Bool)

(assert (=> d!164383 (= lt!673995 e!875588)))

(declare-fun res!1072523 () Bool)

(assert (=> d!164383 (=> (not res!1072523) (not e!875588))))

(assert (=> d!164383 (= res!1072523 ((_ is Cons!36705) acc!619))))

(assert (=> d!164383 (= (contains!10424 acc!619 (select (arr!50599 a!3481) from!2856)) lt!673995)))

(declare-fun b!1570412 () Bool)

(declare-fun e!875587 () Bool)

(assert (=> b!1570412 (= e!875588 e!875587)))

(declare-fun res!1072522 () Bool)

(assert (=> b!1570412 (=> res!1072522 e!875587)))

(assert (=> b!1570412 (= res!1072522 (= (h!38170 acc!619) (select (arr!50599 a!3481) from!2856)))))

(declare-fun b!1570413 () Bool)

(assert (=> b!1570413 (= e!875587 (contains!10424 (t!51609 acc!619) (select (arr!50599 a!3481) from!2856)))))

(assert (= (and d!164383 res!1072523) b!1570412))

(assert (= (and b!1570412 (not res!1072522)) b!1570413))

(declare-fun m!1444963 () Bool)

(assert (=> d!164383 m!1444963))

(assert (=> d!164383 m!1444897))

(declare-fun m!1444965 () Bool)

(assert (=> d!164383 m!1444965))

(assert (=> b!1570413 m!1444897))

(declare-fun m!1444967 () Bool)

(assert (=> b!1570413 m!1444967))

(assert (=> b!1570320 d!164383))

(declare-fun d!164385 () Bool)

(declare-fun lt!673996 () Bool)

(assert (=> d!164385 (= lt!673996 (select (content!804 lt!673976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!875590 () Bool)

(assert (=> d!164385 (= lt!673996 e!875590)))

(declare-fun res!1072525 () Bool)

(assert (=> d!164385 (=> (not res!1072525) (not e!875590))))

(assert (=> d!164385 (= res!1072525 ((_ is Cons!36705) lt!673976))))

(assert (=> d!164385 (= (contains!10424 lt!673976 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673996)))

(declare-fun b!1570414 () Bool)

(declare-fun e!875589 () Bool)

(assert (=> b!1570414 (= e!875590 e!875589)))

(declare-fun res!1072524 () Bool)

(assert (=> b!1570414 (=> res!1072524 e!875589)))

(assert (=> b!1570414 (= res!1072524 (= (h!38170 lt!673976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570415 () Bool)

(assert (=> b!1570415 (= e!875589 (contains!10424 (t!51609 lt!673976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164385 res!1072525) b!1570414))

(assert (= (and b!1570414 (not res!1072524)) b!1570415))

(assert (=> d!164385 m!1444953))

(declare-fun m!1444969 () Bool)

(assert (=> d!164385 m!1444969))

(declare-fun m!1444971 () Bool)

(assert (=> b!1570415 m!1444971))

(assert (=> b!1570324 d!164385))

(declare-fun d!164387 () Bool)

(assert (=> d!164387 (= (array_inv!39554 a!3481) (bvsge (size!51150 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134628 d!164387))

(declare-fun d!164395 () Bool)

(declare-fun lt!673999 () Bool)

(assert (=> d!164395 (= lt!673999 (select (content!804 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!875596 () Bool)

(assert (=> d!164395 (= lt!673999 e!875596)))

(declare-fun res!1072531 () Bool)

(assert (=> d!164395 (=> (not res!1072531) (not e!875596))))

(assert (=> d!164395 (= res!1072531 ((_ is Cons!36705) acc!619))))

(assert (=> d!164395 (= (contains!10424 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673999)))

(declare-fun b!1570420 () Bool)

(declare-fun e!875595 () Bool)

(assert (=> b!1570420 (= e!875596 e!875595)))

(declare-fun res!1072530 () Bool)

(assert (=> b!1570420 (=> res!1072530 e!875595)))

(assert (=> b!1570420 (= res!1072530 (= (h!38170 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570421 () Bool)

(assert (=> b!1570421 (= e!875595 (contains!10424 (t!51609 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164395 res!1072531) b!1570420))

(assert (= (and b!1570420 (not res!1072530)) b!1570421))

(assert (=> d!164395 m!1444963))

(declare-fun m!1444985 () Bool)

(assert (=> d!164395 m!1444985))

(declare-fun m!1444987 () Bool)

(assert (=> b!1570421 m!1444987))

(assert (=> b!1570319 d!164395))

(declare-fun d!164397 () Bool)

(declare-fun res!1072532 () Bool)

(declare-fun e!875597 () Bool)

(assert (=> d!164397 (=> res!1072532 e!875597)))

(assert (=> d!164397 (= res!1072532 ((_ is Nil!36706) acc!619))))

(assert (=> d!164397 (= (noDuplicate!2672 acc!619) e!875597)))

(declare-fun b!1570422 () Bool)

(declare-fun e!875598 () Bool)

(assert (=> b!1570422 (= e!875597 e!875598)))

(declare-fun res!1072533 () Bool)

(assert (=> b!1570422 (=> (not res!1072533) (not e!875598))))

(assert (=> b!1570422 (= res!1072533 (not (contains!10424 (t!51609 acc!619) (h!38170 acc!619))))))

(declare-fun b!1570423 () Bool)

(assert (=> b!1570423 (= e!875598 (noDuplicate!2672 (t!51609 acc!619)))))

(assert (= (and d!164397 (not res!1072532)) b!1570422))

(assert (= (and b!1570422 res!1072533) b!1570423))

(declare-fun m!1444989 () Bool)

(assert (=> b!1570422 m!1444989))

(declare-fun m!1444991 () Bool)

(assert (=> b!1570423 m!1444991))

(assert (=> b!1570329 d!164397))

(declare-fun d!164399 () Bool)

(declare-fun lt!674000 () Bool)

(assert (=> d!164399 (= lt!674000 (select (content!804 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!875600 () Bool)

(assert (=> d!164399 (= lt!674000 e!875600)))

(declare-fun res!1072535 () Bool)

(assert (=> d!164399 (=> (not res!1072535) (not e!875600))))

(assert (=> d!164399 (= res!1072535 ((_ is Cons!36705) acc!619))))

(assert (=> d!164399 (= (contains!10424 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!674000)))

(declare-fun b!1570424 () Bool)

(declare-fun e!875599 () Bool)

(assert (=> b!1570424 (= e!875600 e!875599)))

(declare-fun res!1072534 () Bool)

(assert (=> b!1570424 (=> res!1072534 e!875599)))

(assert (=> b!1570424 (= res!1072534 (= (h!38170 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570425 () Bool)

(assert (=> b!1570425 (= e!875599 (contains!10424 (t!51609 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164399 res!1072535) b!1570424))

(assert (= (and b!1570424 (not res!1072534)) b!1570425))

(assert (=> d!164399 m!1444963))

(declare-fun m!1444993 () Bool)

(assert (=> d!164399 m!1444993))

(declare-fun m!1444995 () Bool)

(assert (=> b!1570425 m!1444995))

(assert (=> b!1570323 d!164399))

(declare-fun d!164401 () Bool)

(assert (=> d!164401 (= (validKeyInArray!0 (select (arr!50599 a!3481) from!2856)) (and (not (= (select (arr!50599 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50599 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1570322 d!164401))

(check-sat (not d!164377) (not d!164383) (not d!164395) (not b!1570421) (not b!1570410) (not b!1570423) (not b!1570411) (not b!1570413) (not b!1570425) (not b!1570422) (not d!164399) (not b!1570401) (not b!1570415) (not d!164385))
(check-sat)
