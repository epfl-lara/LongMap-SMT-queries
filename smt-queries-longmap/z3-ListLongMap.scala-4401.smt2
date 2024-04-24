; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60564 () Bool)

(assert start!60564)

(declare-fun b!680412 () Bool)

(declare-fun res!446594 () Bool)

(declare-fun e!387577 () Bool)

(assert (=> b!680412 (=> (not res!446594) (not e!387577))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680412 (= res!446594 (validKeyInArray!0 k0!2843))))

(declare-fun b!680413 () Bool)

(declare-fun e!387574 () Bool)

(assert (=> b!680413 (= e!387577 (not e!387574))))

(declare-fun res!446595 () Bool)

(assert (=> b!680413 (=> res!446595 e!387574)))

(declare-datatypes ((array!39483 0))(
  ( (array!39484 (arr!18928 (Array (_ BitVec 32) (_ BitVec 64))) (size!19292 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39483)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!680413 (= res!446595 (not (validKeyInArray!0 (select (arr!18928 a!3626) from!3004))))))

(declare-datatypes ((Unit!23829 0))(
  ( (Unit!23830) )
))
(declare-fun lt!313144 () Unit!23829)

(declare-fun e!387578 () Unit!23829)

(assert (=> b!680413 (= lt!313144 e!387578)))

(declare-fun c!77282 () Bool)

(declare-fun arrayContainsKey!0 (array!39483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680413 (= c!77282 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680413 (arrayContainsKey!0 (array!39484 (store (arr!18928 a!3626) i!1382 k0!2843) (size!19292 a!3626)) k0!2843 from!3004)))

(declare-fun b!680414 () Bool)

(declare-fun Unit!23831 () Unit!23829)

(assert (=> b!680414 (= e!387578 Unit!23831)))

(declare-fun lt!313143 () Unit!23829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39483 (_ BitVec 64) (_ BitVec 32)) Unit!23829)

(assert (=> b!680414 (= lt!313143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680414 false))

(declare-fun b!680415 () Bool)

(declare-fun res!446596 () Bool)

(assert (=> b!680415 (=> (not res!446596) (not e!387577))))

(declare-datatypes ((List!12876 0))(
  ( (Nil!12873) (Cons!12872 (h!13920 (_ BitVec 64)) (t!19096 List!12876)) )
))
(declare-fun acc!681 () List!12876)

(declare-fun noDuplicate!802 (List!12876) Bool)

(assert (=> b!680415 (= res!446596 (noDuplicate!802 acc!681))))

(declare-fun b!680416 () Bool)

(assert (=> b!680416 (= e!387574 true)))

(declare-fun subseq!137 (List!12876 List!12876) Bool)

(assert (=> b!680416 (subseq!137 acc!681 acc!681)))

(declare-fun lt!313142 () Unit!23829)

(declare-fun lemmaListSubSeqRefl!0 (List!12876) Unit!23829)

(assert (=> b!680416 (= lt!313142 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680417 () Bool)

(declare-fun res!446589 () Bool)

(assert (=> b!680417 (=> (not res!446589) (not e!387577))))

(declare-fun contains!3528 (List!12876 (_ BitVec 64)) Bool)

(assert (=> b!680417 (= res!446589 (not (contains!3528 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680418 () Bool)

(declare-fun res!446592 () Bool)

(assert (=> b!680418 (=> (not res!446592) (not e!387577))))

(declare-fun e!387575 () Bool)

(assert (=> b!680418 (= res!446592 e!387575)))

(declare-fun res!446586 () Bool)

(assert (=> b!680418 (=> res!446586 e!387575)))

(declare-fun e!387573 () Bool)

(assert (=> b!680418 (= res!446586 e!387573)))

(declare-fun res!446591 () Bool)

(assert (=> b!680418 (=> (not res!446591) (not e!387573))))

(assert (=> b!680418 (= res!446591 (bvsgt from!3004 i!1382))))

(declare-fun b!680419 () Bool)

(declare-fun res!446597 () Bool)

(assert (=> b!680419 (=> (not res!446597) (not e!387577))))

(declare-fun arrayNoDuplicates!0 (array!39483 (_ BitVec 32) List!12876) Bool)

(assert (=> b!680419 (= res!446597 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680421 () Bool)

(declare-fun e!387576 () Bool)

(assert (=> b!680421 (= e!387576 (not (contains!3528 acc!681 k0!2843)))))

(declare-fun b!680422 () Bool)

(declare-fun res!446587 () Bool)

(assert (=> b!680422 (=> (not res!446587) (not e!387577))))

(assert (=> b!680422 (= res!446587 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19292 a!3626))))))

(declare-fun b!680423 () Bool)

(declare-fun res!446593 () Bool)

(assert (=> b!680423 (=> (not res!446593) (not e!387577))))

(assert (=> b!680423 (= res!446593 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12873))))

(declare-fun b!680424 () Bool)

(declare-fun res!446598 () Bool)

(assert (=> b!680424 (=> (not res!446598) (not e!387577))))

(assert (=> b!680424 (= res!446598 (not (contains!3528 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680425 () Bool)

(declare-fun Unit!23832 () Unit!23829)

(assert (=> b!680425 (= e!387578 Unit!23832)))

(declare-fun b!680426 () Bool)

(declare-fun res!446588 () Bool)

(assert (=> b!680426 (=> (not res!446588) (not e!387577))))

(assert (=> b!680426 (= res!446588 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19292 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680420 () Bool)

(declare-fun res!446585 () Bool)

(assert (=> b!680420 (=> (not res!446585) (not e!387577))))

(assert (=> b!680420 (= res!446585 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!446590 () Bool)

(assert (=> start!60564 (=> (not res!446590) (not e!387577))))

(assert (=> start!60564 (= res!446590 (and (bvslt (size!19292 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19292 a!3626))))))

(assert (=> start!60564 e!387577))

(assert (=> start!60564 true))

(declare-fun array_inv!14787 (array!39483) Bool)

(assert (=> start!60564 (array_inv!14787 a!3626)))

(declare-fun b!680427 () Bool)

(assert (=> b!680427 (= e!387575 e!387576)))

(declare-fun res!446599 () Bool)

(assert (=> b!680427 (=> (not res!446599) (not e!387576))))

(assert (=> b!680427 (= res!446599 (bvsle from!3004 i!1382))))

(declare-fun b!680428 () Bool)

(assert (=> b!680428 (= e!387573 (contains!3528 acc!681 k0!2843))))

(assert (= (and start!60564 res!446590) b!680415))

(assert (= (and b!680415 res!446596) b!680424))

(assert (= (and b!680424 res!446598) b!680417))

(assert (= (and b!680417 res!446589) b!680418))

(assert (= (and b!680418 res!446591) b!680428))

(assert (= (and b!680418 (not res!446586)) b!680427))

(assert (= (and b!680427 res!446599) b!680421))

(assert (= (and b!680418 res!446592) b!680423))

(assert (= (and b!680423 res!446593) b!680419))

(assert (= (and b!680419 res!446597) b!680422))

(assert (= (and b!680422 res!446587) b!680412))

(assert (= (and b!680412 res!446594) b!680420))

(assert (= (and b!680420 res!446585) b!680426))

(assert (= (and b!680426 res!446588) b!680413))

(assert (= (and b!680413 c!77282) b!680414))

(assert (= (and b!680413 (not c!77282)) b!680425))

(assert (= (and b!680413 (not res!446595)) b!680416))

(declare-fun m!646021 () Bool)

(assert (=> b!680423 m!646021))

(declare-fun m!646023 () Bool)

(assert (=> b!680420 m!646023))

(declare-fun m!646025 () Bool)

(assert (=> b!680419 m!646025))

(declare-fun m!646027 () Bool)

(assert (=> b!680421 m!646027))

(declare-fun m!646029 () Bool)

(assert (=> start!60564 m!646029))

(declare-fun m!646031 () Bool)

(assert (=> b!680413 m!646031))

(declare-fun m!646033 () Bool)

(assert (=> b!680413 m!646033))

(declare-fun m!646035 () Bool)

(assert (=> b!680413 m!646035))

(assert (=> b!680413 m!646031))

(declare-fun m!646037 () Bool)

(assert (=> b!680413 m!646037))

(declare-fun m!646039 () Bool)

(assert (=> b!680413 m!646039))

(declare-fun m!646041 () Bool)

(assert (=> b!680412 m!646041))

(assert (=> b!680428 m!646027))

(declare-fun m!646043 () Bool)

(assert (=> b!680415 m!646043))

(declare-fun m!646045 () Bool)

(assert (=> b!680424 m!646045))

(declare-fun m!646047 () Bool)

(assert (=> b!680417 m!646047))

(declare-fun m!646049 () Bool)

(assert (=> b!680416 m!646049))

(declare-fun m!646051 () Bool)

(assert (=> b!680416 m!646051))

(declare-fun m!646053 () Bool)

(assert (=> b!680414 m!646053))

(check-sat (not b!680421) (not b!680417) (not b!680412) (not b!680420) (not start!60564) (not b!680419) (not b!680428) (not b!680424) (not b!680416) (not b!680423) (not b!680414) (not b!680415) (not b!680413))
(check-sat)
