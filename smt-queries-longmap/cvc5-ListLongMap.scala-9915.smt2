; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117258 () Bool)

(assert start!117258)

(declare-fun b!1379550 () Bool)

(declare-fun e!781499 () Bool)

(assert (=> b!1379550 (= e!781499 false)))

(declare-datatypes ((array!93854 0))(
  ( (array!93855 (arr!45326 (Array (_ BitVec 32) (_ BitVec 64))) (size!45876 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93854)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!607659 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93854 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379550 (= lt!607659 (arrayCountValidKeys!0 (array!93855 (store (arr!45326 a!4094) i!1451 k!2953) (size!45876 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607658 () (_ BitVec 32))

(assert (=> b!1379550 (= lt!607658 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379547 () Bool)

(declare-fun res!921987 () Bool)

(assert (=> b!1379547 (=> (not res!921987) (not e!781499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379547 (= res!921987 (validKeyInArray!0 (select (arr!45326 a!4094) i!1451)))))

(declare-fun b!1379548 () Bool)

(declare-fun res!921986 () Bool)

(assert (=> b!1379548 (=> (not res!921986) (not e!781499))))

(assert (=> b!1379548 (= res!921986 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921988 () Bool)

(assert (=> start!117258 (=> (not res!921988) (not e!781499))))

(assert (=> start!117258 (= res!921988 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45876 a!4094))))))

(assert (=> start!117258 e!781499))

(assert (=> start!117258 true))

(declare-fun array_inv!34354 (array!93854) Bool)

(assert (=> start!117258 (array_inv!34354 a!4094)))

(declare-fun b!1379549 () Bool)

(declare-fun res!921985 () Bool)

(assert (=> b!1379549 (=> (not res!921985) (not e!781499))))

(assert (=> b!1379549 (= res!921985 (and (bvslt (size!45876 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45876 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117258 res!921988) b!1379547))

(assert (= (and b!1379547 res!921987) b!1379548))

(assert (= (and b!1379548 res!921986) b!1379549))

(assert (= (and b!1379549 res!921985) b!1379550))

(declare-fun m!1264701 () Bool)

(assert (=> b!1379550 m!1264701))

(declare-fun m!1264703 () Bool)

(assert (=> b!1379550 m!1264703))

(declare-fun m!1264705 () Bool)

(assert (=> b!1379550 m!1264705))

(declare-fun m!1264707 () Bool)

(assert (=> b!1379547 m!1264707))

(assert (=> b!1379547 m!1264707))

(declare-fun m!1264709 () Bool)

(assert (=> b!1379547 m!1264709))

(declare-fun m!1264711 () Bool)

(assert (=> b!1379548 m!1264711))

(declare-fun m!1264713 () Bool)

(assert (=> start!117258 m!1264713))

(push 1)

(assert (not b!1379550))

(assert (not start!117258))

(assert (not b!1379547))

(assert (not b!1379548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

