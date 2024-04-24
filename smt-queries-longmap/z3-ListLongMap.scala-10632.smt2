; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125148 () Bool)

(assert start!125148)

(declare-fun b!1453074 () Bool)

(declare-fun res!983448 () Bool)

(declare-fun e!818188 () Bool)

(assert (=> b!1453074 (=> (not res!983448) (not e!818188))))

(declare-datatypes ((array!98491 0))(
  ( (array!98492 (arr!47530 (Array (_ BitVec 32) (_ BitVec 64))) (size!48081 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98491)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453074 (= res!983448 (validKeyInArray!0 (select (arr!47530 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637221 () (_ BitVec 64))

(declare-fun lt!637219 () array!98491)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818190 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1453075 () Bool)

(declare-datatypes ((SeekEntryResult!11679 0))(
  ( (MissingZero!11679 (index!49108 (_ BitVec 32))) (Found!11679 (index!49109 (_ BitVec 32))) (Intermediate!11679 (undefined!12491 Bool) (index!49110 (_ BitVec 32)) (x!130936 (_ BitVec 32))) (Undefined!11679) (MissingVacant!11679 (index!49111 (_ BitVec 32))) )
))
(declare-fun lt!637222 () SeekEntryResult!11679)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98491 (_ BitVec 32)) SeekEntryResult!11679)

(assert (=> b!1453075 (= e!818190 (= lt!637222 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637221 lt!637219 mask!2687)))))

(declare-fun b!1453076 () Bool)

(declare-fun res!983457 () Bool)

(declare-fun e!818187 () Bool)

(assert (=> b!1453076 (=> (not res!983457) (not e!818187))))

(declare-fun lt!637220 () SeekEntryResult!11679)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453076 (= res!983457 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!637220))))

(declare-fun b!1453077 () Bool)

(declare-fun res!983455 () Bool)

(assert (=> b!1453077 (=> (not res!983455) (not e!818188))))

(assert (=> b!1453077 (= res!983455 (validKeyInArray!0 (select (arr!47530 a!2862) j!93)))))

(declare-fun b!1453078 () Bool)

(declare-fun e!818192 () Bool)

(assert (=> b!1453078 (= e!818187 e!818192)))

(declare-fun res!983458 () Bool)

