; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61700 () Bool)

(assert start!61700)

(declare-fun b!690326 () Bool)

(declare-fun res!454732 () Bool)

(declare-fun e!393079 () Bool)

(assert (=> b!690326 (=> (not res!454732) (not e!393079))))

(declare-datatypes ((array!39754 0))(
  ( (array!39755 (arr!19047 (Array (_ BitVec 32) (_ BitVec 64))) (size!19432 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39754)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690326 (= res!454732 (validKeyInArray!0 (select (arr!19047 a!3626) from!3004)))))

(declare-fun b!690327 () Bool)

(declare-fun res!454731 () Bool)

(assert (=> b!690327 (=> (not res!454731) (not e!393079))))

(declare-datatypes ((List!13088 0))(
  ( (Nil!13085) (Cons!13084 (h!14129 (_ BitVec 64)) (t!19355 List!13088)) )
))
(declare-fun arrayNoDuplicates!0 (array!39754 (_ BitVec 32) List!13088) Bool)

(assert (=> b!690327 (= res!454731 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13085))))

(declare-fun b!690328 () Bool)

(declare-fun res!454740 () Bool)

(assert (=> b!690328 (=> (not res!454740) (not e!393079))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690328 (= res!454740 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19432 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690329 () Bool)

(declare-fun res!454736 () Bool)

(assert (=> b!690329 (=> (not res!454736) (not e!393079))))

(assert (=> b!690329 (= res!454736 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19432 a!3626))))))

(declare-fun b!690330 () Bool)

(declare-fun res!454738 () Bool)

(assert (=> b!690330 (=> (not res!454738) (not e!393079))))

(declare-fun e!393077 () Bool)

(assert (=> b!690330 (= res!454738 e!393077)))

(declare-fun res!454744 () Bool)

(assert (=> b!690330 (=> res!454744 e!393077)))

(declare-fun e!393081 () Bool)

(assert (=> b!690330 (= res!454744 e!393081)))

(declare-fun res!454742 () Bool)

(assert (=> b!690330 (=> (not res!454742) (not e!393081))))

(assert (=> b!690330 (= res!454742 (bvsgt from!3004 i!1382))))

(declare-fun b!690331 () Bool)

(declare-fun res!454737 () Bool)

(assert (=> b!690331 (=> (not res!454737) (not e!393079))))

(declare-fun acc!681 () List!13088)

(declare-fun contains!3665 (List!13088 (_ BitVec 64)) Bool)

