; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63028 () Bool)

(assert start!63028)

(declare-fun b!710121 () Bool)

(declare-fun res!473496 () Bool)

(declare-fun e!399609 () Bool)

(assert (=> b!710121 (=> (not res!473496) (not e!399609))))

(declare-datatypes ((List!13284 0))(
  ( (Nil!13281) (Cons!13280 (h!14328 (_ BitVec 64)) (t!19573 List!13284)) )
))
(declare-fun lt!318384 () List!13284)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3936 (List!13284 (_ BitVec 64)) Bool)

(assert (=> b!710121 (= res!473496 (not (contains!3936 lt!318384 k0!2824)))))

(declare-fun b!710122 () Bool)

(declare-fun res!473502 () Bool)

(declare-fun e!399607 () Bool)

(assert (=> b!710122 (=> (not res!473502) (not e!399607))))

(declare-fun acc!652 () List!13284)

(declare-fun noDuplicate!1210 (List!13284) Bool)

(assert (=> b!710122 (= res!473502 (noDuplicate!1210 acc!652))))

(declare-fun b!710123 () Bool)

(declare-fun res!473505 () Bool)

(assert (=> b!710123 (=> (not res!473505) (not e!399607))))

(declare-fun newAcc!49 () List!13284)

(declare-fun subseq!404 (List!13284 List!13284) Bool)

(assert (=> b!710123 (= res!473505 (subseq!404 acc!652 newAcc!49))))

(declare-fun b!710124 () Bool)

(declare-datatypes ((array!40380 0))(
  ( (array!40381 (arr!19336 (Array (_ BitVec 32) (_ BitVec 64))) (size!19733 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40380)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40380 (_ BitVec 32) List!13284) Bool)

(assert (=> b!710124 (= e!399609 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318384)))))

(declare-fun b!710125 () Bool)

(declare-fun res!473501 () Bool)

(assert (=> b!710125 (=> (not res!473501) (not e!399607))))

(declare-fun -!368 (List!13284 (_ BitVec 64)) List!13284)

(assert (=> b!710125 (= res!473501 (= (-!368 newAcc!49 k0!2824) acc!652))))

(declare-fun b!710126 () Bool)

(declare-fun res!473498 () Bool)

(assert (=> b!710126 (=> (not res!473498) (not e!399607))))

