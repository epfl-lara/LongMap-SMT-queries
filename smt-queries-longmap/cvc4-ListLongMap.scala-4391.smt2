; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60378 () Bool)

(assert start!60378)

(declare-fun b!678613 () Bool)

(declare-fun res!445027 () Bool)

(declare-fun e!386679 () Bool)

(assert (=> b!678613 (=> (not res!445027) (not e!386679))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39425 0))(
  ( (array!39426 (arr!18905 (Array (_ BitVec 32) (_ BitVec 64))) (size!19269 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39425)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!678613 (= res!445027 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19269 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678614 () Bool)

(declare-fun e!386678 () Bool)

(declare-datatypes ((List!12946 0))(
  ( (Nil!12943) (Cons!12942 (h!13987 (_ BitVec 64)) (t!19174 List!12946)) )
))
(declare-fun acc!681 () List!12946)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3523 (List!12946 (_ BitVec 64)) Bool)

(assert (=> b!678614 (= e!386678 (contains!3523 acc!681 k!2843))))

(declare-fun b!678615 () Bool)

(declare-fun res!445025 () Bool)

(assert (=> b!678615 (=> (not res!445025) (not e!386679))))

(assert (=> b!678615 (= res!445025 (not (contains!3523 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678616 () Bool)

(declare-fun e!386676 () Bool)

(assert (=> b!678616 (= e!386676 (not (contains!3523 acc!681 k!2843)))))

(declare-fun res!445030 () Bool)

(assert (=> start!60378 (=> (not res!445030) (not e!386679))))

(assert (=> start!60378 (= res!445030 (and (bvslt (size!19269 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19269 a!3626))))))

(assert (=> start!60378 e!386679))

(assert (=> start!60378 true))

(declare-fun array_inv!14701 (array!39425) Bool)

(assert (=> start!60378 (array_inv!14701 a!3626)))

(declare-fun b!678617 () Bool)

(declare-fun res!445022 () Bool)

(assert (=> b!678617 (=> (not res!445022) (not e!386679))))

(declare-fun arrayNoDuplicates!0 (array!39425 (_ BitVec 32) List!12946) Bool)

(assert (=> b!678617 (= res!445022 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678618 () Bool)

(declare-fun res!445031 () Bool)

(assert (=> b!678618 (=> (not res!445031) (not e!386679))))

(declare-fun arrayContainsKey!0 (array!39425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678618 (= res!445031 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678619 () Bool)

(assert (=> b!678619 (= e!386679 (not (arrayContainsKey!0 (array!39426 (store (arr!18905 a!3626) i!1382 k!2843) (size!19269 a!3626)) k!2843 from!3004)))))

(declare-fun b!678620 () Bool)

(declare-fun res!445034 () Bool)

(assert (=> b!678620 (=> (not res!445034) (not e!386679))))

(declare-fun noDuplicate!770 (List!12946) Bool)

(assert (=> b!678620 (= res!445034 (noDuplicate!770 acc!681))))

(declare-fun b!678621 () Bool)

(declare-fun res!445026 () Bool)

(assert (=> b!678621 (=> (not res!445026) (not e!386679))))

(assert (=> b!678621 (= res!445026 (not (contains!3523 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678622 () Bool)

(declare-fun e!386677 () Bool)

(assert (=> b!678622 (= e!386677 e!386676)))

(declare-fun res!445021 () Bool)

(assert (=> b!678622 (=> (not res!445021) (not e!386676))))

(assert (=> b!678622 (= res!445021 (bvsle from!3004 i!1382))))

(declare-fun b!678623 () Bool)

(declare-fun res!445032 () Bool)

(assert (=> b!678623 (=> (not res!445032) (not e!386679))))

(assert (=> b!678623 (= res!445032 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19269 a!3626))))))

(declare-fun b!678624 () Bool)

(declare-fun res!445029 () Bool)

(assert (=> b!678624 (=> (not res!445029) (not e!386679))))

(assert (=> b!678624 (= res!445029 e!386677)))

(declare-fun res!445023 () Bool)

(assert (=> b!678624 (=> res!445023 e!386677)))

(assert (=> b!678624 (= res!445023 e!386678)))

(declare-fun res!445024 () Bool)

(assert (=> b!678624 (=> (not res!445024) (not e!386678))))

(assert (=> b!678624 (= res!445024 (bvsgt from!3004 i!1382))))

(declare-fun b!678625 () Bool)

(declare-fun res!445033 () Bool)

(assert (=> b!678625 (=> (not res!445033) (not e!386679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678625 (= res!445033 (validKeyInArray!0 k!2843))))

(declare-fun b!678626 () Bool)

(declare-fun res!445028 () Bool)

(assert (=> b!678626 (=> (not res!445028) (not e!386679))))

(assert (=> b!678626 (= res!445028 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12943))))

(assert (= (and start!60378 res!445030) b!678620))

(assert (= (and b!678620 res!445034) b!678621))

(assert (= (and b!678621 res!445026) b!678615))

(assert (= (and b!678615 res!445025) b!678624))

(assert (= (and b!678624 res!445024) b!678614))

(assert (= (and b!678624 (not res!445023)) b!678622))

(assert (= (and b!678622 res!445021) b!678616))

(assert (= (and b!678624 res!445029) b!678626))

(assert (= (and b!678626 res!445028) b!678617))

(assert (= (and b!678617 res!445022) b!678623))

(assert (= (and b!678623 res!445032) b!678625))

(assert (= (and b!678625 res!445033) b!678618))

(assert (= (and b!678618 res!445031) b!678613))

(assert (= (and b!678613 res!445027) b!678619))

(declare-fun m!644305 () Bool)

(assert (=> start!60378 m!644305))

(declare-fun m!644307 () Bool)

(assert (=> b!678625 m!644307))

(declare-fun m!644309 () Bool)

(assert (=> b!678617 m!644309))

(declare-fun m!644311 () Bool)

(assert (=> b!678616 m!644311))

(declare-fun m!644313 () Bool)

(assert (=> b!678626 m!644313))

(declare-fun m!644315 () Bool)

(assert (=> b!678615 m!644315))

(declare-fun m!644317 () Bool)

(assert (=> b!678621 m!644317))

(declare-fun m!644319 () Bool)

(assert (=> b!678618 m!644319))

(declare-fun m!644321 () Bool)

(assert (=> b!678619 m!644321))

(declare-fun m!644323 () Bool)

(assert (=> b!678619 m!644323))

(assert (=> b!678614 m!644311))

(declare-fun m!644325 () Bool)

(assert (=> b!678620 m!644325))

(push 1)

(assert (not b!678618))

(assert (not b!678616))

(assert (not b!678619))

(assert (not b!678625))

(assert (not b!678620))

(assert (not b!678615))

(assert (not b!678621))

(assert (not b!678614))

(assert (not b!678617))

(assert (not start!60378))

(assert (not b!678626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93423 () Bool)

(declare-fun lt!312898 () Bool)

(declare-fun content!261 (List!12946) (Set (_ BitVec 64)))

(assert (=> d!93423 (= lt!312898 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!261 acc!681)))))

(declare-fun e!386701 () Bool)

(assert (=> d!93423 (= lt!312898 e!386701)))

(declare-fun res!445051 () Bool)

(assert (=> d!93423 (=> (not res!445051) (not e!386701))))

(assert (=> d!93423 (= res!445051 (is-Cons!12942 acc!681))))

(assert (=> d!93423 (= (contains!3523 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312898)))

(declare-fun b!678651 () Bool)

(declare-fun e!386700 () Bool)

(assert (=> b!678651 (= e!386701 e!386700)))

(declare-fun res!445052 () Bool)

(assert (=> b!678651 (=> res!445052 e!386700)))

(assert (=> b!678651 (= res!445052 (= (h!13987 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678652 () Bool)

(assert (=> b!678652 (= e!386700 (contains!3523 (t!19174 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93423 res!445051) b!678651))

(assert (= (and b!678651 (not res!445052)) b!678652))

(declare-fun m!644327 () Bool)

(assert (=> d!93423 m!644327))

(declare-fun m!644329 () Bool)

(assert (=> d!93423 m!644329))

(declare-fun m!644331 () Bool)

(assert (=> b!678652 m!644331))

(assert (=> b!678621 d!93423))

(declare-fun d!93425 () Bool)

(declare-fun lt!312899 () Bool)

(assert (=> d!93425 (= lt!312899 (member k!2843 (content!261 acc!681)))))

(declare-fun e!386703 () Bool)

(assert (=> d!93425 (= lt!312899 e!386703)))

(declare-fun res!445053 () Bool)

(assert (=> d!93425 (=> (not res!445053) (not e!386703))))

(assert (=> d!93425 (= res!445053 (is-Cons!12942 acc!681))))

(assert (=> d!93425 (= (contains!3523 acc!681 k!2843) lt!312899)))

(declare-fun b!678653 () Bool)

(declare-fun e!386702 () Bool)

(assert (=> b!678653 (= e!386703 e!386702)))

(declare-fun res!445054 () Bool)

(assert (=> b!678653 (=> res!445054 e!386702)))

(assert (=> b!678653 (= res!445054 (= (h!13987 acc!681) k!2843))))

(declare-fun b!678654 () Bool)

(assert (=> b!678654 (= e!386702 (contains!3523 (t!19174 acc!681) k!2843))))

(assert (= (and d!93425 res!445053) b!678653))

(assert (= (and b!678653 (not res!445054)) b!678654))

(assert (=> d!93425 m!644327))

(declare-fun m!644333 () Bool)

(assert (=> d!93425 m!644333))

(declare-fun m!644335 () Bool)

(assert (=> b!678654 m!644335))

(assert (=> b!678616 d!93425))

(declare-fun d!93427 () Bool)

(declare-fun lt!312900 () Bool)

(assert (=> d!93427 (= lt!312900 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!261 acc!681)))))

(declare-fun e!386705 () Bool)

(assert (=> d!93427 (= lt!312900 e!386705)))

(declare-fun res!445055 () Bool)

(assert (=> d!93427 (=> (not res!445055) (not e!386705))))

(assert (=> d!93427 (= res!445055 (is-Cons!12942 acc!681))))

(assert (=> d!93427 (= (contains!3523 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312900)))

(declare-fun b!678655 () Bool)

(declare-fun e!386704 () Bool)

(assert (=> b!678655 (= e!386705 e!386704)))

(declare-fun res!445056 () Bool)

(assert (=> b!678655 (=> res!445056 e!386704)))

(assert (=> b!678655 (= res!445056 (= (h!13987 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678656 () Bool)

(assert (=> b!678656 (= e!386704 (contains!3523 (t!19174 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93427 res!445055) b!678655))

(assert (= (and b!678655 (not res!445056)) b!678656))

(assert (=> d!93427 m!644327))

(declare-fun m!644337 () Bool)

(assert (=> d!93427 m!644337))

(declare-fun m!644339 () Bool)

(assert (=> b!678656 m!644339))

(assert (=> b!678615 d!93427))

(declare-fun b!678699 () Bool)

(declare-fun e!386742 () Bool)

(declare-fun call!33925 () Bool)

(assert (=> b!678699 (= e!386742 call!33925)))

(declare-fun b!678700 () Bool)

(declare-fun e!386744 () Bool)

(assert (=> b!678700 (= e!386744 (contains!3523 Nil!12943 (select (arr!18905 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678701 () Bool)

(assert (=> b!678701 (= e!386742 call!33925)))

(declare-fun b!678702 () Bool)

(declare-fun e!386745 () Bool)

(assert (=> b!678702 (= e!386745 e!386742)))

(declare-fun c!77173 () Bool)

(assert (=> b!678702 (= c!77173 (validKeyInArray!0 (select (arr!18905 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93429 () Bool)

(declare-fun res!445088 () Bool)

(declare-fun e!386743 () Bool)

(assert (=> d!93429 (=> res!445088 e!386743)))

(assert (=> d!93429 (= res!445088 (bvsge #b00000000000000000000000000000000 (size!19269 a!3626)))))

(assert (=> d!93429 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12943) e!386743)))

(declare-fun bm!33922 () Bool)

(assert (=> bm!33922 (= call!33925 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77173 (Cons!12942 (select (arr!18905 a!3626) #b00000000000000000000000000000000) Nil!12943) Nil!12943)))))

(declare-fun b!678703 () Bool)

(assert (=> b!678703 (= e!386743 e!386745)))

(declare-fun res!445087 () Bool)

(assert (=> b!678703 (=> (not res!445087) (not e!386745))))

(assert (=> b!678703 (= res!445087 (not e!386744))))

(declare-fun res!445089 () Bool)

(assert (=> b!678703 (=> (not res!445089) (not e!386744))))

(assert (=> b!678703 (= res!445089 (validKeyInArray!0 (select (arr!18905 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93429 (not res!445088)) b!678703))

(assert (= (and b!678703 res!445089) b!678700))

(assert (= (and b!678703 res!445087) b!678702))

(assert (= (and b!678702 c!77173) b!678699))

(assert (= (and b!678702 (not c!77173)) b!678701))

(assert (= (or b!678699 b!678701) bm!33922))

(declare-fun m!644385 () Bool)

(assert (=> b!678700 m!644385))

(assert (=> b!678700 m!644385))

(declare-fun m!644387 () Bool)

(assert (=> b!678700 m!644387))

(assert (=> b!678702 m!644385))

(assert (=> b!678702 m!644385))

(declare-fun m!644389 () Bool)

(assert (=> b!678702 m!644389))

(assert (=> bm!33922 m!644385))

(declare-fun m!644391 () Bool)

(assert (=> bm!33922 m!644391))

(assert (=> b!678703 m!644385))

(assert (=> b!678703 m!644385))

(assert (=> b!678703 m!644389))

(assert (=> b!678626 d!93429))

(declare-fun d!93445 () Bool)

(assert (=> d!93445 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!678625 d!93445))

(declare-fun d!93447 () Bool)

(declare-fun res!445112 () Bool)

(declare-fun e!386768 () Bool)

(assert (=> d!93447 (=> res!445112 e!386768)))

(assert (=> d!93447 (= res!445112 (is-Nil!12943 acc!681))))

(assert (=> d!93447 (= (noDuplicate!770 acc!681) e!386768)))

(declare-fun b!678726 () Bool)

(declare-fun e!386769 () Bool)

(assert (=> b!678726 (= e!386768 e!386769)))

(declare-fun res!445113 () Bool)

(assert (=> b!678726 (=> (not res!445113) (not e!386769))))

(assert (=> b!678726 (= res!445113 (not (contains!3523 (t!19174 acc!681) (h!13987 acc!681))))))

(declare-fun b!678727 () Bool)

(assert (=> b!678727 (= e!386769 (noDuplicate!770 (t!19174 acc!681)))))

(assert (= (and d!93447 (not res!445112)) b!678726))

(assert (= (and b!678726 res!445113) b!678727))

(declare-fun m!644409 () Bool)

(assert (=> b!678726 m!644409))

(declare-fun m!644411 () Bool)

(assert (=> b!678727 m!644411))

(assert (=> b!678620 d!93447))

(declare-fun d!93463 () Bool)

(declare-fun res!445134 () Bool)

(declare-fun e!386790 () Bool)

(assert (=> d!93463 (=> res!445134 e!386790)))

(assert (=> d!93463 (= res!445134 (= (select (arr!18905 (array!39426 (store (arr!18905 a!3626) i!1382 k!2843) (size!19269 a!3626))) from!3004) k!2843))))

(assert (=> d!93463 (= (arrayContainsKey!0 (array!39426 (store (arr!18905 a!3626) i!1382 k!2843) (size!19269 a!3626)) k!2843 from!3004) e!386790)))

(declare-fun b!678748 () Bool)

(declare-fun e!386791 () Bool)

(assert (=> b!678748 (= e!386790 e!386791)))

(declare-fun res!445135 () Bool)

(assert (=> b!678748 (=> (not res!445135) (not e!386791))))

(assert (=> b!678748 (= res!445135 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19269 (array!39426 (store (arr!18905 a!3626) i!1382 k!2843) (size!19269 a!3626)))))))

(declare-fun b!678749 () Bool)

(assert (=> b!678749 (= e!386791 (arrayContainsKey!0 (array!39426 (store (arr!18905 a!3626) i!1382 k!2843) (size!19269 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93463 (not res!445134)) b!678748))

(assert (= (and b!678748 res!445135) b!678749))

(declare-fun m!644429 () Bool)

(assert (=> d!93463 m!644429))

(declare-fun m!644431 () Bool)

(assert (=> b!678749 m!644431))

(assert (=> b!678619 d!93463))

(assert (=> b!678614 d!93425))

(declare-fun d!93473 () Bool)

(assert (=> d!93473 (= (array_inv!14701 a!3626) (bvsge (size!19269 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60378 d!93473))

(declare-fun d!93475 () Bool)

(declare-fun res!445138 () Bool)

(declare-fun e!386794 () Bool)

(assert (=> d!93475 (=> res!445138 e!386794)))

(assert (=> d!93475 (= res!445138 (= (select (arr!18905 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93475 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!386794)))

(declare-fun b!678752 () Bool)

(declare-fun e!386795 () Bool)

(assert (=> b!678752 (= e!386794 e!386795)))

(declare-fun res!445139 () Bool)

(assert (=> b!678752 (=> (not res!445139) (not e!386795))))

(assert (=> b!678752 (= res!445139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19269 a!3626)))))

(declare-fun b!678753 () Bool)

(assert (=> b!678753 (= e!386795 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93475 (not res!445138)) b!678752))

(assert (= (and b!678752 res!445139) b!678753))

(assert (=> d!93475 m!644385))

(declare-fun m!644437 () Bool)

(assert (=> b!678753 m!644437))

(assert (=> b!678618 d!93475))

(declare-fun b!678754 () Bool)

(declare-fun e!386796 () Bool)

(declare-fun call!33926 () Bool)

(assert (=> b!678754 (= e!386796 call!33926)))

(declare-fun e!386798 () Bool)

(declare-fun b!678755 () Bool)

(assert (=> b!678755 (= e!386798 (contains!3523 acc!681 (select (arr!18905 a!3626) from!3004)))))

(declare-fun b!678756 () Bool)

(assert (=> b!678756 (= e!386796 call!33926)))

(declare-fun b!678757 () Bool)

(declare-fun e!386799 () Bool)

(assert (=> b!678757 (= e!386799 e!386796)))

(declare-fun c!77174 () Bool)

(assert (=> b!678757 (= c!77174 (validKeyInArray!0 (select (arr!18905 a!3626) from!3004)))))

(declare-fun d!93477 () Bool)

(declare-fun res!445141 () Bool)

(declare-fun e!386797 () Bool)

(assert (=> d!93477 (=> res!445141 e!386797)))

(assert (=> d!93477 (= res!445141 (bvsge from!3004 (size!19269 a!3626)))))

(assert (=> d!93477 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!386797)))

(declare-fun bm!33923 () Bool)

