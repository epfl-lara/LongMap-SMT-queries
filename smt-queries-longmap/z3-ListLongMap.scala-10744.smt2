; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125572 () Bool)

(assert start!125572)

(declare-fun b!1469692 () Bool)

(declare-fun res!998239 () Bool)

(declare-fun e!825039 () Bool)

(assert (=> b!1469692 (=> (not res!998239) (not e!825039))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98998 0))(
  ( (array!98999 (arr!47788 (Array (_ BitVec 32) (_ BitVec 64))) (size!48340 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98998)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12053 0))(
  ( (MissingZero!12053 (index!50604 (_ BitVec 32))) (Found!12053 (index!50605 (_ BitVec 32))) (Intermediate!12053 (undefined!12865 Bool) (index!50606 (_ BitVec 32)) (x!132177 (_ BitVec 32))) (Undefined!12053) (MissingVacant!12053 (index!50607 (_ BitVec 32))) )
))
(declare-fun lt!642473 () SeekEntryResult!12053)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98998 (_ BitVec 32)) SeekEntryResult!12053)

(assert (=> b!1469692 (= res!998239 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47788 a!2862) j!93) a!2862 mask!2687) lt!642473))))

(declare-fun b!1469693 () Bool)

(declare-fun res!998236 () Bool)

(declare-fun e!825038 () Bool)

(assert (=> b!1469693 (=> (not res!998236) (not e!825038))))

(declare-fun e!825037 () Bool)

(assert (=> b!1469693 (= res!998236 e!825037)))

(declare-fun c!135241 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469693 (= c!135241 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!642474 () SeekEntryResult!12053)

(declare-fun lt!642475 () (_ BitVec 64))

(declare-fun b!1469694 () Bool)

(declare-fun lt!642476 () array!98998)

(assert (=> b!1469694 (= e!825037 (= lt!642474 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642475 lt!642476 mask!2687)))))

(declare-fun b!1469695 () Bool)

(declare-fun res!998244 () Bool)

(declare-fun e!825035 () Bool)

(assert (=> b!1469695 (=> (not res!998244) (not e!825035))))

(declare-datatypes ((List!34367 0))(
  ( (Nil!34364) (Cons!34363 (h!35713 (_ BitVec 64)) (t!49053 List!34367)) )
))
(declare-fun arrayNoDuplicates!0 (array!98998 (_ BitVec 32) List!34367) Bool)

(assert (=> b!1469695 (= res!998244 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34364))))

(declare-fun b!1469696 () Bool)

(declare-fun res!998248 () Bool)

(assert (=> b!1469696 (=> (not res!998248) (not e!825035))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469696 (= res!998248 (validKeyInArray!0 (select (arr!47788 a!2862) i!1006)))))

(declare-fun b!1469697 () Bool)

(declare-fun res!998240 () Bool)

