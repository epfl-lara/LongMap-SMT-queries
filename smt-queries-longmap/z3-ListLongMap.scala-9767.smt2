; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115948 () Bool)

(assert start!115948)

(declare-fun b!1369776 () Bool)

(declare-fun res!912505 () Bool)

(declare-fun e!776187 () Bool)

(assert (=> b!1369776 (=> (not res!912505) (not e!776187))))

(declare-datatypes ((List!31990 0))(
  ( (Nil!31987) (Cons!31986 (h!33204 (_ BitVec 64)) (t!46676 List!31990)) )
))
(declare-fun newAcc!98 () List!31990)

(declare-fun acc!866 () List!31990)

(declare-fun subseq!1034 (List!31990 List!31990) Bool)

(assert (=> b!1369776 (= res!912505 (subseq!1034 newAcc!98 acc!866))))

(declare-fun b!1369777 () Bool)

(declare-fun res!912509 () Bool)

(assert (=> b!1369777 (=> (not res!912509) (not e!776187))))

(declare-fun contains!9675 (List!31990 (_ BitVec 64)) Bool)

(assert (=> b!1369777 (= res!912509 (not (contains!9675 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369778 () Bool)

(declare-fun res!912511 () Bool)

(assert (=> b!1369778 (=> (not res!912511) (not e!776187))))

(declare-fun noDuplicate!2506 (List!31990) Bool)

(assert (=> b!1369778 (= res!912511 (noDuplicate!2506 acc!866))))

(declare-fun b!1369779 () Bool)

(declare-fun res!912504 () Bool)

(declare-fun e!776188 () Bool)

(assert (=> b!1369779 (=> (not res!912504) (not e!776188))))

(declare-datatypes ((array!93031 0))(
  ( (array!93032 (arr!44935 (Array (_ BitVec 32) (_ BitVec 64))) (size!45486 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93031)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369779 (= res!912504 (not (validKeyInArray!0 (select (arr!44935 a!3861) from!3239))))))

(declare-fun b!1369780 () Bool)

(assert (=> b!1369780 (= e!776187 e!776188)))

(declare-fun res!912508 () Bool)

(assert (=> b!1369780 (=> (not res!912508) (not e!776188))))

(declare-fun arrayNoDuplicates!0 (array!93031 (_ BitVec 32) List!31990) Bool)

(assert (=> b!1369780 (= res!912508 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45140 0))(
  ( (Unit!45141) )
))
(declare-fun lt!602549 () Unit!45140)

(declare-fun noDuplicateSubseq!221 (List!31990 List!31990) Unit!45140)

(assert (=> b!1369780 (= lt!602549 (noDuplicateSubseq!221 newAcc!98 acc!866))))

(declare-fun b!1369782 () Bool)

(declare-fun res!912503 () Bool)

(assert (=> b!1369782 (=> (not res!912503) (not e!776187))))

(assert (=> b!1369782 (= res!912503 (not (contains!9675 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369783 () Bool)

(declare-fun res!912510 () Bool)

(assert (=> b!1369783 (=> (not res!912510) (not e!776188))))

(assert (=> b!1369783 (= res!912510 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369784 () Bool)

(declare-fun res!912506 () Bool)

(assert (=> b!1369784 (=> (not res!912506) (not e!776187))))

(assert (=> b!1369784 (= res!912506 (not (contains!9675 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369785 () Bool)

(declare-fun res!912507 () Bool)

(assert (=> b!1369785 (=> (not res!912507) (not e!776187))))

(assert (=> b!1369785 (= res!912507 (not (contains!9675 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369786 () Bool)

(declare-fun res!912512 () Bool)

(assert (=> b!1369786 (=> (not res!912512) (not e!776188))))

(assert (=> b!1369786 (= res!912512 (bvslt from!3239 (size!45486 a!3861)))))

(declare-fun b!1369781 () Bool)

(assert (=> b!1369781 (= e!776188 false)))

(declare-fun lt!602550 () Bool)

(assert (=> b!1369781 (= lt!602550 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun res!912513 () Bool)

(assert (=> start!115948 (=> (not res!912513) (not e!776187))))

(assert (=> start!115948 (= res!912513 (and (bvslt (size!45486 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45486 a!3861))))))

(assert (=> start!115948 e!776187))

(declare-fun array_inv!34216 (array!93031) Bool)

(assert (=> start!115948 (array_inv!34216 a!3861)))

(assert (=> start!115948 true))

(assert (= (and start!115948 res!912513) b!1369778))

(assert (= (and b!1369778 res!912511) b!1369784))

(assert (= (and b!1369784 res!912506) b!1369785))

(assert (= (and b!1369785 res!912507) b!1369782))

(assert (= (and b!1369782 res!912503) b!1369777))

(assert (= (and b!1369777 res!912509) b!1369776))

(assert (= (and b!1369776 res!912505) b!1369780))

(assert (= (and b!1369780 res!912508) b!1369786))

(assert (= (and b!1369786 res!912512) b!1369779))

(assert (= (and b!1369779 res!912504) b!1369783))

(assert (= (and b!1369783 res!912510) b!1369781))

(declare-fun m!1254031 () Bool)

(assert (=> b!1369776 m!1254031))

(declare-fun m!1254033 () Bool)

(assert (=> b!1369785 m!1254033))

(declare-fun m!1254035 () Bool)

(assert (=> b!1369777 m!1254035))

(declare-fun m!1254037 () Bool)

(assert (=> b!1369779 m!1254037))

(assert (=> b!1369779 m!1254037))

(declare-fun m!1254039 () Bool)

(assert (=> b!1369779 m!1254039))

(declare-fun m!1254041 () Bool)

(assert (=> b!1369784 m!1254041))

(declare-fun m!1254043 () Bool)

(assert (=> b!1369781 m!1254043))

(declare-fun m!1254045 () Bool)

(assert (=> start!115948 m!1254045))

(declare-fun m!1254047 () Bool)

(assert (=> b!1369778 m!1254047))

(declare-fun m!1254049 () Bool)

(assert (=> b!1369780 m!1254049))

(declare-fun m!1254051 () Bool)

(assert (=> b!1369780 m!1254051))

(declare-fun m!1254053 () Bool)

(assert (=> b!1369782 m!1254053))

(check-sat (not b!1369784) (not b!1369782) (not b!1369779) (not start!115948) (not b!1369777) (not b!1369778) (not b!1369776) (not b!1369780) (not b!1369781) (not b!1369785))
(check-sat)
