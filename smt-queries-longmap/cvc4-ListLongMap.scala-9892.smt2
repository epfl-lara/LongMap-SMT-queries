; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117330 () Bool)

(assert start!117330)

(declare-fun b!1379698 () Bool)

(declare-fun e!781691 () Bool)

(declare-fun e!781690 () Bool)

(assert (=> b!1379698 (= e!781691 e!781690)))

(declare-fun res!921444 () Bool)

(assert (=> b!1379698 (=> (not res!921444) (not e!781690))))

(declare-fun lt!607019 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607017 () (_ BitVec 32))

(assert (=> b!1379698 (= res!921444 (and (= lt!607017 (bvsub lt!607019 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93831 0))(
  ( (array!93832 (arr!45311 (Array (_ BitVec 32) (_ BitVec 64))) (size!45862 (_ BitVec 32))) )
))
(declare-fun lt!607021 () array!93831)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93831 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379698 (= lt!607017 (arrayCountValidKeys!0 lt!607021 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93831)

(assert (=> b!1379698 (= lt!607019 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379698 (= lt!607021 (array!93832 (store (arr!45311 a!4094) i!1451 k!2953) (size!45862 a!4094)))))

(declare-fun res!921446 () Bool)

(assert (=> start!117330 (=> (not res!921446) (not e!781691))))

(assert (=> start!117330 (= res!921446 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45862 a!4094))))))

(assert (=> start!117330 e!781691))

(assert (=> start!117330 true))

(declare-fun array_inv!34592 (array!93831) Bool)

(assert (=> start!117330 (array_inv!34592 a!4094)))

(declare-fun b!1379699 () Bool)

(declare-fun res!921445 () Bool)

(assert (=> b!1379699 (=> (not res!921445) (not e!781691))))

(assert (=> b!1379699 (= res!921445 (and (bvslt (size!45862 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45862 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379700 () Bool)

(declare-fun res!921447 () Bool)

(assert (=> b!1379700 (=> (not res!921447) (not e!781691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379700 (= res!921447 (validKeyInArray!0 (select (arr!45311 a!4094) i!1451)))))

(declare-fun b!1379701 () Bool)

(assert (=> b!1379701 (= e!781690 (not true))))

(assert (=> b!1379701 (= (bvadd (arrayCountValidKeys!0 lt!607021 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607017) (arrayCountValidKeys!0 lt!607021 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45718 0))(
  ( (Unit!45719) )
))
(declare-fun lt!607020 () Unit!45718)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45718)

(assert (=> b!1379701 (= lt!607020 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607021 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379701 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607019) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607018 () Unit!45718)

(assert (=> b!1379701 (= lt!607018 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379702 () Bool)

(declare-fun res!921443 () Bool)

(assert (=> b!1379702 (=> (not res!921443) (not e!781691))))

(assert (=> b!1379702 (= res!921443 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117330 res!921446) b!1379700))

(assert (= (and b!1379700 res!921447) b!1379702))

(assert (= (and b!1379702 res!921443) b!1379699))

(assert (= (and b!1379699 res!921445) b!1379698))

(assert (= (and b!1379698 res!921444) b!1379701))

(declare-fun m!1264617 () Bool)

(assert (=> b!1379698 m!1264617))

(declare-fun m!1264619 () Bool)

(assert (=> b!1379698 m!1264619))

(declare-fun m!1264621 () Bool)

(assert (=> b!1379698 m!1264621))

(declare-fun m!1264623 () Bool)

(assert (=> b!1379701 m!1264623))

(declare-fun m!1264625 () Bool)

(assert (=> b!1379701 m!1264625))

(declare-fun m!1264627 () Bool)

(assert (=> b!1379701 m!1264627))

(declare-fun m!1264629 () Bool)

(assert (=> b!1379701 m!1264629))

(declare-fun m!1264631 () Bool)

(assert (=> b!1379701 m!1264631))

(declare-fun m!1264633 () Bool)

(assert (=> b!1379701 m!1264633))

(declare-fun m!1264635 () Bool)

(assert (=> start!117330 m!1264635))

(declare-fun m!1264637 () Bool)

(assert (=> b!1379700 m!1264637))

(assert (=> b!1379700 m!1264637))

(declare-fun m!1264639 () Bool)

(assert (=> b!1379700 m!1264639))

(declare-fun m!1264641 () Bool)

(assert (=> b!1379702 m!1264641))

(push 1)

(assert (not b!1379700))

(assert (not start!117330))

(assert (not b!1379702))

(assert (not b!1379701))

(assert (not b!1379698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

