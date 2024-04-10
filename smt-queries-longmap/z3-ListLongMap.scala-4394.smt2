; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60430 () Bool)

(assert start!60430)

(declare-fun b!679081 () Bool)

(declare-fun e!386918 () Bool)

(declare-datatypes ((List!12954 0))(
  ( (Nil!12951) (Cons!12950 (h!13995 (_ BitVec 64)) (t!19182 List!12954)) )
))
(declare-fun acc!681 () List!12954)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3531 (List!12954 (_ BitVec 64)) Bool)

(assert (=> b!679081 (= e!386918 (not (contains!3531 acc!681 k0!2843)))))

(declare-fun b!679082 () Bool)

(declare-fun res!445472 () Bool)

(declare-fun e!386915 () Bool)

(assert (=> b!679082 (=> (not res!445472) (not e!386915))))

(assert (=> b!679082 (= res!445472 (not (contains!3531 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679083 () Bool)

(declare-fun res!445467 () Bool)

(assert (=> b!679083 (=> (not res!445467) (not e!386915))))

(declare-datatypes ((array!39444 0))(
  ( (array!39445 (arr!18913 (Array (_ BitVec 32) (_ BitVec 64))) (size!19277 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39444)

(declare-fun arrayNoDuplicates!0 (array!39444 (_ BitVec 32) List!12954) Bool)

(assert (=> b!679083 (= res!445467 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12951))))

(declare-fun b!679084 () Bool)

(declare-fun e!386916 () Bool)

(assert (=> b!679084 (= e!386916 e!386918)))

(declare-fun res!445476 () Bool)

(assert (=> b!679084 (=> (not res!445476) (not e!386918))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679084 (= res!445476 (bvsle from!3004 i!1382))))

(declare-fun b!679086 () Bool)

(declare-fun res!445466 () Bool)

(assert (=> b!679086 (=> (not res!445466) (not e!386915))))

(declare-fun noDuplicate!778 (List!12954) Bool)

(assert (=> b!679086 (= res!445466 (noDuplicate!778 acc!681))))

(declare-fun b!679087 () Bool)

(declare-fun res!445471 () Bool)

(assert (=> b!679087 (=> (not res!445471) (not e!386915))))

(assert (=> b!679087 (= res!445471 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19277 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679088 () Bool)

(declare-fun res!445477 () Bool)

(assert (=> b!679088 (=> (not res!445477) (not e!386915))))

(assert (=> b!679088 (= res!445477 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19277 a!3626))))))

(declare-fun b!679089 () Bool)

(declare-fun res!445468 () Bool)

(assert (=> b!679089 (=> (not res!445468) (not e!386915))))

(assert (=> b!679089 (= res!445468 e!386916)))

(declare-fun res!445469 () Bool)

(assert (=> b!679089 (=> res!445469 e!386916)))

(declare-fun e!386919 () Bool)

(assert (=> b!679089 (= res!445469 e!386919)))

(declare-fun res!445474 () Bool)

(assert (=> b!679089 (=> (not res!445474) (not e!386919))))

(assert (=> b!679089 (= res!445474 (bvsgt from!3004 i!1382))))

(declare-fun b!679090 () Bool)

(declare-fun res!445475 () Bool)

(assert (=> b!679090 (=> (not res!445475) (not e!386915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679090 (= res!445475 (validKeyInArray!0 k0!2843))))

(declare-fun b!679091 () Bool)

(declare-fun res!445465 () Bool)

(assert (=> b!679091 (=> (not res!445465) (not e!386915))))

(assert (=> b!679091 (= res!445465 (not (contains!3531 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679092 () Bool)

(declare-fun res!445478 () Bool)

(assert (=> b!679092 (=> (not res!445478) (not e!386915))))

(declare-fun arrayContainsKey!0 (array!39444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679092 (= res!445478 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!445470 () Bool)

(assert (=> start!60430 (=> (not res!445470) (not e!386915))))

(assert (=> start!60430 (= res!445470 (and (bvslt (size!19277 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19277 a!3626))))))

(assert (=> start!60430 e!386915))

(assert (=> start!60430 true))

(declare-fun array_inv!14709 (array!39444) Bool)

(assert (=> start!60430 (array_inv!14709 a!3626)))

(declare-fun b!679085 () Bool)

(assert (=> b!679085 (= e!386915 (not true))))

(assert (=> b!679085 (arrayContainsKey!0 (array!39445 (store (arr!18913 a!3626) i!1382 k0!2843) (size!19277 a!3626)) k0!2843 from!3004)))

(declare-fun b!679093 () Bool)

(declare-fun res!445473 () Bool)

(assert (=> b!679093 (=> (not res!445473) (not e!386915))))

(assert (=> b!679093 (= res!445473 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679094 () Bool)

(assert (=> b!679094 (= e!386919 (contains!3531 acc!681 k0!2843))))

(assert (= (and start!60430 res!445470) b!679086))

(assert (= (and b!679086 res!445466) b!679082))

(assert (= (and b!679082 res!445472) b!679091))

(assert (= (and b!679091 res!445465) b!679089))

(assert (= (and b!679089 res!445474) b!679094))

(assert (= (and b!679089 (not res!445469)) b!679084))

(assert (= (and b!679084 res!445476) b!679081))

(assert (= (and b!679089 res!445468) b!679083))

(assert (= (and b!679083 res!445467) b!679093))

(assert (= (and b!679093 res!445473) b!679088))

(assert (= (and b!679088 res!445477) b!679090))

(assert (= (and b!679090 res!445475) b!679092))

(assert (= (and b!679092 res!445478) b!679087))

(assert (= (and b!679087 res!445471) b!679085))

(declare-fun m!644601 () Bool)

(assert (=> b!679081 m!644601))

(declare-fun m!644603 () Bool)

(assert (=> b!679083 m!644603))

(declare-fun m!644605 () Bool)

(assert (=> b!679090 m!644605))

(declare-fun m!644607 () Bool)

(assert (=> b!679086 m!644607))

(declare-fun m!644609 () Bool)

(assert (=> b!679082 m!644609))

(declare-fun m!644611 () Bool)

(assert (=> b!679085 m!644611))

(declare-fun m!644613 () Bool)

(assert (=> b!679085 m!644613))

(declare-fun m!644615 () Bool)

(assert (=> start!60430 m!644615))

(declare-fun m!644617 () Bool)

(assert (=> b!679092 m!644617))

(declare-fun m!644619 () Bool)

(assert (=> b!679091 m!644619))

(assert (=> b!679094 m!644601))

(declare-fun m!644621 () Bool)

(assert (=> b!679093 m!644621))

(check-sat (not b!679086) (not b!679081) (not b!679092) (not b!679094) (not b!679091) (not b!679085) (not b!679093) (not b!679090) (not b!679083) (not start!60430) (not b!679082))
