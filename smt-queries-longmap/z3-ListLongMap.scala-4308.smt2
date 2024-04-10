; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59878 () Bool)

(assert start!59878)

(declare-fun b!662438 () Bool)

(declare-fun e!380303 () Bool)

(declare-datatypes ((List!12696 0))(
  ( (Nil!12693) (Cons!12692 (h!13737 (_ BitVec 64)) (t!18924 List!12696)) )
))
(declare-fun acc!681 () List!12696)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3273 (List!12696 (_ BitVec 64)) Bool)

(assert (=> b!662438 (= e!380303 (not (contains!3273 acc!681 k0!2843)))))

(declare-fun b!662439 () Bool)

(declare-fun res!430446 () Bool)

(declare-fun e!380310 () Bool)

(assert (=> b!662439 (=> (not res!430446) (not e!380310))))

(declare-datatypes ((array!38925 0))(
  ( (array!38926 (arr!18655 (Array (_ BitVec 32) (_ BitVec 64))) (size!19019 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38925)

(declare-fun arrayNoDuplicates!0 (array!38925 (_ BitVec 32) List!12696) Bool)

(assert (=> b!662439 (= res!430446 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12693))))

(declare-fun b!662441 () Bool)

(declare-fun res!430440 () Bool)

(declare-fun e!380304 () Bool)

(assert (=> b!662441 (=> res!430440 e!380304)))

(declare-fun lt!309012 () List!12696)

(assert (=> b!662441 (= res!430440 (contains!3273 lt!309012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662442 () Bool)

(declare-fun res!430452 () Bool)

(assert (=> b!662442 (=> (not res!430452) (not e!380310))))

(assert (=> b!662442 (= res!430452 (not (contains!3273 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662443 () Bool)

(declare-fun res!430455 () Bool)

(assert (=> b!662443 (=> res!430455 e!380304)))

(declare-fun subseq!12 (List!12696 List!12696) Bool)

(assert (=> b!662443 (= res!430455 (not (subseq!12 acc!681 lt!309012)))))

(declare-fun b!662444 () Bool)

(declare-fun res!430438 () Bool)

(assert (=> b!662444 (=> (not res!430438) (not e!380310))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662444 (= res!430438 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19019 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662445 () Bool)

(declare-fun res!430445 () Bool)

(assert (=> b!662445 (=> (not res!430445) (not e!380310))))

(declare-fun e!380308 () Bool)

(assert (=> b!662445 (= res!430445 e!380308)))

(declare-fun res!430449 () Bool)

(assert (=> b!662445 (=> res!430449 e!380308)))

(declare-fun e!380306 () Bool)

(assert (=> b!662445 (= res!430449 e!380306)))

(declare-fun res!430448 () Bool)

(assert (=> b!662445 (=> (not res!430448) (not e!380306))))

(assert (=> b!662445 (= res!430448 (bvsgt from!3004 i!1382))))

(declare-fun b!662446 () Bool)

(declare-fun res!430453 () Bool)

(assert (=> b!662446 (=> (not res!430453) (not e!380310))))

(assert (=> b!662446 (= res!430453 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662447 () Bool)

(declare-fun res!430439 () Bool)

(assert (=> b!662447 (=> (not res!430439) (not e!380310))))

(assert (=> b!662447 (= res!430439 (not (contains!3273 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662448 () Bool)

(declare-fun res!430441 () Bool)

(assert (=> b!662448 (=> res!430441 e!380304)))

(assert (=> b!662448 (= res!430441 (contains!3273 lt!309012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662449 () Bool)

(declare-fun res!430447 () Bool)

(assert (=> b!662449 (=> (not res!430447) (not e!380310))))

(declare-fun arrayContainsKey!0 (array!38925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662449 (= res!430447 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!430443 () Bool)

(assert (=> start!59878 (=> (not res!430443) (not e!380310))))

(assert (=> start!59878 (= res!430443 (and (bvslt (size!19019 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19019 a!3626))))))

(assert (=> start!59878 e!380310))

(assert (=> start!59878 true))

(declare-fun array_inv!14451 (array!38925) Bool)

(assert (=> start!59878 (array_inv!14451 a!3626)))

(declare-fun b!662440 () Bool)

(assert (=> b!662440 (= e!380304 true)))

(declare-fun lt!309013 () Bool)

(assert (=> b!662440 (= lt!309013 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309012))))

(declare-datatypes ((Unit!23014 0))(
  ( (Unit!23015) )
))
(declare-fun lt!309011 () Unit!23014)

(declare-fun noDuplicateSubseq!12 (List!12696 List!12696) Unit!23014)

(assert (=> b!662440 (= lt!309011 (noDuplicateSubseq!12 acc!681 lt!309012))))

(declare-fun b!662450 () Bool)

(declare-fun e!380309 () Unit!23014)

(declare-fun Unit!23016 () Unit!23014)

(assert (=> b!662450 (= e!380309 Unit!23016)))

(declare-fun b!662451 () Bool)

(declare-fun res!430454 () Bool)

(assert (=> b!662451 (=> (not res!430454) (not e!380310))))

(assert (=> b!662451 (= res!430454 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19019 a!3626))))))

(declare-fun b!662452 () Bool)

(declare-fun res!430457 () Bool)

(assert (=> b!662452 (=> (not res!430457) (not e!380310))))

(declare-fun noDuplicate!520 (List!12696) Bool)

(assert (=> b!662452 (= res!430457 (noDuplicate!520 acc!681))))

(declare-fun b!662453 () Bool)

(declare-fun Unit!23017 () Unit!23014)

(assert (=> b!662453 (= e!380309 Unit!23017)))

(declare-fun lt!309015 () Unit!23014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38925 (_ BitVec 64) (_ BitVec 32)) Unit!23014)

(assert (=> b!662453 (= lt!309015 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662453 false))

(declare-fun b!662454 () Bool)

(declare-fun res!430442 () Bool)

(assert (=> b!662454 (=> (not res!430442) (not e!380310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662454 (= res!430442 (validKeyInArray!0 k0!2843))))

(declare-fun b!662455 () Bool)

(assert (=> b!662455 (= e!380308 e!380303)))

(declare-fun res!430456 () Bool)

(assert (=> b!662455 (=> (not res!430456) (not e!380303))))

(assert (=> b!662455 (= res!430456 (bvsle from!3004 i!1382))))

(declare-fun b!662456 () Bool)

(declare-fun e!380305 () Bool)

(assert (=> b!662456 (= e!380305 e!380304)))

(declare-fun res!430450 () Bool)

(assert (=> b!662456 (=> res!430450 e!380304)))

(assert (=> b!662456 (= res!430450 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!144 (List!12696 (_ BitVec 64)) List!12696)

(assert (=> b!662456 (= lt!309012 ($colon$colon!144 acc!681 (select (arr!18655 a!3626) from!3004)))))

(assert (=> b!662456 (subseq!12 acc!681 acc!681)))

(declare-fun lt!309016 () Unit!23014)

(declare-fun lemmaListSubSeqRefl!0 (List!12696) Unit!23014)

(assert (=> b!662456 (= lt!309016 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662457 () Bool)

(assert (=> b!662457 (= e!380310 (not e!380305))))

(declare-fun res!430444 () Bool)

(assert (=> b!662457 (=> res!430444 e!380305)))

(assert (=> b!662457 (= res!430444 (not (validKeyInArray!0 (select (arr!18655 a!3626) from!3004))))))

(declare-fun lt!309014 () Unit!23014)

(assert (=> b!662457 (= lt!309014 e!380309)))

(declare-fun c!76367 () Bool)

(assert (=> b!662457 (= c!76367 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662457 (arrayContainsKey!0 (array!38926 (store (arr!18655 a!3626) i!1382 k0!2843) (size!19019 a!3626)) k0!2843 from!3004)))

(declare-fun b!662458 () Bool)

(declare-fun res!430451 () Bool)

(assert (=> b!662458 (=> res!430451 e!380304)))

(assert (=> b!662458 (= res!430451 (not (noDuplicate!520 lt!309012)))))

(declare-fun b!662459 () Bool)

(assert (=> b!662459 (= e!380306 (contains!3273 acc!681 k0!2843))))

(assert (= (and start!59878 res!430443) b!662452))

(assert (= (and b!662452 res!430457) b!662442))

(assert (= (and b!662442 res!430452) b!662447))

(assert (= (and b!662447 res!430439) b!662445))

(assert (= (and b!662445 res!430448) b!662459))

(assert (= (and b!662445 (not res!430449)) b!662455))

(assert (= (and b!662455 res!430456) b!662438))

(assert (= (and b!662445 res!430445) b!662439))

(assert (= (and b!662439 res!430446) b!662446))

(assert (= (and b!662446 res!430453) b!662451))

(assert (= (and b!662451 res!430454) b!662454))

(assert (= (and b!662454 res!430442) b!662449))

(assert (= (and b!662449 res!430447) b!662444))

(assert (= (and b!662444 res!430438) b!662457))

(assert (= (and b!662457 c!76367) b!662453))

(assert (= (and b!662457 (not c!76367)) b!662450))

(assert (= (and b!662457 (not res!430444)) b!662456))

(assert (= (and b!662456 (not res!430450)) b!662458))

(assert (= (and b!662458 (not res!430451)) b!662441))

(assert (= (and b!662441 (not res!430440)) b!662448))

(assert (= (and b!662448 (not res!430441)) b!662443))

(assert (= (and b!662443 (not res!430455)) b!662440))

(declare-fun m!634277 () Bool)

(assert (=> b!662441 m!634277))

(declare-fun m!634279 () Bool)

(assert (=> b!662452 m!634279))

(declare-fun m!634281 () Bool)

(assert (=> b!662457 m!634281))

(declare-fun m!634283 () Bool)

(assert (=> b!662457 m!634283))

(declare-fun m!634285 () Bool)

(assert (=> b!662457 m!634285))

(assert (=> b!662457 m!634281))

(declare-fun m!634287 () Bool)

(assert (=> b!662457 m!634287))

(declare-fun m!634289 () Bool)

(assert (=> b!662457 m!634289))

(declare-fun m!634291 () Bool)

(assert (=> b!662447 m!634291))

(declare-fun m!634293 () Bool)

(assert (=> start!59878 m!634293))

(declare-fun m!634295 () Bool)

(assert (=> b!662438 m!634295))

(declare-fun m!634297 () Bool)

(assert (=> b!662440 m!634297))

(declare-fun m!634299 () Bool)

(assert (=> b!662440 m!634299))

(declare-fun m!634301 () Bool)

(assert (=> b!662442 m!634301))

(declare-fun m!634303 () Bool)

(assert (=> b!662449 m!634303))

(declare-fun m!634305 () Bool)

(assert (=> b!662446 m!634305))

(assert (=> b!662456 m!634281))

(assert (=> b!662456 m!634281))

(declare-fun m!634307 () Bool)

(assert (=> b!662456 m!634307))

(declare-fun m!634309 () Bool)

(assert (=> b!662456 m!634309))

(declare-fun m!634311 () Bool)

(assert (=> b!662456 m!634311))

(assert (=> b!662459 m!634295))

(declare-fun m!634313 () Bool)

(assert (=> b!662439 m!634313))

(declare-fun m!634315 () Bool)

(assert (=> b!662443 m!634315))

(declare-fun m!634317 () Bool)

(assert (=> b!662454 m!634317))

(declare-fun m!634319 () Bool)

(assert (=> b!662453 m!634319))

(declare-fun m!634321 () Bool)

(assert (=> b!662458 m!634321))

(declare-fun m!634323 () Bool)

(assert (=> b!662448 m!634323))

(check-sat (not b!662453) (not b!662442) (not start!59878) (not b!662456) (not b!662446) (not b!662441) (not b!662457) (not b!662443) (not b!662440) (not b!662447) (not b!662439) (not b!662459) (not b!662452) (not b!662449) (not b!662454) (not b!662438) (not b!662458) (not b!662448))
(check-sat)
