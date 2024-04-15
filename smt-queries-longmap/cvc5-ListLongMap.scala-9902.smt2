; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117156 () Bool)

(assert start!117156)

(declare-fun b!1378795 () Bool)

(declare-fun res!921374 () Bool)

(declare-fun e!781080 () Bool)

(assert (=> b!1378795 (=> (not res!921374) (not e!781080))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378795 (= res!921374 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378796 () Bool)

(declare-fun res!921373 () Bool)

(assert (=> b!1378796 (=> (not res!921373) (not e!781080))))

(declare-datatypes ((array!93727 0))(
  ( (array!93728 (arr!45264 (Array (_ BitVec 32) (_ BitVec 64))) (size!45816 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93727)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378796 (= res!921373 (and (bvslt (size!45816 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45816 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378794 () Bool)

(declare-fun res!921372 () Bool)

(assert (=> b!1378794 (=> (not res!921372) (not e!781080))))

(assert (=> b!1378794 (= res!921372 (validKeyInArray!0 (select (arr!45264 a!4094) i!1451)))))

(declare-fun b!1378797 () Bool)

(assert (=> b!1378797 (= e!781080 false)))

(declare-fun lt!606829 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93727 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378797 (= lt!606829 (arrayCountValidKeys!0 (array!93728 (store (arr!45264 a!4094) i!1451 k!2953) (size!45816 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606830 () (_ BitVec 32))

(assert (=> b!1378797 (= lt!606830 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921371 () Bool)

(assert (=> start!117156 (=> (not res!921371) (not e!781080))))

(assert (=> start!117156 (= res!921371 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45816 a!4094))))))

(assert (=> start!117156 e!781080))

(assert (=> start!117156 true))

(declare-fun array_inv!34497 (array!93727) Bool)

(assert (=> start!117156 (array_inv!34497 a!4094)))

(assert (= (and start!117156 res!921371) b!1378794))

(assert (= (and b!1378794 res!921372) b!1378795))

(assert (= (and b!1378795 res!921374) b!1378796))

(assert (= (and b!1378796 res!921373) b!1378797))

(declare-fun m!1263187 () Bool)

(assert (=> b!1378795 m!1263187))

(declare-fun m!1263189 () Bool)

(assert (=> b!1378794 m!1263189))

(assert (=> b!1378794 m!1263189))

(declare-fun m!1263191 () Bool)

(assert (=> b!1378794 m!1263191))

(declare-fun m!1263193 () Bool)

(assert (=> b!1378797 m!1263193))

(declare-fun m!1263195 () Bool)

(assert (=> b!1378797 m!1263195))

(declare-fun m!1263197 () Bool)

(assert (=> b!1378797 m!1263197))

(declare-fun m!1263199 () Bool)

(assert (=> start!117156 m!1263199))

(push 1)

(assert (not b!1378794))

(assert (not start!117156))

(assert (not b!1378797))

(assert (not b!1378795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

