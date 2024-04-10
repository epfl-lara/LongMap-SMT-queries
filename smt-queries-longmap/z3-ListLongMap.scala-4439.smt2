; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61702 () Bool)

(assert start!61702)

(declare-fun b!690374 () Bool)

(declare-fun res!454785 () Bool)

(declare-fun e!393096 () Bool)

(assert (=> b!690374 (=> (not res!454785) (not e!393096))))

(declare-datatypes ((array!39756 0))(
  ( (array!39757 (arr!19048 (Array (_ BitVec 32) (_ BitVec 64))) (size!19433 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39756)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690374 (= res!454785 (validKeyInArray!0 (select (arr!19048 a!3626) from!3004)))))

(declare-fun res!454791 () Bool)

(assert (=> start!61702 (=> (not res!454791) (not e!393096))))

(assert (=> start!61702 (= res!454791 (and (bvslt (size!19433 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19433 a!3626))))))

(assert (=> start!61702 e!393096))

(assert (=> start!61702 true))

(declare-fun array_inv!14844 (array!39756) Bool)

(assert (=> start!61702 (array_inv!14844 a!3626)))

(declare-fun b!690375 () Bool)

(declare-fun res!454784 () Bool)

(assert (=> b!690375 (=> (not res!454784) (not e!393096))))

(declare-datatypes ((List!13089 0))(
  ( (Nil!13086) (Cons!13085 (h!14130 (_ BitVec 64)) (t!19356 List!13089)) )
))
(declare-fun acc!681 () List!13089)

(declare-fun contains!3666 (List!13089 (_ BitVec 64)) Bool)

(assert (=> b!690375 (= res!454784 (not (contains!3666 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690376 () Bool)

(declare-fun res!454787 () Bool)

(assert (=> b!690376 (=> (not res!454787) (not e!393096))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690376 (= res!454787 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690377 () Bool)

(declare-fun res!454789 () Bool)

(assert (=> b!690377 (=> (not res!454789) (not e!393096))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690377 (= res!454789 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19433 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690378 () Bool)

(declare-fun res!454786 () Bool)

(assert (=> b!690378 (=> (not res!454786) (not e!393096))))

(assert (=> b!690378 (= res!454786 (not (contains!3666 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690379 () Bool)

(assert (=> b!690379 (= e!393096 (not (arrayContainsKey!0 a!3626 k0!2843 from!3004)))))

(declare-fun b!690380 () Bool)

(declare-fun res!454779 () Bool)

(assert (=> b!690380 (=> (not res!454779) (not e!393096))))

(assert (=> b!690380 (= res!454779 (= (select (arr!19048 a!3626) from!3004) k0!2843))))

(declare-fun b!690381 () Bool)

(declare-fun res!454781 () Bool)

(assert (=> b!690381 (=> (not res!454781) (not e!393096))))

(declare-fun e!393093 () Bool)

(assert (=> b!690381 (= res!454781 e!393093)))

(declare-fun res!454782 () Bool)

(assert (=> b!690381 (=> res!454782 e!393093)))

(declare-fun e!393092 () Bool)

(assert (=> b!690381 (= res!454782 e!393092)))

(declare-fun res!454788 () Bool)

(assert (=> b!690381 (=> (not res!454788) (not e!393092))))

(assert (=> b!690381 (= res!454788 (bvsgt from!3004 i!1382))))

(declare-fun b!690382 () Bool)

(declare-fun res!454793 () Bool)

(assert (=> b!690382 (=> (not res!454793) (not e!393096))))

(declare-fun noDuplicate!913 (List!13089) Bool)

(assert (=> b!690382 (= res!454793 (noDuplicate!913 acc!681))))

(declare-fun b!690383 () Bool)

(assert (=> b!690383 (= e!393092 (contains!3666 acc!681 k0!2843))))

(declare-fun b!690384 () Bool)

(declare-fun e!393095 () Bool)

(assert (=> b!690384 (= e!393095 (not (contains!3666 acc!681 k0!2843)))))

(declare-fun b!690385 () Bool)

(declare-fun res!454790 () Bool)

(assert (=> b!690385 (=> (not res!454790) (not e!393096))))

(assert (=> b!690385 (= res!454790 (validKeyInArray!0 k0!2843))))

(declare-fun b!690386 () Bool)

(assert (=> b!690386 (= e!393093 e!393095)))

(declare-fun res!454783 () Bool)

(assert (=> b!690386 (=> (not res!454783) (not e!393095))))

(assert (=> b!690386 (= res!454783 (bvsle from!3004 i!1382))))

(declare-fun b!690387 () Bool)

(declare-fun res!454778 () Bool)

(assert (=> b!690387 (=> (not res!454778) (not e!393096))))

(assert (=> b!690387 (= res!454778 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19433 a!3626))))))

(declare-fun b!690388 () Bool)

(declare-fun res!454780 () Bool)

(assert (=> b!690388 (=> (not res!454780) (not e!393096))))

(declare-fun arrayNoDuplicates!0 (array!39756 (_ BitVec 32) List!13089) Bool)

(assert (=> b!690388 (= res!454780 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690389 () Bool)

(declare-fun res!454792 () Bool)

(assert (=> b!690389 (=> (not res!454792) (not e!393096))))

(assert (=> b!690389 (= res!454792 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13086))))

(assert (= (and start!61702 res!454791) b!690382))

(assert (= (and b!690382 res!454793) b!690378))

(assert (= (and b!690378 res!454786) b!690375))

(assert (= (and b!690375 res!454784) b!690381))

(assert (= (and b!690381 res!454788) b!690383))

(assert (= (and b!690381 (not res!454782)) b!690386))

(assert (= (and b!690386 res!454783) b!690384))

(assert (= (and b!690381 res!454781) b!690389))

(assert (= (and b!690389 res!454792) b!690388))

(assert (= (and b!690388 res!454780) b!690387))

(assert (= (and b!690387 res!454778) b!690385))

(assert (= (and b!690385 res!454790) b!690376))

(assert (= (and b!690376 res!454787) b!690377))

(assert (= (and b!690377 res!454789) b!690374))

(assert (= (and b!690374 res!454785) b!690380))

(assert (= (and b!690380 res!454779) b!690379))

(declare-fun m!653891 () Bool)

(assert (=> b!690382 m!653891))

(declare-fun m!653893 () Bool)

(assert (=> b!690385 m!653893))

(declare-fun m!653895 () Bool)

(assert (=> b!690384 m!653895))

(declare-fun m!653897 () Bool)

(assert (=> b!690376 m!653897))

(assert (=> b!690383 m!653895))

(declare-fun m!653899 () Bool)

(assert (=> b!690380 m!653899))

(declare-fun m!653901 () Bool)

(assert (=> b!690389 m!653901))

(assert (=> b!690374 m!653899))

(assert (=> b!690374 m!653899))

(declare-fun m!653903 () Bool)

(assert (=> b!690374 m!653903))

(declare-fun m!653905 () Bool)

(assert (=> b!690379 m!653905))

(declare-fun m!653907 () Bool)

(assert (=> start!61702 m!653907))

(declare-fun m!653909 () Bool)

(assert (=> b!690378 m!653909))

(declare-fun m!653911 () Bool)

(assert (=> b!690388 m!653911))

(declare-fun m!653913 () Bool)

(assert (=> b!690375 m!653913))

(check-sat (not start!61702) (not b!690389) (not b!690378) (not b!690379) (not b!690385) (not b!690388) (not b!690374) (not b!690382) (not b!690383) (not b!690384) (not b!690376) (not b!690375))
(check-sat)
(get-model)

(declare-fun b!690448 () Bool)

(declare-fun e!393120 () Bool)

(declare-fun e!393123 () Bool)

(assert (=> b!690448 (= e!393120 e!393123)))

(declare-fun c!78167 () Bool)

(assert (=> b!690448 (= c!78167 (validKeyInArray!0 (select (arr!19048 a!3626) from!3004)))))

(declare-fun d!95435 () Bool)

(declare-fun res!454848 () Bool)

(declare-fun e!393122 () Bool)

(assert (=> d!95435 (=> res!454848 e!393122)))

(assert (=> d!95435 (= res!454848 (bvsge from!3004 (size!19433 a!3626)))))

(assert (=> d!95435 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393122)))

(declare-fun call!34217 () Bool)

(declare-fun bm!34214 () Bool)

(assert (=> bm!34214 (= call!34217 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78167 (Cons!13085 (select (arr!19048 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun e!393121 () Bool)

(declare-fun b!690449 () Bool)

(assert (=> b!690449 (= e!393121 (contains!3666 acc!681 (select (arr!19048 a!3626) from!3004)))))

(declare-fun b!690450 () Bool)

(assert (=> b!690450 (= e!393123 call!34217)))

(declare-fun b!690451 () Bool)

(assert (=> b!690451 (= e!393123 call!34217)))

(declare-fun b!690452 () Bool)

(assert (=> b!690452 (= e!393122 e!393120)))

(declare-fun res!454849 () Bool)

(assert (=> b!690452 (=> (not res!454849) (not e!393120))))

(assert (=> b!690452 (= res!454849 (not e!393121))))

(declare-fun res!454850 () Bool)

(assert (=> b!690452 (=> (not res!454850) (not e!393121))))

(assert (=> b!690452 (= res!454850 (validKeyInArray!0 (select (arr!19048 a!3626) from!3004)))))

(assert (= (and d!95435 (not res!454848)) b!690452))

(assert (= (and b!690452 res!454850) b!690449))

(assert (= (and b!690452 res!454849) b!690448))

(assert (= (and b!690448 c!78167) b!690450))

(assert (= (and b!690448 (not c!78167)) b!690451))

(assert (= (or b!690450 b!690451) bm!34214))

(assert (=> b!690448 m!653899))

(assert (=> b!690448 m!653899))

(assert (=> b!690448 m!653903))

(assert (=> bm!34214 m!653899))

(declare-fun m!653939 () Bool)

(assert (=> bm!34214 m!653939))

(assert (=> b!690449 m!653899))

(assert (=> b!690449 m!653899))

(declare-fun m!653941 () Bool)

(assert (=> b!690449 m!653941))

(assert (=> b!690452 m!653899))

(assert (=> b!690452 m!653899))

(assert (=> b!690452 m!653903))

(assert (=> b!690388 d!95435))

(declare-fun d!95441 () Bool)

(declare-fun lt!316429 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!307 (List!13089) (InoxSet (_ BitVec 64)))

(assert (=> d!95441 (= lt!316429 (select (content!307 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393141 () Bool)

(assert (=> d!95441 (= lt!316429 e!393141)))

(declare-fun res!454868 () Bool)

(assert (=> d!95441 (=> (not res!454868) (not e!393141))))

(get-info :version)

(assert (=> d!95441 (= res!454868 ((_ is Cons!13085) acc!681))))

(assert (=> d!95441 (= (contains!3666 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316429)))

(declare-fun b!690469 () Bool)

(declare-fun e!393140 () Bool)

(assert (=> b!690469 (= e!393141 e!393140)))

(declare-fun res!454867 () Bool)

(assert (=> b!690469 (=> res!454867 e!393140)))

(assert (=> b!690469 (= res!454867 (= (h!14130 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690470 () Bool)

(assert (=> b!690470 (= e!393140 (contains!3666 (t!19356 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95441 res!454868) b!690469))

(assert (= (and b!690469 (not res!454867)) b!690470))

(declare-fun m!653953 () Bool)

(assert (=> d!95441 m!653953))

(declare-fun m!653955 () Bool)

(assert (=> d!95441 m!653955))

(declare-fun m!653957 () Bool)

(assert (=> b!690470 m!653957))

(assert (=> b!690378 d!95441))

(declare-fun b!690475 () Bool)

(declare-fun e!393146 () Bool)

(declare-fun e!393149 () Bool)

(assert (=> b!690475 (= e!393146 e!393149)))

(declare-fun c!78168 () Bool)

(assert (=> b!690475 (= c!78168 (validKeyInArray!0 (select (arr!19048 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95447 () Bool)

(declare-fun res!454873 () Bool)

(declare-fun e!393148 () Bool)

(assert (=> d!95447 (=> res!454873 e!393148)))

(assert (=> d!95447 (= res!454873 (bvsge #b00000000000000000000000000000000 (size!19433 a!3626)))))

(assert (=> d!95447 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13086) e!393148)))

(declare-fun bm!34215 () Bool)

(declare-fun call!34218 () Bool)

(assert (=> bm!34215 (= call!34218 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78168 (Cons!13085 (select (arr!19048 a!3626) #b00000000000000000000000000000000) Nil!13086) Nil!13086)))))

(declare-fun b!690476 () Bool)

(declare-fun e!393147 () Bool)

(assert (=> b!690476 (= e!393147 (contains!3666 Nil!13086 (select (arr!19048 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690477 () Bool)

(assert (=> b!690477 (= e!393149 call!34218)))

(declare-fun b!690478 () Bool)

(assert (=> b!690478 (= e!393149 call!34218)))

(declare-fun b!690479 () Bool)

(assert (=> b!690479 (= e!393148 e!393146)))

(declare-fun res!454874 () Bool)

(assert (=> b!690479 (=> (not res!454874) (not e!393146))))

(assert (=> b!690479 (= res!454874 (not e!393147))))

(declare-fun res!454875 () Bool)

(assert (=> b!690479 (=> (not res!454875) (not e!393147))))

(assert (=> b!690479 (= res!454875 (validKeyInArray!0 (select (arr!19048 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95447 (not res!454873)) b!690479))

(assert (= (and b!690479 res!454875) b!690476))

(assert (= (and b!690479 res!454874) b!690475))

(assert (= (and b!690475 c!78168) b!690477))

(assert (= (and b!690475 (not c!78168)) b!690478))

(assert (= (or b!690477 b!690478) bm!34215))

(declare-fun m!653959 () Bool)

(assert (=> b!690475 m!653959))

(assert (=> b!690475 m!653959))

(declare-fun m!653961 () Bool)

(assert (=> b!690475 m!653961))

(assert (=> bm!34215 m!653959))

(declare-fun m!653963 () Bool)

(assert (=> bm!34215 m!653963))

(assert (=> b!690476 m!653959))

(assert (=> b!690476 m!653959))

(declare-fun m!653965 () Bool)

(assert (=> b!690476 m!653965))

(assert (=> b!690479 m!653959))

(assert (=> b!690479 m!653959))

(assert (=> b!690479 m!653961))

(assert (=> b!690389 d!95447))

(declare-fun d!95449 () Bool)

(assert (=> d!95449 (= (validKeyInArray!0 (select (arr!19048 a!3626) from!3004)) (and (not (= (select (arr!19048 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19048 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690374 d!95449))

(declare-fun d!95453 () Bool)

(assert (=> d!95453 (= (array_inv!14844 a!3626) (bvsge (size!19433 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61702 d!95453))

(declare-fun d!95457 () Bool)

(assert (=> d!95457 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690385 d!95457))

(declare-fun d!95459 () Bool)

(declare-fun lt!316433 () Bool)

(assert (=> d!95459 (= lt!316433 (select (content!307 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393159 () Bool)

(assert (=> d!95459 (= lt!316433 e!393159)))

(declare-fun res!454885 () Bool)

(assert (=> d!95459 (=> (not res!454885) (not e!393159))))

(assert (=> d!95459 (= res!454885 ((_ is Cons!13085) acc!681))))

(assert (=> d!95459 (= (contains!3666 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316433)))

(declare-fun b!690488 () Bool)

(declare-fun e!393158 () Bool)

(assert (=> b!690488 (= e!393159 e!393158)))

(declare-fun res!454884 () Bool)

(assert (=> b!690488 (=> res!454884 e!393158)))

(assert (=> b!690488 (= res!454884 (= (h!14130 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690489 () Bool)

(assert (=> b!690489 (= e!393158 (contains!3666 (t!19356 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95459 res!454885) b!690488))

(assert (= (and b!690488 (not res!454884)) b!690489))

(assert (=> d!95459 m!653953))

(declare-fun m!653975 () Bool)

(assert (=> d!95459 m!653975))

(declare-fun m!653977 () Bool)

(assert (=> b!690489 m!653977))

(assert (=> b!690375 d!95459))

(declare-fun d!95461 () Bool)

(declare-fun res!454902 () Bool)

(declare-fun e!393180 () Bool)

(assert (=> d!95461 (=> res!454902 e!393180)))

(assert (=> d!95461 (= res!454902 (= (select (arr!19048 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95461 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!393180)))

(declare-fun b!690514 () Bool)

(declare-fun e!393181 () Bool)

(assert (=> b!690514 (= e!393180 e!393181)))

(declare-fun res!454903 () Bool)

(assert (=> b!690514 (=> (not res!454903) (not e!393181))))

(assert (=> b!690514 (= res!454903 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19433 a!3626)))))

(declare-fun b!690515 () Bool)

(assert (=> b!690515 (= e!393181 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95461 (not res!454902)) b!690514))

(assert (= (and b!690514 res!454903) b!690515))

(assert (=> d!95461 m!653959))

(declare-fun m!653979 () Bool)

(assert (=> b!690515 m!653979))

(assert (=> b!690376 d!95461))

(declare-fun d!95463 () Bool)

(declare-fun res!454911 () Bool)

(declare-fun e!393190 () Bool)

(assert (=> d!95463 (=> res!454911 e!393190)))

(assert (=> d!95463 (= res!454911 ((_ is Nil!13086) acc!681))))

(assert (=> d!95463 (= (noDuplicate!913 acc!681) e!393190)))

(declare-fun b!690525 () Bool)

(declare-fun e!393191 () Bool)

(assert (=> b!690525 (= e!393190 e!393191)))

(declare-fun res!454912 () Bool)

(assert (=> b!690525 (=> (not res!454912) (not e!393191))))

(assert (=> b!690525 (= res!454912 (not (contains!3666 (t!19356 acc!681) (h!14130 acc!681))))))

(declare-fun b!690526 () Bool)

(assert (=> b!690526 (= e!393191 (noDuplicate!913 (t!19356 acc!681)))))

(assert (= (and d!95463 (not res!454911)) b!690525))

(assert (= (and b!690525 res!454912) b!690526))

(declare-fun m!653985 () Bool)

(assert (=> b!690525 m!653985))

(declare-fun m!653989 () Bool)

(assert (=> b!690526 m!653989))

(assert (=> b!690382 d!95463))

(declare-fun d!95465 () Bool)

(declare-fun lt!316434 () Bool)

(assert (=> d!95465 (= lt!316434 (select (content!307 acc!681) k0!2843))))

(declare-fun e!393197 () Bool)

(assert (=> d!95465 (= lt!316434 e!393197)))

(declare-fun res!454917 () Bool)

(assert (=> d!95465 (=> (not res!454917) (not e!393197))))

(assert (=> d!95465 (= res!454917 ((_ is Cons!13085) acc!681))))

(assert (=> d!95465 (= (contains!3666 acc!681 k0!2843) lt!316434)))

(declare-fun b!690532 () Bool)

(declare-fun e!393196 () Bool)

(assert (=> b!690532 (= e!393197 e!393196)))

(declare-fun res!454916 () Bool)

(assert (=> b!690532 (=> res!454916 e!393196)))

(assert (=> b!690532 (= res!454916 (= (h!14130 acc!681) k0!2843))))

(declare-fun b!690533 () Bool)

(assert (=> b!690533 (= e!393196 (contains!3666 (t!19356 acc!681) k0!2843))))

(assert (= (and d!95465 res!454917) b!690532))

(assert (= (and b!690532 (not res!454916)) b!690533))

(assert (=> d!95465 m!653953))

(declare-fun m!653993 () Bool)

(assert (=> d!95465 m!653993))

(declare-fun m!653995 () Bool)

(assert (=> b!690533 m!653995))

(assert (=> b!690383 d!95465))

(assert (=> b!690384 d!95465))

(declare-fun d!95469 () Bool)

(declare-fun res!454918 () Bool)

(declare-fun e!393198 () Bool)

(assert (=> d!95469 (=> res!454918 e!393198)))

(assert (=> d!95469 (= res!454918 (= (select (arr!19048 a!3626) from!3004) k0!2843))))

(assert (=> d!95469 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!393198)))

(declare-fun b!690534 () Bool)

(declare-fun e!393199 () Bool)

(assert (=> b!690534 (= e!393198 e!393199)))

(declare-fun res!454919 () Bool)

(assert (=> b!690534 (=> (not res!454919) (not e!393199))))

(assert (=> b!690534 (= res!454919 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19433 a!3626)))))

(declare-fun b!690535 () Bool)

(assert (=> b!690535 (= e!393199 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95469 (not res!454918)) b!690534))

(assert (= (and b!690534 res!454919) b!690535))

(assert (=> d!95469 m!653899))

(declare-fun m!653997 () Bool)

(assert (=> b!690535 m!653997))

(assert (=> b!690379 d!95469))

(check-sat (not bm!34214) (not b!690479) (not b!690449) (not b!690476) (not b!690526) (not d!95459) (not d!95465) (not b!690535) (not b!690515) (not b!690475) (not b!690533) (not b!690525) (not b!690489) (not d!95441) (not b!690452) (not b!690448) (not bm!34215) (not b!690470))
(check-sat)
