; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127290 () Bool)

(assert start!127290)

(declare-datatypes ((array!99838 0))(
  ( (array!99839 (arr!48184 (Array (_ BitVec 32) (_ BitVec 64))) (size!48735 (_ BitVec 32))) )
))
(declare-fun lt!651386 () array!99838)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1494443 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12321 0))(
  ( (MissingZero!12321 (index!51676 (_ BitVec 32))) (Found!12321 (index!51677 (_ BitVec 32))) (Intermediate!12321 (undefined!13133 Bool) (index!51678 (_ BitVec 32)) (x!133454 (_ BitVec 32))) (Undefined!12321) (MissingVacant!12321 (index!51679 (_ BitVec 32))) )
))
(declare-fun lt!651389 () SeekEntryResult!12321)

(declare-fun e!837324 () Bool)

(declare-fun lt!651388 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99838 (_ BitVec 32)) SeekEntryResult!12321)

(assert (=> b!1494443 (= e!837324 (= lt!651389 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651388 lt!651386 mask!2687)))))

(declare-fun b!1494444 () Bool)

(declare-fun res!1016146 () Bool)

(declare-fun e!837325 () Bool)

(assert (=> b!1494444 (=> (not res!1016146) (not e!837325))))

(declare-fun a!2862 () array!99838)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494444 (= res!1016146 (validKeyInArray!0 (select (arr!48184 a!2862) j!93)))))

(declare-fun b!1494445 () Bool)

(declare-fun e!837322 () Bool)

(declare-fun e!837327 () Bool)

(assert (=> b!1494445 (= e!837322 e!837327)))

(declare-fun res!1016140 () Bool)

(assert (=> b!1494445 (=> (not res!1016140) (not e!837327))))

(declare-fun lt!651390 () SeekEntryResult!12321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494445 (= res!1016140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48184 a!2862) j!93) mask!2687) (select (arr!48184 a!2862) j!93) a!2862 mask!2687) lt!651390))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494445 (= lt!651390 (Intermediate!12321 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494446 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99838 (_ BitVec 32)) SeekEntryResult!12321)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99838 (_ BitVec 32)) SeekEntryResult!12321)

(assert (=> b!1494446 (= e!837324 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651388 lt!651386 mask!2687) (seekEntryOrOpen!0 lt!651388 lt!651386 mask!2687)))))

(declare-fun b!1494447 () Bool)

(declare-fun res!1016150 () Bool)

