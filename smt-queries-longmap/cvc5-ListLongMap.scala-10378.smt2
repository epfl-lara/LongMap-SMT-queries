; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122190 () Bool)

(assert start!122190)

(declare-fun b!1417509 () Bool)

(declare-fun res!953240 () Bool)

(declare-fun e!802239 () Bool)

(assert (=> b!1417509 (=> (not res!953240) (not e!802239))))

(declare-datatypes ((array!96774 0))(
  ( (array!96775 (arr!46715 (Array (_ BitVec 32) (_ BitVec 64))) (size!47265 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96774)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417509 (= res!953240 (validKeyInArray!0 (select (arr!46715 a!2901) i!1037)))))

(declare-fun b!1417510 () Bool)

(declare-fun res!953242 () Bool)

(assert (=> b!1417510 (=> (not res!953242) (not e!802239))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96774 (_ BitVec 32)) Bool)

(assert (=> b!1417510 (= res!953242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417511 () Bool)

(declare-fun res!953244 () Bool)

(assert (=> b!1417511 (=> (not res!953244) (not e!802239))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417511 (= res!953244 (and (= (size!47265 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47265 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47265 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417512 () Bool)

(declare-fun e!802241 () Bool)

(declare-datatypes ((SeekEntryResult!11026 0))(
  ( (MissingZero!11026 (index!46496 (_ BitVec 32))) (Found!11026 (index!46497 (_ BitVec 32))) (Intermediate!11026 (undefined!11838 Bool) (index!46498 (_ BitVec 32)) (x!128101 (_ BitVec 32))) (Undefined!11026) (MissingVacant!11026 (index!46499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96774 (_ BitVec 32)) SeekEntryResult!11026)

(assert (=> b!1417512 (= e!802241 (= (seekEntryOrOpen!0 (select (arr!46715 a!2901) j!112) a!2901 mask!2840) (Found!11026 j!112)))))

(declare-fun b!1417514 () Bool)

(assert (=> b!1417514 (= e!802239 (not true))))

(assert (=> b!1417514 e!802241))

(declare-fun res!953239 () Bool)

(assert (=> b!1417514 (=> (not res!953239) (not e!802241))))

(assert (=> b!1417514 (= res!953239 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48026 0))(
  ( (Unit!48027) )
))
(declare-fun lt!625391 () Unit!48026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48026)

(assert (=> b!1417514 (= lt!625391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625392 () SeekEntryResult!11026)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96774 (_ BitVec 32)) SeekEntryResult!11026)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417514 (= lt!625392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46715 a!2901) j!112) mask!2840) (select (arr!46715 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417515 () Bool)

(declare-fun res!953243 () Bool)

(assert (=> b!1417515 (=> (not res!953243) (not e!802239))))

(assert (=> b!1417515 (= res!953243 (validKeyInArray!0 (select (arr!46715 a!2901) j!112)))))

(declare-fun b!1417513 () Bool)

(declare-fun res!953245 () Bool)

(assert (=> b!1417513 (=> (not res!953245) (not e!802239))))

(declare-datatypes ((List!33234 0))(
  ( (Nil!33231) (Cons!33230 (h!34523 (_ BitVec 64)) (t!47928 List!33234)) )
))
(declare-fun arrayNoDuplicates!0 (array!96774 (_ BitVec 32) List!33234) Bool)

(assert (=> b!1417513 (= res!953245 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33231))))

(declare-fun res!953241 () Bool)

(assert (=> start!122190 (=> (not res!953241) (not e!802239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122190 (= res!953241 (validMask!0 mask!2840))))

(assert (=> start!122190 e!802239))

(assert (=> start!122190 true))

(declare-fun array_inv!35743 (array!96774) Bool)

(assert (=> start!122190 (array_inv!35743 a!2901)))

(assert (= (and start!122190 res!953241) b!1417511))

(assert (= (and b!1417511 res!953244) b!1417509))

(assert (= (and b!1417509 res!953240) b!1417515))

(assert (= (and b!1417515 res!953243) b!1417510))

(assert (= (and b!1417510 res!953242) b!1417513))

(assert (= (and b!1417513 res!953245) b!1417514))

(assert (= (and b!1417514 res!953239) b!1417512))

(declare-fun m!1308243 () Bool)

(assert (=> b!1417509 m!1308243))

(assert (=> b!1417509 m!1308243))

(declare-fun m!1308245 () Bool)

(assert (=> b!1417509 m!1308245))

(declare-fun m!1308247 () Bool)

(assert (=> b!1417510 m!1308247))

(declare-fun m!1308249 () Bool)

(assert (=> b!1417513 m!1308249))

(declare-fun m!1308251 () Bool)

(assert (=> b!1417512 m!1308251))

(assert (=> b!1417512 m!1308251))

(declare-fun m!1308253 () Bool)

(assert (=> b!1417512 m!1308253))

(assert (=> b!1417514 m!1308251))

(declare-fun m!1308255 () Bool)

(assert (=> b!1417514 m!1308255))

(assert (=> b!1417514 m!1308251))

(declare-fun m!1308257 () Bool)

(assert (=> b!1417514 m!1308257))

(assert (=> b!1417514 m!1308255))

(assert (=> b!1417514 m!1308251))

(declare-fun m!1308259 () Bool)

(assert (=> b!1417514 m!1308259))

(declare-fun m!1308261 () Bool)

(assert (=> b!1417514 m!1308261))

(assert (=> b!1417515 m!1308251))

(assert (=> b!1417515 m!1308251))

(declare-fun m!1308263 () Bool)

(assert (=> b!1417515 m!1308263))

(declare-fun m!1308265 () Bool)

(assert (=> start!122190 m!1308265))

(declare-fun m!1308267 () Bool)

(assert (=> start!122190 m!1308267))

(push 1)

(assert (not b!1417515))

(assert (not b!1417510))

(assert (not b!1417514))

(assert (not start!122190))

(assert (not b!1417509))

(assert (not b!1417512))

(assert (not b!1417513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

