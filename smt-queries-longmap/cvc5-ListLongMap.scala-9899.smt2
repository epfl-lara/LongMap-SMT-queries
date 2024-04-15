; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117138 () Bool)

(assert start!117138)

(declare-fun b!1378679 () Bool)

(declare-fun res!921257 () Bool)

(declare-fun e!781026 () Bool)

(assert (=> b!1378679 (=> (not res!921257) (not e!781026))))

(declare-datatypes ((array!93709 0))(
  ( (array!93710 (arr!45255 (Array (_ BitVec 32) (_ BitVec 64))) (size!45807 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93709)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378679 (= res!921257 (and (bvslt (size!45807 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45807 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378680 () Bool)

(assert (=> b!1378680 (= e!781026 false)))

(declare-fun lt!606794 () (_ BitVec 32))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378680 (= lt!606794 (arrayCountValidKeys!0 (array!93710 (store (arr!45255 a!4094) i!1451 k!2953) (size!45807 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606793 () (_ BitVec 32))

(assert (=> b!1378680 (= lt!606793 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921255 () Bool)

(assert (=> start!117138 (=> (not res!921255) (not e!781026))))

(assert (=> start!117138 (= res!921255 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45807 a!4094))))))

(assert (=> start!117138 e!781026))

(assert (=> start!117138 true))

(declare-fun array_inv!34488 (array!93709) Bool)

(assert (=> start!117138 (array_inv!34488 a!4094)))

(declare-fun b!1378677 () Bool)

(declare-fun res!921256 () Bool)

(assert (=> b!1378677 (=> (not res!921256) (not e!781026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378677 (= res!921256 (validKeyInArray!0 (select (arr!45255 a!4094) i!1451)))))

(declare-fun b!1378678 () Bool)

(declare-fun res!921254 () Bool)

(assert (=> b!1378678 (=> (not res!921254) (not e!781026))))

(assert (=> b!1378678 (= res!921254 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117138 res!921255) b!1378677))

(assert (= (and b!1378677 res!921256) b!1378678))

(assert (= (and b!1378678 res!921254) b!1378679))

(assert (= (and b!1378679 res!921257) b!1378680))

(declare-fun m!1263061 () Bool)

(assert (=> b!1378680 m!1263061))

(declare-fun m!1263063 () Bool)

(assert (=> b!1378680 m!1263063))

(declare-fun m!1263065 () Bool)

(assert (=> b!1378680 m!1263065))

(declare-fun m!1263067 () Bool)

(assert (=> start!117138 m!1263067))

(declare-fun m!1263069 () Bool)

(assert (=> b!1378677 m!1263069))

(assert (=> b!1378677 m!1263069))

(declare-fun m!1263071 () Bool)

(assert (=> b!1378677 m!1263071))

(declare-fun m!1263073 () Bool)

(assert (=> b!1378678 m!1263073))

(push 1)

(assert (not start!117138))

(assert (not b!1378677))

(assert (not b!1378678))

(assert (not b!1378680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