(assert (=> b!1494447 (=> (not res!1016150) (not e!837325))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494447 (= res!1016150 (and (= (size!48735 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48735 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48735 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494448 () Bool)

(declare-fun e!837320 () Bool)

(declare-fun e!837321 () Bool)

(assert (=> b!1494448 (= e!837320 (not e!837321))))

(declare-fun res!1016138 () Bool)

(assert (=> b!1494448 (=> res!1016138 e!837321)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494448 (= res!1016138 (or (and (= (select (arr!48184 a!2862) index!646) (select (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48184 a!2862) index!646) (select (arr!48184 a!2862) j!93))) (= (select (arr!48184 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!837326 () Bool)

(assert (=> b!1494448 e!837326))

(declare-fun res!1016152 () Bool)

(assert (=> b!1494448 (=> (not res!1016152) (not e!837326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99838 (_ BitVec 32)) Bool)

(assert (=> b!1494448 (= res!1016152 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50015 0))(
  ( (Unit!50016) )
))
(declare-fun lt!651391 () Unit!50015)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50015)

(assert (=> b!1494448 (= lt!651391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494449 () Bool)

(declare-fun res!1016153 () Bool)

(assert (=> b!1494449 (=> (not res!1016153) (not e!837320))))

(assert (=> b!1494449 (= res!1016153 e!837324)))

(declare-fun c!138691 () Bool)

(assert (=> b!1494449 (= c!138691 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494450 () Bool)

(declare-fun res!1016145 () Bool)

(assert (=> b!1494450 (=> (not res!1016145) (not e!837325))))

(declare-datatypes ((List!34672 0))(
  ( (Nil!34669) (Cons!34668 (h!36068 (_ BitVec 64)) (t!49358 List!34672)) )
))
(declare-fun arrayNoDuplicates!0 (array!99838 (_ BitVec 32) List!34672) Bool)

(assert (=> b!1494450 (= res!1016145 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34669))))

(declare-fun b!1494451 () Bool)

(declare-fun res!1016147 () Bool)

(assert (=> b!1494451 (=> (not res!1016147) (not e!837326))))

(assert (=> b!1494451 (= res!1016147 (= (seekEntryOrOpen!0 (select (arr!48184 a!2862) j!93) a!2862 mask!2687) (Found!12321 j!93)))))

(declare-fun b!1494452 () Bool)

(declare-fun res!1016151 () Bool)

(assert (=> b!1494452 (=> (not res!1016151) (not e!837320))))

(assert (=> b!1494452 (= res!1016151 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494453 () Bool)

(assert (=> b!1494453 (= e!837327 e!837320)))

(declare-fun res!1016142 () Bool)

(assert (=> b!1494453 (=> (not res!1016142) (not e!837320))))

(assert (=> b!1494453 (= res!1016142 (= lt!651389 (Intermediate!12321 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1494453 (= lt!651389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651388 mask!2687) lt!651388 lt!651386 mask!2687))))

(assert (=> b!1494453 (= lt!651388 (select (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494454 () Bool)

(declare-fun res!1016139 () Bool)

(assert (=> b!1494454 (=> (not res!1016139) (not e!837325))))

(assert (=> b!1494454 (= res!1016139 (validKeyInArray!0 (select (arr!48184 a!2862) i!1006)))))

(declare-fun b!1494455 () Bool)

(declare-fun res!1016141 () Bool)

(assert (=> b!1494455 (=> (not res!1016141) (not e!837327))))

(assert (=> b!1494455 (= res!1016141 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48184 a!2862) j!93) a!2862 mask!2687) lt!651390))))

(declare-fun b!1494456 () Bool)

(assert (=> b!1494456 (= e!837325 e!837322)))

(declare-fun res!1016149 () Bool)

(assert (=> b!1494456 (=> (not res!1016149) (not e!837322))))

(assert (=> b!1494456 (= res!1016149 (= (select (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494456 (= lt!651386 (array!99839 (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48735 a!2862)))))

(declare-fun b!1494457 () Bool)

(assert (=> b!1494457 (= e!837321 true)))

(declare-fun lt!651387 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494457 (= lt!651387 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1494458 () Bool)

(declare-fun res!1016143 () Bool)

(assert (=> b!1494458 (=> (not res!1016143) (not e!837325))))

(assert (=> b!1494458 (= res!1016143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494459 () Bool)

(assert (=> b!1494459 (= e!837326 (or (= (select (arr!48184 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48184 a!2862) intermediateBeforeIndex!19) (select (arr!48184 a!2862) j!93))))))

(declare-fun res!1016148 () Bool)

(assert (=> start!127290 (=> (not res!1016148) (not e!837325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127290 (= res!1016148 (validMask!0 mask!2687))))

(assert (=> start!127290 e!837325))

(assert (=> start!127290 true))

(declare-fun array_inv!37465 (array!99838) Bool)

(assert (=> start!127290 (array_inv!37465 a!2862)))

(declare-fun b!1494460 () Bool)

(declare-fun res!1016144 () Bool)

(assert (=> b!1494460 (=> (not res!1016144) (not e!837325))))

(assert (=> b!1494460 (= res!1016144 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48735 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48735 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48735 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127290 res!1016148) b!1494447))

(assert (= (and b!1494447 res!1016150) b!1494454))

(assert (= (and b!1494454 res!1016139) b!1494444))

(assert (= (and b!1494444 res!1016146) b!1494458))

(assert (= (and b!1494458 res!1016143) b!1494450))

(assert (= (and b!1494450 res!1016145) b!1494460))

(assert (= (and b!1494460 res!1016144) b!1494456))

(assert (= (and b!1494456 res!1016149) b!1494445))

(assert (= (and b!1494445 res!1016140) b!1494455))

(assert (= (and b!1494455 res!1016141) b!1494453))

(assert (= (and b!1494453 res!1016142) b!1494449))

(assert (= (and b!1494449 c!138691) b!1494443))

(assert (= (and b!1494449 (not c!138691)) b!1494446))

(assert (= (and b!1494449 res!1016153) b!1494452))

(assert (= (and b!1494452 res!1016151) b!1494448))

(assert (= (and b!1494448 res!1016152) b!1494451))

(assert (= (and b!1494451 res!1016147) b!1494459))

(assert (= (and b!1494448 (not res!1016138)) b!1494457))

(declare-fun m!1378387 () Bool)

(assert (=> b!1494459 m!1378387))

(declare-fun m!1378389 () Bool)

(assert (=> b!1494459 m!1378389))

(declare-fun m!1378391 () Bool)

(assert (=> b!1494448 m!1378391))

(declare-fun m!1378393 () Bool)

(assert (=> b!1494448 m!1378393))

(declare-fun m!1378395 () Bool)

(assert (=> b!1494448 m!1378395))

(declare-fun m!1378397 () Bool)

(assert (=> b!1494448 m!1378397))

(declare-fun m!1378399 () Bool)

(assert (=> b!1494448 m!1378399))

(assert (=> b!1494448 m!1378389))

(declare-fun m!1378401 () Bool)

(assert (=> b!1494450 m!1378401))

(declare-fun m!1378403 () Bool)

(assert (=> b!1494457 m!1378403))

(declare-fun m!1378405 () Bool)

(assert (=> b!1494446 m!1378405))

(declare-fun m!1378407 () Bool)

(assert (=> b!1494446 m!1378407))

(assert (=> b!1494451 m!1378389))

(assert (=> b!1494451 m!1378389))

(declare-fun m!1378409 () Bool)

(assert (=> b!1494451 m!1378409))

(declare-fun m!1378411 () Bool)

(assert (=> start!127290 m!1378411))

(declare-fun m!1378413 () Bool)

(assert (=> start!127290 m!1378413))

(assert (=> b!1494444 m!1378389))

(assert (=> b!1494444 m!1378389))

(declare-fun m!1378415 () Bool)

(assert (=> b!1494444 m!1378415))

(assert (=> b!1494455 m!1378389))

(assert (=> b!1494455 m!1378389))

(declare-fun m!1378417 () Bool)

(assert (=> b!1494455 m!1378417))

(assert (=> b!1494445 m!1378389))

(assert (=> b!1494445 m!1378389))

(declare-fun m!1378419 () Bool)

(assert (=> b!1494445 m!1378419))

(assert (=> b!1494445 m!1378419))

(assert (=> b!1494445 m!1378389))

(declare-fun m!1378421 () Bool)

(assert (=> b!1494445 m!1378421))

(assert (=> b!1494456 m!1378393))

(declare-fun m!1378423 () Bool)

(assert (=> b!1494456 m!1378423))

(declare-fun m!1378425 () Bool)

(assert (=> b!1494454 m!1378425))

(assert (=> b!1494454 m!1378425))

(declare-fun m!1378427 () Bool)

(assert (=> b!1494454 m!1378427))

(declare-fun m!1378429 () Bool)

(assert (=> b!1494458 m!1378429))

(declare-fun m!1378431 () Bool)

(assert (=> b!1494443 m!1378431))

(declare-fun m!1378433 () Bool)

(assert (=> b!1494453 m!1378433))

(assert (=> b!1494453 m!1378433))

(declare-fun m!1378435 () Bool)

(assert (=> b!1494453 m!1378435))

(assert (=> b!1494453 m!1378393))

(declare-fun m!1378437 () Bool)

(assert (=> b!1494453 m!1378437))

(check-sat (not b!1494443) (not b!1494454) (not b!1494458) (not b!1494448) (not b!1494446) (not b!1494451) (not b!1494450) (not b!1494455) (not start!127290) (not b!1494444) (not b!1494445) (not b!1494457) (not b!1494453))
(check-sat)
