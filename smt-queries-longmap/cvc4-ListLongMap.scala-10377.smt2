; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122188 () Bool)

(assert start!122188)

(declare-fun b!1417488 () Bool)

(declare-fun res!953221 () Bool)

(declare-fun e!802230 () Bool)

(assert (=> b!1417488 (=> (not res!953221) (not e!802230))))

(declare-datatypes ((array!96772 0))(
  ( (array!96773 (arr!46714 (Array (_ BitVec 32) (_ BitVec 64))) (size!47264 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96772)

(declare-datatypes ((List!33233 0))(
  ( (Nil!33230) (Cons!33229 (h!34522 (_ BitVec 64)) (t!47927 List!33233)) )
))
(declare-fun arrayNoDuplicates!0 (array!96772 (_ BitVec 32) List!33233) Bool)

(assert (=> b!1417488 (= res!953221 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33230))))

(declare-fun b!1417489 () Bool)

(declare-fun res!953222 () Bool)

(assert (=> b!1417489 (=> (not res!953222) (not e!802230))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96772 (_ BitVec 32)) Bool)

(assert (=> b!1417489 (= res!953222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417490 () Bool)

(assert (=> b!1417490 (= e!802230 (not true))))

(declare-fun e!802232 () Bool)

(assert (=> b!1417490 e!802232))

(declare-fun res!953219 () Bool)

(assert (=> b!1417490 (=> (not res!953219) (not e!802232))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417490 (= res!953219 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48024 0))(
  ( (Unit!48025) )
))
(declare-fun lt!625385 () Unit!48024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48024)

(assert (=> b!1417490 (= lt!625385 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11025 0))(
  ( (MissingZero!11025 (index!46492 (_ BitVec 32))) (Found!11025 (index!46493 (_ BitVec 32))) (Intermediate!11025 (undefined!11837 Bool) (index!46494 (_ BitVec 32)) (x!128092 (_ BitVec 32))) (Undefined!11025) (MissingVacant!11025 (index!46495 (_ BitVec 32))) )
))
(declare-fun lt!625386 () SeekEntryResult!11025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96772 (_ BitVec 32)) SeekEntryResult!11025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417490 (= lt!625386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46714 a!2901) j!112) mask!2840) (select (arr!46714 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417491 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96772 (_ BitVec 32)) SeekEntryResult!11025)

(assert (=> b!1417491 (= e!802232 (= (seekEntryOrOpen!0 (select (arr!46714 a!2901) j!112) a!2901 mask!2840) (Found!11025 j!112)))))

(declare-fun b!1417492 () Bool)

(declare-fun res!953218 () Bool)

(assert (=> b!1417492 (=> (not res!953218) (not e!802230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417492 (= res!953218 (validKeyInArray!0 (select (arr!46714 a!2901) j!112)))))

(declare-fun res!953223 () Bool)

(assert (=> start!122188 (=> (not res!953223) (not e!802230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122188 (= res!953223 (validMask!0 mask!2840))))

(assert (=> start!122188 e!802230))

(assert (=> start!122188 true))

(declare-fun array_inv!35742 (array!96772) Bool)

(assert (=> start!122188 (array_inv!35742 a!2901)))

(declare-fun b!1417493 () Bool)

(declare-fun res!953224 () Bool)

(assert (=> b!1417493 (=> (not res!953224) (not e!802230))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417493 (= res!953224 (and (= (size!47264 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47264 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47264 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417494 () Bool)

(declare-fun res!953220 () Bool)

(assert (=> b!1417494 (=> (not res!953220) (not e!802230))))

(assert (=> b!1417494 (= res!953220 (validKeyInArray!0 (select (arr!46714 a!2901) i!1037)))))

(assert (= (and start!122188 res!953223) b!1417493))

(assert (= (and b!1417493 res!953224) b!1417494))

(assert (= (and b!1417494 res!953220) b!1417492))

(assert (= (and b!1417492 res!953218) b!1417489))

(assert (= (and b!1417489 res!953222) b!1417488))

(assert (= (and b!1417488 res!953221) b!1417490))

(assert (= (and b!1417490 res!953219) b!1417491))

(declare-fun m!1308217 () Bool)

(assert (=> start!122188 m!1308217))

(declare-fun m!1308219 () Bool)

(assert (=> start!122188 m!1308219))

(declare-fun m!1308221 () Bool)

(assert (=> b!1417490 m!1308221))

(declare-fun m!1308223 () Bool)

(assert (=> b!1417490 m!1308223))

(assert (=> b!1417490 m!1308221))

(declare-fun m!1308225 () Bool)

(assert (=> b!1417490 m!1308225))

(assert (=> b!1417490 m!1308223))

(assert (=> b!1417490 m!1308221))

(declare-fun m!1308227 () Bool)

(assert (=> b!1417490 m!1308227))

(declare-fun m!1308229 () Bool)

(assert (=> b!1417490 m!1308229))

(assert (=> b!1417492 m!1308221))

(assert (=> b!1417492 m!1308221))

(declare-fun m!1308231 () Bool)

(assert (=> b!1417492 m!1308231))

(declare-fun m!1308233 () Bool)

(assert (=> b!1417494 m!1308233))

(assert (=> b!1417494 m!1308233))

(declare-fun m!1308235 () Bool)

(assert (=> b!1417494 m!1308235))

(declare-fun m!1308237 () Bool)

(assert (=> b!1417489 m!1308237))

(assert (=> b!1417491 m!1308221))

(assert (=> b!1417491 m!1308221))

(declare-fun m!1308239 () Bool)

(assert (=> b!1417491 m!1308239))

(declare-fun m!1308241 () Bool)

(assert (=> b!1417488 m!1308241))

(push 1)

(assert (not b!1417491))

(assert (not start!122188))

(assert (not b!1417490))

(assert (not b!1417488))

(assert (not b!1417492))

(assert (not b!1417489))

(assert (not b!1417494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

