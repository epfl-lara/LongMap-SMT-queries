; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60438 () Bool)

(assert start!60438)

(declare-fun b!679257 () Bool)

(declare-fun res!445647 () Bool)

(declare-fun e!386988 () Bool)

(assert (=> b!679257 (=> (not res!445647) (not e!386988))))

(declare-datatypes ((List!12958 0))(
  ( (Nil!12955) (Cons!12954 (h!13999 (_ BitVec 64)) (t!19186 List!12958)) )
))
(declare-fun acc!681 () List!12958)

(declare-fun noDuplicate!782 (List!12958) Bool)

(assert (=> b!679257 (= res!445647 (noDuplicate!782 acc!681))))

(declare-fun e!386983 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun b!679259 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39452 0))(
  ( (array!39453 (arr!18917 (Array (_ BitVec 32) (_ BitVec 64))) (size!19281 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39452)

(declare-fun arrayContainsKey!0 (array!39452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679259 (= e!386983 (arrayContainsKey!0 a!3626 k!2843 from!3004))))

(declare-fun b!679260 () Bool)

(declare-fun res!445649 () Bool)

(assert (=> b!679260 (=> (not res!445649) (not e!386988))))

(declare-fun contains!3535 (List!12958 (_ BitVec 64)) Bool)

(assert (=> b!679260 (= res!445649 (not (contains!3535 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679261 () Bool)

(declare-fun res!445652 () Bool)

(assert (=> b!679261 (=> (not res!445652) (not e!386988))))

(assert (=> b!679261 (= res!445652 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679262 () Bool)

(declare-fun res!445646 () Bool)

(assert (=> b!679262 (=> (not res!445646) (not e!386988))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679262 (= res!445646 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19281 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679263 () Bool)

(declare-fun res!445644 () Bool)

(assert (=> b!679263 (=> (not res!445644) (not e!386988))))

(declare-fun e!386986 () Bool)

(assert (=> b!679263 (= res!445644 e!386986)))

(declare-fun res!445641 () Bool)

(assert (=> b!679263 (=> res!445641 e!386986)))

(declare-fun e!386987 () Bool)

(assert (=> b!679263 (= res!445641 e!386987)))

(declare-fun res!445651 () Bool)

(assert (=> b!679263 (=> (not res!445651) (not e!386987))))

(assert (=> b!679263 (= res!445651 (bvsgt from!3004 i!1382))))

(declare-fun b!679264 () Bool)

(assert (=> b!679264 (= e!386987 (contains!3535 acc!681 k!2843))))

(declare-fun res!445648 () Bool)

(assert (=> start!60438 (=> (not res!445648) (not e!386988))))

(assert (=> start!60438 (= res!445648 (and (bvslt (size!19281 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19281 a!3626))))))

(assert (=> start!60438 e!386988))

(assert (=> start!60438 true))

(declare-fun array_inv!14713 (array!39452) Bool)

(assert (=> start!60438 (array_inv!14713 a!3626)))

(declare-fun b!679258 () Bool)

(declare-fun res!445643 () Bool)

(assert (=> b!679258 (=> (not res!445643) (not e!386988))))

(assert (=> b!679258 (= res!445643 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19281 a!3626))))))

(declare-fun b!679265 () Bool)

(declare-fun res!445642 () Bool)

(assert (=> b!679265 (=> (not res!445642) (not e!386988))))

(declare-fun arrayNoDuplicates!0 (array!39452 (_ BitVec 32) List!12958) Bool)

(assert (=> b!679265 (= res!445642 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12955))))

(declare-fun b!679266 () Bool)

(declare-fun res!445653 () Bool)

(assert (=> b!679266 (=> (not res!445653) (not e!386988))))

(assert (=> b!679266 (= res!445653 (not (contains!3535 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679267 () Bool)

(declare-fun res!445654 () Bool)

(assert (=> b!679267 (=> (not res!445654) (not e!386988))))

(assert (=> b!679267 (= res!445654 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679268 () Bool)

(declare-fun res!445650 () Bool)

(assert (=> b!679268 (=> (not res!445650) (not e!386988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679268 (= res!445650 (validKeyInArray!0 k!2843))))

(declare-fun b!679269 () Bool)

(declare-fun e!386985 () Bool)

(assert (=> b!679269 (= e!386986 e!386985)))

(declare-fun res!445655 () Bool)

(assert (=> b!679269 (=> (not res!445655) (not e!386985))))

(assert (=> b!679269 (= res!445655 (bvsle from!3004 i!1382))))

(declare-fun b!679270 () Bool)

(assert (=> b!679270 (= e!386985 (not (contains!3535 acc!681 k!2843)))))

(declare-fun b!679271 () Bool)

(assert (=> b!679271 (= e!386988 (not e!386983))))

(declare-fun res!445645 () Bool)

(assert (=> b!679271 (=> res!445645 e!386983)))

(assert (=> b!679271 (= res!445645 (not (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679271 (arrayContainsKey!0 (array!39453 (store (arr!18917 a!3626) i!1382 k!2843) (size!19281 a!3626)) k!2843 from!3004)))

(assert (= (and start!60438 res!445648) b!679257))

(assert (= (and b!679257 res!445647) b!679266))

(assert (= (and b!679266 res!445653) b!679260))

(assert (= (and b!679260 res!445649) b!679263))

(assert (= (and b!679263 res!445651) b!679264))

(assert (= (and b!679263 (not res!445641)) b!679269))

(assert (= (and b!679269 res!445655) b!679270))

(assert (= (and b!679263 res!445644) b!679265))

(assert (= (and b!679265 res!445642) b!679267))

(assert (= (and b!679267 res!445654) b!679258))

(assert (= (and b!679258 res!445643) b!679268))

(assert (= (and b!679268 res!445650) b!679261))

(assert (= (and b!679261 res!445652) b!679262))

(assert (= (and b!679262 res!445646) b!679271))

(assert (= (and b!679271 (not res!445645)) b!679259))

(declare-fun m!644697 () Bool)

(assert (=> b!679270 m!644697))

(declare-fun m!644699 () Bool)

(assert (=> b!679260 m!644699))

(declare-fun m!644701 () Bool)

(assert (=> b!679259 m!644701))

(declare-fun m!644703 () Bool)

(assert (=> b!679267 m!644703))

(declare-fun m!644705 () Bool)

(assert (=> b!679268 m!644705))

(declare-fun m!644707 () Bool)

(assert (=> start!60438 m!644707))

(declare-fun m!644709 () Bool)

(assert (=> b!679257 m!644709))

(declare-fun m!644711 () Bool)

(assert (=> b!679261 m!644711))

(declare-fun m!644713 () Bool)

(assert (=> b!679266 m!644713))

(declare-fun m!644715 () Bool)

(assert (=> b!679265 m!644715))

(declare-fun m!644717 () Bool)

(assert (=> b!679271 m!644717))

(declare-fun m!644719 () Bool)

(assert (=> b!679271 m!644719))

(declare-fun m!644721 () Bool)

(assert (=> b!679271 m!644721))

(assert (=> b!679264 m!644697))

(push 1)

(assert (not b!679257))

(assert (not b!679261))

(assert (not b!679271))

(assert (not b!679264))

(assert (not b!679260))

(assert (not b!679267))

(assert (not b!679265))

(assert (not start!60438))

(assert (not b!679266))

(assert (not b!679259))

(assert (not b!679268))

(assert (not b!679270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!679308 () Bool)

(declare-fun e!387020 () Bool)

(declare-fun call!33933 () Bool)

(assert (=> b!679308 (= e!387020 call!33933)))

(declare-fun b!679309 () Bool)

(assert (=> b!679309 (= e!387020 call!33933)))

(declare-fun b!679310 () Bool)

(declare-fun e!387022 () Bool)

(assert (=> b!679310 (= e!387022 (contains!3535 Nil!12955 (select (arr!18917 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!679312 () Bool)

(declare-fun e!387019 () Bool)

(declare-fun e!387021 () Bool)

(assert (=> b!679312 (= e!387019 e!387021)))

(declare-fun res!445680 () Bool)

(assert (=> b!679312 (=> (not res!445680) (not e!387021))))

(assert (=> b!679312 (= res!445680 (not e!387022))))

(declare-fun res!445682 () Bool)

(assert (=> b!679312 (=> (not res!445682) (not e!387022))))

(assert (=> b!679312 (= res!445682 (validKeyInArray!0 (select (arr!18917 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33930 () Bool)

(declare-fun c!77181 () Bool)

(assert (=> bm!33930 (= call!33933 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77181 (Cons!12954 (select (arr!18917 a!3626) #b00000000000000000000000000000000) Nil!12955) Nil!12955)))))

(declare-fun b!679311 () Bool)

(assert (=> b!679311 (= e!387021 e!387020)))

(assert (=> b!679311 (= c!77181 (validKeyInArray!0 (select (arr!18917 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93489 () Bool)

(declare-fun res!445681 () Bool)

(assert (=> d!93489 (=> res!445681 e!387019)))

(assert (=> d!93489 (= res!445681 (bvsge #b00000000000000000000000000000000 (size!19281 a!3626)))))

(assert (=> d!93489 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12955) e!387019)))

(assert (= (and d!93489 (not res!445681)) b!679312))

(assert (= (and b!679312 res!445682) b!679310))

(assert (= (and b!679312 res!445680) b!679311))

(assert (= (and b!679311 c!77181) b!679308))

(assert (= (and b!679311 (not c!77181)) b!679309))

(assert (= (or b!679308 b!679309) bm!33930))

(declare-fun m!644741 () Bool)

(assert (=> b!679310 m!644741))

(assert (=> b!679310 m!644741))

(declare-fun m!644743 () Bool)

(assert (=> b!679310 m!644743))

(assert (=> b!679312 m!644741))

(assert (=> b!679312 m!644741))

(declare-fun m!644745 () Bool)

(assert (=> b!679312 m!644745))

(assert (=> bm!33930 m!644741))

(declare-fun m!644747 () Bool)

(assert (=> bm!33930 m!644747))

(assert (=> b!679311 m!644741))

(assert (=> b!679311 m!644741))

(assert (=> b!679311 m!644745))

(assert (=> b!679265 d!93489))

(declare-fun d!93497 () Bool)

(declare-fun lt!312918 () Bool)

(declare-fun content!264 (List!12958) (Set (_ BitVec 64)))

(assert (=> d!93497 (= lt!312918 (member k!2843 (content!264 acc!681)))))

(declare-fun e!387042 () Bool)

(assert (=> d!93497 (= lt!312918 e!387042)))

(declare-fun res!445703 () Bool)

(assert (=> d!93497 (=> (not res!445703) (not e!387042))))

(assert (=> d!93497 (= res!445703 (is-Cons!12954 acc!681))))

(assert (=> d!93497 (= (contains!3535 acc!681 k!2843) lt!312918)))

(declare-fun b!679333 () Bool)

(declare-fun e!387044 () Bool)

(assert (=> b!679333 (= e!387042 e!387044)))

(declare-fun res!445702 () Bool)

(assert (=> b!679333 (=> res!445702 e!387044)))

(assert (=> b!679333 (= res!445702 (= (h!13999 acc!681) k!2843))))

(declare-fun b!679334 () Bool)

(assert (=> b!679334 (= e!387044 (contains!3535 (t!19186 acc!681) k!2843))))

(assert (= (and d!93497 res!445703) b!679333))

(assert (= (and b!679333 (not res!445702)) b!679334))

(declare-fun m!644757 () Bool)

(assert (=> d!93497 m!644757))

(declare-fun m!644761 () Bool)

(assert (=> d!93497 m!644761))

(declare-fun m!644763 () Bool)

(assert (=> b!679334 m!644763))

(assert (=> b!679264 d!93497))

(declare-fun d!93505 () Bool)

(declare-fun lt!312919 () Bool)

(assert (=> d!93505 (= lt!312919 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!264 acc!681)))))

(declare-fun e!387047 () Bool)

(assert (=> d!93505 (= lt!312919 e!387047)))

(declare-fun res!445708 () Bool)

(assert (=> d!93505 (=> (not res!445708) (not e!387047))))

(assert (=> d!93505 (= res!445708 (is-Cons!12954 acc!681))))

(assert (=> d!93505 (= (contains!3535 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312919)))

(declare-fun b!679337 () Bool)

(declare-fun e!387048 () Bool)

(assert (=> b!679337 (= e!387047 e!387048)))

(declare-fun res!445707 () Bool)

(assert (=> b!679337 (=> res!445707 e!387048)))

(assert (=> b!679337 (= res!445707 (= (h!13999 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!679338 () Bool)

(assert (=> b!679338 (= e!387048 (contains!3535 (t!19186 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93505 res!445708) b!679337))

(assert (= (and b!679337 (not res!445707)) b!679338))

(assert (=> d!93505 m!644757))

(declare-fun m!644767 () Bool)

(assert (=> d!93505 m!644767))

(declare-fun m!644769 () Bool)

(assert (=> b!679338 m!644769))

(assert (=> b!679266 d!93505))

(assert (=> b!679270 d!93497))

(declare-fun d!93509 () Bool)

(declare-fun res!445723 () Bool)

(declare-fun e!387063 () Bool)

(assert (=> d!93509 (=> res!445723 e!387063)))

(assert (=> d!93509 (= res!445723 (= (select (arr!18917 a!3626) from!3004) k!2843))))

(assert (=> d!93509 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!387063)))

(declare-fun b!679353 () Bool)

(declare-fun e!387064 () Bool)

(assert (=> b!679353 (= e!387063 e!387064)))

(declare-fun res!445724 () Bool)

(assert (=> b!679353 (=> (not res!445724) (not e!387064))))

(assert (=> b!679353 (= res!445724 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19281 a!3626)))))

(declare-fun b!679354 () Bool)

(assert (=> b!679354 (= e!387064 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93509 (not res!445723)) b!679353))

(assert (= (and b!679353 res!445724) b!679354))

(declare-fun m!644793 () Bool)

(assert (=> d!93509 m!644793))

(declare-fun m!644795 () Bool)

(assert (=> b!679354 m!644795))

(assert (=> b!679259 d!93509))

(declare-fun d!93523 () Bool)

(assert (=> d!93523 (= (array_inv!14713 a!3626) (bvsge (size!19281 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60438 d!93523))

(declare-fun d!93525 () Bool)

(declare-fun res!445725 () Bool)

(declare-fun e!387065 () Bool)

(assert (=> d!93525 (=> res!445725 e!387065)))

(assert (=> d!93525 (= res!445725 (= (select (arr!18917 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93525 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!387065)))

(declare-fun b!679355 () Bool)

(declare-fun e!387066 () Bool)

(assert (=> b!679355 (= e!387065 e!387066)))

(declare-fun res!445726 () Bool)

(assert (=> b!679355 (=> (not res!445726) (not e!387066))))

(assert (=> b!679355 (= res!445726 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19281 a!3626)))))

(declare-fun b!679356 () Bool)

(assert (=> b!679356 (= e!387066 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93525 (not res!445725)) b!679355))

(assert (= (and b!679355 res!445726) b!679356))

(assert (=> d!93525 m!644741))

(declare-fun m!644797 () Bool)

(assert (=> b!679356 m!644797))

(assert (=> b!679261 d!93525))

(declare-fun d!93527 () Bool)

(declare-fun res!445733 () Bool)

(declare-fun e!387073 () Bool)

(assert (=> d!93527 (=> res!445733 e!387073)))

(assert (=> d!93527 (= res!445733 (= (select (arr!18917 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93527 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387073)))

(declare-fun b!679363 () Bool)

(declare-fun e!387074 () Bool)

(assert (=> b!679363 (= e!387073 e!387074)))

(declare-fun res!445734 () Bool)

(assert (=> b!679363 (=> (not res!445734) (not e!387074))))

(assert (=> b!679363 (= res!445734 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19281 a!3626)))))

(declare-fun b!679364 () Bool)

(assert (=> b!679364 (= e!387074 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93527 (not res!445733)) b!679363))

(assert (= (and b!679363 res!445734) b!679364))

(declare-fun m!644799 () Bool)

(assert (=> d!93527 m!644799))

(declare-fun m!644801 () Bool)

(assert (=> b!679364 m!644801))

(assert (=> b!679271 d!93527))

(declare-fun d!93529 () Bool)

(declare-fun res!445735 () Bool)

(declare-fun e!387077 () Bool)

(assert (=> d!93529 (=> res!445735 e!387077)))

(assert (=> d!93529 (= res!445735 (= (select (arr!18917 (array!39453 (store (arr!18917 a!3626) i!1382 k!2843) (size!19281 a!3626))) from!3004) k!2843))))

(assert (=> d!93529 (= (arrayContainsKey!0 (array!39453 (store (arr!18917 a!3626) i!1382 k!2843) (size!19281 a!3626)) k!2843 from!3004) e!387077)))

(declare-fun b!679369 () Bool)

(declare-fun e!387078 () Bool)

(assert (=> b!679369 (= e!387077 e!387078)))

(declare-fun res!445736 () Bool)

(assert (=> b!679369 (=> (not res!445736) (not e!387078))))

(assert (=> b!679369 (= res!445736 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19281 (array!39453 (store (arr!18917 a!3626) i!1382 k!2843) (size!19281 a!3626)))))))

(declare-fun b!679370 () Bool)

(assert (=> b!679370 (= e!387078 (arrayContainsKey!0 (array!39453 (store (arr!18917 a!3626) i!1382 k!2843) (size!19281 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93529 (not res!445735)) b!679369))

(assert (= (and b!679369 res!445736) b!679370))

(declare-fun m!644803 () Bool)

(assert (=> d!93529 m!644803))

(declare-fun m!644805 () Bool)

(assert (=> b!679370 m!644805))

(assert (=> b!679271 d!93529))

(declare-fun d!93531 () Bool)

(declare-fun lt!312923 () Bool)

(assert (=> d!93531 (= lt!312923 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!264 acc!681)))))

(declare-fun e!387079 () Bool)

(assert (=> d!93531 (= lt!312923 e!387079)))

(declare-fun res!445738 () Bool)

(assert (=> d!93531 (=> (not res!445738) (not e!387079))))

(assert (=> d!93531 (= res!445738 (is-Cons!12954 acc!681))))

(assert (=> d!93531 (= (contains!3535 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312923)))

(declare-fun b!679371 () Bool)

(declare-fun e!387080 () Bool)

(assert (=> b!679371 (= e!387079 e!387080)))

(declare-fun res!445737 () Bool)

(assert (=> b!679371 (=> res!445737 e!387080)))

(assert (=> b!679371 (= res!445737 (= (h!13999 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