(assert (=> b!710126 (= res!473498 (not (contains!3936 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710127 () Bool)

(declare-fun res!473504 () Bool)

(assert (=> b!710127 (=> (not res!473504) (not e!399607))))

(declare-fun arrayContainsKey!0 (array!40380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710127 (= res!473504 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!473495 () Bool)

(assert (=> start!63028 (=> (not res!473495) (not e!399607))))

(assert (=> start!63028 (= res!473495 (and (bvslt (size!19733 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19733 a!3591))))))

(assert (=> start!63028 e!399607))

(assert (=> start!63028 true))

(declare-fun array_inv!15195 (array!40380) Bool)

(assert (=> start!63028 (array_inv!15195 a!3591)))

(declare-fun b!710128 () Bool)

(declare-fun res!473508 () Bool)

(assert (=> b!710128 (=> (not res!473508) (not e!399607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710128 (= res!473508 (validKeyInArray!0 k0!2824))))

(declare-fun b!710129 () Bool)

(declare-fun res!473510 () Bool)

(assert (=> b!710129 (=> (not res!473510) (not e!399607))))

(assert (=> b!710129 (= res!473510 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19733 a!3591)))))

(declare-fun b!710130 () Bool)

(declare-fun res!473493 () Bool)

(assert (=> b!710130 (=> (not res!473493) (not e!399609))))

(assert (=> b!710130 (= res!473493 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710131 () Bool)

(declare-fun res!473494 () Bool)

(assert (=> b!710131 (=> (not res!473494) (not e!399607))))

(assert (=> b!710131 (= res!473494 (noDuplicate!1210 newAcc!49))))

(declare-fun b!710132 () Bool)

(declare-fun res!473499 () Bool)

(assert (=> b!710132 (=> (not res!473499) (not e!399607))))

(assert (=> b!710132 (= res!473499 (not (contains!3936 acc!652 k0!2824)))))

(declare-fun b!710133 () Bool)

(declare-fun res!473492 () Bool)

(assert (=> b!710133 (=> (not res!473492) (not e!399607))))

(assert (=> b!710133 (= res!473492 (not (contains!3936 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710134 () Bool)

(declare-fun res!473500 () Bool)

(assert (=> b!710134 (=> (not res!473500) (not e!399607))))

(assert (=> b!710134 (= res!473500 (not (contains!3936 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710135 () Bool)

(declare-fun res!473506 () Bool)

(assert (=> b!710135 (=> (not res!473506) (not e!399609))))

(assert (=> b!710135 (= res!473506 (noDuplicate!1210 lt!318384))))

(declare-fun b!710136 () Bool)

(declare-fun res!473512 () Bool)

(assert (=> b!710136 (=> (not res!473512) (not e!399607))))

(assert (=> b!710136 (= res!473512 (contains!3936 newAcc!49 k0!2824))))

(declare-fun b!710137 () Bool)

(declare-fun res!473497 () Bool)

(assert (=> b!710137 (=> (not res!473497) (not e!399609))))

(assert (=> b!710137 (= res!473497 (not (contains!3936 lt!318384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710138 () Bool)

(declare-fun res!473491 () Bool)

(assert (=> b!710138 (=> (not res!473491) (not e!399607))))

(assert (=> b!710138 (= res!473491 (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)))))

(declare-fun b!710139 () Bool)

(declare-fun res!473507 () Bool)

(assert (=> b!710139 (=> (not res!473507) (not e!399607))))

(assert (=> b!710139 (= res!473507 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710140 () Bool)

(declare-fun res!473490 () Bool)

(assert (=> b!710140 (=> (not res!473490) (not e!399607))))

(assert (=> b!710140 (= res!473490 (not (contains!3936 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710141 () Bool)

(assert (=> b!710141 (= e!399607 e!399609)))

(declare-fun res!473511 () Bool)

(assert (=> b!710141 (=> (not res!473511) (not e!399609))))

(assert (=> b!710141 (= res!473511 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!512 (List!13284 (_ BitVec 64)) List!13284)

(assert (=> b!710141 (= lt!318384 ($colon$colon!512 acc!652 (select (arr!19336 a!3591) from!2969)))))

(declare-fun b!710142 () Bool)

(declare-fun res!473503 () Bool)

(assert (=> b!710142 (=> (not res!473503) (not e!399609))))

(assert (=> b!710142 (= res!473503 (not (contains!3936 lt!318384 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710143 () Bool)

(declare-fun res!473509 () Bool)

(assert (=> b!710143 (=> (not res!473509) (not e!399609))))

(assert (=> b!710143 (= res!473509 (noDuplicate!1210 ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969))))))

(assert (= (and start!63028 res!473495) b!710122))

(assert (= (and b!710122 res!473502) b!710131))

(assert (= (and b!710131 res!473494) b!710134))

(assert (= (and b!710134 res!473500) b!710126))

(assert (= (and b!710126 res!473498) b!710127))

(assert (= (and b!710127 res!473504) b!710132))

(assert (= (and b!710132 res!473499) b!710128))

(assert (= (and b!710128 res!473508) b!710139))

(assert (= (and b!710139 res!473507) b!710123))

(assert (= (and b!710123 res!473505) b!710136))

(assert (= (and b!710136 res!473512) b!710125))

(assert (= (and b!710125 res!473501) b!710140))

(assert (= (and b!710140 res!473490) b!710133))

(assert (= (and b!710133 res!473492) b!710129))

(assert (= (and b!710129 res!473510) b!710138))

(assert (= (and b!710138 res!473491) b!710141))

(assert (= (and b!710141 res!473511) b!710135))

(assert (= (and b!710135 res!473506) b!710143))

(assert (= (and b!710143 res!473509) b!710137))

(assert (= (and b!710137 res!473497) b!710142))

(assert (= (and b!710142 res!473503) b!710130))

(assert (= (and b!710130 res!473493) b!710121))

(assert (= (and b!710121 res!473496) b!710124))

(declare-fun m!667833 () Bool)

(assert (=> b!710127 m!667833))

(declare-fun m!667835 () Bool)

(assert (=> b!710139 m!667835))

(declare-fun m!667837 () Bool)

(assert (=> b!710123 m!667837))

(declare-fun m!667839 () Bool)

(assert (=> b!710131 m!667839))

(declare-fun m!667841 () Bool)

(assert (=> b!710135 m!667841))

(declare-fun m!667843 () Bool)

(assert (=> b!710133 m!667843))

(declare-fun m!667845 () Bool)

(assert (=> b!710140 m!667845))

(declare-fun m!667847 () Bool)

(assert (=> b!710132 m!667847))

(declare-fun m!667849 () Bool)

(assert (=> b!710137 m!667849))

(declare-fun m!667851 () Bool)

(assert (=> b!710124 m!667851))

(declare-fun m!667853 () Bool)

(assert (=> start!63028 m!667853))

(declare-fun m!667855 () Bool)

(assert (=> b!710136 m!667855))

(declare-fun m!667857 () Bool)

(assert (=> b!710138 m!667857))

(assert (=> b!710138 m!667857))

(declare-fun m!667859 () Bool)

(assert (=> b!710138 m!667859))

(declare-fun m!667861 () Bool)

(assert (=> b!710142 m!667861))

(declare-fun m!667863 () Bool)

(assert (=> b!710125 m!667863))

(declare-fun m!667865 () Bool)

(assert (=> b!710130 m!667865))

(declare-fun m!667867 () Bool)

(assert (=> b!710121 m!667867))

(declare-fun m!667869 () Bool)

(assert (=> b!710122 m!667869))

(declare-fun m!667871 () Bool)

(assert (=> b!710128 m!667871))

(assert (=> b!710141 m!667857))

(assert (=> b!710141 m!667857))

(declare-fun m!667873 () Bool)

(assert (=> b!710141 m!667873))

(assert (=> b!710143 m!667857))

(assert (=> b!710143 m!667857))

(declare-fun m!667875 () Bool)

(assert (=> b!710143 m!667875))

(assert (=> b!710143 m!667875))

(declare-fun m!667877 () Bool)

(assert (=> b!710143 m!667877))

(declare-fun m!667879 () Bool)

(assert (=> b!710134 m!667879))

(declare-fun m!667881 () Bool)

(assert (=> b!710126 m!667881))

(check-sat (not b!710138) (not b!710121) (not b!710136) (not b!710139) (not b!710122) (not b!710142) (not b!710143) (not b!710126) (not b!710124) (not b!710134) (not b!710133) (not b!710137) (not b!710125) (not b!710127) (not b!710128) (not b!710141) (not b!710131) (not start!63028) (not b!710140) (not b!710132) (not b!710135) (not b!710123) (not b!710130))
(check-sat)
(get-model)

(declare-fun d!97371 () Bool)

(declare-fun res!473655 () Bool)

(declare-fun e!399632 () Bool)

(assert (=> d!97371 (=> res!473655 e!399632)))

(get-info :version)

(assert (=> d!97371 (= res!473655 ((_ is Nil!13281) ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969))))))

(assert (=> d!97371 (= (noDuplicate!1210 ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969))) e!399632)))

(declare-fun b!710286 () Bool)

(declare-fun e!399633 () Bool)

(assert (=> b!710286 (= e!399632 e!399633)))

(declare-fun res!473656 () Bool)

(assert (=> b!710286 (=> (not res!473656) (not e!399633))))

(assert (=> b!710286 (= res!473656 (not (contains!3936 (t!19573 ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969))) (h!14328 ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969))))))))

(declare-fun b!710287 () Bool)

(assert (=> b!710287 (= e!399633 (noDuplicate!1210 (t!19573 ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969)))))))

(assert (= (and d!97371 (not res!473655)) b!710286))

(assert (= (and b!710286 res!473656) b!710287))

(declare-fun m!667983 () Bool)

(assert (=> b!710286 m!667983))

(declare-fun m!667985 () Bool)

(assert (=> b!710287 m!667985))

(assert (=> b!710143 d!97371))

(declare-fun d!97373 () Bool)

(assert (=> d!97373 (= ($colon$colon!512 newAcc!49 (select (arr!19336 a!3591) from!2969)) (Cons!13280 (select (arr!19336 a!3591) from!2969) newAcc!49))))

(assert (=> b!710143 d!97373))

(declare-fun d!97375 () Bool)

(declare-fun res!473657 () Bool)

(declare-fun e!399634 () Bool)

(assert (=> d!97375 (=> res!473657 e!399634)))

(assert (=> d!97375 (= res!473657 ((_ is Nil!13281) acc!652))))

(assert (=> d!97375 (= (noDuplicate!1210 acc!652) e!399634)))

(declare-fun b!710288 () Bool)

(declare-fun e!399635 () Bool)

(assert (=> b!710288 (= e!399634 e!399635)))

(declare-fun res!473658 () Bool)

(assert (=> b!710288 (=> (not res!473658) (not e!399635))))

(assert (=> b!710288 (= res!473658 (not (contains!3936 (t!19573 acc!652) (h!14328 acc!652))))))

(declare-fun b!710289 () Bool)

(assert (=> b!710289 (= e!399635 (noDuplicate!1210 (t!19573 acc!652)))))

(assert (= (and d!97375 (not res!473657)) b!710288))

(assert (= (and b!710288 res!473658) b!710289))

(declare-fun m!667987 () Bool)

(assert (=> b!710288 m!667987))

(declare-fun m!667989 () Bool)

(assert (=> b!710289 m!667989))

(assert (=> b!710122 d!97375))

(declare-fun d!97377 () Bool)

(declare-fun lt!318393 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!347 (List!13284) (InoxSet (_ BitVec 64)))

(assert (=> d!97377 (= lt!318393 (select (content!347 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399641 () Bool)

(assert (=> d!97377 (= lt!318393 e!399641)))

(declare-fun res!473664 () Bool)

(assert (=> d!97377 (=> (not res!473664) (not e!399641))))

(assert (=> d!97377 (= res!473664 ((_ is Cons!13280) newAcc!49))))

(assert (=> d!97377 (= (contains!3936 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318393)))

(declare-fun b!710294 () Bool)

(declare-fun e!399640 () Bool)

(assert (=> b!710294 (= e!399641 e!399640)))

(declare-fun res!473663 () Bool)

(assert (=> b!710294 (=> res!473663 e!399640)))

(assert (=> b!710294 (= res!473663 (= (h!14328 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710295 () Bool)

(assert (=> b!710295 (= e!399640 (contains!3936 (t!19573 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97377 res!473664) b!710294))

(assert (= (and b!710294 (not res!473663)) b!710295))

(declare-fun m!667991 () Bool)

(assert (=> d!97377 m!667991))

(declare-fun m!667993 () Bool)

(assert (=> d!97377 m!667993))

(declare-fun m!667995 () Bool)

(assert (=> b!710295 m!667995))

(assert (=> b!710133 d!97377))

(declare-fun d!97379 () Bool)

(declare-fun res!473665 () Bool)

(declare-fun e!399642 () Bool)

(assert (=> d!97379 (=> res!473665 e!399642)))

(assert (=> d!97379 (= res!473665 ((_ is Nil!13281) newAcc!49))))

(assert (=> d!97379 (= (noDuplicate!1210 newAcc!49) e!399642)))

(declare-fun b!710296 () Bool)

(declare-fun e!399643 () Bool)

(assert (=> b!710296 (= e!399642 e!399643)))

(declare-fun res!473666 () Bool)

(assert (=> b!710296 (=> (not res!473666) (not e!399643))))

(assert (=> b!710296 (= res!473666 (not (contains!3936 (t!19573 newAcc!49) (h!14328 newAcc!49))))))

(declare-fun b!710297 () Bool)

(assert (=> b!710297 (= e!399643 (noDuplicate!1210 (t!19573 newAcc!49)))))

(assert (= (and d!97379 (not res!473665)) b!710296))

(assert (= (and b!710296 res!473666) b!710297))

(declare-fun m!667997 () Bool)

(assert (=> b!710296 m!667997))

(declare-fun m!667999 () Bool)

(assert (=> b!710297 m!667999))

(assert (=> b!710131 d!97379))

(declare-fun d!97381 () Bool)

(declare-fun lt!318394 () Bool)

(assert (=> d!97381 (= lt!318394 (select (content!347 lt!318384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399645 () Bool)

(assert (=> d!97381 (= lt!318394 e!399645)))

(declare-fun res!473668 () Bool)

(assert (=> d!97381 (=> (not res!473668) (not e!399645))))

(assert (=> d!97381 (= res!473668 ((_ is Cons!13280) lt!318384))))

(assert (=> d!97381 (= (contains!3936 lt!318384 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318394)))

(declare-fun b!710298 () Bool)

(declare-fun e!399644 () Bool)

(assert (=> b!710298 (= e!399645 e!399644)))

(declare-fun res!473667 () Bool)

(assert (=> b!710298 (=> res!473667 e!399644)))

(assert (=> b!710298 (= res!473667 (= (h!14328 lt!318384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710299 () Bool)

(assert (=> b!710299 (= e!399644 (contains!3936 (t!19573 lt!318384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97381 res!473668) b!710298))

(assert (= (and b!710298 (not res!473667)) b!710299))

(declare-fun m!668001 () Bool)

(assert (=> d!97381 m!668001))

(declare-fun m!668003 () Bool)

(assert (=> d!97381 m!668003))

(declare-fun m!668005 () Bool)

(assert (=> b!710299 m!668005))

(assert (=> b!710142 d!97381))

(declare-fun d!97383 () Bool)

(declare-fun lt!318395 () Bool)

(assert (=> d!97383 (= lt!318395 (select (content!347 lt!318384) k0!2824))))

(declare-fun e!399647 () Bool)

(assert (=> d!97383 (= lt!318395 e!399647)))

(declare-fun res!473670 () Bool)

(assert (=> d!97383 (=> (not res!473670) (not e!399647))))

(assert (=> d!97383 (= res!473670 ((_ is Cons!13280) lt!318384))))

(assert (=> d!97383 (= (contains!3936 lt!318384 k0!2824) lt!318395)))

(declare-fun b!710300 () Bool)

(declare-fun e!399646 () Bool)

(assert (=> b!710300 (= e!399647 e!399646)))

(declare-fun res!473669 () Bool)

(assert (=> b!710300 (=> res!473669 e!399646)))

(assert (=> b!710300 (= res!473669 (= (h!14328 lt!318384) k0!2824))))

(declare-fun b!710301 () Bool)

(assert (=> b!710301 (= e!399646 (contains!3936 (t!19573 lt!318384) k0!2824))))

(assert (= (and d!97383 res!473670) b!710300))

(assert (= (and b!710300 (not res!473669)) b!710301))

(assert (=> d!97383 m!668001))

(declare-fun m!668007 () Bool)

(assert (=> d!97383 m!668007))

(declare-fun m!668009 () Bool)

(assert (=> b!710301 m!668009))

(assert (=> b!710121 d!97383))

(declare-fun d!97385 () Bool)

(assert (=> d!97385 (= (array_inv!15195 a!3591) (bvsge (size!19733 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63028 d!97385))

(declare-fun d!97387 () Bool)

(declare-fun lt!318396 () Bool)

(assert (=> d!97387 (= lt!318396 (select (content!347 acc!652) k0!2824))))

(declare-fun e!399649 () Bool)

(assert (=> d!97387 (= lt!318396 e!399649)))

(declare-fun res!473672 () Bool)

(assert (=> d!97387 (=> (not res!473672) (not e!399649))))

(assert (=> d!97387 (= res!473672 ((_ is Cons!13280) acc!652))))

(assert (=> d!97387 (= (contains!3936 acc!652 k0!2824) lt!318396)))

(declare-fun b!710302 () Bool)

(declare-fun e!399648 () Bool)

(assert (=> b!710302 (= e!399649 e!399648)))

(declare-fun res!473671 () Bool)

(assert (=> b!710302 (=> res!473671 e!399648)))

(assert (=> b!710302 (= res!473671 (= (h!14328 acc!652) k0!2824))))

(declare-fun b!710303 () Bool)

(assert (=> b!710303 (= e!399648 (contains!3936 (t!19573 acc!652) k0!2824))))

(assert (= (and d!97387 res!473672) b!710302))

(assert (= (and b!710302 (not res!473671)) b!710303))

(declare-fun m!668011 () Bool)

(assert (=> d!97387 m!668011))

(declare-fun m!668013 () Bool)

(assert (=> d!97387 m!668013))

(declare-fun m!668015 () Bool)

(assert (=> b!710303 m!668015))

(assert (=> b!710132 d!97387))

(declare-fun d!97389 () Bool)

(declare-fun res!473677 () Bool)

(declare-fun e!399654 () Bool)

(assert (=> d!97389 (=> res!473677 e!399654)))

(assert (=> d!97389 (= res!473677 (= (select (arr!19336 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97389 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399654)))

(declare-fun b!710308 () Bool)

(declare-fun e!399655 () Bool)

(assert (=> b!710308 (= e!399654 e!399655)))

(declare-fun res!473678 () Bool)

(assert (=> b!710308 (=> (not res!473678) (not e!399655))))

(assert (=> b!710308 (= res!473678 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19733 a!3591)))))

(declare-fun b!710309 () Bool)

(assert (=> b!710309 (= e!399655 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97389 (not res!473677)) b!710308))

(assert (= (and b!710308 res!473678) b!710309))

(declare-fun m!668017 () Bool)

(assert (=> d!97389 m!668017))

(declare-fun m!668019 () Bool)

(assert (=> b!710309 m!668019))

(assert (=> b!710130 d!97389))

(declare-fun d!97391 () Bool)

(assert (=> d!97391 (= ($colon$colon!512 acc!652 (select (arr!19336 a!3591) from!2969)) (Cons!13280 (select (arr!19336 a!3591) from!2969) acc!652))))

(assert (=> b!710141 d!97391))

(declare-fun b!710332 () Bool)

(declare-fun e!399677 () Bool)

(declare-fun e!399679 () Bool)

(assert (=> b!710332 (= e!399677 e!399679)))

(declare-fun c!78686 () Bool)

(assert (=> b!710332 (= c!78686 (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)))))

(declare-fun b!710333 () Bool)

(declare-fun call!34461 () Bool)

(assert (=> b!710333 (= e!399679 call!34461)))

(declare-fun b!710334 () Bool)

(assert (=> b!710334 (= e!399679 call!34461)))

(declare-fun d!97393 () Bool)

(declare-fun res!473697 () Bool)

(declare-fun e!399676 () Bool)

(assert (=> d!97393 (=> res!473697 e!399676)))

(assert (=> d!97393 (= res!473697 (bvsge from!2969 (size!19733 a!3591)))))

(assert (=> d!97393 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399676)))

(declare-fun b!710335 () Bool)

(declare-fun e!399678 () Bool)

(assert (=> b!710335 (= e!399678 (contains!3936 acc!652 (select (arr!19336 a!3591) from!2969)))))

(declare-fun bm!34458 () Bool)

(assert (=> bm!34458 (= call!34461 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78686 (Cons!13280 (select (arr!19336 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710336 () Bool)

(assert (=> b!710336 (= e!399676 e!399677)))

(declare-fun res!473699 () Bool)

(assert (=> b!710336 (=> (not res!473699) (not e!399677))))

(assert (=> b!710336 (= res!473699 (not e!399678))))

(declare-fun res!473698 () Bool)

(assert (=> b!710336 (=> (not res!473698) (not e!399678))))

(assert (=> b!710336 (= res!473698 (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)))))

(assert (= (and d!97393 (not res!473697)) b!710336))

(assert (= (and b!710336 res!473698) b!710335))

(assert (= (and b!710336 res!473699) b!710332))

(assert (= (and b!710332 c!78686) b!710334))

(assert (= (and b!710332 (not c!78686)) b!710333))

(assert (= (or b!710334 b!710333) bm!34458))

(assert (=> b!710332 m!667857))

(assert (=> b!710332 m!667857))

(assert (=> b!710332 m!667859))

(assert (=> b!710335 m!667857))

(assert (=> b!710335 m!667857))

(declare-fun m!668033 () Bool)

(assert (=> b!710335 m!668033))

(assert (=> bm!34458 m!667857))

(declare-fun m!668035 () Bool)

(assert (=> bm!34458 m!668035))

(assert (=> b!710336 m!667857))

(assert (=> b!710336 m!667857))

(assert (=> b!710336 m!667859))

(assert (=> b!710139 d!97393))

(declare-fun d!97405 () Bool)

(declare-fun lt!318403 () Bool)

(assert (=> d!97405 (= lt!318403 (select (content!347 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399681 () Bool)

(assert (=> d!97405 (= lt!318403 e!399681)))

(declare-fun res!473701 () Bool)

(assert (=> d!97405 (=> (not res!473701) (not e!399681))))

(assert (=> d!97405 (= res!473701 ((_ is Cons!13280) newAcc!49))))

(assert (=> d!97405 (= (contains!3936 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318403)))

(declare-fun b!710337 () Bool)

(declare-fun e!399680 () Bool)

(assert (=> b!710337 (= e!399681 e!399680)))

(declare-fun res!473700 () Bool)

(assert (=> b!710337 (=> res!473700 e!399680)))

(assert (=> b!710337 (= res!473700 (= (h!14328 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710338 () Bool)

(assert (=> b!710338 (= e!399680 (contains!3936 (t!19573 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97405 res!473701) b!710337))

(assert (= (and b!710337 (not res!473700)) b!710338))

(assert (=> d!97405 m!667991))

(declare-fun m!668037 () Bool)

(assert (=> d!97405 m!668037))

(declare-fun m!668039 () Bool)

(assert (=> b!710338 m!668039))

(assert (=> b!710140 d!97405))

(declare-fun d!97407 () Bool)

(declare-fun res!473706 () Bool)

(declare-fun e!399686 () Bool)

(assert (=> d!97407 (=> res!473706 e!399686)))

(assert (=> d!97407 (= res!473706 (= (select (arr!19336 a!3591) from!2969) k0!2824))))

(assert (=> d!97407 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399686)))

(declare-fun b!710343 () Bool)

(declare-fun e!399687 () Bool)

(assert (=> b!710343 (= e!399686 e!399687)))

(declare-fun res!473707 () Bool)

(assert (=> b!710343 (=> (not res!473707) (not e!399687))))

(assert (=> b!710343 (= res!473707 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19733 a!3591)))))

(declare-fun b!710344 () Bool)

(assert (=> b!710344 (= e!399687 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97407 (not res!473706)) b!710343))

(assert (= (and b!710343 res!473707) b!710344))

(assert (=> d!97407 m!667857))

(declare-fun m!668041 () Bool)

(assert (=> b!710344 m!668041))

(assert (=> b!710127 d!97407))

(declare-fun d!97409 () Bool)

(assert (=> d!97409 (= (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)) (and (not (= (select (arr!19336 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19336 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710138 d!97409))

(declare-fun d!97413 () Bool)

(assert (=> d!97413 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710128 d!97413))

(declare-fun d!97415 () Bool)

(declare-fun lt!318405 () Bool)

(assert (=> d!97415 (= lt!318405 (select (content!347 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399701 () Bool)

(assert (=> d!97415 (= lt!318405 e!399701)))

(declare-fun res!473721 () Bool)

(assert (=> d!97415 (=> (not res!473721) (not e!399701))))

(assert (=> d!97415 (= res!473721 ((_ is Cons!13280) acc!652))))

(assert (=> d!97415 (= (contains!3936 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318405)))

(declare-fun b!710357 () Bool)

(declare-fun e!399700 () Bool)

(assert (=> b!710357 (= e!399701 e!399700)))

(declare-fun res!473720 () Bool)

(assert (=> b!710357 (=> res!473720 e!399700)))

(assert (=> b!710357 (= res!473720 (= (h!14328 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710358 () Bool)

(assert (=> b!710358 (= e!399700 (contains!3936 (t!19573 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97415 res!473721) b!710357))

(assert (= (and b!710357 (not res!473720)) b!710358))

(assert (=> d!97415 m!668011))

(declare-fun m!668053 () Bool)

(assert (=> d!97415 m!668053))

(declare-fun m!668055 () Bool)

(assert (=> b!710358 m!668055))

(assert (=> b!710126 d!97415))

(declare-fun d!97419 () Bool)

(declare-fun lt!318407 () Bool)

(assert (=> d!97419 (= lt!318407 (select (content!347 lt!318384) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399705 () Bool)

(assert (=> d!97419 (= lt!318407 e!399705)))

(declare-fun res!473725 () Bool)

(assert (=> d!97419 (=> (not res!473725) (not e!399705))))

(assert (=> d!97419 (= res!473725 ((_ is Cons!13280) lt!318384))))

(assert (=> d!97419 (= (contains!3936 lt!318384 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318407)))

(declare-fun b!710361 () Bool)

(declare-fun e!399704 () Bool)

(assert (=> b!710361 (= e!399705 e!399704)))

(declare-fun res!473724 () Bool)

(assert (=> b!710361 (=> res!473724 e!399704)))

(assert (=> b!710361 (= res!473724 (= (h!14328 lt!318384) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710362 () Bool)

(assert (=> b!710362 (= e!399704 (contains!3936 (t!19573 lt!318384) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97419 res!473725) b!710361))

(assert (= (and b!710361 (not res!473724)) b!710362))

(assert (=> d!97419 m!668001))

(declare-fun m!668061 () Bool)

(assert (=> d!97419 m!668061))

(declare-fun m!668063 () Bool)

(assert (=> b!710362 m!668063))

(assert (=> b!710137 d!97419))

(declare-fun d!97423 () Bool)

(declare-fun res!473726 () Bool)

(declare-fun e!399706 () Bool)

(assert (=> d!97423 (=> res!473726 e!399706)))

(assert (=> d!97423 (= res!473726 ((_ is Nil!13281) lt!318384))))

(assert (=> d!97423 (= (noDuplicate!1210 lt!318384) e!399706)))

(declare-fun b!710363 () Bool)

(declare-fun e!399707 () Bool)

(assert (=> b!710363 (= e!399706 e!399707)))

(declare-fun res!473727 () Bool)

(assert (=> b!710363 (=> (not res!473727) (not e!399707))))

(assert (=> b!710363 (= res!473727 (not (contains!3936 (t!19573 lt!318384) (h!14328 lt!318384))))))

(declare-fun b!710364 () Bool)

(assert (=> b!710364 (= e!399707 (noDuplicate!1210 (t!19573 lt!318384)))))

(assert (= (and d!97423 (not res!473726)) b!710363))

(assert (= (and b!710363 res!473727) b!710364))

(declare-fun m!668065 () Bool)

(assert (=> b!710363 m!668065))

(declare-fun m!668067 () Bool)

(assert (=> b!710364 m!668067))

(assert (=> b!710135 d!97423))

(declare-fun b!710403 () Bool)

(declare-fun e!399742 () Bool)

(declare-fun lt!318412 () List!13284)

(assert (=> b!710403 (= e!399742 (= (content!347 lt!318412) ((_ map and) (content!347 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34463 () Bool)

(declare-fun call!34466 () List!13284)

(assert (=> bm!34463 (= call!34466 (-!368 (t!19573 newAcc!49) k0!2824))))

(declare-fun d!97427 () Bool)

(assert (=> d!97427 e!399742))

(declare-fun res!473754 () Bool)

(assert (=> d!97427 (=> (not res!473754) (not e!399742))))

(declare-fun size!19736 (List!13284) Int)

(assert (=> d!97427 (= res!473754 (<= (size!19736 lt!318412) (size!19736 newAcc!49)))))

(declare-fun e!399741 () List!13284)

(assert (=> d!97427 (= lt!318412 e!399741)))

(declare-fun c!78693 () Bool)

(assert (=> d!97427 (= c!78693 ((_ is Cons!13280) newAcc!49))))

(assert (=> d!97427 (= (-!368 newAcc!49 k0!2824) lt!318412)))

(declare-fun b!710404 () Bool)

(assert (=> b!710404 (= e!399741 Nil!13281)))

(declare-fun b!710405 () Bool)

(declare-fun e!399743 () List!13284)

(assert (=> b!710405 (= e!399741 e!399743)))

(declare-fun c!78694 () Bool)

(assert (=> b!710405 (= c!78694 (= k0!2824 (h!14328 newAcc!49)))))

(declare-fun b!710406 () Bool)

(assert (=> b!710406 (= e!399743 (Cons!13280 (h!14328 newAcc!49) call!34466))))

(declare-fun b!710407 () Bool)

(assert (=> b!710407 (= e!399743 call!34466)))

(assert (= (and d!97427 c!78693) b!710405))

(assert (= (and d!97427 (not c!78693)) b!710404))

(assert (= (and b!710405 c!78694) b!710407))

(assert (= (and b!710405 (not c!78694)) b!710406))

(assert (= (or b!710407 b!710406) bm!34463))

(assert (= (and d!97427 res!473754) b!710403))

(declare-fun m!668086 () Bool)

(assert (=> b!710403 m!668086))

(assert (=> b!710403 m!667991))

(declare-fun m!668091 () Bool)

(assert (=> b!710403 m!668091))

(declare-fun m!668093 () Bool)

(assert (=> bm!34463 m!668093))

(declare-fun m!668095 () Bool)

(assert (=> d!97427 m!668095))

(declare-fun m!668097 () Bool)

(assert (=> d!97427 m!668097))

(assert (=> b!710125 d!97427))

(declare-fun d!97441 () Bool)

(declare-fun lt!318414 () Bool)

(assert (=> d!97441 (= lt!318414 (select (content!347 newAcc!49) k0!2824))))

(declare-fun e!399753 () Bool)

(assert (=> d!97441 (= lt!318414 e!399753)))

(declare-fun res!473763 () Bool)

(assert (=> d!97441 (=> (not res!473763) (not e!399753))))

(assert (=> d!97441 (= res!473763 ((_ is Cons!13280) newAcc!49))))

(assert (=> d!97441 (= (contains!3936 newAcc!49 k0!2824) lt!318414)))

(declare-fun b!710417 () Bool)

(declare-fun e!399752 () Bool)

(assert (=> b!710417 (= e!399753 e!399752)))

(declare-fun res!473762 () Bool)

(assert (=> b!710417 (=> res!473762 e!399752)))

(assert (=> b!710417 (= res!473762 (= (h!14328 newAcc!49) k0!2824))))

(declare-fun b!710418 () Bool)

(assert (=> b!710418 (= e!399752 (contains!3936 (t!19573 newAcc!49) k0!2824))))

(assert (= (and d!97441 res!473763) b!710417))

(assert (= (and b!710417 (not res!473762)) b!710418))

(assert (=> d!97441 m!667991))

(declare-fun m!668107 () Bool)

(assert (=> d!97441 m!668107))

(declare-fun m!668109 () Bool)

(assert (=> b!710418 m!668109))

(assert (=> b!710136 d!97441))

(declare-fun d!97445 () Bool)

(declare-fun res!473786 () Bool)

(declare-fun e!399774 () Bool)

(assert (=> d!97445 (=> res!473786 e!399774)))

(assert (=> d!97445 (= res!473786 ((_ is Nil!13281) acc!652))))

(assert (=> d!97445 (= (subseq!404 acc!652 newAcc!49) e!399774)))

(declare-fun b!710442 () Bool)

(declare-fun e!399775 () Bool)

(assert (=> b!710442 (= e!399775 (subseq!404 acc!652 (t!19573 newAcc!49)))))

(declare-fun b!710441 () Bool)

(declare-fun e!399776 () Bool)

(assert (=> b!710441 (= e!399776 (subseq!404 (t!19573 acc!652) (t!19573 newAcc!49)))))

(declare-fun b!710440 () Bool)

(declare-fun e!399777 () Bool)

(assert (=> b!710440 (= e!399777 e!399775)))

(declare-fun res!473785 () Bool)

(assert (=> b!710440 (=> res!473785 e!399775)))

(assert (=> b!710440 (= res!473785 e!399776)))

(declare-fun res!473787 () Bool)

(assert (=> b!710440 (=> (not res!473787) (not e!399776))))

(assert (=> b!710440 (= res!473787 (= (h!14328 acc!652) (h!14328 newAcc!49)))))

(declare-fun b!710439 () Bool)

(assert (=> b!710439 (= e!399774 e!399777)))

(declare-fun res!473784 () Bool)

(assert (=> b!710439 (=> (not res!473784) (not e!399777))))

(assert (=> b!710439 (= res!473784 ((_ is Cons!13280) newAcc!49))))

(assert (= (and d!97445 (not res!473786)) b!710439))

(assert (= (and b!710439 res!473784) b!710440))

(assert (= (and b!710440 res!473787) b!710441))

(assert (= (and b!710440 (not res!473785)) b!710442))

(declare-fun m!668131 () Bool)

(assert (=> b!710442 m!668131))

(declare-fun m!668133 () Bool)

(assert (=> b!710441 m!668133))

(assert (=> b!710123 d!97445))

(declare-fun d!97461 () Bool)

(declare-fun lt!318417 () Bool)

(assert (=> d!97461 (= lt!318417 (select (content!347 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399785 () Bool)

(assert (=> d!97461 (= lt!318417 e!399785)))

(declare-fun res!473795 () Bool)

(assert (=> d!97461 (=> (not res!473795) (not e!399785))))

(assert (=> d!97461 (= res!473795 ((_ is Cons!13280) acc!652))))

(assert (=> d!97461 (= (contains!3936 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318417)))

(declare-fun b!710447 () Bool)

(declare-fun e!399784 () Bool)

(assert (=> b!710447 (= e!399785 e!399784)))

(declare-fun res!473794 () Bool)

(assert (=> b!710447 (=> res!473794 e!399784)))

(assert (=> b!710447 (= res!473794 (= (h!14328 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710448 () Bool)

(assert (=> b!710448 (= e!399784 (contains!3936 (t!19573 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97461 res!473795) b!710447))

(assert (= (and b!710447 (not res!473794)) b!710448))

(assert (=> d!97461 m!668011))

(declare-fun m!668135 () Bool)

(assert (=> d!97461 m!668135))

(declare-fun m!668137 () Bool)

(assert (=> b!710448 m!668137))

(assert (=> b!710134 d!97461))

(declare-fun b!710455 () Bool)

(declare-fun e!399789 () Bool)

(declare-fun e!399791 () Bool)

(assert (=> b!710455 (= e!399789 e!399791)))

(declare-fun c!78698 () Bool)

(assert (=> b!710455 (= c!78698 (validKeyInArray!0 (select (arr!19336 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710456 () Bool)

(declare-fun call!34468 () Bool)

(assert (=> b!710456 (= e!399791 call!34468)))

(declare-fun b!710457 () Bool)

(assert (=> b!710457 (= e!399791 call!34468)))

(declare-fun d!97463 () Bool)

(declare-fun res!473796 () Bool)

(declare-fun e!399788 () Bool)

(assert (=> d!97463 (=> res!473796 e!399788)))

(assert (=> d!97463 (= res!473796 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19733 a!3591)))))

(assert (=> d!97463 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318384) e!399788)))

(declare-fun e!399790 () Bool)

(declare-fun b!710458 () Bool)

(assert (=> b!710458 (= e!399790 (contains!3936 lt!318384 (select (arr!19336 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34465 () Bool)

(assert (=> bm!34465 (= call!34468 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78698 (Cons!13280 (select (arr!19336 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318384) lt!318384)))))

(declare-fun b!710459 () Bool)

(assert (=> b!710459 (= e!399788 e!399789)))

(declare-fun res!473798 () Bool)

(assert (=> b!710459 (=> (not res!473798) (not e!399789))))

(assert (=> b!710459 (= res!473798 (not e!399790))))

(declare-fun res!473797 () Bool)

(assert (=> b!710459 (=> (not res!473797) (not e!399790))))

(assert (=> b!710459 (= res!473797 (validKeyInArray!0 (select (arr!19336 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97463 (not res!473796)) b!710459))

(assert (= (and b!710459 res!473797) b!710458))

(assert (= (and b!710459 res!473798) b!710455))

(assert (= (and b!710455 c!78698) b!710457))

(assert (= (and b!710455 (not c!78698)) b!710456))

(assert (= (or b!710457 b!710456) bm!34465))

(assert (=> b!710455 m!668017))

(assert (=> b!710455 m!668017))

(declare-fun m!668139 () Bool)

(assert (=> b!710455 m!668139))

(assert (=> b!710458 m!668017))

(assert (=> b!710458 m!668017))

(declare-fun m!668141 () Bool)

(assert (=> b!710458 m!668141))

(assert (=> bm!34465 m!668017))

(declare-fun m!668143 () Bool)

(assert (=> bm!34465 m!668143))

(assert (=> b!710459 m!668017))

(assert (=> b!710459 m!668017))

(assert (=> b!710459 m!668139))

(assert (=> b!710124 d!97463))

(check-sat (not d!97441) (not b!710448) (not b!710418) (not b!710297) (not b!710335) (not b!710309) (not b!710288) (not b!710441) (not b!710362) (not d!97377) (not b!710458) (not bm!34465) (not b!710289) (not b!710403) (not b!710296) (not b!710459) (not b!710336) (not b!710358) (not b!710338) (not b!710286) (not d!97387) (not b!710332) (not bm!34463) (not d!97405) (not b!710364) (not b!710442) (not d!97461) (not b!710344) (not b!710295) (not d!97415) (not d!97381) (not b!710363) (not b!710301) (not b!710455) (not d!97383) (not d!97427) (not b!710299) (not b!710287) (not d!97419) (not b!710303) (not bm!34458))
(check-sat)
