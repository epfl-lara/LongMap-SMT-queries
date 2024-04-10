; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103012 () Bool)

(assert start!103012)

(declare-fun b!1237539 () Bool)

(declare-fun res!825408 () Bool)

(declare-fun e!701337 () Bool)

(assert (=> b!1237539 (=> (not res!825408) (not e!701337))))

(declare-datatypes ((List!27273 0))(
  ( (Nil!27270) (Cons!27269 (h!28478 (_ BitVec 64)) (t!40736 List!27273)) )
))
(declare-fun acc!846 () List!27273)

(declare-fun contains!7335 (List!27273 (_ BitVec 64)) Bool)

(assert (=> b!1237539 (= res!825408 (not (contains!7335 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237540 () Bool)

(declare-fun e!701335 () Bool)

(declare-fun lt!561085 () List!27273)

(declare-fun noDuplicate!1932 (List!27273) Bool)

(assert (=> b!1237540 (= e!701335 (noDuplicate!1932 lt!561085))))

(declare-fun b!1237541 () Bool)

(assert (=> b!1237541 (= e!701337 (not e!701335))))

(declare-fun res!825410 () Bool)

(assert (=> b!1237541 (=> res!825410 e!701335)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237541 (= res!825410 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!589 (List!27273 List!27273) Bool)

(assert (=> b!1237541 (subseq!589 acc!846 lt!561085)))

(declare-datatypes ((Unit!41076 0))(
  ( (Unit!41077) )
))
(declare-fun lt!561084 () Unit!41076)

(declare-fun subseqTail!76 (List!27273 List!27273) Unit!41076)

(assert (=> b!1237541 (= lt!561084 (subseqTail!76 lt!561085 lt!561085))))

(assert (=> b!1237541 (subseq!589 lt!561085 lt!561085)))

(declare-fun lt!561086 () Unit!41076)

(declare-fun lemmaListSubSeqRefl!0 (List!27273) Unit!41076)

(assert (=> b!1237541 (= lt!561086 (lemmaListSubSeqRefl!0 lt!561085))))

(declare-datatypes ((array!79788 0))(
  ( (array!79789 (arr!38500 (Array (_ BitVec 32) (_ BitVec 64))) (size!39036 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79788)

(assert (=> b!1237541 (= lt!561085 (Cons!27269 (select (arr!38500 a!3835) from!3213) acc!846))))

(declare-fun res!825413 () Bool)

(assert (=> start!103012 (=> (not res!825413) (not e!701337))))

(assert (=> start!103012 (= res!825413 (and (bvslt (size!39036 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39036 a!3835))))))

(assert (=> start!103012 e!701337))

(declare-fun array_inv!29348 (array!79788) Bool)

(assert (=> start!103012 (array_inv!29348 a!3835)))

(assert (=> start!103012 true))

(declare-fun b!1237542 () Bool)

(declare-fun res!825407 () Bool)

(assert (=> b!1237542 (=> (not res!825407) (not e!701337))))

(assert (=> b!1237542 (= res!825407 (not (contains!7335 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237543 () Bool)

(declare-fun res!825415 () Bool)

(assert (=> b!1237543 (=> (not res!825415) (not e!701337))))

(assert (=> b!1237543 (= res!825415 (noDuplicate!1932 acc!846))))

(declare-fun b!1237544 () Bool)

(declare-fun res!825412 () Bool)

(assert (=> b!1237544 (=> (not res!825412) (not e!701337))))

(assert (=> b!1237544 (= res!825412 (not (= from!3213 (bvsub (size!39036 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237545 () Bool)

(declare-fun res!825411 () Bool)

(assert (=> b!1237545 (=> (not res!825411) (not e!701337))))

(declare-fun arrayNoDuplicates!0 (array!79788 (_ BitVec 32) List!27273) Bool)

(assert (=> b!1237545 (= res!825411 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237546 () Bool)

(declare-fun res!825409 () Bool)

(assert (=> b!1237546 (=> (not res!825409) (not e!701337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237546 (= res!825409 (validKeyInArray!0 (select (arr!38500 a!3835) from!3213)))))

(declare-fun b!1237547 () Bool)

(declare-fun res!825414 () Bool)

(assert (=> b!1237547 (=> (not res!825414) (not e!701337))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237547 (= res!825414 (contains!7335 acc!846 k!2925))))

(assert (= (and start!103012 res!825413) b!1237543))

(assert (= (and b!1237543 res!825415) b!1237542))

(assert (= (and b!1237542 res!825407) b!1237539))

(assert (= (and b!1237539 res!825408) b!1237545))

(assert (= (and b!1237545 res!825411) b!1237547))

(assert (= (and b!1237547 res!825414) b!1237544))

(assert (= (and b!1237544 res!825412) b!1237546))

(assert (= (and b!1237546 res!825409) b!1237541))

(assert (= (and b!1237541 (not res!825410)) b!1237540))

(declare-fun m!1141253 () Bool)

(assert (=> b!1237540 m!1141253))

(declare-fun m!1141255 () Bool)

(assert (=> start!103012 m!1141255))

(declare-fun m!1141257 () Bool)

(assert (=> b!1237542 m!1141257))

(declare-fun m!1141259 () Bool)

(assert (=> b!1237539 m!1141259))

(declare-fun m!1141261 () Bool)

(assert (=> b!1237543 m!1141261))

(declare-fun m!1141263 () Bool)

(assert (=> b!1237545 m!1141263))

(declare-fun m!1141265 () Bool)

(assert (=> b!1237547 m!1141265))

(declare-fun m!1141267 () Bool)

(assert (=> b!1237546 m!1141267))

(assert (=> b!1237546 m!1141267))

(declare-fun m!1141269 () Bool)

(assert (=> b!1237546 m!1141269))

(declare-fun m!1141271 () Bool)

(assert (=> b!1237541 m!1141271))

(declare-fun m!1141273 () Bool)

(assert (=> b!1237541 m!1141273))

(declare-fun m!1141275 () Bool)

(assert (=> b!1237541 m!1141275))

(declare-fun m!1141277 () Bool)

(assert (=> b!1237541 m!1141277))

(assert (=> b!1237541 m!1141267))

(push 1)

(assert (not b!1237542))

(assert (not b!1237545))

(assert (not start!103012))

(assert (not b!1237541))

(assert (not b!1237543))

(assert (not b!1237540))

(assert (not b!1237539))

(assert (not b!1237546))

(assert (not b!1237547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135697 () Bool)

(assert (=> d!135697 (= (array_inv!29348 a!3835) (bvsge (size!39036 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103012 d!135697))

(declare-fun d!135701 () Bool)

(declare-fun lt!561093 () Bool)

(declare-fun content!584 (List!27273) (Set (_ BitVec 64)))

(assert (=> d!135701 (= lt!561093 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!584 acc!846)))))

(declare-fun e!701371 () Bool)

(assert (=> d!135701 (= lt!561093 e!701371)))

(declare-fun res!825449 () Bool)

(assert (=> d!135701 (=> (not res!825449) (not e!701371))))

(assert (=> d!135701 (= res!825449 (is-Cons!27269 acc!846))))

(assert (=> d!135701 (= (contains!7335 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561093)))

(declare-fun b!1237580 () Bool)

(declare-fun e!701370 () Bool)

(assert (=> b!1237580 (= e!701371 e!701370)))

(declare-fun res!825448 () Bool)

(assert (=> b!1237580 (=> res!825448 e!701370)))

(assert (=> b!1237580 (= res!825448 (= (h!28478 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237581 () Bool)

(assert (=> b!1237581 (= e!701370 (contains!7335 (t!40736 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135701 res!825449) b!1237580))

(assert (= (and b!1237580 (not res!825448)) b!1237581))

(declare-fun m!1141301 () Bool)

(assert (=> d!135701 m!1141301))

(declare-fun m!1141303 () Bool)

(assert (=> d!135701 m!1141303))

(declare-fun m!1141305 () Bool)

(assert (=> b!1237581 m!1141305))

(assert (=> b!1237539 d!135701))

(declare-fun b!1237633 () Bool)

(declare-fun e!701410 () Bool)

(declare-fun call!61026 () Bool)

(assert (=> b!1237633 (= e!701410 call!61026)))

(declare-fun c!120939 () Bool)

(declare-fun bm!61023 () Bool)

(assert (=> bm!61023 (= call!61026 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120939 (Cons!27269 (select (arr!38500 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1237634 () Bool)

(declare-fun e!701411 () Bool)

(assert (=> b!1237634 (= e!701411 (contains!7335 acc!846 (select (arr!38500 a!3835) from!3213)))))

(declare-fun b!1237635 () Bool)

(declare-fun e!701413 () Bool)

(assert (=> b!1237635 (= e!701413 e!701410)))

(assert (=> b!1237635 (= c!120939 (validKeyInArray!0 (select (arr!38500 a!3835) from!3213)))))

(declare-fun d!135709 () Bool)

(declare-fun res!825476 () Bool)

(declare-fun e!701412 () Bool)

(assert (=> d!135709 (=> res!825476 e!701412)))

(assert (=> d!135709 (= res!825476 (bvsge from!3213 (size!39036 a!3835)))))

(assert (=> d!135709 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701412)))

(declare-fun b!1237636 () Bool)

(assert (=> b!1237636 (= e!701412 e!701413)))

(declare-fun res!825477 () Bool)

(assert (=> b!1237636 (=> (not res!825477) (not e!701413))))

(assert (=> b!1237636 (= res!825477 (not e!701411))))

(declare-fun res!825475 () Bool)

(assert (=> b!1237636 (=> (not res!825475) (not e!701411))))

(assert (=> b!1237636 (= res!825475 (validKeyInArray!0 (select (arr!38500 a!3835) from!3213)))))

(declare-fun b!1237637 () Bool)

(assert (=> b!1237637 (= e!701410 call!61026)))

(assert (= (and d!135709 (not res!825476)) b!1237636))

(assert (= (and b!1237636 res!825475) b!1237634))

(assert (= (and b!1237636 res!825477) b!1237635))

(assert (= (and b!1237635 c!120939) b!1237633))

(assert (= (and b!1237635 (not c!120939)) b!1237637))

(assert (= (or b!1237633 b!1237637) bm!61023))

(assert (=> bm!61023 m!1141267))

(declare-fun m!1141325 () Bool)

(assert (=> bm!61023 m!1141325))

(assert (=> b!1237634 m!1141267))

(assert (=> b!1237634 m!1141267))

(declare-fun m!1141327 () Bool)

(assert (=> b!1237634 m!1141327))

(assert (=> b!1237635 m!1141267))

(assert (=> b!1237635 m!1141267))

(assert (=> b!1237635 m!1141269))

(assert (=> b!1237636 m!1141267))

(assert (=> b!1237636 m!1141267))

(assert (=> b!1237636 m!1141269))

(assert (=> b!1237545 d!135709))

(declare-fun d!135717 () Bool)

(declare-fun res!825485 () Bool)

(declare-fun e!701422 () Bool)

(assert (=> d!135717 (=> res!825485 e!701422)))

(assert (=> d!135717 (= res!825485 (is-Nil!27270 lt!561085))))

(assert (=> d!135717 (= (noDuplicate!1932 lt!561085) e!701422)))

(declare-fun b!1237647 () Bool)

(declare-fun e!701423 () Bool)

(assert (=> b!1237647 (= e!701422 e!701423)))

(declare-fun res!825486 () Bool)

(assert (=> b!1237647 (=> (not res!825486) (not e!701423))))

(assert (=> b!1237647 (= res!825486 (not (contains!7335 (t!40736 lt!561085) (h!28478 lt!561085))))))

(declare-fun b!1237648 () Bool)

(assert (=> b!1237648 (= e!701423 (noDuplicate!1932 (t!40736 lt!561085)))))

(assert (= (and d!135717 (not res!825485)) b!1237647))

(assert (= (and b!1237647 res!825486) b!1237648))

(declare-fun m!1141335 () Bool)

(assert (=> b!1237647 m!1141335))

(declare-fun m!1141337 () Bool)

(assert (=> b!1237648 m!1141337))

(assert (=> b!1237540 d!135717))

(declare-fun b!1237669 () Bool)

(declare-fun e!701443 () Bool)

(assert (=> b!1237669 (= e!701443 (subseq!589 (t!40736 acc!846) (t!40736 lt!561085)))))

(declare-fun b!1237667 () Bool)

(declare-fun e!701445 () Bool)

(declare-fun e!701444 () Bool)

(assert (=> b!1237667 (= e!701445 e!701444)))

(declare-fun res!825507 () Bool)

(assert (=> b!1237667 (=> (not res!825507) (not e!701444))))

(assert (=> b!1237667 (= res!825507 (is-Cons!27269 lt!561085))))

(declare-fun d!135723 () Bool)

(declare-fun res!825508 () Bool)

(assert (=> d!135723 (=> res!825508 e!701445)))

(assert (=> d!135723 (= res!825508 (is-Nil!27270 acc!846))))

(assert (=> d!135723 (= (subseq!589 acc!846 lt!561085) e!701445)))

(declare-fun b!1237670 () Bool)

(declare-fun e!701442 () Bool)

(assert (=> b!1237670 (= e!701442 (subseq!589 acc!846 (t!40736 lt!561085)))))

(declare-fun b!1237668 () Bool)

(assert (=> b!1237668 (= e!701444 e!701442)))

(declare-fun res!825505 () Bool)

(assert (=> b!1237668 (=> res!825505 e!701442)))

(assert (=> b!1237668 (= res!825505 e!701443)))

(declare-fun res!825506 () Bool)

(assert (=> b!1237668 (=> (not res!825506) (not e!701443))))

(assert (=> b!1237668 (= res!825506 (= (h!28478 acc!846) (h!28478 lt!561085)))))

(assert (= (and d!135723 (not res!825508)) b!1237667))

(assert (= (and b!1237667 res!825507) b!1237668))

(assert (= (and b!1237668 res!825506) b!1237669))

(assert (= (and b!1237668 (not res!825505)) b!1237670))

(declare-fun m!1141353 () Bool)

(assert (=> b!1237669 m!1141353))

(declare-fun m!1141355 () Bool)

(assert (=> b!1237670 m!1141355))

(assert (=> b!1237541 d!135723))

(declare-fun b!1237730 () Bool)

(declare-fun e!701492 () Unit!41076)

(declare-fun e!701493 () Unit!41076)

(assert (=> b!1237730 (= e!701492 e!701493)))

(declare-fun c!120958 () Bool)

(assert (=> b!1237730 (= c!120958 (subseq!589 lt!561085 (t!40736 lt!561085)))))

(declare-fun b!1237731 () Bool)

(declare-fun c!120957 () Bool)

(declare-fun isEmpty!1010 (List!27273) Bool)

(assert (=> b!1237731 (= c!120957 (not (isEmpty!1010 (t!40736 lt!561085))))))

(declare-fun e!701491 () Unit!41076)

(assert (=> b!1237731 (= e!701493 e!701491)))

(declare-fun d!135735 () Bool)

(declare-fun tail!162 (List!27273) List!27273)

(assert (=> d!135735 (subseq!589 (tail!162 lt!561085) lt!561085)))

(declare-fun lt!561110 () Unit!41076)

(assert (=> d!135735 (= lt!561110 e!701492)))

(declare-fun c!120956 () Bool)

(assert (=> d!135735 (= c!120956 (and (is-Cons!27269 lt!561085) (is-Cons!27269 lt!561085)))))

(declare-fun e!701490 () Bool)

(assert (=> d!135735 e!701490))

(declare-fun res!825538 () Bool)

(assert (=> d!135735 (=> (not res!825538) (not e!701490))))

(assert (=> d!135735 (= res!825538 (not (isEmpty!1010 lt!561085)))))

(assert (=> d!135735 (= (subseqTail!76 lt!561085 lt!561085) lt!561110)))

(declare-fun b!1237732 () Bool)

(declare-fun call!61035 () Unit!41076)

(assert (=> b!1237732 (= e!701493 call!61035)))

(declare-fun b!1237733 () Bool)

(assert (=> b!1237733 (= e!701491 call!61035)))

(declare-fun b!1237734 () Bool)

(declare-fun Unit!41080 () Unit!41076)

(assert (=> b!1237734 (= e!701492 Unit!41080)))

(declare-fun b!1237735 () Bool)

(declare-fun Unit!41081 () Unit!41076)

(assert (=> b!1237735 (= e!701491 Unit!41081)))

(declare-fun bm!61032 () Bool)

(assert (=> bm!61032 (= call!61035 (subseqTail!76 (ite c!120958 lt!561085 (t!40736 lt!561085)) (t!40736 lt!561085)))))

(declare-fun b!1237736 () Bool)

(assert (=> b!1237736 (= e!701490 (subseq!589 lt!561085 lt!561085))))

(assert (= (and d!135735 res!825538) b!1237736))

(assert (= (and d!135735 c!120956) b!1237730))

(assert (= (and d!135735 (not c!120956)) b!1237734))

(assert (= (and b!1237730 c!120958) b!1237732))

(assert (= (and b!1237730 (not c!120958)) b!1237731))

(assert (= (and b!1237731 c!120957) b!1237733))

(assert (= (and b!1237731 (not c!120957)) b!1237735))

(assert (= (or b!1237732 b!1237733) bm!61032))

(declare-fun m!1141373 () Bool)

(assert (=> d!135735 m!1141373))

(assert (=> d!135735 m!1141373))

(declare-fun m!1141375 () Bool)

(assert (=> d!135735 m!1141375))

(declare-fun m!1141377 () Bool)

(assert (=> d!135735 m!1141377))

(assert (=> b!1237736 m!1141273))

(declare-fun m!1141379 () Bool)

(assert (=> b!1237731 m!1141379))

(declare-fun m!1141381 () Bool)

(assert (=> b!1237730 m!1141381))

(declare-fun m!1141383 () Bool)

(assert (=> bm!61032 m!1141383))

(assert (=> b!1237541 d!135735))

(declare-fun b!1237739 () Bool)

(declare-fun e!701495 () Bool)

(assert (=> b!1237739 (= e!701495 (subseq!589 (t!40736 lt!561085) (t!40736 lt!561085)))))

(declare-fun b!1237737 () Bool)

