; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60862 () Bool)

(assert start!60862)

(declare-fun b!682461 () Bool)

(declare-datatypes ((Unit!23942 0))(
  ( (Unit!23943) )
))
(declare-fun e!388877 () Unit!23942)

(declare-fun Unit!23944 () Unit!23942)

(assert (=> b!682461 (= e!388877 Unit!23944)))

(declare-fun b!682462 () Bool)

(declare-fun e!388875 () Unit!23942)

(declare-fun Unit!23945 () Unit!23942)

(assert (=> b!682462 (= e!388875 Unit!23945)))

(declare-fun lt!313530 () Unit!23942)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39546 0))(
  ( (array!39547 (arr!18955 (Array (_ BitVec 32) (_ BitVec 64))) (size!19319 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39546 (_ BitVec 64) (_ BitVec 32)) Unit!23942)

(assert (=> b!682462 (= lt!313530 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682462 false))

(declare-fun b!682463 () Bool)

(declare-fun e!388879 () Bool)

(declare-datatypes ((List!12996 0))(
  ( (Nil!12993) (Cons!12992 (h!14037 (_ BitVec 64)) (t!19239 List!12996)) )
))
(declare-fun acc!681 () List!12996)

(declare-fun contains!3573 (List!12996 (_ BitVec 64)) Bool)

(assert (=> b!682463 (= e!388879 (contains!3573 acc!681 k0!2843))))

(declare-fun b!682464 () Bool)

(declare-fun Unit!23946 () Unit!23942)

(assert (=> b!682464 (= e!388875 Unit!23946)))

(declare-fun b!682465 () Bool)

(declare-fun res!448466 () Bool)

(declare-fun e!388876 () Bool)

(assert (=> b!682465 (=> (not res!448466) (not e!388876))))

(declare-fun arrayContainsKey!0 (array!39546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682465 (= res!448466 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682466 () Bool)

(declare-fun e!388880 () Bool)

(assert (=> b!682466 (= e!388880 (not (contains!3573 acc!681 k0!2843)))))

(declare-fun b!682467 () Bool)

(declare-fun res!448465 () Bool)

(assert (=> b!682467 (=> (not res!448465) (not e!388876))))

(assert (=> b!682467 (= res!448465 (not (contains!3573 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682468 () Bool)

(declare-fun res!448457 () Bool)

(assert (=> b!682468 (=> (not res!448457) (not e!388876))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682468 (= res!448457 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19319 a!3626))))))

(declare-fun b!682469 () Bool)

(declare-fun res!448460 () Bool)

(assert (=> b!682469 (=> (not res!448460) (not e!388876))))

(assert (=> b!682469 (= res!448460 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19319 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682470 () Bool)

(declare-fun res!448462 () Bool)

(assert (=> b!682470 (=> (not res!448462) (not e!388876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682470 (= res!448462 (validKeyInArray!0 k0!2843))))

(declare-fun res!448464 () Bool)

(assert (=> start!60862 (=> (not res!448464) (not e!388876))))

(assert (=> start!60862 (= res!448464 (and (bvslt (size!19319 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19319 a!3626))))))

(assert (=> start!60862 e!388876))

(assert (=> start!60862 true))

(declare-fun array_inv!14751 (array!39546) Bool)

(assert (=> start!60862 (array_inv!14751 a!3626)))

(declare-fun b!682471 () Bool)

(declare-fun res!448461 () Bool)

(assert (=> b!682471 (=> (not res!448461) (not e!388876))))

(declare-fun e!388878 () Bool)

(assert (=> b!682471 (= res!448461 e!388878)))

(declare-fun res!448463 () Bool)

(assert (=> b!682471 (=> res!448463 e!388878)))

(assert (=> b!682471 (= res!448463 e!388879)))

(declare-fun res!448453 () Bool)

(assert (=> b!682471 (=> (not res!448453) (not e!388879))))

(assert (=> b!682471 (= res!448453 (bvsgt from!3004 i!1382))))

(declare-fun b!682472 () Bool)

(declare-fun res!448456 () Bool)

(assert (=> b!682472 (=> (not res!448456) (not e!388876))))

(declare-fun arrayNoDuplicates!0 (array!39546 (_ BitVec 32) List!12996) Bool)

(assert (=> b!682472 (= res!448456 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12993))))

(declare-fun b!682473 () Bool)

(assert (=> b!682473 (= e!388876 (not (not (contains!3573 acc!681 k0!2843))))))

(declare-fun subseq!159 (List!12996 List!12996) Bool)

(assert (=> b!682473 (subseq!159 acc!681 acc!681)))

(declare-fun lt!313531 () Unit!23942)

(declare-fun lemmaListSubSeqRefl!0 (List!12996) Unit!23942)

(assert (=> b!682473 (= lt!313531 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682473 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313528 () Unit!23942)

(assert (=> b!682473 (= lt!313528 e!388877)))

(declare-fun c!77372 () Bool)

(assert (=> b!682473 (= c!77372 (validKeyInArray!0 (select (arr!18955 a!3626) from!3004)))))

(declare-fun lt!313527 () Unit!23942)

(assert (=> b!682473 (= lt!313527 e!388875)))

(declare-fun c!77371 () Bool)

(assert (=> b!682473 (= c!77371 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682473 (arrayContainsKey!0 (array!39547 (store (arr!18955 a!3626) i!1382 k0!2843) (size!19319 a!3626)) k0!2843 from!3004)))

(declare-fun b!682474 () Bool)

(declare-fun res!448458 () Bool)

(assert (=> b!682474 (=> (not res!448458) (not e!388876))))

(declare-fun noDuplicate!820 (List!12996) Bool)

(assert (=> b!682474 (= res!448458 (noDuplicate!820 acc!681))))

(declare-fun b!682475 () Bool)

(declare-fun res!448459 () Bool)

(assert (=> b!682475 (=> (not res!448459) (not e!388876))))

(assert (=> b!682475 (= res!448459 (not (contains!3573 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682476 () Bool)

(assert (=> b!682476 (= e!388878 e!388880)))

(declare-fun res!448455 () Bool)

(assert (=> b!682476 (=> (not res!448455) (not e!388880))))

(assert (=> b!682476 (= res!448455 (bvsle from!3004 i!1382))))

(declare-fun b!682477 () Bool)

(declare-fun lt!313526 () Unit!23942)

(assert (=> b!682477 (= e!388877 lt!313526)))

(declare-fun lt!313529 () Unit!23942)

(assert (=> b!682477 (= lt!313529 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682477 (subseq!159 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39546 List!12996 List!12996 (_ BitVec 32)) Unit!23942)

(declare-fun $colon$colon!324 (List!12996 (_ BitVec 64)) List!12996)

(assert (=> b!682477 (= lt!313526 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!324 acc!681 (select (arr!18955 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682477 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682478 () Bool)

(declare-fun res!448454 () Bool)

(assert (=> b!682478 (=> (not res!448454) (not e!388876))))

(assert (=> b!682478 (= res!448454 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60862 res!448464) b!682474))

(assert (= (and b!682474 res!448458) b!682475))

(assert (= (and b!682475 res!448459) b!682467))

(assert (= (and b!682467 res!448465) b!682471))

(assert (= (and b!682471 res!448453) b!682463))

(assert (= (and b!682471 (not res!448463)) b!682476))

(assert (= (and b!682476 res!448455) b!682466))

(assert (= (and b!682471 res!448461) b!682472))

(assert (= (and b!682472 res!448456) b!682478))

(assert (= (and b!682478 res!448454) b!682468))

(assert (= (and b!682468 res!448457) b!682470))

(assert (= (and b!682470 res!448462) b!682465))

(assert (= (and b!682465 res!448466) b!682469))

(assert (= (and b!682469 res!448460) b!682473))

(assert (= (and b!682473 c!77371) b!682462))

(assert (= (and b!682473 (not c!77371)) b!682464))

(assert (= (and b!682473 c!77372) b!682477))

(assert (= (and b!682473 (not c!77372)) b!682461))

(declare-fun m!647157 () Bool)

(assert (=> b!682466 m!647157))

(declare-fun m!647159 () Bool)

(assert (=> b!682473 m!647159))

(declare-fun m!647161 () Bool)

(assert (=> b!682473 m!647161))

(assert (=> b!682473 m!647157))

(declare-fun m!647163 () Bool)

(assert (=> b!682473 m!647163))

(declare-fun m!647165 () Bool)

(assert (=> b!682473 m!647165))

(declare-fun m!647167 () Bool)

(assert (=> b!682473 m!647167))

(assert (=> b!682473 m!647161))

(declare-fun m!647169 () Bool)

(assert (=> b!682473 m!647169))

(declare-fun m!647171 () Bool)

(assert (=> b!682473 m!647171))

(declare-fun m!647173 () Bool)

(assert (=> b!682473 m!647173))

(declare-fun m!647175 () Bool)

(assert (=> b!682474 m!647175))

(declare-fun m!647177 () Bool)

(assert (=> b!682478 m!647177))

(declare-fun m!647179 () Bool)

(assert (=> start!60862 m!647179))

(declare-fun m!647181 () Bool)

(assert (=> b!682472 m!647181))

(assert (=> b!682463 m!647157))

(declare-fun m!647183 () Bool)

(assert (=> b!682467 m!647183))

(assert (=> b!682477 m!647159))

(assert (=> b!682477 m!647161))

(declare-fun m!647185 () Bool)

(assert (=> b!682477 m!647185))

(declare-fun m!647187 () Bool)

(assert (=> b!682477 m!647187))

(assert (=> b!682477 m!647161))

(assert (=> b!682477 m!647185))

(assert (=> b!682477 m!647165))

(assert (=> b!682477 m!647173))

(declare-fun m!647189 () Bool)

(assert (=> b!682475 m!647189))

(declare-fun m!647191 () Bool)

(assert (=> b!682462 m!647191))

(declare-fun m!647193 () Bool)

(assert (=> b!682465 m!647193))

(declare-fun m!647195 () Bool)

(assert (=> b!682470 m!647195))

(check-sat (not b!682475) (not b!682463) (not b!682465) (not b!682466) (not b!682467) (not b!682474) (not b!682462) (not b!682470) (not b!682473) (not b!682472) (not b!682477) (not start!60862) (not b!682478))
(check-sat)