(assert (=> b!1453078 (=> (not res!983458) (not e!818192))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453078 (= res!983458 (= lt!637222 (Intermediate!11679 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453078 (= lt!637222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637221 mask!2687) lt!637221 lt!637219 mask!2687))))

(assert (=> b!1453078 (= lt!637221 (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453079 () Bool)

(assert (=> b!1453079 (= e!818192 (not true))))

(declare-fun e!818191 () Bool)

(assert (=> b!1453079 e!818191))

(declare-fun res!983449 () Bool)

(assert (=> b!1453079 (=> (not res!983449) (not e!818191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98491 (_ BitVec 32)) Bool)

(assert (=> b!1453079 (= res!983449 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48887 0))(
  ( (Unit!48888) )
))
(declare-fun lt!637218 () Unit!48887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48887)

(assert (=> b!1453079 (= lt!637218 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!983452 () Bool)

(assert (=> start!125148 (=> (not res!983452) (not e!818188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125148 (= res!983452 (validMask!0 mask!2687))))

(assert (=> start!125148 e!818188))

(assert (=> start!125148 true))

(declare-fun array_inv!36811 (array!98491) Bool)

(assert (=> start!125148 (array_inv!36811 a!2862)))

(declare-fun b!1453080 () Bool)

(declare-fun res!983453 () Bool)

(assert (=> b!1453080 (=> (not res!983453) (not e!818188))))

(assert (=> b!1453080 (= res!983453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453081 () Bool)

(declare-fun res!983459 () Bool)

(assert (=> b!1453081 (=> (not res!983459) (not e!818192))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453081 (= res!983459 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453082 () Bool)

(declare-fun res!983454 () Bool)

(assert (=> b!1453082 (=> (not res!983454) (not e!818192))))

(assert (=> b!1453082 (= res!983454 e!818190)))

(declare-fun c!134332 () Bool)

(assert (=> b!1453082 (= c!134332 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453083 () Bool)

(declare-fun res!983462 () Bool)

(assert (=> b!1453083 (=> (not res!983462) (not e!818188))))

(declare-datatypes ((List!34018 0))(
  ( (Nil!34015) (Cons!34014 (h!35375 (_ BitVec 64)) (t!48704 List!34018)) )
))
(declare-fun arrayNoDuplicates!0 (array!98491 (_ BitVec 32) List!34018) Bool)

(assert (=> b!1453083 (= res!983462 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34015))))

(declare-fun b!1453084 () Bool)

(declare-fun e!818189 () Bool)

(assert (=> b!1453084 (= e!818188 e!818189)))

(declare-fun res!983460 () Bool)

(assert (=> b!1453084 (=> (not res!983460) (not e!818189))))

(assert (=> b!1453084 (= res!983460 (= (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453084 (= lt!637219 (array!98492 (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48081 a!2862)))))

(declare-fun b!1453085 () Bool)

(declare-fun res!983461 () Bool)

(assert (=> b!1453085 (=> (not res!983461) (not e!818191))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98491 (_ BitVec 32)) SeekEntryResult!11679)

(assert (=> b!1453085 (= res!983461 (= (seekEntryOrOpen!0 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) (Found!11679 j!93)))))

(declare-fun b!1453086 () Bool)

(declare-fun res!983450 () Bool)

(assert (=> b!1453086 (=> (not res!983450) (not e!818188))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453086 (= res!983450 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48081 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48081 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48081 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453087 () Bool)

(assert (=> b!1453087 (= e!818189 e!818187)))

(declare-fun res!983456 () Bool)

(assert (=> b!1453087 (=> (not res!983456) (not e!818187))))

(assert (=> b!1453087 (= res!983456 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47530 a!2862) j!93) mask!2687) (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!637220))))

(assert (=> b!1453087 (= lt!637220 (Intermediate!11679 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453088 () Bool)

(declare-fun res!983451 () Bool)

(assert (=> b!1453088 (=> (not res!983451) (not e!818188))))

(assert (=> b!1453088 (= res!983451 (and (= (size!48081 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48081 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48081 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453089 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98491 (_ BitVec 32)) SeekEntryResult!11679)

(assert (=> b!1453089 (= e!818190 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637221 lt!637219 mask!2687) (seekEntryOrOpen!0 lt!637221 lt!637219 mask!2687)))))

(declare-fun b!1453090 () Bool)

(assert (=> b!1453090 (= e!818191 (and (or (= (select (arr!47530 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47530 a!2862) intermediateBeforeIndex!19) (select (arr!47530 a!2862) j!93))) (or (and (= (select (arr!47530 a!2862) index!646) (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47530 a!2862) index!646) (select (arr!47530 a!2862) j!93))) (= (select (arr!47530 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!125148 res!983452) b!1453088))

(assert (= (and b!1453088 res!983451) b!1453074))

(assert (= (and b!1453074 res!983448) b!1453077))

(assert (= (and b!1453077 res!983455) b!1453080))

(assert (= (and b!1453080 res!983453) b!1453083))

(assert (= (and b!1453083 res!983462) b!1453086))

(assert (= (and b!1453086 res!983450) b!1453084))

(assert (= (and b!1453084 res!983460) b!1453087))

(assert (= (and b!1453087 res!983456) b!1453076))

(assert (= (and b!1453076 res!983457) b!1453078))

(assert (= (and b!1453078 res!983458) b!1453082))

(assert (= (and b!1453082 c!134332) b!1453075))

(assert (= (and b!1453082 (not c!134332)) b!1453089))

(assert (= (and b!1453082 res!983454) b!1453081))

(assert (= (and b!1453081 res!983459) b!1453079))

(assert (= (and b!1453079 res!983449) b!1453085))

(assert (= (and b!1453085 res!983461) b!1453090))

(declare-fun m!1341775 () Bool)

(assert (=> b!1453085 m!1341775))

(assert (=> b!1453085 m!1341775))

(declare-fun m!1341777 () Bool)

(assert (=> b!1453085 m!1341777))

(declare-fun m!1341779 () Bool)

(assert (=> b!1453074 m!1341779))

(assert (=> b!1453074 m!1341779))

(declare-fun m!1341781 () Bool)

(assert (=> b!1453074 m!1341781))

(assert (=> b!1453077 m!1341775))

(assert (=> b!1453077 m!1341775))

(declare-fun m!1341783 () Bool)

(assert (=> b!1453077 m!1341783))

(declare-fun m!1341785 () Bool)

(assert (=> b!1453079 m!1341785))

(declare-fun m!1341787 () Bool)

(assert (=> b!1453079 m!1341787))

(declare-fun m!1341789 () Bool)

(assert (=> b!1453083 m!1341789))

(declare-fun m!1341791 () Bool)

(assert (=> b!1453089 m!1341791))

(declare-fun m!1341793 () Bool)

(assert (=> b!1453089 m!1341793))

(declare-fun m!1341795 () Bool)

(assert (=> b!1453080 m!1341795))

(declare-fun m!1341797 () Bool)

(assert (=> b!1453090 m!1341797))

(declare-fun m!1341799 () Bool)

(assert (=> b!1453090 m!1341799))

(declare-fun m!1341801 () Bool)

(assert (=> b!1453090 m!1341801))

(declare-fun m!1341803 () Bool)

(assert (=> b!1453090 m!1341803))

(assert (=> b!1453090 m!1341775))

(declare-fun m!1341805 () Bool)

(assert (=> start!125148 m!1341805))

(declare-fun m!1341807 () Bool)

(assert (=> start!125148 m!1341807))

(assert (=> b!1453087 m!1341775))

(assert (=> b!1453087 m!1341775))

(declare-fun m!1341809 () Bool)

(assert (=> b!1453087 m!1341809))

(assert (=> b!1453087 m!1341809))

(assert (=> b!1453087 m!1341775))

(declare-fun m!1341811 () Bool)

(assert (=> b!1453087 m!1341811))

(declare-fun m!1341813 () Bool)

(assert (=> b!1453075 m!1341813))

(assert (=> b!1453076 m!1341775))

(assert (=> b!1453076 m!1341775))

(declare-fun m!1341815 () Bool)

(assert (=> b!1453076 m!1341815))

(declare-fun m!1341817 () Bool)

(assert (=> b!1453078 m!1341817))

(assert (=> b!1453078 m!1341817))

(declare-fun m!1341819 () Bool)

(assert (=> b!1453078 m!1341819))

(assert (=> b!1453078 m!1341797))

(declare-fun m!1341821 () Bool)

(assert (=> b!1453078 m!1341821))

(assert (=> b!1453084 m!1341797))

(declare-fun m!1341823 () Bool)

(assert (=> b!1453084 m!1341823))

(check-sat (not b!1453078) (not b!1453080) (not b!1453089) (not b!1453085) (not b!1453083) (not b!1453077) (not b!1453075) (not b!1453074) (not b!1453087) (not b!1453076) (not b!1453079) (not start!125148))
(check-sat)
