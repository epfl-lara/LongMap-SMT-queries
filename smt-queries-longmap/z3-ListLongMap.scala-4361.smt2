; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60252 () Bool)

(assert start!60252)

(declare-fun b!673422 () Bool)

(declare-fun e!384612 () Bool)

(declare-datatypes ((List!12756 0))(
  ( (Nil!12753) (Cons!12752 (h!13800 (_ BitVec 64)) (t!18976 List!12756)) )
))
(declare-fun acc!681 () List!12756)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3408 (List!12756 (_ BitVec 64)) Bool)

(assert (=> b!673422 (= e!384612 (contains!3408 acc!681 k0!2843))))

(declare-fun b!673423 () Bool)

(declare-fun e!384602 () Bool)

(declare-fun lt!312531 () List!12756)

(assert (=> b!673423 (= e!384602 (contains!3408 lt!312531 k0!2843))))

(declare-fun b!673424 () Bool)

(declare-fun e!384607 () Bool)

(assert (=> b!673424 (= e!384607 (not (contains!3408 acc!681 k0!2843)))))

(declare-fun b!673425 () Bool)

(declare-fun res!439884 () Bool)

(declare-fun e!384611 () Bool)

(assert (=> b!673425 (=> (not res!439884) (not e!384611))))

(declare-datatypes ((array!39237 0))(
  ( (array!39238 (arr!18808 (Array (_ BitVec 32) (_ BitVec 64))) (size!19172 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39237)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673425 (= res!439884 (validKeyInArray!0 (select (arr!18808 a!3626) from!3004)))))

(declare-fun res!439880 () Bool)

(assert (=> start!60252 (=> (not res!439880) (not e!384611))))

(assert (=> start!60252 (= res!439880 (and (bvslt (size!19172 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19172 a!3626))))))

(assert (=> start!60252 e!384611))

(assert (=> start!60252 true))

(declare-fun array_inv!14667 (array!39237) Bool)

(assert (=> start!60252 (array_inv!14667 a!3626)))

(declare-fun b!673426 () Bool)

(declare-fun res!439888 () Bool)

(assert (=> b!673426 (=> (not res!439888) (not e!384611))))

(declare-fun arrayContainsKey!0 (array!39237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673426 (= res!439888 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673427 () Bool)

(declare-datatypes ((Unit!23643 0))(
  ( (Unit!23644) )
))
(declare-fun e!384609 () Unit!23643)

(declare-fun Unit!23645 () Unit!23643)

(assert (=> b!673427 (= e!384609 Unit!23645)))

(assert (=> b!673427 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312529 () Unit!23643)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39237 (_ BitVec 64) (_ BitVec 32)) Unit!23643)

(assert (=> b!673427 (= lt!312529 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673427 false))

(declare-fun b!673428 () Bool)

(declare-fun res!439878 () Bool)

(assert (=> b!673428 (=> (not res!439878) (not e!384611))))

(assert (=> b!673428 (= res!439878 (validKeyInArray!0 k0!2843))))

(declare-fun b!673429 () Bool)

(declare-fun res!439892 () Bool)

(assert (=> b!673429 (=> (not res!439892) (not e!384611))))

(assert (=> b!673429 (= res!439892 (not (contains!3408 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673430 () Bool)

(declare-fun e!384606 () Bool)

(assert (=> b!673430 (= e!384611 e!384606)))

(declare-fun res!439877 () Bool)

(assert (=> b!673430 (=> (not res!439877) (not e!384606))))

(assert (=> b!673430 (= res!439877 (not (= (select (arr!18808 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312530 () Unit!23643)

(assert (=> b!673430 (= lt!312530 e!384609)))

(declare-fun c!77141 () Bool)

(assert (=> b!673430 (= c!77141 (= (select (arr!18808 a!3626) from!3004) k0!2843))))

(declare-fun b!673431 () Bool)

(declare-fun res!439885 () Bool)

(assert (=> b!673431 (=> (not res!439885) (not e!384611))))

(declare-fun e!384608 () Bool)

(assert (=> b!673431 (= res!439885 e!384608)))

(declare-fun res!439881 () Bool)

(assert (=> b!673431 (=> res!439881 e!384608)))

(assert (=> b!673431 (= res!439881 e!384612)))

(declare-fun res!439889 () Bool)

(assert (=> b!673431 (=> (not res!439889) (not e!384612))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673431 (= res!439889 (bvsgt from!3004 i!1382))))

(declare-fun b!673432 () Bool)

(declare-fun e!384604 () Bool)

(assert (=> b!673432 (= e!384604 (not (contains!3408 lt!312531 k0!2843)))))

(declare-fun b!673433 () Bool)

(declare-fun e!384603 () Bool)

(assert (=> b!673433 (= e!384603 e!384604)))

(declare-fun res!439886 () Bool)

(assert (=> b!673433 (=> (not res!439886) (not e!384604))))

(assert (=> b!673433 (= res!439886 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673434 () Bool)

(declare-fun res!439898 () Bool)

(assert (=> b!673434 (=> (not res!439898) (not e!384611))))

(declare-fun arrayNoDuplicates!0 (array!39237 (_ BitVec 32) List!12756) Bool)

(assert (=> b!673434 (= res!439898 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12753))))

(declare-fun b!673435 () Bool)

(declare-fun res!439896 () Bool)

(declare-fun e!384610 () Bool)

(assert (=> b!673435 (=> (not res!439896) (not e!384610))))

(assert (=> b!673435 (= res!439896 e!384603)))

(declare-fun res!439891 () Bool)

(assert (=> b!673435 (=> res!439891 e!384603)))

(assert (=> b!673435 (= res!439891 e!384602)))

(declare-fun res!439894 () Bool)

(assert (=> b!673435 (=> (not res!439894) (not e!384602))))

(assert (=> b!673435 (= res!439894 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673436 () Bool)

(declare-fun res!439897 () Bool)

(assert (=> b!673436 (=> (not res!439897) (not e!384611))))

(assert (=> b!673436 (= res!439897 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19172 a!3626))))))

(declare-fun b!673437 () Bool)

(declare-fun res!439900 () Bool)

(assert (=> b!673437 (=> (not res!439900) (not e!384611))))

(assert (=> b!673437 (= res!439900 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673438 () Bool)

(assert (=> b!673438 (= e!384610 false)))

(declare-fun lt!312532 () Bool)

(assert (=> b!673438 (= lt!312532 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312531))))

(declare-fun b!673439 () Bool)

(assert (=> b!673439 (= e!384608 e!384607)))

(declare-fun res!439879 () Bool)

(assert (=> b!673439 (=> (not res!439879) (not e!384607))))

(assert (=> b!673439 (= res!439879 (bvsle from!3004 i!1382))))

(declare-fun b!673440 () Bool)

(declare-fun res!439893 () Bool)

(assert (=> b!673440 (=> (not res!439893) (not e!384610))))

(assert (=> b!673440 (= res!439893 (not (contains!3408 lt!312531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673441 () Bool)

(declare-fun res!439883 () Bool)

(assert (=> b!673441 (=> (not res!439883) (not e!384611))))

(assert (=> b!673441 (= res!439883 (not (contains!3408 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673442 () Bool)

(declare-fun res!439895 () Bool)

(assert (=> b!673442 (=> (not res!439895) (not e!384610))))

(declare-fun noDuplicate!682 (List!12756) Bool)

(assert (=> b!673442 (= res!439895 (noDuplicate!682 lt!312531))))

(declare-fun b!673443 () Bool)

(declare-fun res!439887 () Bool)

(assert (=> b!673443 (=> (not res!439887) (not e!384611))))

(assert (=> b!673443 (= res!439887 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19172 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673444 () Bool)

(assert (=> b!673444 (= e!384606 e!384610)))

(declare-fun res!439890 () Bool)

(assert (=> b!673444 (=> (not res!439890) (not e!384610))))

(assert (=> b!673444 (= res!439890 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!278 (List!12756 (_ BitVec 64)) List!12756)

(assert (=> b!673444 (= lt!312531 ($colon$colon!278 acc!681 (select (arr!18808 a!3626) from!3004)))))

(declare-fun b!673445 () Bool)

(declare-fun Unit!23646 () Unit!23643)

(assert (=> b!673445 (= e!384609 Unit!23646)))

(declare-fun b!673446 () Bool)

(declare-fun res!439899 () Bool)

(assert (=> b!673446 (=> (not res!439899) (not e!384611))))

(assert (=> b!673446 (= res!439899 (noDuplicate!682 acc!681))))

(declare-fun b!673447 () Bool)

(declare-fun res!439882 () Bool)

(assert (=> b!673447 (=> (not res!439882) (not e!384610))))

(assert (=> b!673447 (= res!439882 (not (contains!3408 lt!312531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60252 res!439880) b!673446))

(assert (= (and b!673446 res!439899) b!673441))

(assert (= (and b!673441 res!439883) b!673429))

(assert (= (and b!673429 res!439892) b!673431))

(assert (= (and b!673431 res!439889) b!673422))

(assert (= (and b!673431 (not res!439881)) b!673439))

(assert (= (and b!673439 res!439879) b!673424))

(assert (= (and b!673431 res!439885) b!673434))

(assert (= (and b!673434 res!439898) b!673437))

(assert (= (and b!673437 res!439900) b!673436))

(assert (= (and b!673436 res!439897) b!673428))

(assert (= (and b!673428 res!439878) b!673426))

(assert (= (and b!673426 res!439888) b!673443))

(assert (= (and b!673443 res!439887) b!673425))

(assert (= (and b!673425 res!439884) b!673430))

(assert (= (and b!673430 c!77141) b!673427))

(assert (= (and b!673430 (not c!77141)) b!673445))

(assert (= (and b!673430 res!439877) b!673444))

(assert (= (and b!673444 res!439890) b!673442))

(assert (= (and b!673442 res!439895) b!673440))

(assert (= (and b!673440 res!439893) b!673447))

(assert (= (and b!673447 res!439882) b!673435))

(assert (= (and b!673435 res!439894) b!673423))

(assert (= (and b!673435 (not res!439891)) b!673433))

(assert (= (and b!673433 res!439886) b!673432))

(assert (= (and b!673435 res!439896) b!673438))

(declare-fun m!642469 () Bool)

(assert (=> b!673424 m!642469))

(declare-fun m!642471 () Bool)

(assert (=> b!673444 m!642471))

(assert (=> b!673444 m!642471))

(declare-fun m!642473 () Bool)

(assert (=> b!673444 m!642473))

(assert (=> b!673430 m!642471))

(declare-fun m!642475 () Bool)

(assert (=> b!673446 m!642475))

(assert (=> b!673425 m!642471))

(assert (=> b!673425 m!642471))

(declare-fun m!642477 () Bool)

(assert (=> b!673425 m!642477))

(declare-fun m!642479 () Bool)

(assert (=> b!673427 m!642479))

(declare-fun m!642481 () Bool)

(assert (=> b!673427 m!642481))

(declare-fun m!642483 () Bool)

(assert (=> b!673447 m!642483))

(declare-fun m!642485 () Bool)

(assert (=> b!673429 m!642485))

(declare-fun m!642487 () Bool)

(assert (=> b!673441 m!642487))

(declare-fun m!642489 () Bool)

(assert (=> b!673423 m!642489))

(declare-fun m!642491 () Bool)

(assert (=> start!60252 m!642491))

(declare-fun m!642493 () Bool)

(assert (=> b!673426 m!642493))

(assert (=> b!673422 m!642469))

(declare-fun m!642495 () Bool)

(assert (=> b!673428 m!642495))

(declare-fun m!642497 () Bool)

(assert (=> b!673438 m!642497))

(assert (=> b!673432 m!642489))

(declare-fun m!642499 () Bool)

(assert (=> b!673437 m!642499))

(declare-fun m!642501 () Bool)

(assert (=> b!673442 m!642501))

(declare-fun m!642503 () Bool)

(assert (=> b!673434 m!642503))

(declare-fun m!642505 () Bool)

(assert (=> b!673440 m!642505))

(check-sat (not b!673426) (not b!673444) (not b!673423) (not b!673442) (not b!673437) (not start!60252) (not b!673440) (not b!673428) (not b!673441) (not b!673447) (not b!673429) (not b!673425) (not b!673424) (not b!673434) (not b!673432) (not b!673422) (not b!673438) (not b!673446) (not b!673427))
(check-sat)
