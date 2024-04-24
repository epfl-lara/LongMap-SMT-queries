; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128778 () Bool)

(assert start!128778)

(declare-fun b!1508317 () Bool)

(declare-fun e!843056 () Bool)

(assert (=> b!1508317 (= e!843056 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100604 0))(
  ( (array!100605 (arr!48540 (Array (_ BitVec 32) (_ BitVec 64))) (size!49091 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100604)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!654904 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508317 (= lt!654904 (toIndex!0 (select (arr!48540 a!2804) j!70) mask!2512))))

(declare-fun b!1508318 () Bool)

(declare-fun res!1027464 () Bool)

(assert (=> b!1508318 (=> (not res!1027464) (not e!843056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508318 (= res!1027464 (validKeyInArray!0 (select (arr!48540 a!2804) j!70)))))

(declare-fun b!1508319 () Bool)

(declare-fun res!1027467 () Bool)

(assert (=> b!1508319 (=> (not res!1027467) (not e!843056))))

(declare-datatypes ((List!35010 0))(
  ( (Nil!35007) (Cons!35006 (h!36421 (_ BitVec 64)) (t!49696 List!35010)) )
))
(declare-fun arrayNoDuplicates!0 (array!100604 (_ BitVec 32) List!35010) Bool)

(assert (=> b!1508319 (= res!1027467 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35007))))

(declare-fun b!1508320 () Bool)

(declare-fun res!1027469 () Bool)

(assert (=> b!1508320 (=> (not res!1027469) (not e!843056))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508320 (= res!1027469 (and (= (size!49091 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49091 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49091 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1027465 () Bool)

(assert (=> start!128778 (=> (not res!1027465) (not e!843056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128778 (= res!1027465 (validMask!0 mask!2512))))

(assert (=> start!128778 e!843056))

(assert (=> start!128778 true))

(declare-fun array_inv!37821 (array!100604) Bool)

(assert (=> start!128778 (array_inv!37821 a!2804)))

(declare-fun b!1508321 () Bool)

(declare-fun res!1027468 () Bool)

(assert (=> b!1508321 (=> (not res!1027468) (not e!843056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100604 (_ BitVec 32)) Bool)

(assert (=> b!1508321 (= res!1027468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508322 () Bool)

(declare-fun res!1027466 () Bool)

(assert (=> b!1508322 (=> (not res!1027466) (not e!843056))))

(assert (=> b!1508322 (= res!1027466 (validKeyInArray!0 (select (arr!48540 a!2804) i!961)))))

(declare-fun b!1508323 () Bool)

(declare-fun res!1027463 () Bool)

(assert (=> b!1508323 (=> (not res!1027463) (not e!843056))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1508323 (= res!1027463 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49091 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49091 a!2804))))))

(assert (= (and start!128778 res!1027465) b!1508320))

(assert (= (and b!1508320 res!1027469) b!1508322))

(assert (= (and b!1508322 res!1027466) b!1508318))

(assert (= (and b!1508318 res!1027464) b!1508321))

(assert (= (and b!1508321 res!1027468) b!1508319))

(assert (= (and b!1508319 res!1027467) b!1508323))

(assert (= (and b!1508323 res!1027463) b!1508317))

(declare-fun m!1391217 () Bool)

(assert (=> b!1508318 m!1391217))

(assert (=> b!1508318 m!1391217))

(declare-fun m!1391219 () Bool)

(assert (=> b!1508318 m!1391219))

(assert (=> b!1508317 m!1391217))

(assert (=> b!1508317 m!1391217))

(declare-fun m!1391221 () Bool)

(assert (=> b!1508317 m!1391221))

(declare-fun m!1391223 () Bool)

(assert (=> b!1508322 m!1391223))

(assert (=> b!1508322 m!1391223))

(declare-fun m!1391225 () Bool)

(assert (=> b!1508322 m!1391225))

(declare-fun m!1391227 () Bool)

(assert (=> b!1508321 m!1391227))

(declare-fun m!1391229 () Bool)

(assert (=> start!128778 m!1391229))

(declare-fun m!1391231 () Bool)

(assert (=> start!128778 m!1391231))

(declare-fun m!1391233 () Bool)

(assert (=> b!1508319 m!1391233))

(push 1)

(assert (not b!1508321))

(assert (not b!1508317))

(assert (not b!1508319))

(assert (not b!1508318))

(assert (not start!128778))

(assert (not b!1508322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

