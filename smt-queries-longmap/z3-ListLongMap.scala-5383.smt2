; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71898 () Bool)

(assert start!71898)

(declare-fun b!835470 () Bool)

(declare-fun res!568346 () Bool)

(declare-fun e!466069 () Bool)

(assert (=> b!835470 (=> (not res!568346) (not e!466069))))

(declare-datatypes ((array!46808 0))(
  ( (array!46809 (arr!22438 (Array (_ BitVec 32) (_ BitVec 64))) (size!22859 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46808)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835470 (= res!568346 (not (validKeyInArray!0 (select (arr!22438 a!4227) i!1466))))))

(declare-fun b!835471 () Bool)

(declare-fun e!466070 () Bool)

(assert (=> b!835471 (= e!466069 e!466070)))

(declare-fun res!568341 () Bool)

(assert (=> b!835471 (=> (not res!568341) (not e!466070))))

(declare-fun lt!379732 () (_ BitVec 32))

(declare-fun lt!379730 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835471 (= res!568341 (and (= lt!379732 lt!379730) (not (= to!390 (size!22859 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46808 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835471 (= lt!379730 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835471 (= lt!379732 (arrayCountValidKeys!0 (array!46809 (store (arr!22438 a!4227) i!1466 k0!2968) (size!22859 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835472 () Bool)

(declare-fun res!568342 () Bool)

(assert (=> b!835472 (=> (not res!568342) (not e!466069))))

(assert (=> b!835472 (= res!568342 (and (bvslt (size!22859 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22859 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568343 () Bool)

(assert (=> start!71898 (=> (not res!568343) (not e!466069))))

(assert (=> start!71898 (= res!568343 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22859 a!4227))))))

(assert (=> start!71898 e!466069))

(assert (=> start!71898 true))

(declare-fun array_inv!17885 (array!46808) Bool)

(assert (=> start!71898 (array_inv!17885 a!4227)))

(declare-fun b!835473 () Bool)

(declare-fun res!568344 () Bool)

(assert (=> b!835473 (=> (not res!568344) (not e!466070))))

(assert (=> b!835473 (= res!568344 (not (validKeyInArray!0 (select (arr!22438 a!4227) to!390))))))

(declare-fun b!835474 () Bool)

(declare-fun res!568345 () Bool)

(assert (=> b!835474 (=> (not res!568345) (not e!466069))))

(assert (=> b!835474 (= res!568345 (validKeyInArray!0 k0!2968))))

(declare-fun b!835475 () Bool)

(assert (=> b!835475 (= e!466070 (not true))))

(assert (=> b!835475 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379730)))

(declare-datatypes ((Unit!28721 0))(
  ( (Unit!28722) )
))
(declare-fun lt!379731 () Unit!28721)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46808 (_ BitVec 32) (_ BitVec 32)) Unit!28721)

(assert (=> b!835475 (= lt!379731 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71898 res!568343) b!835470))

(assert (= (and b!835470 res!568346) b!835474))

(assert (= (and b!835474 res!568345) b!835472))

(assert (= (and b!835472 res!568342) b!835471))

(assert (= (and b!835471 res!568341) b!835473))

(assert (= (and b!835473 res!568344) b!835475))

(declare-fun m!780643 () Bool)

(assert (=> b!835471 m!780643))

(declare-fun m!780645 () Bool)

(assert (=> b!835471 m!780645))

(declare-fun m!780647 () Bool)

(assert (=> b!835471 m!780647))

(declare-fun m!780649 () Bool)

(assert (=> b!835473 m!780649))

(assert (=> b!835473 m!780649))

(declare-fun m!780651 () Bool)

(assert (=> b!835473 m!780651))

(declare-fun m!780653 () Bool)

(assert (=> b!835475 m!780653))

(declare-fun m!780655 () Bool)

(assert (=> b!835475 m!780655))

(declare-fun m!780657 () Bool)

(assert (=> start!71898 m!780657))

(declare-fun m!780659 () Bool)

(assert (=> b!835470 m!780659))

(assert (=> b!835470 m!780659))

(declare-fun m!780661 () Bool)

(assert (=> b!835470 m!780661))

(declare-fun m!780663 () Bool)

(assert (=> b!835474 m!780663))

(check-sat (not b!835471) (not b!835474) (not b!835475) (not b!835470) (not b!835473) (not start!71898))
(check-sat)
