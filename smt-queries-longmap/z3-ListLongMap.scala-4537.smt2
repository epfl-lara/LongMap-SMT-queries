; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62970 () Bool)

(assert start!62970)

(declare-fun b!709929 () Bool)

(declare-fun res!473435 () Bool)

(declare-fun e!399444 () Bool)

(assert (=> b!709929 (=> (not res!473435) (not e!399444))))

(declare-datatypes ((array!40386 0))(
  ( (array!40387 (arr!19342 (Array (_ BitVec 32) (_ BitVec 64))) (size!19738 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40386)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709929 (= res!473435 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709930 () Bool)

(declare-datatypes ((List!13383 0))(
  ( (Nil!13380) (Cons!13379 (h!14424 (_ BitVec 64)) (t!19680 List!13383)) )
))
(declare-fun lt!318272 () List!13383)

(declare-fun arrayNoDuplicates!0 (array!40386 (_ BitVec 32) List!13383) Bool)

(assert (=> b!709930 (= e!399444 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318272)))))

(declare-fun b!709932 () Bool)

(declare-fun res!473426 () Bool)

(assert (=> b!709932 (=> (not res!473426) (not e!399444))))

(declare-fun noDuplicate!1207 (List!13383) Bool)

(assert (=> b!709932 (= res!473426 (noDuplicate!1207 lt!318272))))

(declare-fun b!709933 () Bool)

(declare-fun res!473430 () Bool)

(assert (=> b!709933 (=> (not res!473430) (not e!399444))))

(declare-fun contains!3960 (List!13383 (_ BitVec 64)) Bool)

(assert (=> b!709933 (= res!473430 (not (contains!3960 lt!318272 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709934 () Bool)

(declare-fun res!473441 () Bool)

(assert (=> b!709934 (=> (not res!473441) (not e!399444))))

(assert (=> b!709934 (= res!473441 (not (contains!3960 lt!318272 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709935 () Bool)

(declare-fun res!473422 () Bool)

(declare-fun e!399445 () Bool)

(assert (=> b!709935 (=> (not res!473422) (not e!399445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709935 (= res!473422 (validKeyInArray!0 k0!2824))))

(declare-fun b!709936 () Bool)

(declare-fun res!473440 () Bool)

(assert (=> b!709936 (=> (not res!473440) (not e!399445))))

(declare-fun newAcc!49 () List!13383)

(assert (=> b!709936 (= res!473440 (contains!3960 newAcc!49 k0!2824))))

(declare-fun b!709937 () Bool)

(declare-fun res!473438 () Bool)

(assert (=> b!709937 (=> (not res!473438) (not e!399445))))

(declare-fun acc!652 () List!13383)

(assert (=> b!709937 (= res!473438 (not (contains!3960 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709938 () Bool)

(declare-fun res!473431 () Bool)

(assert (=> b!709938 (=> (not res!473431) (not e!399445))))

(declare-fun subseq!405 (List!13383 List!13383) Bool)

(assert (=> b!709938 (= res!473431 (subseq!405 acc!652 newAcc!49))))

(declare-fun b!709939 () Bool)

(assert (=> b!709939 (= e!399445 e!399444)))

(declare-fun res!473443 () Bool)

(assert (=> b!709939 (=> (not res!473443) (not e!399444))))

(assert (=> b!709939 (= res!473443 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!516 (List!13383 (_ BitVec 64)) List!13383)

(assert (=> b!709939 (= lt!318272 ($colon$colon!516 acc!652 (select (arr!19342 a!3591) from!2969)))))

(declare-fun b!709940 () Bool)

(declare-fun res!473421 () Bool)

(assert (=> b!709940 (=> (not res!473421) (not e!399445))))

(assert (=> b!709940 (= res!473421 (validKeyInArray!0 (select (arr!19342 a!3591) from!2969)))))

(declare-fun b!709941 () Bool)

(declare-fun res!473437 () Bool)

(assert (=> b!709941 (=> (not res!473437) (not e!399445))))

(assert (=> b!709941 (= res!473437 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19738 a!3591)))))

(declare-fun b!709942 () Bool)

(declare-fun res!473433 () Bool)

(assert (=> b!709942 (=> (not res!473433) (not e!399444))))

(assert (=> b!709942 (= res!473433 (not (contains!3960 lt!318272 k0!2824)))))

(declare-fun b!709943 () Bool)

(declare-fun res!473434 () Bool)

(assert (=> b!709943 (=> (not res!473434) (not e!399445))))

(assert (=> b!709943 (= res!473434 (not (contains!3960 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709944 () Bool)

(declare-fun res!473432 () Bool)

(assert (=> b!709944 (=> (not res!473432) (not e!399445))))

(assert (=> b!709944 (= res!473432 (not (contains!3960 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!473439 () Bool)

(assert (=> start!62970 (=> (not res!473439) (not e!399445))))

(assert (=> start!62970 (= res!473439 (and (bvslt (size!19738 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19738 a!3591))))))

(assert (=> start!62970 e!399445))

(assert (=> start!62970 true))

(declare-fun array_inv!15138 (array!40386) Bool)

(assert (=> start!62970 (array_inv!15138 a!3591)))

(declare-fun b!709931 () Bool)

(declare-fun res!473428 () Bool)

(assert (=> b!709931 (=> (not res!473428) (not e!399444))))

(assert (=> b!709931 (= res!473428 (noDuplicate!1207 ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969))))))

(declare-fun b!709945 () Bool)

(declare-fun res!473436 () Bool)

(assert (=> b!709945 (=> (not res!473436) (not e!399445))))

(assert (=> b!709945 (= res!473436 (not (contains!3960 acc!652 k0!2824)))))

(declare-fun b!709946 () Bool)

(declare-fun res!473442 () Bool)

(assert (=> b!709946 (=> (not res!473442) (not e!399445))))

(assert (=> b!709946 (= res!473442 (noDuplicate!1207 newAcc!49))))

(declare-fun b!709947 () Bool)

(declare-fun res!473429 () Bool)

(assert (=> b!709947 (=> (not res!473429) (not e!399445))))

(assert (=> b!709947 (= res!473429 (not (contains!3960 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709948 () Bool)

(declare-fun res!473423 () Bool)

(assert (=> b!709948 (=> (not res!473423) (not e!399445))))

(assert (=> b!709948 (= res!473423 (noDuplicate!1207 acc!652))))

(declare-fun b!709949 () Bool)

(declare-fun res!473425 () Bool)

(assert (=> b!709949 (=> (not res!473425) (not e!399445))))

(declare-fun -!370 (List!13383 (_ BitVec 64)) List!13383)

(assert (=> b!709949 (= res!473425 (= (-!370 newAcc!49 k0!2824) acc!652))))

(declare-fun b!709950 () Bool)

(declare-fun res!473424 () Bool)

(assert (=> b!709950 (=> (not res!473424) (not e!399445))))

(assert (=> b!709950 (= res!473424 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709951 () Bool)

(declare-fun res!473427 () Bool)

(assert (=> b!709951 (=> (not res!473427) (not e!399445))))

(assert (=> b!709951 (= res!473427 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62970 res!473439) b!709948))

(assert (= (and b!709948 res!473423) b!709946))

(assert (= (and b!709946 res!473442) b!709937))

(assert (= (and b!709937 res!473438) b!709944))

(assert (= (and b!709944 res!473432) b!709951))

(assert (= (and b!709951 res!473427) b!709945))

(assert (= (and b!709945 res!473436) b!709935))

(assert (= (and b!709935 res!473422) b!709950))

(assert (= (and b!709950 res!473424) b!709938))

(assert (= (and b!709938 res!473431) b!709936))

(assert (= (and b!709936 res!473440) b!709949))

(assert (= (and b!709949 res!473425) b!709943))

(assert (= (and b!709943 res!473434) b!709947))

(assert (= (and b!709947 res!473429) b!709941))

(assert (= (and b!709941 res!473437) b!709940))

(assert (= (and b!709940 res!473421) b!709939))

(assert (= (and b!709939 res!473443) b!709932))

(assert (= (and b!709932 res!473426) b!709931))

(assert (= (and b!709931 res!473428) b!709933))

(assert (= (and b!709933 res!473430) b!709934))

(assert (= (and b!709934 res!473441) b!709929))

(assert (= (and b!709929 res!473435) b!709942))

(assert (= (and b!709942 res!473433) b!709930))

(declare-fun m!667125 () Bool)

(assert (=> b!709940 m!667125))

(assert (=> b!709940 m!667125))

(declare-fun m!667127 () Bool)

(assert (=> b!709940 m!667127))

(declare-fun m!667129 () Bool)

(assert (=> start!62970 m!667129))

(declare-fun m!667131 () Bool)

(assert (=> b!709932 m!667131))

(declare-fun m!667133 () Bool)

(assert (=> b!709949 m!667133))

(declare-fun m!667135 () Bool)

(assert (=> b!709933 m!667135))

(declare-fun m!667137 () Bool)

(assert (=> b!709935 m!667137))

(declare-fun m!667139 () Bool)

(assert (=> b!709944 m!667139))

(assert (=> b!709931 m!667125))

(assert (=> b!709931 m!667125))

(declare-fun m!667141 () Bool)

(assert (=> b!709931 m!667141))

(assert (=> b!709931 m!667141))

(declare-fun m!667143 () Bool)

(assert (=> b!709931 m!667143))

(declare-fun m!667145 () Bool)

(assert (=> b!709930 m!667145))

(declare-fun m!667147 () Bool)

(assert (=> b!709946 m!667147))

(declare-fun m!667149 () Bool)

(assert (=> b!709942 m!667149))

(declare-fun m!667151 () Bool)

(assert (=> b!709934 m!667151))

(declare-fun m!667153 () Bool)

(assert (=> b!709947 m!667153))

(declare-fun m!667155 () Bool)

(assert (=> b!709938 m!667155))

(declare-fun m!667157 () Bool)

(assert (=> b!709937 m!667157))

(declare-fun m!667159 () Bool)

(assert (=> b!709929 m!667159))

(declare-fun m!667161 () Bool)

(assert (=> b!709951 m!667161))

(declare-fun m!667163 () Bool)

(assert (=> b!709948 m!667163))

(declare-fun m!667165 () Bool)

(assert (=> b!709936 m!667165))

(assert (=> b!709939 m!667125))

(assert (=> b!709939 m!667125))

(declare-fun m!667167 () Bool)

(assert (=> b!709939 m!667167))

(declare-fun m!667169 () Bool)

(assert (=> b!709950 m!667169))

(declare-fun m!667171 () Bool)

(assert (=> b!709945 m!667171))

(declare-fun m!667173 () Bool)

(assert (=> b!709943 m!667173))

(check-sat (not b!709940) (not b!709931) (not b!709937) (not b!709946) (not b!709934) (not b!709945) (not b!709947) (not b!709938) (not b!709935) (not b!709939) (not b!709948) (not b!709932) (not b!709943) (not b!709933) (not b!709944) (not b!709942) (not b!709950) (not b!709951) (not start!62970) (not b!709930) (not b!709929) (not b!709949) (not b!709936))
(check-sat)
(get-model)

(declare-fun d!97223 () Bool)

(declare-fun res!473517 () Bool)

(declare-fun e!399460 () Bool)

(assert (=> d!97223 (=> res!473517 e!399460)))

(assert (=> d!97223 (= res!473517 (= (select (arr!19342 a!3591) from!2969) k0!2824))))

(assert (=> d!97223 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399460)))

(declare-fun b!710025 () Bool)

(declare-fun e!399461 () Bool)

(assert (=> b!710025 (= e!399460 e!399461)))

(declare-fun res!473518 () Bool)

(assert (=> b!710025 (=> (not res!473518) (not e!399461))))

(assert (=> b!710025 (= res!473518 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19738 a!3591)))))

(declare-fun b!710026 () Bool)

(assert (=> b!710026 (= e!399461 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97223 (not res!473517)) b!710025))

(assert (= (and b!710025 res!473518) b!710026))

(assert (=> d!97223 m!667125))

(declare-fun m!667225 () Bool)

(assert (=> b!710026 m!667225))

(assert (=> b!709951 d!97223))

(declare-fun b!710037 () Bool)

(declare-fun e!399472 () Bool)

(declare-fun call!34455 () Bool)

(assert (=> b!710037 (= e!399472 call!34455)))

(declare-fun e!399473 () Bool)

(declare-fun b!710038 () Bool)

(assert (=> b!710038 (= e!399473 (contains!3960 lt!318272 (select (arr!19342 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710039 () Bool)

(assert (=> b!710039 (= e!399472 call!34455)))

(declare-fun bm!34452 () Bool)

(declare-fun c!78623 () Bool)

(assert (=> bm!34452 (= call!34455 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78623 (Cons!13379 (select (arr!19342 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318272) lt!318272)))))

(declare-fun b!710040 () Bool)

(declare-fun e!399471 () Bool)

(declare-fun e!399470 () Bool)

(assert (=> b!710040 (= e!399471 e!399470)))

(declare-fun res!473526 () Bool)

(assert (=> b!710040 (=> (not res!473526) (not e!399470))))

(assert (=> b!710040 (= res!473526 (not e!399473))))

(declare-fun res!473527 () Bool)

(assert (=> b!710040 (=> (not res!473527) (not e!399473))))

(assert (=> b!710040 (= res!473527 (validKeyInArray!0 (select (arr!19342 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710041 () Bool)

(assert (=> b!710041 (= e!399470 e!399472)))

(assert (=> b!710041 (= c!78623 (validKeyInArray!0 (select (arr!19342 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97225 () Bool)

(declare-fun res!473525 () Bool)

(assert (=> d!97225 (=> res!473525 e!399471)))

(assert (=> d!97225 (= res!473525 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19738 a!3591)))))

(assert (=> d!97225 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318272) e!399471)))

(assert (= (and d!97225 (not res!473525)) b!710040))

(assert (= (and b!710040 res!473527) b!710038))

(assert (= (and b!710040 res!473526) b!710041))

(assert (= (and b!710041 c!78623) b!710037))

(assert (= (and b!710041 (not c!78623)) b!710039))

(assert (= (or b!710037 b!710039) bm!34452))

(declare-fun m!667227 () Bool)

(assert (=> b!710038 m!667227))

(assert (=> b!710038 m!667227))

(declare-fun m!667229 () Bool)

(assert (=> b!710038 m!667229))

(assert (=> bm!34452 m!667227))

(declare-fun m!667231 () Bool)

(assert (=> bm!34452 m!667231))

(assert (=> b!710040 m!667227))

(assert (=> b!710040 m!667227))

(declare-fun m!667233 () Bool)

(assert (=> b!710040 m!667233))

(assert (=> b!710041 m!667227))

(assert (=> b!710041 m!667227))

(assert (=> b!710041 m!667233))

(assert (=> b!709930 d!97225))

(declare-fun d!97227 () Bool)

(assert (=> d!97227 (= ($colon$colon!516 acc!652 (select (arr!19342 a!3591) from!2969)) (Cons!13379 (select (arr!19342 a!3591) from!2969) acc!652))))

(assert (=> b!709939 d!97227))

(declare-fun b!710042 () Bool)

(declare-fun e!399476 () Bool)

(declare-fun call!34456 () Bool)

(assert (=> b!710042 (= e!399476 call!34456)))

(declare-fun e!399477 () Bool)

(declare-fun b!710043 () Bool)

(assert (=> b!710043 (= e!399477 (contains!3960 acc!652 (select (arr!19342 a!3591) from!2969)))))

(declare-fun b!710044 () Bool)

(assert (=> b!710044 (= e!399476 call!34456)))

(declare-fun c!78624 () Bool)

(declare-fun bm!34453 () Bool)

(assert (=> bm!34453 (= call!34456 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78624 (Cons!13379 (select (arr!19342 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710045 () Bool)

(declare-fun e!399475 () Bool)

(declare-fun e!399474 () Bool)

(assert (=> b!710045 (= e!399475 e!399474)))

(declare-fun res!473529 () Bool)

(assert (=> b!710045 (=> (not res!473529) (not e!399474))))

(assert (=> b!710045 (= res!473529 (not e!399477))))

(declare-fun res!473530 () Bool)

(assert (=> b!710045 (=> (not res!473530) (not e!399477))))

(assert (=> b!710045 (= res!473530 (validKeyInArray!0 (select (arr!19342 a!3591) from!2969)))))

(declare-fun b!710046 () Bool)

(assert (=> b!710046 (= e!399474 e!399476)))

(assert (=> b!710046 (= c!78624 (validKeyInArray!0 (select (arr!19342 a!3591) from!2969)))))

(declare-fun d!97229 () Bool)

(declare-fun res!473528 () Bool)

(assert (=> d!97229 (=> res!473528 e!399475)))

(assert (=> d!97229 (= res!473528 (bvsge from!2969 (size!19738 a!3591)))))

(assert (=> d!97229 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399475)))

(assert (= (and d!97229 (not res!473528)) b!710045))

(assert (= (and b!710045 res!473530) b!710043))

(assert (= (and b!710045 res!473529) b!710046))

(assert (= (and b!710046 c!78624) b!710042))

(assert (= (and b!710046 (not c!78624)) b!710044))

(assert (= (or b!710042 b!710044) bm!34453))

(assert (=> b!710043 m!667125))

(assert (=> b!710043 m!667125))

(declare-fun m!667235 () Bool)

(assert (=> b!710043 m!667235))

(assert (=> bm!34453 m!667125))

(declare-fun m!667237 () Bool)

(assert (=> bm!34453 m!667237))

(assert (=> b!710045 m!667125))

(assert (=> b!710045 m!667125))

(assert (=> b!710045 m!667127))

(assert (=> b!710046 m!667125))

(assert (=> b!710046 m!667125))

(assert (=> b!710046 m!667127))

(assert (=> b!709950 d!97229))

(declare-fun d!97231 () Bool)

(declare-fun res!473531 () Bool)

(declare-fun e!399478 () Bool)

(assert (=> d!97231 (=> res!473531 e!399478)))

(assert (=> d!97231 (= res!473531 (= (select (arr!19342 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97231 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399478)))

(declare-fun b!710047 () Bool)

(declare-fun e!399479 () Bool)

(assert (=> b!710047 (= e!399478 e!399479)))

(declare-fun res!473532 () Bool)

(assert (=> b!710047 (=> (not res!473532) (not e!399479))))

(assert (=> b!710047 (= res!473532 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19738 a!3591)))))

(declare-fun b!710048 () Bool)

(assert (=> b!710048 (= e!399479 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97231 (not res!473531)) b!710047))

(assert (= (and b!710047 res!473532) b!710048))

(assert (=> d!97231 m!667227))

(declare-fun m!667239 () Bool)

(assert (=> b!710048 m!667239))

(assert (=> b!709929 d!97231))

(declare-fun d!97233 () Bool)

(assert (=> d!97233 (= (array_inv!15138 a!3591) (bvsge (size!19738 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62970 d!97233))

(declare-fun d!97235 () Bool)

(assert (=> d!97235 (= (validKeyInArray!0 (select (arr!19342 a!3591) from!2969)) (and (not (= (select (arr!19342 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19342 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709940 d!97235))

(declare-fun d!97239 () Bool)

(declare-fun res!473555 () Bool)

(declare-fun e!399501 () Bool)

(assert (=> d!97239 (=> res!473555 e!399501)))

(get-info :version)

(assert (=> d!97239 (= res!473555 ((_ is Nil!13380) acc!652))))

(assert (=> d!97239 (= (subseq!405 acc!652 newAcc!49) e!399501)))

(declare-fun b!710071 () Bool)

(declare-fun e!399503 () Bool)

(assert (=> b!710071 (= e!399503 (subseq!405 (t!19680 acc!652) (t!19680 newAcc!49)))))

(declare-fun b!710070 () Bool)

(declare-fun e!399500 () Bool)

(declare-fun e!399502 () Bool)

(assert (=> b!710070 (= e!399500 e!399502)))

(declare-fun res!473556 () Bool)

(assert (=> b!710070 (=> res!473556 e!399502)))

(assert (=> b!710070 (= res!473556 e!399503)))

(declare-fun res!473553 () Bool)

(assert (=> b!710070 (=> (not res!473553) (not e!399503))))

(assert (=> b!710070 (= res!473553 (= (h!14424 acc!652) (h!14424 newAcc!49)))))

(declare-fun b!710069 () Bool)

(assert (=> b!710069 (= e!399501 e!399500)))

(declare-fun res!473554 () Bool)

(assert (=> b!710069 (=> (not res!473554) (not e!399500))))

(assert (=> b!710069 (= res!473554 ((_ is Cons!13379) newAcc!49))))

(declare-fun b!710072 () Bool)

(assert (=> b!710072 (= e!399502 (subseq!405 acc!652 (t!19680 newAcc!49)))))

(assert (= (and d!97239 (not res!473555)) b!710069))

(assert (= (and b!710069 res!473554) b!710070))

(assert (= (and b!710070 res!473553) b!710071))

(assert (= (and b!710070 (not res!473556)) b!710072))

(declare-fun m!667253 () Bool)

(assert (=> b!710071 m!667253))

(declare-fun m!667255 () Bool)

(assert (=> b!710072 m!667255))

(assert (=> b!709938 d!97239))

(declare-fun bm!34459 () Bool)

(declare-fun call!34462 () List!13383)

(assert (=> bm!34459 (= call!34462 (-!370 (t!19680 newAcc!49) k0!2824))))

(declare-fun b!710119 () Bool)

(declare-fun lt!318288 () List!13383)

(declare-fun e!399542 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!348 (List!13383) (InoxSet (_ BitVec 64)))

(assert (=> b!710119 (= e!399542 (= (content!348 lt!318288) ((_ map and) (content!348 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!710120 () Bool)

(declare-fun e!399543 () List!13383)

(assert (=> b!710120 (= e!399543 call!34462)))

(declare-fun d!97247 () Bool)

(assert (=> d!97247 e!399542))

(declare-fun res!473582 () Bool)

(assert (=> d!97247 (=> (not res!473582) (not e!399542))))

(declare-fun size!19741 (List!13383) Int)

(assert (=> d!97247 (= res!473582 (<= (size!19741 lt!318288) (size!19741 newAcc!49)))))

(declare-fun e!399541 () List!13383)

(assert (=> d!97247 (= lt!318288 e!399541)))

(declare-fun c!78635 () Bool)

(assert (=> d!97247 (= c!78635 ((_ is Cons!13379) newAcc!49))))

(assert (=> d!97247 (= (-!370 newAcc!49 k0!2824) lt!318288)))

(declare-fun b!710118 () Bool)

(assert (=> b!710118 (= e!399543 (Cons!13379 (h!14424 newAcc!49) call!34462))))

(declare-fun b!710121 () Bool)

(assert (=> b!710121 (= e!399541 Nil!13380)))

(declare-fun b!710122 () Bool)

(assert (=> b!710122 (= e!399541 e!399543)))

(declare-fun c!78636 () Bool)

(assert (=> b!710122 (= c!78636 (= k0!2824 (h!14424 newAcc!49)))))

(assert (= (and d!97247 c!78635) b!710122))

(assert (= (and d!97247 (not c!78635)) b!710121))

(assert (= (and b!710122 c!78636) b!710120))

(assert (= (and b!710122 (not c!78636)) b!710118))

(assert (= (or b!710120 b!710118) bm!34459))

(assert (= (and d!97247 res!473582) b!710119))

(declare-fun m!667279 () Bool)

(assert (=> bm!34459 m!667279))

(declare-fun m!667283 () Bool)

(assert (=> b!710119 m!667283))

(declare-fun m!667285 () Bool)

(assert (=> b!710119 m!667285))

(declare-fun m!667289 () Bool)

(assert (=> b!710119 m!667289))

(declare-fun m!667291 () Bool)

(assert (=> d!97247 m!667291))

(declare-fun m!667293 () Bool)

(assert (=> d!97247 m!667293))

(assert (=> b!709949 d!97247))

(declare-fun d!97263 () Bool)

(declare-fun lt!318292 () Bool)

(assert (=> d!97263 (= lt!318292 (select (content!348 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399558 () Bool)

(assert (=> d!97263 (= lt!318292 e!399558)))

(declare-fun res!473597 () Bool)

(assert (=> d!97263 (=> (not res!473597) (not e!399558))))

(assert (=> d!97263 (= res!473597 ((_ is Cons!13379) newAcc!49))))

(assert (=> d!97263 (= (contains!3960 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318292)))

(declare-fun b!710137 () Bool)

(declare-fun e!399559 () Bool)

(assert (=> b!710137 (= e!399558 e!399559)))

(declare-fun res!473598 () Bool)

(assert (=> b!710137 (=> res!473598 e!399559)))

(assert (=> b!710137 (= res!473598 (= (h!14424 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710138 () Bool)

(assert (=> b!710138 (= e!399559 (contains!3960 (t!19680 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97263 res!473597) b!710137))

(assert (= (and b!710137 (not res!473598)) b!710138))

(assert (=> d!97263 m!667285))

(declare-fun m!667305 () Bool)

(assert (=> d!97263 m!667305))

(declare-fun m!667307 () Bool)

(assert (=> b!710138 m!667307))

(assert (=> b!709947 d!97263))

(declare-fun d!97271 () Bool)

(declare-fun lt!318293 () Bool)

(assert (=> d!97271 (= lt!318293 (select (content!348 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399562 () Bool)

(assert (=> d!97271 (= lt!318293 e!399562)))

(declare-fun res!473601 () Bool)

(assert (=> d!97271 (=> (not res!473601) (not e!399562))))

(assert (=> d!97271 (= res!473601 ((_ is Cons!13379) acc!652))))

(assert (=> d!97271 (= (contains!3960 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318293)))

(declare-fun b!710141 () Bool)

(declare-fun e!399563 () Bool)

(assert (=> b!710141 (= e!399562 e!399563)))

(declare-fun res!473602 () Bool)

(assert (=> b!710141 (=> res!473602 e!399563)))

(assert (=> b!710141 (= res!473602 (= (h!14424 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710142 () Bool)

(assert (=> b!710142 (= e!399563 (contains!3960 (t!19680 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97271 res!473601) b!710141))

(assert (= (and b!710141 (not res!473602)) b!710142))

(declare-fun m!667309 () Bool)

(assert (=> d!97271 m!667309))

(declare-fun m!667311 () Bool)

(assert (=> d!97271 m!667311))

(declare-fun m!667313 () Bool)

(assert (=> b!710142 m!667313))

(assert (=> b!709937 d!97271))

(declare-fun d!97273 () Bool)

(declare-fun res!473611 () Bool)

(declare-fun e!399574 () Bool)

(assert (=> d!97273 (=> res!473611 e!399574)))

(assert (=> d!97273 (= res!473611 ((_ is Nil!13380) acc!652))))

(assert (=> d!97273 (= (noDuplicate!1207 acc!652) e!399574)))

(declare-fun b!710155 () Bool)

(declare-fun e!399575 () Bool)

(assert (=> b!710155 (= e!399574 e!399575)))

(declare-fun res!473612 () Bool)

(assert (=> b!710155 (=> (not res!473612) (not e!399575))))

(assert (=> b!710155 (= res!473612 (not (contains!3960 (t!19680 acc!652) (h!14424 acc!652))))))

(declare-fun b!710156 () Bool)

(assert (=> b!710156 (= e!399575 (noDuplicate!1207 (t!19680 acc!652)))))

(assert (= (and d!97273 (not res!473611)) b!710155))

(assert (= (and b!710155 res!473612) b!710156))

(declare-fun m!667315 () Bool)

(assert (=> b!710155 m!667315))

(declare-fun m!667317 () Bool)

(assert (=> b!710156 m!667317))

(assert (=> b!709948 d!97273))

(declare-fun d!97275 () Bool)

(assert (=> d!97275 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709935 d!97275))

(declare-fun d!97277 () Bool)

(declare-fun res!473619 () Bool)

(declare-fun e!399582 () Bool)

(assert (=> d!97277 (=> res!473619 e!399582)))

(assert (=> d!97277 (= res!473619 ((_ is Nil!13380) newAcc!49))))

(assert (=> d!97277 (= (noDuplicate!1207 newAcc!49) e!399582)))

(declare-fun b!710163 () Bool)

(declare-fun e!399583 () Bool)

(assert (=> b!710163 (= e!399582 e!399583)))

(declare-fun res!473620 () Bool)

(assert (=> b!710163 (=> (not res!473620) (not e!399583))))

(assert (=> b!710163 (= res!473620 (not (contains!3960 (t!19680 newAcc!49) (h!14424 newAcc!49))))))

(declare-fun b!710164 () Bool)

(assert (=> b!710164 (= e!399583 (noDuplicate!1207 (t!19680 newAcc!49)))))

(assert (= (and d!97277 (not res!473619)) b!710163))

(assert (= (and b!710163 res!473620) b!710164))

(declare-fun m!667319 () Bool)

(assert (=> b!710163 m!667319))

(declare-fun m!667321 () Bool)

(assert (=> b!710164 m!667321))

(assert (=> b!709946 d!97277))

(declare-fun d!97279 () Bool)

(declare-fun lt!318294 () Bool)

(assert (=> d!97279 (= lt!318294 (select (content!348 newAcc!49) k0!2824))))

(declare-fun e!399590 () Bool)

(assert (=> d!97279 (= lt!318294 e!399590)))

(declare-fun res!473624 () Bool)

(assert (=> d!97279 (=> (not res!473624) (not e!399590))))

(assert (=> d!97279 (= res!473624 ((_ is Cons!13379) newAcc!49))))

(assert (=> d!97279 (= (contains!3960 newAcc!49 k0!2824) lt!318294)))

(declare-fun b!710174 () Bool)

(declare-fun e!399591 () Bool)

(assert (=> b!710174 (= e!399590 e!399591)))

(declare-fun res!473625 () Bool)

(assert (=> b!710174 (=> res!473625 e!399591)))

(assert (=> b!710174 (= res!473625 (= (h!14424 newAcc!49) k0!2824))))

(declare-fun b!710175 () Bool)

(assert (=> b!710175 (= e!399591 (contains!3960 (t!19680 newAcc!49) k0!2824))))

(assert (= (and d!97279 res!473624) b!710174))

(assert (= (and b!710174 (not res!473625)) b!710175))

(assert (=> d!97279 m!667285))

(declare-fun m!667323 () Bool)

(assert (=> d!97279 m!667323))

(declare-fun m!667325 () Bool)

(assert (=> b!710175 m!667325))

(assert (=> b!709936 d!97279))

(declare-fun d!97281 () Bool)

(declare-fun lt!318295 () Bool)

(assert (=> d!97281 (= lt!318295 (select (content!348 lt!318272) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399592 () Bool)

(assert (=> d!97281 (= lt!318295 e!399592)))

(declare-fun res!473626 () Bool)

(assert (=> d!97281 (=> (not res!473626) (not e!399592))))

(assert (=> d!97281 (= res!473626 ((_ is Cons!13379) lt!318272))))

(assert (=> d!97281 (= (contains!3960 lt!318272 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318295)))

(declare-fun b!710176 () Bool)

(declare-fun e!399593 () Bool)

(assert (=> b!710176 (= e!399592 e!399593)))

(declare-fun res!473627 () Bool)

(assert (=> b!710176 (=> res!473627 e!399593)))

(assert (=> b!710176 (= res!473627 (= (h!14424 lt!318272) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710177 () Bool)

(assert (=> b!710177 (= e!399593 (contains!3960 (t!19680 lt!318272) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97281 res!473626) b!710176))

(assert (= (and b!710176 (not res!473627)) b!710177))

(declare-fun m!667331 () Bool)

(assert (=> d!97281 m!667331))

(declare-fun m!667333 () Bool)

(assert (=> d!97281 m!667333))

(declare-fun m!667335 () Bool)

(assert (=> b!710177 m!667335))

(assert (=> b!709934 d!97281))

(declare-fun d!97285 () Bool)

(declare-fun lt!318297 () Bool)

(assert (=> d!97285 (= lt!318297 (select (content!348 acc!652) k0!2824))))

(declare-fun e!399596 () Bool)

(assert (=> d!97285 (= lt!318297 e!399596)))

(declare-fun res!473630 () Bool)

(assert (=> d!97285 (=> (not res!473630) (not e!399596))))

(assert (=> d!97285 (= res!473630 ((_ is Cons!13379) acc!652))))

(assert (=> d!97285 (= (contains!3960 acc!652 k0!2824) lt!318297)))

(declare-fun b!710180 () Bool)

(declare-fun e!399597 () Bool)

(assert (=> b!710180 (= e!399596 e!399597)))

(declare-fun res!473631 () Bool)

(assert (=> b!710180 (=> res!473631 e!399597)))

(assert (=> b!710180 (= res!473631 (= (h!14424 acc!652) k0!2824))))

(declare-fun b!710181 () Bool)

(assert (=> b!710181 (= e!399597 (contains!3960 (t!19680 acc!652) k0!2824))))

(assert (= (and d!97285 res!473630) b!710180))

(assert (= (and b!710180 (not res!473631)) b!710181))

(assert (=> d!97285 m!667309))

(declare-fun m!667343 () Bool)

(assert (=> d!97285 m!667343))

(declare-fun m!667345 () Bool)

(assert (=> b!710181 m!667345))

(assert (=> b!709945 d!97285))

(declare-fun d!97289 () Bool)

(declare-fun lt!318298 () Bool)

(assert (=> d!97289 (= lt!318298 (select (content!348 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399598 () Bool)

(assert (=> d!97289 (= lt!318298 e!399598)))

(declare-fun res!473632 () Bool)

(assert (=> d!97289 (=> (not res!473632) (not e!399598))))

(assert (=> d!97289 (= res!473632 ((_ is Cons!13379) newAcc!49))))

(assert (=> d!97289 (= (contains!3960 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318298)))

(declare-fun b!710182 () Bool)

(declare-fun e!399599 () Bool)

(assert (=> b!710182 (= e!399598 e!399599)))

(declare-fun res!473633 () Bool)

(assert (=> b!710182 (=> res!473633 e!399599)))

(assert (=> b!710182 (= res!473633 (= (h!14424 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710183 () Bool)

(assert (=> b!710183 (= e!399599 (contains!3960 (t!19680 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97289 res!473632) b!710182))

(assert (= (and b!710182 (not res!473633)) b!710183))

(assert (=> d!97289 m!667285))

(declare-fun m!667347 () Bool)

(assert (=> d!97289 m!667347))

(declare-fun m!667349 () Bool)

(assert (=> b!710183 m!667349))

(assert (=> b!709943 d!97289))

(declare-fun d!97291 () Bool)

(declare-fun lt!318299 () Bool)

(assert (=> d!97291 (= lt!318299 (select (content!348 lt!318272) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399600 () Bool)

(assert (=> d!97291 (= lt!318299 e!399600)))

(declare-fun res!473634 () Bool)

(assert (=> d!97291 (=> (not res!473634) (not e!399600))))

(assert (=> d!97291 (= res!473634 ((_ is Cons!13379) lt!318272))))

(assert (=> d!97291 (= (contains!3960 lt!318272 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318299)))

(declare-fun b!710184 () Bool)

(declare-fun e!399601 () Bool)

(assert (=> b!710184 (= e!399600 e!399601)))

(declare-fun res!473635 () Bool)

(assert (=> b!710184 (=> res!473635 e!399601)))

(assert (=> b!710184 (= res!473635 (= (h!14424 lt!318272) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710185 () Bool)

(assert (=> b!710185 (= e!399601 (contains!3960 (t!19680 lt!318272) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97291 res!473634) b!710184))

(assert (= (and b!710184 (not res!473635)) b!710185))

(assert (=> d!97291 m!667331))

(declare-fun m!667351 () Bool)

(assert (=> d!97291 m!667351))

(declare-fun m!667353 () Bool)

(assert (=> b!710185 m!667353))

(assert (=> b!709933 d!97291))

(declare-fun d!97295 () Bool)

(declare-fun lt!318301 () Bool)

(assert (=> d!97295 (= lt!318301 (select (content!348 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399604 () Bool)

(assert (=> d!97295 (= lt!318301 e!399604)))

(declare-fun res!473638 () Bool)

(assert (=> d!97295 (=> (not res!473638) (not e!399604))))

(assert (=> d!97295 (= res!473638 ((_ is Cons!13379) acc!652))))

(assert (=> d!97295 (= (contains!3960 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318301)))

(declare-fun b!710188 () Bool)

(declare-fun e!399605 () Bool)

(assert (=> b!710188 (= e!399604 e!399605)))

(declare-fun res!473639 () Bool)

(assert (=> b!710188 (=> res!473639 e!399605)))

(assert (=> b!710188 (= res!473639 (= (h!14424 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710189 () Bool)

(assert (=> b!710189 (= e!399605 (contains!3960 (t!19680 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97295 res!473638) b!710188))

(assert (= (and b!710188 (not res!473639)) b!710189))

(assert (=> d!97295 m!667309))

(declare-fun m!667359 () Bool)

(assert (=> d!97295 m!667359))

(declare-fun m!667361 () Bool)

(assert (=> b!710189 m!667361))

(assert (=> b!709944 d!97295))

(declare-fun d!97299 () Bool)

(declare-fun res!473642 () Bool)

(declare-fun e!399608 () Bool)

(assert (=> d!97299 (=> res!473642 e!399608)))

(assert (=> d!97299 (= res!473642 ((_ is Nil!13380) ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969))))))

(assert (=> d!97299 (= (noDuplicate!1207 ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969))) e!399608)))

(declare-fun b!710192 () Bool)

(declare-fun e!399609 () Bool)

(assert (=> b!710192 (= e!399608 e!399609)))

(declare-fun res!473643 () Bool)

(assert (=> b!710192 (=> (not res!473643) (not e!399609))))

(assert (=> b!710192 (= res!473643 (not (contains!3960 (t!19680 ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969))) (h!14424 ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969))))))))

(declare-fun b!710193 () Bool)

(assert (=> b!710193 (= e!399609 (noDuplicate!1207 (t!19680 ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969)))))))

(assert (= (and d!97299 (not res!473642)) b!710192))

(assert (= (and b!710192 res!473643) b!710193))

(declare-fun m!667367 () Bool)

(assert (=> b!710192 m!667367))

(declare-fun m!667369 () Bool)

(assert (=> b!710193 m!667369))

(assert (=> b!709931 d!97299))

(declare-fun d!97303 () Bool)

(assert (=> d!97303 (= ($colon$colon!516 newAcc!49 (select (arr!19342 a!3591) from!2969)) (Cons!13379 (select (arr!19342 a!3591) from!2969) newAcc!49))))

(assert (=> b!709931 d!97303))

(declare-fun d!97307 () Bool)

(declare-fun lt!318304 () Bool)

(assert (=> d!97307 (= lt!318304 (select (content!348 lt!318272) k0!2824))))

(declare-fun e!399618 () Bool)

(assert (=> d!97307 (= lt!318304 e!399618)))

(declare-fun res!473651 () Bool)

(assert (=> d!97307 (=> (not res!473651) (not e!399618))))

(assert (=> d!97307 (= res!473651 ((_ is Cons!13379) lt!318272))))

(assert (=> d!97307 (= (contains!3960 lt!318272 k0!2824) lt!318304)))

(declare-fun b!710203 () Bool)

(declare-fun e!399619 () Bool)

(assert (=> b!710203 (= e!399618 e!399619)))

(declare-fun res!473652 () Bool)

(assert (=> b!710203 (=> res!473652 e!399619)))

(assert (=> b!710203 (= res!473652 (= (h!14424 lt!318272) k0!2824))))

(declare-fun b!710204 () Bool)

(assert (=> b!710204 (= e!399619 (contains!3960 (t!19680 lt!318272) k0!2824))))

(assert (= (and d!97307 res!473651) b!710203))

(assert (= (and b!710203 (not res!473652)) b!710204))

(assert (=> d!97307 m!667331))

(declare-fun m!667375 () Bool)

(assert (=> d!97307 m!667375))

(declare-fun m!667379 () Bool)

(assert (=> b!710204 m!667379))

(assert (=> b!709942 d!97307))

(declare-fun d!97309 () Bool)

(declare-fun res!473653 () Bool)

(declare-fun e!399620 () Bool)

(assert (=> d!97309 (=> res!473653 e!399620)))

(assert (=> d!97309 (= res!473653 ((_ is Nil!13380) lt!318272))))

(assert (=> d!97309 (= (noDuplicate!1207 lt!318272) e!399620)))

(declare-fun b!710205 () Bool)

(declare-fun e!399621 () Bool)

(assert (=> b!710205 (= e!399620 e!399621)))

(declare-fun res!473654 () Bool)

(assert (=> b!710205 (=> (not res!473654) (not e!399621))))

(assert (=> b!710205 (= res!473654 (not (contains!3960 (t!19680 lt!318272) (h!14424 lt!318272))))))

(declare-fun b!710206 () Bool)

(assert (=> b!710206 (= e!399621 (noDuplicate!1207 (t!19680 lt!318272)))))

(assert (= (and d!97309 (not res!473653)) b!710205))

(assert (= (and b!710205 res!473654) b!710206))

(declare-fun m!667387 () Bool)

(assert (=> b!710205 m!667387))

(declare-fun m!667389 () Bool)

(assert (=> b!710206 m!667389))

(assert (=> b!709932 d!97309))

(check-sat (not b!710164) (not bm!34453) (not b!710193) (not bm!34452) (not b!710048) (not b!710206) (not b!710175) (not b!710043) (not b!710163) (not bm!34459) (not d!97263) (not b!710189) (not b!710026) (not b!710156) (not b!710204) (not b!710045) (not b!710205) (not b!710038) (not d!97247) (not b!710041) (not d!97289) (not b!710183) (not b!710142) (not d!97295) (not d!97285) (not b!710119) (not b!710181) (not b!710138) (not d!97307) (not b!710072) (not d!97291) (not d!97271) (not d!97279) (not b!710155) (not b!710185) (not b!710177) (not b!710192) (not b!710046) (not b!710071) (not d!97281) (not b!710040))
(check-sat)
