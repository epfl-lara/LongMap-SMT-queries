; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117334 () Bool)

(assert start!117334)

(declare-fun b!1379728 () Bool)

(declare-fun res!921476 () Bool)

(declare-fun e!781709 () Bool)

(assert (=> b!1379728 (=> (not res!921476) (not e!781709))))

(declare-datatypes ((array!93835 0))(
  ( (array!93836 (arr!45313 (Array (_ BitVec 32) (_ BitVec 64))) (size!45864 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93835)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379728 (= res!921476 (validKeyInArray!0 (select (arr!45313 a!4094) i!1451)))))

(declare-fun b!1379729 () Bool)

(declare-fun e!781708 () Bool)

(assert (=> b!1379729 (= e!781709 e!781708)))

(declare-fun res!921475 () Bool)

(assert (=> b!1379729 (=> (not res!921475) (not e!781708))))

(declare-fun lt!607048 () (_ BitVec 32))

(declare-fun lt!607050 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379729 (= res!921475 (and (= lt!607050 (bvsub lt!607048 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607051 () array!93835)

(declare-fun arrayCountValidKeys!0 (array!93835 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379729 (= lt!607050 (arrayCountValidKeys!0 lt!607051 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379729 (= lt!607048 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379729 (= lt!607051 (array!93836 (store (arr!45313 a!4094) i!1451 k0!2953) (size!45864 a!4094)))))

(declare-fun b!1379730 () Bool)

(declare-fun res!921473 () Bool)

(assert (=> b!1379730 (=> (not res!921473) (not e!781709))))

(assert (=> b!1379730 (= res!921473 (and (bvslt (size!45864 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45864 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379731 () Bool)

(declare-fun res!921477 () Bool)

(assert (=> b!1379731 (=> (not res!921477) (not e!781709))))

(assert (=> b!1379731 (= res!921477 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379732 () Bool)

(assert (=> b!1379732 (= e!781708 (not true))))

(assert (=> b!1379732 (= (bvadd (arrayCountValidKeys!0 lt!607051 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607050) (arrayCountValidKeys!0 lt!607051 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45722 0))(
  ( (Unit!45723) )
))
(declare-fun lt!607047 () Unit!45722)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45722)

(assert (=> b!1379732 (= lt!607047 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607051 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379732 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607048) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607049 () Unit!45722)

(assert (=> b!1379732 (= lt!607049 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921474 () Bool)

(assert (=> start!117334 (=> (not res!921474) (not e!781709))))

(assert (=> start!117334 (= res!921474 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45864 a!4094))))))

(assert (=> start!117334 e!781709))

(assert (=> start!117334 true))

(declare-fun array_inv!34594 (array!93835) Bool)

(assert (=> start!117334 (array_inv!34594 a!4094)))

(assert (= (and start!117334 res!921474) b!1379728))

(assert (= (and b!1379728 res!921476) b!1379731))

(assert (= (and b!1379731 res!921477) b!1379730))

(assert (= (and b!1379730 res!921473) b!1379729))

(assert (= (and b!1379729 res!921475) b!1379732))

(declare-fun m!1264669 () Bool)

(assert (=> b!1379729 m!1264669))

(declare-fun m!1264671 () Bool)

(assert (=> b!1379729 m!1264671))

(declare-fun m!1264673 () Bool)

(assert (=> b!1379729 m!1264673))

(declare-fun m!1264675 () Bool)

(assert (=> b!1379728 m!1264675))

(assert (=> b!1379728 m!1264675))

(declare-fun m!1264677 () Bool)

(assert (=> b!1379728 m!1264677))

(declare-fun m!1264679 () Bool)

(assert (=> start!117334 m!1264679))

(declare-fun m!1264681 () Bool)

(assert (=> b!1379731 m!1264681))

(declare-fun m!1264683 () Bool)

(assert (=> b!1379732 m!1264683))

(declare-fun m!1264685 () Bool)

(assert (=> b!1379732 m!1264685))

(declare-fun m!1264687 () Bool)

(assert (=> b!1379732 m!1264687))

(declare-fun m!1264689 () Bool)

(assert (=> b!1379732 m!1264689))

(declare-fun m!1264691 () Bool)

(assert (=> b!1379732 m!1264691))

(declare-fun m!1264693 () Bool)

(assert (=> b!1379732 m!1264693))

(check-sat (not b!1379731) (not b!1379729) (not b!1379728) (not start!117334) (not b!1379732))
(check-sat)