(assert (=> b!690331 (= res!454737 (not (contains!3665 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!454733 () Bool)

(assert (=> start!61700 (=> (not res!454733) (not e!393079))))

(assert (=> start!61700 (= res!454733 (and (bvslt (size!19432 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19432 a!3626))))))

(assert (=> start!61700 e!393079))

(assert (=> start!61700 true))

(declare-fun array_inv!14843 (array!39754) Bool)

(assert (=> start!61700 (array_inv!14843 a!3626)))

(declare-fun b!690332 () Bool)

(declare-fun res!454745 () Bool)

(assert (=> b!690332 (=> (not res!454745) (not e!393079))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690332 (= res!454745 (validKeyInArray!0 k!2843))))

(declare-fun b!690333 () Bool)

(declare-fun res!454734 () Bool)

(assert (=> b!690333 (=> (not res!454734) (not e!393079))))

(declare-fun noDuplicate!912 (List!13088) Bool)

(assert (=> b!690333 (= res!454734 (noDuplicate!912 acc!681))))

(declare-fun b!690334 () Bool)

(declare-fun res!454730 () Bool)

(assert (=> b!690334 (=> (not res!454730) (not e!393079))))

(assert (=> b!690334 (= res!454730 (not (contains!3665 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690335 () Bool)

(assert (=> b!690335 (= e!393081 (contains!3665 acc!681 k!2843))))

(declare-fun b!690336 () Bool)

(declare-fun e!393080 () Bool)

(assert (=> b!690336 (= e!393077 e!393080)))

(declare-fun res!454743 () Bool)

(assert (=> b!690336 (=> (not res!454743) (not e!393080))))

(assert (=> b!690336 (= res!454743 (bvsle from!3004 i!1382))))

(declare-fun b!690337 () Bool)

(declare-fun arrayContainsKey!0 (array!39754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690337 (= e!393079 (not (arrayContainsKey!0 a!3626 k!2843 from!3004)))))

(declare-fun b!690338 () Bool)

(declare-fun res!454735 () Bool)

(assert (=> b!690338 (=> (not res!454735) (not e!393079))))

(assert (=> b!690338 (= res!454735 (= (select (arr!19047 a!3626) from!3004) k!2843))))

(declare-fun b!690339 () Bool)

(declare-fun res!454741 () Bool)

(assert (=> b!690339 (=> (not res!454741) (not e!393079))))

(assert (=> b!690339 (= res!454741 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690340 () Bool)

(assert (=> b!690340 (= e!393080 (not (contains!3665 acc!681 k!2843)))))

(declare-fun b!690341 () Bool)

(declare-fun res!454739 () Bool)

(assert (=> b!690341 (=> (not res!454739) (not e!393079))))

(assert (=> b!690341 (= res!454739 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!61700 res!454733) b!690333))

(assert (= (and b!690333 res!454734) b!690331))

(assert (= (and b!690331 res!454737) b!690334))

(assert (= (and b!690334 res!454730) b!690330))

(assert (= (and b!690330 res!454742) b!690335))

(assert (= (and b!690330 (not res!454744)) b!690336))

(assert (= (and b!690336 res!454743) b!690340))

(assert (= (and b!690330 res!454738) b!690327))

(assert (= (and b!690327 res!454731) b!690341))

(assert (= (and b!690341 res!454739) b!690329))

(assert (= (and b!690329 res!454736) b!690332))

(assert (= (and b!690332 res!454745) b!690339))

(assert (= (and b!690339 res!454741) b!690328))

(assert (= (and b!690328 res!454740) b!690326))

(assert (= (and b!690326 res!454732) b!690338))

(assert (= (and b!690338 res!454735) b!690337))

(declare-fun m!653867 () Bool)

(assert (=> start!61700 m!653867))

(declare-fun m!653869 () Bool)

(assert (=> b!690334 m!653869))

(declare-fun m!653871 () Bool)

(assert (=> b!690340 m!653871))

(declare-fun m!653873 () Bool)

(assert (=> b!690327 m!653873))

(declare-fun m!653875 () Bool)

(assert (=> b!690341 m!653875))

(declare-fun m!653877 () Bool)

(assert (=> b!690331 m!653877))

(assert (=> b!690335 m!653871))

(declare-fun m!653879 () Bool)

(assert (=> b!690339 m!653879))

(declare-fun m!653881 () Bool)

(assert (=> b!690337 m!653881))

(declare-fun m!653883 () Bool)

(assert (=> b!690326 m!653883))

(assert (=> b!690326 m!653883))

(declare-fun m!653885 () Bool)

(assert (=> b!690326 m!653885))

(declare-fun m!653887 () Bool)

(assert (=> b!690332 m!653887))

(assert (=> b!690338 m!653883))

(declare-fun m!653889 () Bool)

(assert (=> b!690333 m!653889))

(push 1)

(assert (not b!690339))

(assert (not b!690327))

(assert (not b!690331))

(assert (not b!690333))

(assert (not b!690334))

(assert (not start!61700))

(assert (not b!690340))

(assert (not b!690341))

(assert (not b!690337))

(assert (not b!690326))

(assert (not b!690335))

(assert (not b!690332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95439 () Bool)

(declare-fun res!454859 () Bool)

(declare-fun e!393132 () Bool)

(assert (=> d!95439 (=> res!454859 e!393132)))

(assert (=> d!95439 (= res!454859 (= (select (arr!19047 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95439 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!393132)))

(declare-fun b!690461 () Bool)

(declare-fun e!393133 () Bool)

(assert (=> b!690461 (= e!393132 e!393133)))

(declare-fun res!454860 () Bool)

(assert (=> b!690461 (=> (not res!454860) (not e!393133))))

(assert (=> b!690461 (= res!454860 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19432 a!3626)))))

(declare-fun b!690462 () Bool)

(assert (=> b!690462 (= e!393133 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95439 (not res!454859)) b!690461))

(assert (= (and b!690461 res!454860) b!690462))

(declare-fun m!653943 () Bool)

(assert (=> d!95439 m!653943))

(declare-fun m!653945 () Bool)

(assert (=> b!690462 m!653945))

(assert (=> b!690339 d!95439))

(declare-fun d!95443 () Bool)

(declare-fun lt!316432 () Bool)

(declare-fun content!308 (List!13088) (Set (_ BitVec 64)))

(assert (=> d!95443 (= lt!316432 (set.member k!2843 (content!308 acc!681)))))

(declare-fun e!393156 () Bool)

(assert (=> d!95443 (= lt!316432 e!393156)))

(declare-fun res!454883 () Bool)

(assert (=> d!95443 (=> (not res!454883) (not e!393156))))

(assert (=> d!95443 (= res!454883 (is-Cons!13084 acc!681))))

(assert (=> d!95443 (= (contains!3665 acc!681 k!2843) lt!316432)))

(declare-fun b!690486 () Bool)

(declare-fun e!393157 () Bool)

(assert (=> b!690486 (= e!393156 e!393157)))

(declare-fun res!454882 () Bool)

(assert (=> b!690486 (=> res!454882 e!393157)))

(assert (=> b!690486 (= res!454882 (= (h!14129 acc!681) k!2843))))

(declare-fun b!690487 () Bool)

(assert (=> b!690487 (= e!393157 (contains!3665 (t!19355 acc!681) k!2843))))

(assert (= (and d!95443 res!454883) b!690486))

(assert (= (and b!690486 (not res!454882)) b!690487))

(declare-fun m!653969 () Bool)

(assert (=> d!95443 m!653969))

(declare-fun m!653971 () Bool)

(assert (=> d!95443 m!653971))

(declare-fun m!653973 () Bool)

(assert (=> b!690487 m!653973))

(assert (=> b!690340 d!95443))

(declare-fun b!690527 () Bool)

(declare-fun e!393195 () Bool)

(declare-fun e!393194 () Bool)

(assert (=> b!690527 (= e!393195 e!393194)))

(declare-fun c!78174 () Bool)

(assert (=> b!690527 (= c!78174 (validKeyInArray!0 (select (arr!19047 a!3626) from!3004)))))

(declare-fun b!690528 () Bool)

(declare-fun call!34224 () Bool)

(assert (=> b!690528 (= e!393194 call!34224)))

(declare-fun d!95455 () Bool)

(declare-fun res!454913 () Bool)

(declare-fun e!393192 () Bool)

(assert (=> d!95455 (=> res!454913 e!393192)))

(assert (=> d!95455 (= res!454913 (bvsge from!3004 (size!19432 a!3626)))))

(assert (=> d!95455 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393192)))

(declare-fun b!690529 () Bool)

(assert (=> b!690529 (= e!393192 e!393195)))

(declare-fun res!454915 () Bool)

(assert (=> b!690529 (=> (not res!454915) (not e!393195))))

(declare-fun e!393193 () Bool)

(assert (=> b!690529 (= res!454915 (not e!393193))))

(declare-fun res!454914 () Bool)

(assert (=> b!690529 (=> (not res!454914) (not e!393193))))

(assert (=> b!690529 (= res!454914 (validKeyInArray!0 (select (arr!19047 a!3626) from!3004)))))

(declare-fun b!690530 () Bool)

(assert (=> b!690530 (= e!393193 (contains!3665 acc!681 (select (arr!19047 a!3626) from!3004)))))

(declare-fun b!690531 () Bool)

(assert (=> b!690531 (= e!393194 call!34224)))

(declare-fun bm!34221 () Bool)

(assert (=> bm!34221 (= call!34224 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78174 (Cons!13084 (select (arr!19047 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!95455 (not res!454913)) b!690529))

(assert (= (and b!690529 res!454914) b!690530))

(assert (= (and b!690529 res!454915) b!690527))

(assert (= (and b!690527 c!78174) b!690528))

(assert (= (and b!690527 (not c!78174)) b!690531))

(assert (= (or b!690528 b!690531) bm!34221))

(assert (=> b!690527 m!653883))

(assert (=> b!690527 m!653883))

(assert (=> b!690527 m!653885))

(assert (=> b!690529 m!653883))

(assert (=> b!690529 m!653883))

(assert (=> b!690529 m!653885))

(assert (=> b!690530 m!653883))

(assert (=> b!690530 m!653883))

(declare-fun m!653999 () Bool)

(assert (=> b!690530 m!653999))

(assert (=> bm!34221 m!653883))

(declare-fun m!654001 () Bool)

(assert (=> bm!34221 m!654001))

(assert (=> b!690341 d!95455))

(declare-fun d!95473 () Bool)

(declare-fun res!454920 () Bool)

(declare-fun e!393200 () Bool)

(assert (=> d!95473 (=> res!454920 e!393200)))

(assert (=> d!95473 (= res!454920 (= (select (arr!19047 a!3626) from!3004) k!2843))))

(assert (=> d!95473 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!393200)))

(declare-fun b!690536 () Bool)

(declare-fun e!393201 () Bool)

(assert (=> b!690536 (= e!393200 e!393201)))

(declare-fun res!454921 () Bool)

(assert (=> b!690536 (=> (not res!454921) (not e!393201))))

(assert (=> b!690536 (= res!454921 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19432 a!3626)))))

(declare-fun b!690537 () Bool)

(assert (=> b!690537 (= e!393201 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95473 (not res!454920)) b!690536))

(assert (= (and b!690536 res!454921) b!690537))

(assert (=> d!95473 m!653883))

(declare-fun m!654003 () Bool)

(assert (=> b!690537 m!654003))

(assert (=> b!690337 d!95473))

(declare-fun d!95475 () Bool)

(assert (=> d!95475 (= (validKeyInArray!0 (select (arr!19047 a!3626) from!3004)) (and (not (= (select (arr!19047 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19047 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690326 d!95475))

(declare-fun d!95479 () Bool)

(assert (=> d!95479 (= (array_inv!14843 a!3626) (bvsge (size!19432 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61700 d!95479))

(declare-fun b!690542 () Bool)

(declare-fun e!393209 () Bool)

(declare-fun e!393208 () Bool)

(assert (=> b!690542 (= e!393209 e!393208)))

(declare-fun c!78175 () Bool)

(assert (=> b!690542 (= c!78175 (validKeyInArray!0 (select (arr!19047 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690543 () Bool)

(declare-fun call!34225 () Bool)

(assert (=> b!690543 (= e!393208 call!34225)))

(declare-fun d!95481 () Bool)

(declare-fun res!454926 () Bool)

(declare-fun e!393206 () Bool)

(assert (=> d!95481 (=> res!454926 e!393206)))

(assert (=> d!95481 (= res!454926 (bvsge #b00000000000000000000000000000000 (size!19432 a!3626)))))

(assert (=> d!95481 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13085) e!393206)))

(declare-fun b!690544 () Bool)

(assert (=> b!690544 (= e!393206 e!393209)))

(declare-fun res!454928 () Bool)

(assert (=> b!690544 (=> (not res!454928) (not e!393209))))

(declare-fun e!393207 () Bool)

(assert (=> b!690544 (= res!454928 (not e!393207))))

(declare-fun res!454927 () Bool)

(assert (=> b!690544 (=> (not res!454927) (not e!393207))))

(assert (=> b!690544 (= res!454927 (validKeyInArray!0 (select (arr!19047 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690545 () Bool)

(assert (=> b!690545 (= e!393207 (contains!3665 Nil!13085 (select (arr!19047 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690546 () Bool)

(assert (=> b!690546 (= e!393208 call!34225)))

(declare-fun bm!34222 () Bool)

(assert (=> bm!34222 (= call!34225 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78175 (Cons!13084 (select (arr!19047 a!3626) #b00000000000000000000000000000000) Nil!13085) Nil!13085)))))

(assert (= (and d!95481 (not res!454926)) b!690544))

(assert (= (and b!690544 res!454927) b!690545))

(assert (= (and b!690544 res!454928) b!690542))

(assert (= (and b!690542 c!78175) b!690543))

(assert (= (and b!690542 (not c!78175)) b!690546))

(assert (= (or b!690543 b!690546) bm!34222))

(assert (=> b!690542 m!653943))

(assert (=> b!690542 m!653943))

(declare-fun m!654005 () Bool)

(assert (=> b!690542 m!654005))

(assert (=> b!690544 m!653943))

(assert (=> b!690544 m!653943))

(assert (=> b!690544 m!654005))

(assert (=> b!690545 m!653943))

(assert (=> b!690545 m!653943))

(declare-fun m!654007 () Bool)

(assert (=> b!690545 m!654007))

(assert (=> bm!34222 m!653943))

(declare-fun m!654009 () Bool)

(assert (=> bm!34222 m!654009))

(assert (=> b!690327 d!95481))

(declare-fun d!95483 () Bool)

(declare-fun lt!316435 () Bool)

(assert (=> d!95483 (= lt!316435 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!308 acc!681)))))

(declare-fun e!393212 () Bool)

(assert (=> d!95483 (= lt!316435 e!393212)))

(declare-fun res!454932 () Bool)

(assert (=> d!95483 (=> (not res!454932) (not e!393212))))

(assert (=> d!95483 (= res!454932 (is-Cons!13084 acc!681))))

(assert (=> d!95483 (= (contains!3665 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316435)))

(declare-fun b!690549 () Bool)

(declare-fun e!393213 () Bool)

(assert (=> b!690549 (= e!393212 e!393213)))

(declare-fun res!454931 () Bool)

(assert (=> b!690549 (=> res!454931 e!393213)))

(assert (=> b!690549 (= res!454931 (= (h!14129 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690550 () Bool)

(assert (=> b!690550 (= e!393213 (contains!3665 (t!19355 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95483 res!454932) b!690549))

(assert (= (and b!690549 (not res!454931)) b!690550))

(assert (=> d!95483 m!653969))

(declare-fun m!654015 () Bool)

(assert (=> d!95483 m!654015))

(declare-fun m!654017 () Bool)

(assert (=> b!690550 m!654017))

(assert (=> b!690334 d!95483))

(assert (=> b!690335 d!95443))

(declare-fun d!95487 () Bool)

(declare-fun lt!316436 () Bool)

(assert (=> d!95487 (= lt!316436 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!308 acc!681)))))

(declare-fun e!393216 () Bool)

(assert (=> d!95487 (= lt!316436 e!393216)))

(declare-fun res!454936 () Bool)

(assert (=> d!95487 (=> (not res!454936) (not e!393216))))

(assert (=> d!95487 (= res!454936 (is-Cons!13084 acc!681))))

(assert (=> d!95487 (= (contains!3665 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316436)))

(declare-fun b!690553 () Bool)

(declare-fun e!393217 () Bool)

(assert (=> b!690553 (= e!393216 e!393217)))

(declare-fun res!454935 () Bool)

(assert (=> b!690553 (=> res!454935 e!393217)))

(assert (=> b!690553 (= res!454935 (= (h!14129 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690554 () Bool)

(assert (=> b!690554 (= e!393217 (contains!3665 (t!19355 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95487 res!454936) b!690553))

(assert (= (and b!690553 (not res!454935)) b!690554))

(assert (=> d!95487 m!653969))

(declare-fun m!654021 () Bool)

(assert (=> d!95487 m!654021))

(declare-fun m!654023 () Bool)

(assert (=> b!690554 m!654023))

(assert (=> b!690331 d!95487))

(declare-fun d!95493 () Bool)

(assert (=> d!95493 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690332 d!95493))

(declare-fun d!95495 () Bool)

(declare-fun res!454948 () Bool)

(declare-fun e!393230 () Bool)

(assert (=> d!95495 (=> res!454948 e!393230)))

(assert (=> d!95495 (= res!454948 (is-Nil!13085 acc!681))))

(assert (=> d!95495 (= (noDuplicate!912 acc!681) e!393230)))

(declare-fun b!690568 () Bool)

(declare-fun e!393231 () Bool)

(assert (=> b!690568 (= e!393230 e!393231)))

(declare-fun res!454949 () Bool)

(assert (=> b!690568 (=> (not res!454949) (not e!393231))))

(assert (=> b!690568 (= res!454949 (not (contains!3665 (t!19355 acc!681) (h!14129 acc!681))))))

