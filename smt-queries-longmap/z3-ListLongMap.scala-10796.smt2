; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126642 () Bool)

(assert start!126642)

(declare-fun b!1482816 () Bool)

(declare-fun e!831802 () Bool)

(declare-fun e!831801 () Bool)

(assert (=> b!1482816 (= e!831802 e!831801)))

(declare-fun res!1007084 () Bool)

(assert (=> b!1482816 (=> (not res!1007084) (not e!831801))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99499 0))(
  ( (array!99500 (arr!48022 (Array (_ BitVec 32) (_ BitVec 64))) (size!48573 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99499)

(assert (=> b!1482816 (= res!1007084 (= (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647320 () array!99499)

(assert (=> b!1482816 (= lt!647320 (array!99500 (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48573 a!2862)))))

(declare-fun b!1482817 () Bool)

(declare-fun res!1007093 () Bool)

(assert (=> b!1482817 (=> (not res!1007093) (not e!831802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482817 (= res!1007093 (validKeyInArray!0 (select (arr!48022 a!2862) i!1006)))))

(declare-fun b!1482818 () Bool)

(declare-fun res!1007095 () Bool)

(declare-fun e!831804 () Bool)

(assert (=> b!1482818 (=> (not res!1007095) (not e!831804))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12159 0))(
  ( (MissingZero!12159 (index!51028 (_ BitVec 32))) (Found!12159 (index!51029 (_ BitVec 32))) (Intermediate!12159 (undefined!12971 Bool) (index!51030 (_ BitVec 32)) (x!132803 (_ BitVec 32))) (Undefined!12159) (MissingVacant!12159 (index!51031 (_ BitVec 32))) )
))
(declare-fun lt!647318 () SeekEntryResult!12159)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99499 (_ BitVec 32)) SeekEntryResult!12159)

(assert (=> b!1482818 (= res!1007095 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48022 a!2862) j!93) a!2862 mask!2687) lt!647318))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1482819 () Bool)

(declare-fun e!831807 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1482819 (= e!831807 (and (or (= (select (arr!48022 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48022 a!2862) intermediateBeforeIndex!19) (select (arr!48022 a!2862) j!93))) (or (and (= (select (arr!48022 a!2862) index!646) (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48022 a!2862) index!646) (select (arr!48022 a!2862) j!93))) (= (select (arr!48022 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1482820 () Bool)

(declare-fun res!1007087 () Bool)

(declare-fun e!831805 () Bool)

(assert (=> b!1482820 (=> (not res!1007087) (not e!831805))))

(declare-fun e!831806 () Bool)

(assert (=> b!1482820 (= res!1007087 e!831806)))

(declare-fun c!137398 () Bool)

(assert (=> b!1482820 (= c!137398 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482821 () Bool)

(declare-fun res!1007088 () Bool)

(assert (=> b!1482821 (=> (not res!1007088) (not e!831805))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482821 (= res!1007088 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482822 () Bool)

(declare-fun res!1007091 () Bool)

(assert (=> b!1482822 (=> (not res!1007091) (not e!831802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99499 (_ BitVec 32)) Bool)

(assert (=> b!1482822 (= res!1007091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482823 () Bool)

(assert (=> b!1482823 (= e!831804 e!831805)))

(declare-fun res!1007096 () Bool)

(assert (=> b!1482823 (=> (not res!1007096) (not e!831805))))

(declare-fun lt!647319 () SeekEntryResult!12159)

(assert (=> b!1482823 (= res!1007096 (= lt!647319 (Intermediate!12159 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647317 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482823 (= lt!647319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647317 mask!2687) lt!647317 lt!647320 mask!2687))))

(assert (=> b!1482823 (= lt!647317 (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482824 () Bool)

(assert (=> b!1482824 (= e!831801 e!831804)))

(declare-fun res!1007094 () Bool)

(assert (=> b!1482824 (=> (not res!1007094) (not e!831804))))

(assert (=> b!1482824 (= res!1007094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48022 a!2862) j!93) mask!2687) (select (arr!48022 a!2862) j!93) a!2862 mask!2687) lt!647318))))

(assert (=> b!1482824 (= lt!647318 (Intermediate!12159 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482825 () Bool)

(declare-fun res!1007089 () Bool)

(assert (=> b!1482825 (=> (not res!1007089) (not e!831802))))

(assert (=> b!1482825 (= res!1007089 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48573 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48573 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48573 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1007082 () Bool)

(assert (=> start!126642 (=> (not res!1007082) (not e!831802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126642 (= res!1007082 (validMask!0 mask!2687))))

(assert (=> start!126642 e!831802))

(assert (=> start!126642 true))

(declare-fun array_inv!37303 (array!99499) Bool)

(assert (=> start!126642 (array_inv!37303 a!2862)))

(declare-fun b!1482826 () Bool)

(declare-fun res!1007090 () Bool)

(assert (=> b!1482826 (=> (not res!1007090) (not e!831802))))

(assert (=> b!1482826 (= res!1007090 (validKeyInArray!0 (select (arr!48022 a!2862) j!93)))))

(declare-fun b!1482827 () Bool)

(assert (=> b!1482827 (= e!831806 (= lt!647319 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647317 lt!647320 mask!2687)))))

(declare-fun b!1482828 () Bool)

(declare-fun res!1007085 () Bool)

(assert (=> b!1482828 (=> (not res!1007085) (not e!831802))))

(assert (=> b!1482828 (= res!1007085 (and (= (size!48573 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48573 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48573 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482829 () Bool)

(assert (=> b!1482829 (= e!831805 (not true))))

(assert (=> b!1482829 e!831807))

(declare-fun res!1007092 () Bool)

(assert (=> b!1482829 (=> (not res!1007092) (not e!831807))))

(assert (=> b!1482829 (= res!1007092 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49691 0))(
  ( (Unit!49692) )
))
(declare-fun lt!647316 () Unit!49691)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49691)

(assert (=> b!1482829 (= lt!647316 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482830 () Bool)

(declare-fun res!1007086 () Bool)

(assert (=> b!1482830 (=> (not res!1007086) (not e!831807))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99499 (_ BitVec 32)) SeekEntryResult!12159)

(assert (=> b!1482830 (= res!1007086 (= (seekEntryOrOpen!0 (select (arr!48022 a!2862) j!93) a!2862 mask!2687) (Found!12159 j!93)))))

(declare-fun b!1482831 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99499 (_ BitVec 32)) SeekEntryResult!12159)

(assert (=> b!1482831 (= e!831806 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647317 lt!647320 mask!2687) (seekEntryOrOpen!0 lt!647317 lt!647320 mask!2687)))))

(declare-fun b!1482832 () Bool)

(declare-fun res!1007083 () Bool)

(assert (=> b!1482832 (=> (not res!1007083) (not e!831802))))

(declare-datatypes ((List!34510 0))(
  ( (Nil!34507) (Cons!34506 (h!35891 (_ BitVec 64)) (t!49196 List!34510)) )
))
(declare-fun arrayNoDuplicates!0 (array!99499 (_ BitVec 32) List!34510) Bool)

(assert (=> b!1482832 (= res!1007083 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34507))))

(assert (= (and start!126642 res!1007082) b!1482828))

(assert (= (and b!1482828 res!1007085) b!1482817))

(assert (= (and b!1482817 res!1007093) b!1482826))

(assert (= (and b!1482826 res!1007090) b!1482822))

(assert (= (and b!1482822 res!1007091) b!1482832))

(assert (= (and b!1482832 res!1007083) b!1482825))

(assert (= (and b!1482825 res!1007089) b!1482816))

(assert (= (and b!1482816 res!1007084) b!1482824))

(assert (= (and b!1482824 res!1007094) b!1482818))

(assert (= (and b!1482818 res!1007095) b!1482823))

(assert (= (and b!1482823 res!1007096) b!1482820))

(assert (= (and b!1482820 c!137398) b!1482827))

(assert (= (and b!1482820 (not c!137398)) b!1482831))

(assert (= (and b!1482820 res!1007087) b!1482821))

(assert (= (and b!1482821 res!1007088) b!1482829))

(assert (= (and b!1482829 res!1007092) b!1482830))

(assert (= (and b!1482830 res!1007086) b!1482819))

(declare-fun m!1368541 () Bool)

(assert (=> b!1482824 m!1368541))

(assert (=> b!1482824 m!1368541))

(declare-fun m!1368543 () Bool)

(assert (=> b!1482824 m!1368543))

(assert (=> b!1482824 m!1368543))

(assert (=> b!1482824 m!1368541))

(declare-fun m!1368545 () Bool)

(assert (=> b!1482824 m!1368545))

(declare-fun m!1368547 () Bool)

(assert (=> b!1482819 m!1368547))

(declare-fun m!1368549 () Bool)

(assert (=> b!1482819 m!1368549))

(declare-fun m!1368551 () Bool)

(assert (=> b!1482819 m!1368551))

(declare-fun m!1368553 () Bool)

(assert (=> b!1482819 m!1368553))

(assert (=> b!1482819 m!1368541))

(declare-fun m!1368555 () Bool)

(assert (=> b!1482827 m!1368555))

(assert (=> b!1482826 m!1368541))

(assert (=> b!1482826 m!1368541))

(declare-fun m!1368557 () Bool)

(assert (=> b!1482826 m!1368557))

(assert (=> b!1482830 m!1368541))

(assert (=> b!1482830 m!1368541))

(declare-fun m!1368559 () Bool)

(assert (=> b!1482830 m!1368559))

(declare-fun m!1368561 () Bool)

(assert (=> b!1482831 m!1368561))

(declare-fun m!1368563 () Bool)

(assert (=> b!1482831 m!1368563))

(declare-fun m!1368565 () Bool)

(assert (=> b!1482817 m!1368565))

(assert (=> b!1482817 m!1368565))

(declare-fun m!1368567 () Bool)

(assert (=> b!1482817 m!1368567))

(assert (=> b!1482818 m!1368541))

(assert (=> b!1482818 m!1368541))

(declare-fun m!1368569 () Bool)

(assert (=> b!1482818 m!1368569))

(assert (=> b!1482816 m!1368547))

(declare-fun m!1368571 () Bool)

(assert (=> b!1482816 m!1368571))

(declare-fun m!1368573 () Bool)

(assert (=> b!1482822 m!1368573))

(declare-fun m!1368575 () Bool)

(assert (=> b!1482823 m!1368575))

(assert (=> b!1482823 m!1368575))

(declare-fun m!1368577 () Bool)

(assert (=> b!1482823 m!1368577))

(assert (=> b!1482823 m!1368547))

(declare-fun m!1368579 () Bool)

(assert (=> b!1482823 m!1368579))

(declare-fun m!1368581 () Bool)

(assert (=> b!1482832 m!1368581))

(declare-fun m!1368583 () Bool)

(assert (=> b!1482829 m!1368583))

(declare-fun m!1368585 () Bool)

(assert (=> b!1482829 m!1368585))

(declare-fun m!1368587 () Bool)

(assert (=> start!126642 m!1368587))

(declare-fun m!1368589 () Bool)

(assert (=> start!126642 m!1368589))

(check-sat (not b!1482824) (not b!1482817) (not b!1482822) (not b!1482830) (not b!1482826) (not start!126642) (not b!1482832) (not b!1482823) (not b!1482831) (not b!1482829) (not b!1482818) (not b!1482827))
(check-sat)
