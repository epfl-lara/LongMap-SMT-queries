; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117132 () Bool)

(assert start!117132)

(declare-fun b!1378679 () Bool)

(declare-fun res!921214 () Bool)

(declare-fun e!781027 () Bool)

(assert (=> b!1378679 (=> (not res!921214) (not e!781027))))

(declare-datatypes ((array!93749 0))(
  ( (array!93750 (arr!45275 (Array (_ BitVec 32) (_ BitVec 64))) (size!45825 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93749)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378679 (= res!921214 (and (bvslt (size!45825 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45825 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378680 () Bool)

(declare-fun res!921213 () Bool)

(assert (=> b!1378680 (=> (not res!921213) (not e!781027))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378680 (= res!921213 (= (arrayCountValidKeys!0 (array!93750 (store (arr!45275 a!4094) i!1451 k!2953) (size!45825 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun res!921215 () Bool)

(assert (=> start!117132 (=> (not res!921215) (not e!781027))))

(assert (=> start!117132 (= res!921215 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45825 a!4094))))))

(assert (=> start!117132 e!781027))

(assert (=> start!117132 true))

(declare-fun array_inv!34303 (array!93749) Bool)

(assert (=> start!117132 (array_inv!34303 a!4094)))

(declare-fun b!1378681 () Bool)

(assert (=> b!1378681 (= e!781027 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1378682 () Bool)

(declare-fun res!921216 () Bool)

(assert (=> b!1378682 (=> (not res!921216) (not e!781027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378682 (= res!921216 (validKeyInArray!0 (select (arr!45275 a!4094) i!1451)))))

(declare-fun b!1378683 () Bool)

(declare-fun res!921217 () Bool)

(assert (=> b!1378683 (=> (not res!921217) (not e!781027))))

(assert (=> b!1378683 (= res!921217 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117132 res!921215) b!1378682))

(assert (= (and b!1378682 res!921216) b!1378683))

(assert (= (and b!1378683 res!921217) b!1378679))

(assert (= (and b!1378679 res!921214) b!1378680))

(assert (= (and b!1378680 res!921213) b!1378681))

(declare-fun m!1263495 () Bool)

(assert (=> b!1378680 m!1263495))

(declare-fun m!1263497 () Bool)

(assert (=> b!1378680 m!1263497))

(declare-fun m!1263499 () Bool)

(assert (=> b!1378680 m!1263499))

(declare-fun m!1263501 () Bool)

(assert (=> start!117132 m!1263501))

(declare-fun m!1263503 () Bool)

(assert (=> b!1378682 m!1263503))

(assert (=> b!1378682 m!1263503))

(declare-fun m!1263505 () Bool)

(assert (=> b!1378682 m!1263505))

(declare-fun m!1263507 () Bool)

(assert (=> b!1378683 m!1263507))

(push 1)

(assert (not start!117132))

(assert (not b!1378680))

(assert (not b!1378682))

(assert (not b!1378683))

(check-sat)

(pop 1)

