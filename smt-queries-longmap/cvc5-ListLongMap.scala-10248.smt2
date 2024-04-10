; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120540 () Bool)

(assert start!120540)

(declare-fun b!1403595 () Bool)

(declare-fun res!942106 () Bool)

(declare-fun e!794717 () Bool)

(assert (=> b!1403595 (=> (not res!942106) (not e!794717))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95949 0))(
  ( (array!95950 (arr!46325 (Array (_ BitVec 32) (_ BitVec 64))) (size!46875 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95949)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403595 (= res!942106 (and (= (size!46875 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46875 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46875 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403596 () Bool)

(declare-fun res!942109 () Bool)

(assert (=> b!1403596 (=> (not res!942109) (not e!794717))))

(declare-datatypes ((List!32844 0))(
  ( (Nil!32841) (Cons!32840 (h!34088 (_ BitVec 64)) (t!47538 List!32844)) )
))
(declare-fun arrayNoDuplicates!0 (array!95949 (_ BitVec 32) List!32844) Bool)

(assert (=> b!1403596 (= res!942109 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32841))))

(declare-fun res!942111 () Bool)

(assert (=> start!120540 (=> (not res!942111) (not e!794717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120540 (= res!942111 (validMask!0 mask!2840))))

(assert (=> start!120540 e!794717))

(assert (=> start!120540 true))

(declare-fun array_inv!35353 (array!95949) Bool)

(assert (=> start!120540 (array_inv!35353 a!2901)))

(declare-fun b!1403597 () Bool)

(declare-fun res!942112 () Bool)

(assert (=> b!1403597 (=> (not res!942112) (not e!794717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95949 (_ BitVec 32)) Bool)

(assert (=> b!1403597 (= res!942112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!794716 () Bool)

(declare-fun b!1403598 () Bool)

(declare-datatypes ((SeekEntryResult!10642 0))(
  ( (MissingZero!10642 (index!44945 (_ BitVec 32))) (Found!10642 (index!44946 (_ BitVec 32))) (Intermediate!10642 (undefined!11454 Bool) (index!44947 (_ BitVec 32)) (x!126557 (_ BitVec 32))) (Undefined!10642) (MissingVacant!10642 (index!44948 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95949 (_ BitVec 32)) SeekEntryResult!10642)

(assert (=> b!1403598 (= e!794716 (= (seekEntryOrOpen!0 (select (arr!46325 a!2901) j!112) a!2901 mask!2840) (Found!10642 j!112)))))

(declare-fun b!1403599 () Bool)

(declare-fun res!942107 () Bool)

(assert (=> b!1403599 (=> (not res!942107) (not e!794717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403599 (= res!942107 (validKeyInArray!0 (select (arr!46325 a!2901) j!112)))))

(declare-fun b!1403600 () Bool)

(declare-fun res!942110 () Bool)

(assert (=> b!1403600 (=> (not res!942110) (not e!794717))))

(assert (=> b!1403600 (= res!942110 (validKeyInArray!0 (select (arr!46325 a!2901) i!1037)))))

(declare-fun b!1403601 () Bool)

(assert (=> b!1403601 (= e!794717 (not true))))

(assert (=> b!1403601 e!794716))

(declare-fun res!942108 () Bool)

(assert (=> b!1403601 (=> (not res!942108) (not e!794716))))

(assert (=> b!1403601 (= res!942108 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47288 0))(
  ( (Unit!47289) )
))
(declare-fun lt!618452 () Unit!47288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47288)

(assert (=> b!1403601 (= lt!618452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618453 () SeekEntryResult!10642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95949 (_ BitVec 32)) SeekEntryResult!10642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403601 (= lt!618453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46325 a!2901) j!112) mask!2840) (select (arr!46325 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120540 res!942111) b!1403595))

(assert (= (and b!1403595 res!942106) b!1403600))

(assert (= (and b!1403600 res!942110) b!1403599))

(assert (= (and b!1403599 res!942107) b!1403597))

(assert (= (and b!1403597 res!942112) b!1403596))

(assert (= (and b!1403596 res!942109) b!1403601))

(assert (= (and b!1403601 res!942108) b!1403598))

(declare-fun m!1292289 () Bool)

(assert (=> b!1403597 m!1292289))

(declare-fun m!1292291 () Bool)

(assert (=> b!1403599 m!1292291))

(assert (=> b!1403599 m!1292291))

(declare-fun m!1292293 () Bool)

(assert (=> b!1403599 m!1292293))

(declare-fun m!1292295 () Bool)

(assert (=> b!1403600 m!1292295))

(assert (=> b!1403600 m!1292295))

(declare-fun m!1292297 () Bool)

(assert (=> b!1403600 m!1292297))

(assert (=> b!1403601 m!1292291))

(declare-fun m!1292299 () Bool)

(assert (=> b!1403601 m!1292299))

(assert (=> b!1403601 m!1292291))

(declare-fun m!1292301 () Bool)

(assert (=> b!1403601 m!1292301))

(assert (=> b!1403601 m!1292299))

(assert (=> b!1403601 m!1292291))

(declare-fun m!1292303 () Bool)

(assert (=> b!1403601 m!1292303))

(declare-fun m!1292305 () Bool)

(assert (=> b!1403601 m!1292305))

(declare-fun m!1292307 () Bool)

(assert (=> b!1403596 m!1292307))

(assert (=> b!1403598 m!1292291))

(assert (=> b!1403598 m!1292291))

(declare-fun m!1292309 () Bool)

(assert (=> b!1403598 m!1292309))

(declare-fun m!1292311 () Bool)

(assert (=> start!120540 m!1292311))

(declare-fun m!1292313 () Bool)

(assert (=> start!120540 m!1292313))

(push 1)

(assert (not start!120540))

(assert (not b!1403597))

(assert (not b!1403599))

(assert (not b!1403598))

(assert (not b!1403601))

(assert (not b!1403600))

(assert (not b!1403596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

