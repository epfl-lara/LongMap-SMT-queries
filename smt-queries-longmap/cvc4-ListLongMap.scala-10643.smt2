; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125000 () Bool)

(assert start!125000)

(declare-fun b!1453646 () Bool)

(declare-fun e!818170 () Bool)

(declare-fun e!818169 () Bool)

(assert (=> b!1453646 (= e!818170 e!818169)))

(declare-fun res!984635 () Bool)

(assert (=> b!1453646 (=> (not res!984635) (not e!818169))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98448 0))(
  ( (array!98449 (arr!47512 (Array (_ BitVec 32) (_ BitVec 64))) (size!48062 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98448)

(assert (=> b!1453646 (= res!984635 (= (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637301 () array!98448)

(assert (=> b!1453646 (= lt!637301 (array!98449 (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48062 a!2862)))))

(declare-fun b!1453647 () Bool)

(declare-fun e!818167 () Bool)

(declare-fun e!818164 () Bool)

(assert (=> b!1453647 (= e!818167 e!818164)))

(declare-fun res!984639 () Bool)

(assert (=> b!1453647 (=> (not res!984639) (not e!818164))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637305 () (_ BitVec 64))

(assert (=> b!1453647 (= res!984639 (and (= index!646 intermediateAfterIndex!19) (= lt!637305 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453648 () Bool)

(declare-fun e!818165 () Bool)

(assert (=> b!1453648 (= e!818165 e!818167)))

(declare-fun res!984650 () Bool)

(assert (=> b!1453648 (=> res!984650 e!818167)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453648 (= res!984650 (or (and (= (select (arr!47512 a!2862) index!646) lt!637305) (= (select (arr!47512 a!2862) index!646) (select (arr!47512 a!2862) j!93))) (= (select (arr!47512 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453648 (= lt!637305 (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453649 () Bool)

(declare-fun res!984646 () Bool)

(assert (=> b!1453649 (=> (not res!984646) (not e!818165))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453649 (= res!984646 (or (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) (select (arr!47512 a!2862) j!93))))))

(declare-fun b!1453650 () Bool)

(declare-fun res!984640 () Bool)

(assert (=> b!1453650 (=> (not res!984640) (not e!818170))))

(declare-datatypes ((List!34013 0))(
  ( (Nil!34010) (Cons!34009 (h!35359 (_ BitVec 64)) (t!48707 List!34013)) )
))
(declare-fun arrayNoDuplicates!0 (array!98448 (_ BitVec 32) List!34013) Bool)

(assert (=> b!1453650 (= res!984640 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34010))))

(declare-fun b!1453651 () Bool)

(declare-fun res!984643 () Bool)

(assert (=> b!1453651 (=> (not res!984643) (not e!818165))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11764 0))(
  ( (MissingZero!11764 (index!49448 (_ BitVec 32))) (Found!11764 (index!49449 (_ BitVec 32))) (Intermediate!11764 (undefined!12576 Bool) (index!49450 (_ BitVec 32)) (x!131085 (_ BitVec 32))) (Undefined!11764) (MissingVacant!11764 (index!49451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98448 (_ BitVec 32)) SeekEntryResult!11764)

(assert (=> b!1453651 (= res!984643 (= (seekEntryOrOpen!0 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) (Found!11764 j!93)))))

(declare-fun res!984637 () Bool)

(assert (=> start!125000 (=> (not res!984637) (not e!818170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125000 (= res!984637 (validMask!0 mask!2687))))

(assert (=> start!125000 e!818170))

(assert (=> start!125000 true))

(declare-fun array_inv!36540 (array!98448) Bool)

(assert (=> start!125000 (array_inv!36540 a!2862)))

(declare-fun b!1453652 () Bool)

(declare-fun e!818166 () Bool)

(assert (=> b!1453652 (= e!818166 (not true))))

(assert (=> b!1453652 e!818165))

(declare-fun res!984636 () Bool)

(assert (=> b!1453652 (=> (not res!984636) (not e!818165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98448 (_ BitVec 32)) Bool)

(assert (=> b!1453652 (= res!984636 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49024 0))(
  ( (Unit!49025) )
))
(declare-fun lt!637302 () Unit!49024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49024)

(assert (=> b!1453652 (= lt!637302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!637300 () (_ BitVec 64))

(declare-fun b!1453653 () Bool)

(declare-fun e!818163 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98448 (_ BitVec 32)) SeekEntryResult!11764)

(assert (=> b!1453653 (= e!818163 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637300 lt!637301 mask!2687) (seekEntryOrOpen!0 lt!637300 lt!637301 mask!2687)))))

(declare-fun b!1453654 () Bool)

(declare-fun res!984642 () Bool)

(declare-fun e!818168 () Bool)

(assert (=> b!1453654 (=> (not res!984642) (not e!818168))))

(declare-fun lt!637303 () SeekEntryResult!11764)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98448 (_ BitVec 32)) SeekEntryResult!11764)

(assert (=> b!1453654 (= res!984642 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!637303))))

(declare-fun b!1453655 () Bool)

(declare-fun res!984638 () Bool)

(assert (=> b!1453655 (=> (not res!984638) (not e!818166))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453655 (= res!984638 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453656 () Bool)

(declare-fun res!984644 () Bool)

(assert (=> b!1453656 (=> (not res!984644) (not e!818170))))

(assert (=> b!1453656 (= res!984644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453657 () Bool)

(declare-fun res!984649 () Bool)

(assert (=> b!1453657 (=> (not res!984649) (not e!818170))))

(assert (=> b!1453657 (= res!984649 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48062 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48062 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48062 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453658 () Bool)

(declare-fun res!984645 () Bool)

(assert (=> b!1453658 (=> (not res!984645) (not e!818170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453658 (= res!984645 (validKeyInArray!0 (select (arr!47512 a!2862) j!93)))))

(declare-fun b!1453659 () Bool)

(declare-fun res!984652 () Bool)

(assert (=> b!1453659 (=> (not res!984652) (not e!818170))))

(assert (=> b!1453659 (= res!984652 (and (= (size!48062 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48062 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48062 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453660 () Bool)

(declare-fun res!984648 () Bool)

(assert (=> b!1453660 (=> (not res!984648) (not e!818170))))

(assert (=> b!1453660 (= res!984648 (validKeyInArray!0 (select (arr!47512 a!2862) i!1006)))))

(declare-fun b!1453661 () Bool)

(assert (=> b!1453661 (= e!818169 e!818168)))

(declare-fun res!984641 () Bool)

(assert (=> b!1453661 (=> (not res!984641) (not e!818168))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453661 (= res!984641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47512 a!2862) j!93) mask!2687) (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!637303))))

(assert (=> b!1453661 (= lt!637303 (Intermediate!11764 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453662 () Bool)

(assert (=> b!1453662 (= e!818168 e!818166)))

(declare-fun res!984647 () Bool)

(assert (=> b!1453662 (=> (not res!984647) (not e!818166))))

(declare-fun lt!637304 () SeekEntryResult!11764)

(assert (=> b!1453662 (= res!984647 (= lt!637304 (Intermediate!11764 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453662 (= lt!637304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637300 mask!2687) lt!637300 lt!637301 mask!2687))))

(assert (=> b!1453662 (= lt!637300 (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453663 () Bool)

(assert (=> b!1453663 (= e!818163 (= lt!637304 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637300 lt!637301 mask!2687)))))

(declare-fun b!1453664 () Bool)

(declare-fun res!984651 () Bool)

(assert (=> b!1453664 (=> (not res!984651) (not e!818166))))

(assert (=> b!1453664 (= res!984651 e!818163)))

(declare-fun c!134016 () Bool)

(assert (=> b!1453664 (= c!134016 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453665 () Bool)

(assert (=> b!1453665 (= e!818164 (= (seekEntryOrOpen!0 lt!637300 lt!637301 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637300 lt!637301 mask!2687)))))

(assert (= (and start!125000 res!984637) b!1453659))

(assert (= (and b!1453659 res!984652) b!1453660))

(assert (= (and b!1453660 res!984648) b!1453658))

(assert (= (and b!1453658 res!984645) b!1453656))

(assert (= (and b!1453656 res!984644) b!1453650))

(assert (= (and b!1453650 res!984640) b!1453657))

(assert (= (and b!1453657 res!984649) b!1453646))

(assert (= (and b!1453646 res!984635) b!1453661))

(assert (= (and b!1453661 res!984641) b!1453654))

(assert (= (and b!1453654 res!984642) b!1453662))

(assert (= (and b!1453662 res!984647) b!1453664))

(assert (= (and b!1453664 c!134016) b!1453663))

(assert (= (and b!1453664 (not c!134016)) b!1453653))

(assert (= (and b!1453664 res!984651) b!1453655))

(assert (= (and b!1453655 res!984638) b!1453652))

(assert (= (and b!1453652 res!984636) b!1453651))

(assert (= (and b!1453651 res!984643) b!1453649))

(assert (= (and b!1453649 res!984646) b!1453648))

(assert (= (and b!1453648 (not res!984650)) b!1453647))

(assert (= (and b!1453647 res!984639) b!1453665))

(declare-fun m!1342091 () Bool)

(assert (=> b!1453665 m!1342091))

(declare-fun m!1342093 () Bool)

(assert (=> b!1453665 m!1342093))

(declare-fun m!1342095 () Bool)

(assert (=> b!1453663 m!1342095))

(declare-fun m!1342097 () Bool)

(assert (=> b!1453651 m!1342097))

(assert (=> b!1453651 m!1342097))

(declare-fun m!1342099 () Bool)

(assert (=> b!1453651 m!1342099))

(declare-fun m!1342101 () Bool)

(assert (=> b!1453656 m!1342101))

(declare-fun m!1342103 () Bool)

(assert (=> b!1453650 m!1342103))

(assert (=> b!1453661 m!1342097))

(assert (=> b!1453661 m!1342097))

(declare-fun m!1342105 () Bool)

(assert (=> b!1453661 m!1342105))

(assert (=> b!1453661 m!1342105))

(assert (=> b!1453661 m!1342097))

(declare-fun m!1342107 () Bool)

(assert (=> b!1453661 m!1342107))

(declare-fun m!1342109 () Bool)

(assert (=> b!1453662 m!1342109))

(assert (=> b!1453662 m!1342109))

(declare-fun m!1342111 () Bool)

(assert (=> b!1453662 m!1342111))

(declare-fun m!1342113 () Bool)

(assert (=> b!1453662 m!1342113))

(declare-fun m!1342115 () Bool)

(assert (=> b!1453662 m!1342115))

(assert (=> b!1453646 m!1342113))

(declare-fun m!1342117 () Bool)

(assert (=> b!1453646 m!1342117))

(declare-fun m!1342119 () Bool)

(assert (=> b!1453660 m!1342119))

(assert (=> b!1453660 m!1342119))

(declare-fun m!1342121 () Bool)

(assert (=> b!1453660 m!1342121))

(declare-fun m!1342123 () Bool)

(assert (=> start!125000 m!1342123))

(declare-fun m!1342125 () Bool)

(assert (=> start!125000 m!1342125))

(declare-fun m!1342127 () Bool)

(assert (=> b!1453652 m!1342127))

(declare-fun m!1342129 () Bool)

(assert (=> b!1453652 m!1342129))

(assert (=> b!1453654 m!1342097))

(assert (=> b!1453654 m!1342097))

(declare-fun m!1342131 () Bool)

(assert (=> b!1453654 m!1342131))

(assert (=> b!1453653 m!1342093))

(assert (=> b!1453653 m!1342091))

(declare-fun m!1342133 () Bool)

(assert (=> b!1453649 m!1342133))

(assert (=> b!1453649 m!1342097))

(declare-fun m!1342135 () Bool)

(assert (=> b!1453648 m!1342135))

(assert (=> b!1453648 m!1342097))

(assert (=> b!1453648 m!1342113))

(declare-fun m!1342137 () Bool)

(assert (=> b!1453648 m!1342137))

(assert (=> b!1453658 m!1342097))

(assert (=> b!1453658 m!1342097))

(declare-fun m!1342139 () Bool)

(assert (=> b!1453658 m!1342139))

(push 1)