(assert (=> b!1469697 (=> (not res!998240) (not e!825035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98998 (_ BitVec 32)) Bool)

(assert (=> b!1469697 (= res!998240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469698 () Bool)

(assert (=> b!1469698 (= e!825039 e!825038)))

(declare-fun res!998241 () Bool)

(assert (=> b!1469698 (=> (not res!998241) (not e!825038))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469698 (= res!998241 (= lt!642474 (Intermediate!12053 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469698 (= lt!642474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642475 mask!2687) lt!642475 lt!642476 mask!2687))))

(assert (=> b!1469698 (= lt!642475 (select (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469699 () Bool)

(declare-fun res!998238 () Bool)

(assert (=> b!1469699 (=> (not res!998238) (not e!825035))))

(assert (=> b!1469699 (= res!998238 (validKeyInArray!0 (select (arr!47788 a!2862) j!93)))))

(declare-fun b!1469701 () Bool)

(declare-fun res!998237 () Bool)

(assert (=> b!1469701 (=> (not res!998237) (not e!825035))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469701 (= res!998237 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48340 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48340 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48340 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469702 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98998 (_ BitVec 32)) SeekEntryResult!12053)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98998 (_ BitVec 32)) SeekEntryResult!12053)

(assert (=> b!1469702 (= e!825037 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642475 lt!642476 mask!2687) (seekEntryOrOpen!0 lt!642475 lt!642476 mask!2687)))))

(declare-fun b!1469703 () Bool)

(declare-fun e!825036 () Bool)

(assert (=> b!1469703 (= e!825036 e!825039)))

(declare-fun res!998243 () Bool)

(assert (=> b!1469703 (=> (not res!998243) (not e!825039))))

(assert (=> b!1469703 (= res!998243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47788 a!2862) j!93) mask!2687) (select (arr!47788 a!2862) j!93) a!2862 mask!2687) lt!642473))))

(assert (=> b!1469703 (= lt!642473 (Intermediate!12053 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469704 () Bool)

(declare-fun res!998242 () Bool)

(assert (=> b!1469704 (=> (not res!998242) (not e!825038))))

(assert (=> b!1469704 (= res!998242 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1469705 () Bool)

(assert (=> b!1469705 (= e!825035 e!825036)))

(declare-fun res!998247 () Bool)

(assert (=> b!1469705 (=> (not res!998247) (not e!825036))))

(assert (=> b!1469705 (= res!998247 (= (select (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469705 (= lt!642476 (array!98999 (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48340 a!2862)))))

(declare-fun b!1469706 () Bool)

(assert (=> b!1469706 (= e!825038 (not true))))

(assert (=> b!1469706 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49287 0))(
  ( (Unit!49288) )
))
(declare-fun lt!642477 () Unit!49287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49287)

(assert (=> b!1469706 (= lt!642477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!998246 () Bool)

(assert (=> start!125572 (=> (not res!998246) (not e!825035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125572 (= res!998246 (validMask!0 mask!2687))))

(assert (=> start!125572 e!825035))

(assert (=> start!125572 true))

(declare-fun array_inv!37021 (array!98998) Bool)

(assert (=> start!125572 (array_inv!37021 a!2862)))

(declare-fun b!1469700 () Bool)

(declare-fun res!998245 () Bool)

(assert (=> b!1469700 (=> (not res!998245) (not e!825035))))

(assert (=> b!1469700 (= res!998245 (and (= (size!48340 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48340 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48340 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125572 res!998246) b!1469700))

(assert (= (and b!1469700 res!998245) b!1469696))

(assert (= (and b!1469696 res!998248) b!1469699))

(assert (= (and b!1469699 res!998238) b!1469697))

(assert (= (and b!1469697 res!998240) b!1469695))

(assert (= (and b!1469695 res!998244) b!1469701))

(assert (= (and b!1469701 res!998237) b!1469705))

(assert (= (and b!1469705 res!998247) b!1469703))

(assert (= (and b!1469703 res!998243) b!1469692))

(assert (= (and b!1469692 res!998239) b!1469698))

(assert (= (and b!1469698 res!998241) b!1469693))

(assert (= (and b!1469693 c!135241) b!1469694))

(assert (= (and b!1469693 (not c!135241)) b!1469702))

(assert (= (and b!1469693 res!998236) b!1469704))

(assert (= (and b!1469704 res!998242) b!1469706))

(declare-fun m!1356357 () Bool)

(assert (=> start!125572 m!1356357))

(declare-fun m!1356359 () Bool)

(assert (=> start!125572 m!1356359))

(declare-fun m!1356361 () Bool)

(assert (=> b!1469699 m!1356361))

(assert (=> b!1469699 m!1356361))

(declare-fun m!1356363 () Bool)

(assert (=> b!1469699 m!1356363))

(declare-fun m!1356365 () Bool)

(assert (=> b!1469698 m!1356365))

(assert (=> b!1469698 m!1356365))

(declare-fun m!1356367 () Bool)

(assert (=> b!1469698 m!1356367))

(declare-fun m!1356369 () Bool)

(assert (=> b!1469698 m!1356369))

(declare-fun m!1356371 () Bool)

(assert (=> b!1469698 m!1356371))

(declare-fun m!1356373 () Bool)

(assert (=> b!1469694 m!1356373))

(declare-fun m!1356375 () Bool)

(assert (=> b!1469706 m!1356375))

(declare-fun m!1356377 () Bool)

(assert (=> b!1469706 m!1356377))

(declare-fun m!1356379 () Bool)

(assert (=> b!1469702 m!1356379))

(declare-fun m!1356381 () Bool)

(assert (=> b!1469702 m!1356381))

(declare-fun m!1356383 () Bool)

(assert (=> b!1469696 m!1356383))

(assert (=> b!1469696 m!1356383))

(declare-fun m!1356385 () Bool)

(assert (=> b!1469696 m!1356385))

(assert (=> b!1469692 m!1356361))

(assert (=> b!1469692 m!1356361))

(declare-fun m!1356387 () Bool)

(assert (=> b!1469692 m!1356387))

(assert (=> b!1469705 m!1356369))

(declare-fun m!1356389 () Bool)

(assert (=> b!1469705 m!1356389))

(declare-fun m!1356391 () Bool)

(assert (=> b!1469697 m!1356391))

(declare-fun m!1356393 () Bool)

(assert (=> b!1469695 m!1356393))

(assert (=> b!1469703 m!1356361))

(assert (=> b!1469703 m!1356361))

(declare-fun m!1356395 () Bool)

(assert (=> b!1469703 m!1356395))

(assert (=> b!1469703 m!1356395))

(assert (=> b!1469703 m!1356361))

(declare-fun m!1356397 () Bool)

(assert (=> b!1469703 m!1356397))

(check-sat (not b!1469697) (not b!1469698) (not b!1469706) (not b!1469694) (not b!1469699) (not b!1469696) (not b!1469702) (not b!1469703) (not start!125572) (not b!1469692) (not b!1469695))
(check-sat)
