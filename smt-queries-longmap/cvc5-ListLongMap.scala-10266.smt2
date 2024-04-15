; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120756 () Bool)

(assert start!120756)

(declare-fun b!1405056 () Bool)

(declare-fun res!943324 () Bool)

(declare-fun e!795388 () Bool)

(assert (=> b!1405056 (=> (not res!943324) (not e!795388))))

(declare-datatypes ((array!96016 0))(
  ( (array!96017 (arr!46356 (Array (_ BitVec 32) (_ BitVec 64))) (size!46908 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96016)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405056 (= res!943324 (validKeyInArray!0 (select (arr!46356 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1405057 () Bool)

(declare-fun e!795387 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10693 0))(
  ( (MissingZero!10693 (index!45149 (_ BitVec 32))) (Found!10693 (index!45150 (_ BitVec 32))) (Intermediate!10693 (undefined!11505 Bool) (index!45151 (_ BitVec 32)) (x!126761 (_ BitVec 32))) (Undefined!10693) (MissingVacant!10693 (index!45152 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96016 (_ BitVec 32)) SeekEntryResult!10693)

(assert (=> b!1405057 (= e!795387 (= (seekEntryOrOpen!0 (select (arr!46356 a!2901) j!112) a!2901 mask!2840) (Found!10693 j!112)))))

(declare-fun b!1405058 () Bool)

(declare-fun res!943328 () Bool)

(assert (=> b!1405058 (=> (not res!943328) (not e!795388))))

(declare-datatypes ((List!32953 0))(
  ( (Nil!32950) (Cons!32949 (h!34203 (_ BitVec 64)) (t!47639 List!32953)) )
))
(declare-fun arrayNoDuplicates!0 (array!96016 (_ BitVec 32) List!32953) Bool)

(assert (=> b!1405058 (= res!943328 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32950))))

(declare-fun b!1405059 () Bool)

(declare-fun res!943330 () Bool)

(assert (=> b!1405059 (=> (not res!943330) (not e!795388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96016 (_ BitVec 32)) Bool)

(assert (=> b!1405059 (= res!943330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405060 () Bool)

(declare-fun res!943327 () Bool)

(assert (=> b!1405060 (=> (not res!943327) (not e!795388))))

(assert (=> b!1405060 (= res!943327 (and (= (size!46908 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46908 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46908 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405062 () Bool)

(declare-fun res!943325 () Bool)

(assert (=> b!1405062 (=> (not res!943325) (not e!795388))))

(assert (=> b!1405062 (= res!943325 (validKeyInArray!0 (select (arr!46356 a!2901) j!112)))))

(declare-fun res!943326 () Bool)

(assert (=> start!120756 (=> (not res!943326) (not e!795388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120756 (= res!943326 (validMask!0 mask!2840))))

(assert (=> start!120756 e!795388))

(assert (=> start!120756 true))

(declare-fun array_inv!35589 (array!96016) Bool)

(assert (=> start!120756 (array_inv!35589 a!2901)))

(declare-fun b!1405061 () Bool)

(assert (=> b!1405061 (= e!795388 (not true))))

(assert (=> b!1405061 e!795387))

(declare-fun res!943329 () Bool)

(assert (=> b!1405061 (=> (not res!943329) (not e!795387))))

(assert (=> b!1405061 (= res!943329 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47203 0))(
  ( (Unit!47204) )
))
(declare-fun lt!618751 () Unit!47203)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47203)

(assert (=> b!1405061 (= lt!618751 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618752 () SeekEntryResult!10693)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96016 (_ BitVec 32)) SeekEntryResult!10693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405061 (= lt!618752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46356 a!2901) j!112) mask!2840) (select (arr!46356 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120756 res!943326) b!1405060))

(assert (= (and b!1405060 res!943327) b!1405056))

(assert (= (and b!1405056 res!943324) b!1405062))

(assert (= (and b!1405062 res!943325) b!1405059))

(assert (= (and b!1405059 res!943330) b!1405058))

(assert (= (and b!1405058 res!943328) b!1405061))

(assert (= (and b!1405061 res!943329) b!1405057))

(declare-fun m!1293311 () Bool)

(assert (=> start!120756 m!1293311))

(declare-fun m!1293313 () Bool)

(assert (=> start!120756 m!1293313))

(declare-fun m!1293315 () Bool)

(assert (=> b!1405061 m!1293315))

(declare-fun m!1293317 () Bool)

(assert (=> b!1405061 m!1293317))

(assert (=> b!1405061 m!1293315))

(declare-fun m!1293319 () Bool)

(assert (=> b!1405061 m!1293319))

(assert (=> b!1405061 m!1293317))

(assert (=> b!1405061 m!1293315))

(declare-fun m!1293321 () Bool)

(assert (=> b!1405061 m!1293321))

(declare-fun m!1293323 () Bool)

(assert (=> b!1405061 m!1293323))

(assert (=> b!1405062 m!1293315))

(assert (=> b!1405062 m!1293315))

(declare-fun m!1293325 () Bool)

(assert (=> b!1405062 m!1293325))

(declare-fun m!1293327 () Bool)

(assert (=> b!1405056 m!1293327))

(assert (=> b!1405056 m!1293327))

(declare-fun m!1293329 () Bool)

(assert (=> b!1405056 m!1293329))

(declare-fun m!1293331 () Bool)

(assert (=> b!1405059 m!1293331))

(assert (=> b!1405057 m!1293315))

(assert (=> b!1405057 m!1293315))

(declare-fun m!1293333 () Bool)

(assert (=> b!1405057 m!1293333))

(declare-fun m!1293335 () Bool)

(assert (=> b!1405058 m!1293335))

(push 1)

(assert (not b!1405057))

(assert (not b!1405059))

(assert (not b!1405056))

(assert (not b!1405058))

(assert (not b!1405061))

(assert (not b!1405062))

(assert (not start!120756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

