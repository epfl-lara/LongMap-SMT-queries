; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115476 () Bool)

(assert start!115476)

(declare-fun b!1366025 () Bool)

(declare-fun res!909610 () Bool)

(declare-fun e!774343 () Bool)

(assert (=> b!1366025 (=> (not res!909610) (not e!774343))))

(declare-datatypes ((List!31895 0))(
  ( (Nil!31892) (Cons!31891 (h!33100 (_ BitVec 64)) (t!46589 List!31895)) )
))
(declare-fun newAcc!98 () List!31895)

(declare-fun contains!9577 (List!31895 (_ BitVec 64)) Bool)

(assert (=> b!1366025 (= res!909610 (not (contains!9577 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366026 () Bool)

(declare-fun res!909602 () Bool)

(declare-fun e!774340 () Bool)

(assert (=> b!1366026 (=> (not res!909602) (not e!774340))))

(declare-datatypes ((array!92797 0))(
  ( (array!92798 (arr!44827 (Array (_ BitVec 32) (_ BitVec 64))) (size!45377 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92797)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!31895)

(assert (=> b!1366026 (= res!909602 (not (contains!9577 acc!866 (select (arr!44827 a!3861) from!3239))))))

(declare-fun b!1366027 () Bool)

(declare-fun res!909600 () Bool)

(declare-fun e!774342 () Bool)

(assert (=> b!1366027 (=> (not res!909600) (not e!774342))))

(declare-fun lt!601450 () List!31895)

(assert (=> b!1366027 (= res!909600 (not (contains!9577 lt!601450 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366028 () Bool)

(declare-fun res!909611 () Bool)

(assert (=> b!1366028 (=> (not res!909611) (not e!774342))))

(declare-fun noDuplicate!2434 (List!31895) Bool)

(assert (=> b!1366028 (= res!909611 (noDuplicate!2434 lt!601450))))

(declare-fun b!1366029 () Bool)

(assert (=> b!1366029 (= e!774342 false)))

(declare-fun lt!601451 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92797 (_ BitVec 32) List!31895) Bool)

(assert (=> b!1366029 (= lt!601451 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601450))))

(declare-datatypes ((Unit!45091 0))(
  ( (Unit!45092) )
))
(declare-fun lt!601449 () Unit!45091)

(declare-fun lt!601453 () List!31895)

(declare-fun noDuplicateSubseq!166 (List!31895 List!31895) Unit!45091)

(assert (=> b!1366029 (= lt!601449 (noDuplicateSubseq!166 lt!601453 lt!601450))))

(declare-fun b!1366030 () Bool)

(declare-fun res!909615 () Bool)

(assert (=> b!1366030 (=> (not res!909615) (not e!774342))))

(declare-fun subseq!979 (List!31895 List!31895) Bool)

(assert (=> b!1366030 (= res!909615 (subseq!979 lt!601453 lt!601450))))

(declare-fun res!909608 () Bool)

(assert (=> start!115476 (=> (not res!909608) (not e!774343))))

(assert (=> start!115476 (= res!909608 (and (bvslt (size!45377 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45377 a!3861))))))

(assert (=> start!115476 e!774343))

(declare-fun array_inv!33855 (array!92797) Bool)

(assert (=> start!115476 (array_inv!33855 a!3861)))

(assert (=> start!115476 true))

(declare-fun b!1366031 () Bool)

(declare-fun res!909601 () Bool)

(assert (=> b!1366031 (=> (not res!909601) (not e!774342))))

(assert (=> b!1366031 (= res!909601 (not (contains!9577 lt!601453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366032 () Bool)

(declare-fun res!909605 () Bool)

(assert (=> b!1366032 (=> (not res!909605) (not e!774342))))

(assert (=> b!1366032 (= res!909605 (not (contains!9577 lt!601453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366033 () Bool)

(assert (=> b!1366033 (= e!774343 e!774340)))

(declare-fun res!909612 () Bool)

(assert (=> b!1366033 (=> (not res!909612) (not e!774340))))

(assert (=> b!1366033 (= res!909612 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601452 () Unit!45091)

(assert (=> b!1366033 (= lt!601452 (noDuplicateSubseq!166 newAcc!98 acc!866))))

(declare-fun b!1366034 () Bool)

(declare-fun res!909609 () Bool)

(assert (=> b!1366034 (=> (not res!909609) (not e!774340))))

(assert (=> b!1366034 (= res!909609 (bvslt from!3239 (size!45377 a!3861)))))

(declare-fun b!1366035 () Bool)

(declare-fun res!909607 () Bool)

(assert (=> b!1366035 (=> (not res!909607) (not e!774343))))

(assert (=> b!1366035 (= res!909607 (subseq!979 newAcc!98 acc!866))))

(declare-fun b!1366036 () Bool)

(declare-fun res!909606 () Bool)

(assert (=> b!1366036 (=> (not res!909606) (not e!774343))))

(assert (=> b!1366036 (= res!909606 (not (contains!9577 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366037 () Bool)

(declare-fun res!909604 () Bool)

(assert (=> b!1366037 (=> (not res!909604) (not e!774343))))

(assert (=> b!1366037 (= res!909604 (not (contains!9577 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366038 () Bool)

(declare-fun res!909613 () Bool)

(assert (=> b!1366038 (=> (not res!909613) (not e!774343))))

(assert (=> b!1366038 (= res!909613 (noDuplicate!2434 acc!866))))

(declare-fun b!1366039 () Bool)

(declare-fun res!909616 () Bool)

(assert (=> b!1366039 (=> (not res!909616) (not e!774340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366039 (= res!909616 (validKeyInArray!0 (select (arr!44827 a!3861) from!3239)))))

(declare-fun b!1366040 () Bool)

(assert (=> b!1366040 (= e!774340 e!774342)))

(declare-fun res!909603 () Bool)

(assert (=> b!1366040 (=> (not res!909603) (not e!774342))))

(assert (=> b!1366040 (= res!909603 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366040 (= lt!601453 (Cons!31891 (select (arr!44827 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366040 (= lt!601450 (Cons!31891 (select (arr!44827 a!3861) from!3239) acc!866))))

(declare-fun b!1366041 () Bool)

(declare-fun res!909614 () Bool)

(assert (=> b!1366041 (=> (not res!909614) (not e!774342))))

(assert (=> b!1366041 (= res!909614 (not (contains!9577 lt!601450 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366042 () Bool)

(declare-fun res!909599 () Bool)

(assert (=> b!1366042 (=> (not res!909599) (not e!774343))))

(assert (=> b!1366042 (= res!909599 (not (contains!9577 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115476 res!909608) b!1366038))

(assert (= (and b!1366038 res!909613) b!1366042))

(assert (= (and b!1366042 res!909599) b!1366036))

(assert (= (and b!1366036 res!909606) b!1366025))

(assert (= (and b!1366025 res!909610) b!1366037))

(assert (= (and b!1366037 res!909604) b!1366035))

(assert (= (and b!1366035 res!909607) b!1366033))

(assert (= (and b!1366033 res!909612) b!1366034))

(assert (= (and b!1366034 res!909609) b!1366039))

(assert (= (and b!1366039 res!909616) b!1366026))

(assert (= (and b!1366026 res!909602) b!1366040))

(assert (= (and b!1366040 res!909603) b!1366028))

(assert (= (and b!1366028 res!909611) b!1366041))

(assert (= (and b!1366041 res!909614) b!1366027))

(assert (= (and b!1366027 res!909600) b!1366032))

(assert (= (and b!1366032 res!909605) b!1366031))

(assert (= (and b!1366031 res!909601) b!1366030))

(assert (= (and b!1366030 res!909615) b!1366029))

(declare-fun m!1250421 () Bool)

(assert (=> b!1366033 m!1250421))

(declare-fun m!1250423 () Bool)

(assert (=> b!1366033 m!1250423))

(declare-fun m!1250425 () Bool)

(assert (=> start!115476 m!1250425))

(declare-fun m!1250427 () Bool)

(assert (=> b!1366035 m!1250427))

(declare-fun m!1250429 () Bool)

(assert (=> b!1366039 m!1250429))

(assert (=> b!1366039 m!1250429))

(declare-fun m!1250431 () Bool)

(assert (=> b!1366039 m!1250431))

(declare-fun m!1250433 () Bool)

(assert (=> b!1366028 m!1250433))

(declare-fun m!1250435 () Bool)

(assert (=> b!1366027 m!1250435))

(declare-fun m!1250437 () Bool)

(assert (=> b!1366032 m!1250437))

(declare-fun m!1250439 () Bool)

(assert (=> b!1366038 m!1250439))

(declare-fun m!1250441 () Bool)

(assert (=> b!1366041 m!1250441))

(assert (=> b!1366026 m!1250429))

(assert (=> b!1366026 m!1250429))

(declare-fun m!1250443 () Bool)

(assert (=> b!1366026 m!1250443))

(declare-fun m!1250445 () Bool)

(assert (=> b!1366036 m!1250445))

(declare-fun m!1250447 () Bool)

(assert (=> b!1366029 m!1250447))

(declare-fun m!1250449 () Bool)

(assert (=> b!1366029 m!1250449))

(declare-fun m!1250451 () Bool)

(assert (=> b!1366025 m!1250451))

(declare-fun m!1250453 () Bool)

(assert (=> b!1366042 m!1250453))

(declare-fun m!1250455 () Bool)

(assert (=> b!1366030 m!1250455))

(assert (=> b!1366040 m!1250429))

(declare-fun m!1250457 () Bool)

(assert (=> b!1366031 m!1250457))

(declare-fun m!1250459 () Bool)

(assert (=> b!1366037 m!1250459))

(push 1)

