; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125880 () Bool)

(assert start!125880)

(declare-fun b!1471595 () Bool)

(declare-fun res!998924 () Bool)

(declare-fun e!826217 () Bool)

(assert (=> b!1471595 (=> (not res!998924) (not e!826217))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99166 0))(
  ( (array!99167 (arr!47866 (Array (_ BitVec 32) (_ BitVec 64))) (size!48417 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99166)

(assert (=> b!1471595 (= res!998924 (and (= (size!48417 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48417 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48417 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471596 () Bool)

(declare-fun res!998925 () Bool)

(assert (=> b!1471596 (=> (not res!998925) (not e!826217))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471596 (= res!998925 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48417 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48417 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48417 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471597 () Bool)

(declare-fun e!826215 () Bool)

(assert (=> b!1471597 (= e!826217 e!826215)))

(declare-fun res!998930 () Bool)

(assert (=> b!1471597 (=> (not res!998930) (not e!826215))))

(assert (=> b!1471597 (= res!998930 (= (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643344 () array!99166)

(assert (=> b!1471597 (= lt!643344 (array!99167 (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48417 a!2862)))))

(declare-fun b!1471598 () Bool)

(declare-fun res!998929 () Bool)

(assert (=> b!1471598 (=> (not res!998929) (not e!826217))))

(declare-datatypes ((List!34354 0))(
  ( (Nil!34351) (Cons!34350 (h!35714 (_ BitVec 64)) (t!49040 List!34354)) )
))
(declare-fun arrayNoDuplicates!0 (array!99166 (_ BitVec 32) List!34354) Bool)

(assert (=> b!1471598 (= res!998929 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34351))))

(declare-fun b!1471599 () Bool)

(declare-fun res!998927 () Bool)

(declare-fun e!826218 () Bool)

(assert (=> b!1471599 (=> (not res!998927) (not e!826218))))

(declare-fun e!826213 () Bool)

(assert (=> b!1471599 (= res!998927 e!826213)))

(declare-fun c!135856 () Bool)

(assert (=> b!1471599 (= c!135856 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!998935 () Bool)

(assert (=> start!125880 (=> (not res!998935) (not e!826217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125880 (= res!998935 (validMask!0 mask!2687))))

(assert (=> start!125880 e!826217))

(assert (=> start!125880 true))

(declare-fun array_inv!37147 (array!99166) Bool)

(assert (=> start!125880 (array_inv!37147 a!2862)))

(declare-fun b!1471600 () Bool)

(declare-fun e!826214 () Bool)

(assert (=> b!1471600 (= e!826215 e!826214)))

(declare-fun res!998934 () Bool)

(assert (=> b!1471600 (=> (not res!998934) (not e!826214))))

(declare-datatypes ((SeekEntryResult!12003 0))(
  ( (MissingZero!12003 (index!50404 (_ BitVec 32))) (Found!12003 (index!50405 (_ BitVec 32))) (Intermediate!12003 (undefined!12815 Bool) (index!50406 (_ BitVec 32)) (x!132165 (_ BitVec 32))) (Undefined!12003) (MissingVacant!12003 (index!50407 (_ BitVec 32))) )
))
(declare-fun lt!643345 () SeekEntryResult!12003)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99166 (_ BitVec 32)) SeekEntryResult!12003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471600 (= res!998934 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!643345))))

(assert (=> b!1471600 (= lt!643345 (Intermediate!12003 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471601 () Bool)

(declare-fun res!998931 () Bool)

(assert (=> b!1471601 (=> (not res!998931) (not e!826217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99166 (_ BitVec 32)) Bool)

(assert (=> b!1471601 (= res!998931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!643346 () (_ BitVec 64))

(declare-fun b!1471602 () Bool)

(declare-fun lt!643347 () SeekEntryResult!12003)

(assert (=> b!1471602 (= e!826213 (= lt!643347 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643346 lt!643344 mask!2687)))))

(declare-fun b!1471603 () Bool)

(declare-fun res!998932 () Bool)

(assert (=> b!1471603 (=> (not res!998932) (not e!826214))))

(assert (=> b!1471603 (= res!998932 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!643345))))

(declare-fun b!1471604 () Bool)

(assert (=> b!1471604 (= e!826218 (not true))))

(assert (=> b!1471604 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49379 0))(
  ( (Unit!49380) )
))
(declare-fun lt!643348 () Unit!49379)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49379)

(assert (=> b!1471604 (= lt!643348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471605 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99166 (_ BitVec 32)) SeekEntryResult!12003)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99166 (_ BitVec 32)) SeekEntryResult!12003)

(assert (=> b!1471605 (= e!826213 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643346 lt!643344 mask!2687) (seekEntryOrOpen!0 lt!643346 lt!643344 mask!2687)))))

(declare-fun b!1471606 () Bool)

(declare-fun res!998928 () Bool)

(assert (=> b!1471606 (=> (not res!998928) (not e!826217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471606 (= res!998928 (validKeyInArray!0 (select (arr!47866 a!2862) j!93)))))

(declare-fun b!1471607 () Bool)

(declare-fun res!998936 () Bool)

(assert (=> b!1471607 (=> (not res!998936) (not e!826217))))

(assert (=> b!1471607 (= res!998936 (validKeyInArray!0 (select (arr!47866 a!2862) i!1006)))))

(declare-fun b!1471608 () Bool)

(declare-fun res!998926 () Bool)

(assert (=> b!1471608 (=> (not res!998926) (not e!826218))))

(assert (=> b!1471608 (= res!998926 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471609 () Bool)

(assert (=> b!1471609 (= e!826214 e!826218)))

(declare-fun res!998933 () Bool)

(assert (=> b!1471609 (=> (not res!998933) (not e!826218))))

(assert (=> b!1471609 (= res!998933 (= lt!643347 (Intermediate!12003 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471609 (= lt!643347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643346 mask!2687) lt!643346 lt!643344 mask!2687))))

(assert (=> b!1471609 (= lt!643346 (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125880 res!998935) b!1471595))

(assert (= (and b!1471595 res!998924) b!1471607))

(assert (= (and b!1471607 res!998936) b!1471606))

(assert (= (and b!1471606 res!998928) b!1471601))

(assert (= (and b!1471601 res!998931) b!1471598))

(assert (= (and b!1471598 res!998929) b!1471596))

(assert (= (and b!1471596 res!998925) b!1471597))

(assert (= (and b!1471597 res!998930) b!1471600))

(assert (= (and b!1471600 res!998934) b!1471603))

(assert (= (and b!1471603 res!998932) b!1471609))

(assert (= (and b!1471609 res!998933) b!1471599))

(assert (= (and b!1471599 c!135856) b!1471602))

(assert (= (and b!1471599 (not c!135856)) b!1471605))

(assert (= (and b!1471599 res!998927) b!1471608))

(assert (= (and b!1471608 res!998926) b!1471604))

(declare-fun m!1358719 () Bool)

(assert (=> b!1471601 m!1358719))

(declare-fun m!1358721 () Bool)

(assert (=> start!125880 m!1358721))

(declare-fun m!1358723 () Bool)

(assert (=> start!125880 m!1358723))

(declare-fun m!1358725 () Bool)

(assert (=> b!1471598 m!1358725))

(declare-fun m!1358727 () Bool)

(assert (=> b!1471603 m!1358727))

(assert (=> b!1471603 m!1358727))

(declare-fun m!1358729 () Bool)

(assert (=> b!1471603 m!1358729))

(declare-fun m!1358731 () Bool)

(assert (=> b!1471609 m!1358731))

(assert (=> b!1471609 m!1358731))

(declare-fun m!1358733 () Bool)

(assert (=> b!1471609 m!1358733))

(declare-fun m!1358735 () Bool)

(assert (=> b!1471609 m!1358735))

(declare-fun m!1358737 () Bool)

(assert (=> b!1471609 m!1358737))

(assert (=> b!1471600 m!1358727))

(assert (=> b!1471600 m!1358727))

(declare-fun m!1358739 () Bool)

(assert (=> b!1471600 m!1358739))

(assert (=> b!1471600 m!1358739))

(assert (=> b!1471600 m!1358727))

(declare-fun m!1358741 () Bool)

(assert (=> b!1471600 m!1358741))

(assert (=> b!1471597 m!1358735))

(declare-fun m!1358743 () Bool)

(assert (=> b!1471597 m!1358743))

(declare-fun m!1358745 () Bool)

(assert (=> b!1471604 m!1358745))

(declare-fun m!1358747 () Bool)

(assert (=> b!1471604 m!1358747))

(assert (=> b!1471606 m!1358727))

(assert (=> b!1471606 m!1358727))

(declare-fun m!1358749 () Bool)

(assert (=> b!1471606 m!1358749))

(declare-fun m!1358751 () Bool)

(assert (=> b!1471605 m!1358751))

(declare-fun m!1358753 () Bool)

(assert (=> b!1471605 m!1358753))

(declare-fun m!1358755 () Bool)

(assert (=> b!1471602 m!1358755))

(declare-fun m!1358757 () Bool)

(assert (=> b!1471607 m!1358757))

(assert (=> b!1471607 m!1358757))

(declare-fun m!1358759 () Bool)

(assert (=> b!1471607 m!1358759))

(check-sat (not b!1471605) (not b!1471598) (not b!1471609) (not start!125880) (not b!1471602) (not b!1471600) (not b!1471601) (not b!1471604) (not b!1471607) (not b!1471603) (not b!1471606))
(check-sat)
