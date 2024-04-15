; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115846 () Bool)

(assert start!115846)

(declare-fun b!1369469 () Bool)

(declare-fun res!912980 () Bool)

(declare-fun e!775813 () Bool)

(assert (=> b!1369469 (=> (not res!912980) (not e!775813))))

(declare-datatypes ((List!32027 0))(
  ( (Nil!32024) (Cons!32023 (h!33232 (_ BitVec 64)) (t!46713 List!32027)) )
))
(declare-fun acc!866 () List!32027)

(declare-fun contains!9620 (List!32027 (_ BitVec 64)) Bool)

(assert (=> b!1369469 (= res!912980 (not (contains!9620 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369470 () Bool)

(declare-fun res!912978 () Bool)

(assert (=> b!1369470 (=> (not res!912978) (not e!775813))))

(assert (=> b!1369470 (= res!912978 (not (contains!9620 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369472 () Bool)

(declare-fun res!912976 () Bool)

(declare-fun e!775815 () Bool)

(assert (=> b!1369472 (=> (not res!912976) (not e!775815))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92919 0))(
  ( (array!92920 (arr!44881 (Array (_ BitVec 32) (_ BitVec 64))) (size!45433 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92919)

(assert (=> b!1369472 (= res!912976 (bvsge from!3239 (size!45433 a!3861)))))

(declare-fun b!1369473 () Bool)

(assert (=> b!1369473 (= e!775815 false)))

(declare-fun lt!602094 () Bool)

(declare-fun newAcc!98 () List!32027)

(declare-fun noDuplicate!2535 (List!32027) Bool)

(assert (=> b!1369473 (= lt!602094 (noDuplicate!2535 newAcc!98))))

(declare-fun b!1369474 () Bool)

(assert (=> b!1369474 (= e!775813 e!775815)))

(declare-fun res!912972 () Bool)

(assert (=> b!1369474 (=> (not res!912972) (not e!775815))))

(declare-fun arrayNoDuplicates!0 (array!92919 (_ BitVec 32) List!32027) Bool)

(assert (=> b!1369474 (= res!912972 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45090 0))(
  ( (Unit!45091) )
))
(declare-fun lt!602093 () Unit!45090)

(declare-fun noDuplicateSubseq!245 (List!32027 List!32027) Unit!45090)

(assert (=> b!1369474 (= lt!602093 (noDuplicateSubseq!245 newAcc!98 acc!866))))

(declare-fun b!1369475 () Bool)

(declare-fun res!912977 () Bool)

(assert (=> b!1369475 (=> (not res!912977) (not e!775813))))

(declare-fun subseq!1058 (List!32027 List!32027) Bool)

(assert (=> b!1369475 (= res!912977 (subseq!1058 newAcc!98 acc!866))))

(declare-fun b!1369476 () Bool)

(declare-fun res!912974 () Bool)

(assert (=> b!1369476 (=> (not res!912974) (not e!775813))))

(assert (=> b!1369476 (= res!912974 (not (contains!9620 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369477 () Bool)

(declare-fun res!912975 () Bool)

(assert (=> b!1369477 (=> (not res!912975) (not e!775813))))

(assert (=> b!1369477 (= res!912975 (noDuplicate!2535 acc!866))))

(declare-fun b!1369471 () Bool)

(declare-fun res!912973 () Bool)

(assert (=> b!1369471 (=> (not res!912973) (not e!775813))))

(assert (=> b!1369471 (= res!912973 (not (contains!9620 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912979 () Bool)

(assert (=> start!115846 (=> (not res!912979) (not e!775813))))

(assert (=> start!115846 (= res!912979 (and (bvslt (size!45433 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45433 a!3861))))))

(assert (=> start!115846 e!775813))

(declare-fun array_inv!34114 (array!92919) Bool)

(assert (=> start!115846 (array_inv!34114 a!3861)))

(assert (=> start!115846 true))

(assert (= (and start!115846 res!912979) b!1369477))

(assert (= (and b!1369477 res!912975) b!1369469))

(assert (= (and b!1369469 res!912980) b!1369470))

(assert (= (and b!1369470 res!912978) b!1369471))

(assert (= (and b!1369471 res!912973) b!1369476))

(assert (= (and b!1369476 res!912974) b!1369475))

(assert (= (and b!1369475 res!912977) b!1369474))

(assert (= (and b!1369474 res!912972) b!1369472))

(assert (= (and b!1369472 res!912976) b!1369473))

(declare-fun m!1252779 () Bool)

(assert (=> b!1369475 m!1252779))

(declare-fun m!1252781 () Bool)

(assert (=> b!1369473 m!1252781))

(declare-fun m!1252783 () Bool)

(assert (=> b!1369470 m!1252783))

(declare-fun m!1252785 () Bool)

(assert (=> b!1369477 m!1252785))

(declare-fun m!1252787 () Bool)

(assert (=> b!1369476 m!1252787))

(declare-fun m!1252789 () Bool)

(assert (=> b!1369474 m!1252789))

(declare-fun m!1252791 () Bool)

(assert (=> b!1369474 m!1252791))

(declare-fun m!1252793 () Bool)

(assert (=> b!1369471 m!1252793))

(declare-fun m!1252795 () Bool)

(assert (=> start!115846 m!1252795))

(declare-fun m!1252797 () Bool)

(assert (=> b!1369469 m!1252797))

(check-sat (not b!1369471) (not start!115846) (not b!1369476) (not b!1369473) (not b!1369474) (not b!1369470) (not b!1369469) (not b!1369477) (not b!1369475))
(check-sat)
