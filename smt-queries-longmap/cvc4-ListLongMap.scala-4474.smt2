; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62232 () Bool)

(assert start!62232)

(declare-fun b!697554 () Bool)

(declare-fun res!461487 () Bool)

(declare-fun e!396491 () Bool)

(assert (=> b!697554 (=> (not res!461487) (not e!396491))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39989 0))(
  ( (array!39990 (arr!19154 (Array (_ BitVec 32) (_ BitVec 64))) (size!19539 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39989)

(assert (=> b!697554 (= res!461487 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19539 a!3626))))))

(declare-fun b!697555 () Bool)

(declare-fun res!461473 () Bool)

(assert (=> b!697555 (=> (not res!461473) (not e!396491))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697555 (= res!461473 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697556 () Bool)

(declare-fun res!461490 () Bool)

(assert (=> b!697556 (=> (not res!461490) (not e!396491))))

(declare-datatypes ((List!13195 0))(
  ( (Nil!13192) (Cons!13191 (h!14236 (_ BitVec 64)) (t!19477 List!13195)) )
))
(declare-fun acc!681 () List!13195)

(declare-fun contains!3772 (List!13195 (_ BitVec 64)) Bool)

(assert (=> b!697556 (= res!461490 (not (contains!3772 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697557 () Bool)

(declare-fun res!461489 () Bool)

(assert (=> b!697557 (=> (not res!461489) (not e!396491))))

(declare-fun noDuplicate!1019 (List!13195) Bool)

(assert (=> b!697557 (= res!461489 (noDuplicate!1019 acc!681))))

(declare-fun lt!317164 () array!39989)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun b!697558 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39989 (_ BitVec 32) List!13195) Bool)

(assert (=> b!697558 (= e!396491 (not (arrayNoDuplicates!0 lt!317164 from!3004 acc!681)))))

(assert (=> b!697558 (arrayNoDuplicates!0 lt!317164 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (=> b!697558 (= lt!317164 (array!39990 (store (arr!19154 a!3626) i!1382 k!2843) (size!19539 a!3626)))))

(declare-datatypes ((Unit!24580 0))(
  ( (Unit!24581) )
))
(declare-fun lt!317163 () Unit!24580)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39989 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13195) Unit!24580)

(assert (=> b!697558 (= lt!317163 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697559 () Bool)

(declare-fun e!396495 () Bool)

(assert (=> b!697559 (= e!396495 (not (contains!3772 acc!681 k!2843)))))

(declare-fun b!697560 () Bool)

(declare-fun e!396490 () Bool)

(assert (=> b!697560 (= e!396490 (contains!3772 acc!681 k!2843))))

(declare-fun b!697561 () Bool)

(declare-fun res!461482 () Bool)

(assert (=> b!697561 (=> (not res!461482) (not e!396491))))

(assert (=> b!697561 (= res!461482 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19539 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697562 () Bool)

(declare-fun e!396492 () Bool)

(assert (=> b!697562 (= e!396492 (contains!3772 acc!681 k!2843))))

(declare-fun res!461478 () Bool)

(assert (=> start!62232 (=> (not res!461478) (not e!396491))))

(assert (=> start!62232 (= res!461478 (and (bvslt (size!19539 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19539 a!3626))))))

(assert (=> start!62232 e!396491))

(assert (=> start!62232 true))

(declare-fun array_inv!14950 (array!39989) Bool)

(assert (=> start!62232 (array_inv!14950 a!3626)))

(declare-fun b!697563 () Bool)

(declare-fun res!461484 () Bool)

(assert (=> b!697563 (=> (not res!461484) (not e!396491))))

(declare-fun e!396494 () Bool)

(assert (=> b!697563 (= res!461484 e!396494)))

(declare-fun res!461485 () Bool)

(assert (=> b!697563 (=> res!461485 e!396494)))

(assert (=> b!697563 (= res!461485 e!396492)))

(declare-fun res!461474 () Bool)

(assert (=> b!697563 (=> (not res!461474) (not e!396492))))

(assert (=> b!697563 (= res!461474 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697564 () Bool)

(declare-fun res!461476 () Bool)

(assert (=> b!697564 (=> (not res!461476) (not e!396491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697564 (= res!461476 (not (validKeyInArray!0 (select (arr!19154 a!3626) from!3004))))))

(declare-fun b!697565 () Bool)

(declare-fun res!461486 () Bool)

(assert (=> b!697565 (=> (not res!461486) (not e!396491))))

(assert (=> b!697565 (= res!461486 (not (contains!3772 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697566 () Bool)

(assert (=> b!697566 (= e!396494 e!396495)))

(declare-fun res!461479 () Bool)

(assert (=> b!697566 (=> (not res!461479) (not e!396495))))

(assert (=> b!697566 (= res!461479 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697567 () Bool)

(declare-fun res!461481 () Bool)

(assert (=> b!697567 (=> (not res!461481) (not e!396491))))

(assert (=> b!697567 (= res!461481 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13192))))

(declare-fun b!697568 () Bool)

(declare-fun res!461488 () Bool)

(assert (=> b!697568 (=> (not res!461488) (not e!396491))))

(assert (=> b!697568 (= res!461488 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697569 () Bool)

(declare-fun res!461472 () Bool)

(assert (=> b!697569 (=> (not res!461472) (not e!396491))))

(assert (=> b!697569 (= res!461472 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697570 () Bool)

(declare-fun res!461475 () Bool)

(assert (=> b!697570 (=> (not res!461475) (not e!396491))))

(declare-fun e!396488 () Bool)

(assert (=> b!697570 (= res!461475 e!396488)))

(declare-fun res!461480 () Bool)

(assert (=> b!697570 (=> res!461480 e!396488)))

(assert (=> b!697570 (= res!461480 e!396490)))

(declare-fun res!461477 () Bool)

(assert (=> b!697570 (=> (not res!461477) (not e!396490))))

(assert (=> b!697570 (= res!461477 (bvsgt from!3004 i!1382))))

(declare-fun b!697571 () Bool)

(declare-fun res!461483 () Bool)

(assert (=> b!697571 (=> (not res!461483) (not e!396491))))

(assert (=> b!697571 (= res!461483 (validKeyInArray!0 k!2843))))

(declare-fun b!697572 () Bool)

(declare-fun e!396493 () Bool)

(assert (=> b!697572 (= e!396493 (not (contains!3772 acc!681 k!2843)))))

(declare-fun b!697573 () Bool)

(declare-fun res!461492 () Bool)

(assert (=> b!697573 (=> (not res!461492) (not e!396491))))

(assert (=> b!697573 (= res!461492 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697574 () Bool)

(assert (=> b!697574 (= e!396488 e!396493)))

(declare-fun res!461491 () Bool)

(assert (=> b!697574 (=> (not res!461491) (not e!396493))))

(assert (=> b!697574 (= res!461491 (bvsle from!3004 i!1382))))

(assert (= (and start!62232 res!461478) b!697557))

(assert (= (and b!697557 res!461489) b!697565))

(assert (= (and b!697565 res!461486) b!697556))

(assert (= (and b!697556 res!461490) b!697570))

(assert (= (and b!697570 res!461477) b!697560))

(assert (= (and b!697570 (not res!461480)) b!697574))

(assert (= (and b!697574 res!461491) b!697572))

(assert (= (and b!697570 res!461475) b!697567))

(assert (= (and b!697567 res!461481) b!697573))

(assert (= (and b!697573 res!461492) b!697554))

(assert (= (and b!697554 res!461487) b!697571))

(assert (= (and b!697571 res!461483) b!697555))

(assert (= (and b!697555 res!461473) b!697561))

(assert (= (and b!697561 res!461482) b!697564))

(assert (= (and b!697564 res!461476) b!697568))

(assert (= (and b!697568 res!461488) b!697563))

(assert (= (and b!697563 res!461474) b!697562))

(assert (= (and b!697563 (not res!461485)) b!697566))

(assert (= (and b!697566 res!461479) b!697559))

(assert (= (and b!697563 res!461484) b!697569))

(assert (= (and b!697569 res!461472) b!697558))

(declare-fun m!657909 () Bool)

(assert (=> b!697559 m!657909))

(assert (=> b!697562 m!657909))

(declare-fun m!657911 () Bool)

(assert (=> b!697557 m!657911))

(declare-fun m!657913 () Bool)

(assert (=> start!62232 m!657913))

(declare-fun m!657915 () Bool)

(assert (=> b!697558 m!657915))

(declare-fun m!657917 () Bool)

(assert (=> b!697558 m!657917))

(declare-fun m!657919 () Bool)

(assert (=> b!697558 m!657919))

(declare-fun m!657921 () Bool)

(assert (=> b!697558 m!657921))

(declare-fun m!657923 () Bool)

(assert (=> b!697571 m!657923))

(declare-fun m!657925 () Bool)

(assert (=> b!697565 m!657925))

(assert (=> b!697572 m!657909))

(declare-fun m!657927 () Bool)

(assert (=> b!697567 m!657927))

(declare-fun m!657929 () Bool)

(assert (=> b!697555 m!657929))

(declare-fun m!657931 () Bool)

(assert (=> b!697573 m!657931))

(assert (=> b!697560 m!657909))

(declare-fun m!657933 () Bool)

(assert (=> b!697564 m!657933))

(assert (=> b!697564 m!657933))

(declare-fun m!657935 () Bool)

(assert (=> b!697564 m!657935))

(declare-fun m!657937 () Bool)

(assert (=> b!697569 m!657937))

(declare-fun m!657939 () Bool)

(assert (=> b!697556 m!657939))

(push 1)

(assert (not start!62232))

(assert (not b!697573))

(assert (not b!697569))

(assert (not b!697559))

(assert (not b!697556))

(assert (not b!697572))

(assert (not b!697557))

(assert (not b!697558))

(assert (not b!697555))

(assert (not b!697564))

(assert (not b!697571))

(assert (not b!697562))

(assert (not b!697565))

(assert (not b!697560))

(assert (not b!697567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96173 () Bool)

(declare-fun lt!317175 () Bool)

(declare-fun content!328 (List!13195) (Set (_ BitVec 64)))

(assert (=> d!96173 (= lt!317175 (member k!2843 (content!328 acc!681)))))

(declare-fun e!396547 () Bool)

(assert (=> d!96173 (= lt!317175 e!396547)))

(declare-fun res!461538 () Bool)

(assert (=> d!96173 (=> (not res!461538) (not e!396547))))

(assert (=> d!96173 (= res!461538 (is-Cons!13191 acc!681))))

(assert (=> d!96173 (= (contains!3772 acc!681 k!2843) lt!317175)))

(declare-fun b!697633 () Bool)

(declare-fun e!396548 () Bool)

(assert (=> b!697633 (= e!396547 e!396548)))

(declare-fun res!461537 () Bool)

(assert (=> b!697633 (=> res!461537 e!396548)))

(assert (=> b!697633 (= res!461537 (= (h!14236 acc!681) k!2843))))

(declare-fun b!697634 () Bool)

(assert (=> b!697634 (= e!396548 (contains!3772 (t!19477 acc!681) k!2843))))

(assert (= (and d!96173 res!461538) b!697633))

(assert (= (and b!697633 (not res!461537)) b!697634))

(declare-fun m!657997 () Bool)

(assert (=> d!96173 m!657997))

(declare-fun m!657999 () Bool)

(assert (=> d!96173 m!657999))

(declare-fun m!658001 () Bool)

(assert (=> b!697634 m!658001))

(assert (=> b!697562 d!96173))

(declare-fun d!96183 () Bool)

(declare-fun res!461553 () Bool)

(declare-fun e!396566 () Bool)

(assert (=> d!96183 (=> res!461553 e!396566)))

(assert (=> d!96183 (= res!461553 (bvsge from!3004 (size!19539 a!3626)))))

(assert (=> d!96183 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396566)))

(declare-fun b!697651 () Bool)

(declare-fun e!396564 () Bool)

(assert (=> b!697651 (= e!396564 (contains!3772 acc!681 (select (arr!19154 a!3626) from!3004)))))

(declare-fun b!697652 () Bool)

(declare-fun e!396565 () Bool)

(declare-fun call!34323 () Bool)

(assert (=> b!697652 (= e!396565 call!34323)))

(declare-fun b!697653 () Bool)

(assert (=> b!697653 (= e!396565 call!34323)))

(declare-fun b!697654 () Bool)

(declare-fun e!396563 () Bool)

(assert (=> b!697654 (= e!396566 e!396563)))

(declare-fun res!461552 () Bool)

(assert (=> b!697654 (=> (not res!461552) (not e!396563))))

(assert (=> b!697654 (= res!461552 (not e!396564))))

(declare-fun res!461551 () Bool)

(assert (=> b!697654 (=> (not res!461551) (not e!396564))))

(assert (=> b!697654 (= res!461551 (validKeyInArray!0 (select (arr!19154 a!3626) from!3004)))))

(declare-fun bm!34320 () Bool)

(declare-fun c!78417 () Bool)

(assert (=> bm!34320 (= call!34323 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78417 (Cons!13191 (select (arr!19154 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!697655 () Bool)

(assert (=> b!697655 (= e!396563 e!396565)))

(assert (=> b!697655 (= c!78417 (validKeyInArray!0 (select (arr!19154 a!3626) from!3004)))))

(assert (= (and d!96183 (not res!461553)) b!697654))

(assert (= (and b!697654 res!461551) b!697651))

(assert (= (and b!697654 res!461552) b!697655))

(assert (= (and b!697655 c!78417) b!697652))

(assert (= (and b!697655 (not c!78417)) b!697653))

(assert (= (or b!697652 b!697653) bm!34320))

(assert (=> b!697651 m!657933))

(assert (=> b!697651 m!657933))

(declare-fun m!658007 () Bool)

(assert (=> b!697651 m!658007))

(assert (=> b!697654 m!657933))

(assert (=> b!697654 m!657933))

(assert (=> b!697654 m!657935))

(assert (=> bm!34320 m!657933))

(declare-fun m!658009 () Bool)

(assert (=> bm!34320 m!658009))

(assert (=> b!697655 m!657933))

(assert (=> b!697655 m!657933))

(assert (=> b!697655 m!657935))

(assert (=> b!697573 d!96183))

(assert (=> b!697572 d!96173))

(assert (=> b!697560 d!96173))

(declare-fun d!96187 () Bool)

(assert (=> d!96187 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697571 d!96187))

(declare-fun d!96189 () Bool)

(declare-fun res!461556 () Bool)

(declare-fun e!396570 () Bool)

(assert (=> d!96189 (=> res!461556 e!396570)))

(assert (=> d!96189 (= res!461556 (bvsge from!3004 (size!19539 lt!317164)))))

(assert (=> d!96189 (= (arrayNoDuplicates!0 lt!317164 from!3004 acc!681) e!396570)))

(declare-fun b!697656 () Bool)

(declare-fun e!396568 () Bool)

(assert (=> b!697656 (= e!396568 (contains!3772 acc!681 (select (arr!19154 lt!317164) from!3004)))))

(declare-fun b!697657 () Bool)

(declare-fun e!396569 () Bool)

(declare-fun call!34324 () Bool)

(assert (=> b!697657 (= e!396569 call!34324)))

(declare-fun b!697658 () Bool)

(assert (=> b!697658 (= e!396569 call!34324)))

(declare-fun b!697659 () Bool)

(declare-fun e!396567 () Bool)

(assert (=> b!697659 (= e!396570 e!396567)))

(declare-fun res!461555 () Bool)

(assert (=> b!697659 (=> (not res!461555) (not e!396567))))

(assert (=> b!697659 (= res!461555 (not e!396568))))

(declare-fun res!461554 () Bool)

(assert (=> b!697659 (=> (not res!461554) (not e!396568))))

(assert (=> b!697659 (= res!461554 (validKeyInArray!0 (select (arr!19154 lt!317164) from!3004)))))

(declare-fun bm!34321 () Bool)

(declare-fun c!78418 () Bool)

(assert (=> bm!34321 (= call!34324 (arrayNoDuplicates!0 lt!317164 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78418 (Cons!13191 (select (arr!19154 lt!317164) from!3004) acc!681) acc!681)))))

(declare-fun b!697660 () Bool)

(assert (=> b!697660 (= e!396567 e!396569)))

