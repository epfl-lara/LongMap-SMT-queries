; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125236 () Bool)

(assert start!125236)

(declare-fun b!1462056 () Bool)

(declare-fun res!991646 () Bool)

(declare-fun e!821869 () Bool)

(assert (=> b!1462056 (=> (not res!991646) (not e!821869))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462056 (= res!991646 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462057 () Bool)

(declare-fun res!991654 () Bool)

(declare-fun e!821870 () Bool)

(assert (=> b!1462057 (=> (not res!991654) (not e!821870))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98662 0))(
  ( (array!98663 (arr!47620 (Array (_ BitVec 32) (_ BitVec 64))) (size!48172 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98662)

(assert (=> b!1462057 (= res!991654 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48172 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48172 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48172 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462058 () Bool)

(declare-fun e!821871 () Bool)

(assert (=> b!1462058 (= e!821869 (not e!821871))))

(declare-fun res!991640 () Bool)

(assert (=> b!1462058 (=> res!991640 e!821871)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1462058 (= res!991640 (or (and (= (select (arr!47620 a!2862) index!646) (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47620 a!2862) index!646) (select (arr!47620 a!2862) j!93))) (= (select (arr!47620 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821873 () Bool)

(assert (=> b!1462058 e!821873))

(declare-fun res!991655 () Bool)

(assert (=> b!1462058 (=> (not res!991655) (not e!821873))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98662 (_ BitVec 32)) Bool)

(assert (=> b!1462058 (= res!991655 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49131 0))(
  ( (Unit!49132) )
))
(declare-fun lt!640158 () Unit!49131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49131)

(assert (=> b!1462058 (= lt!640158 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462059 () Bool)

(declare-fun res!991642 () Bool)

(assert (=> b!1462059 (=> (not res!991642) (not e!821870))))

(declare-datatypes ((List!34199 0))(
  ( (Nil!34196) (Cons!34195 (h!35545 (_ BitVec 64)) (t!48885 List!34199)) )
))
(declare-fun arrayNoDuplicates!0 (array!98662 (_ BitVec 32) List!34199) Bool)

(assert (=> b!1462059 (= res!991642 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34196))))

(declare-fun lt!640160 () (_ BitVec 64))

(declare-fun e!821866 () Bool)

(declare-fun lt!640161 () array!98662)

(declare-fun b!1462060 () Bool)

(declare-datatypes ((SeekEntryResult!11897 0))(
  ( (MissingZero!11897 (index!49980 (_ BitVec 32))) (Found!11897 (index!49981 (_ BitVec 32))) (Intermediate!11897 (undefined!12709 Bool) (index!49982 (_ BitVec 32)) (x!131573 (_ BitVec 32))) (Undefined!11897) (MissingVacant!11897 (index!49983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98662 (_ BitVec 32)) SeekEntryResult!11897)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98662 (_ BitVec 32)) SeekEntryResult!11897)

(assert (=> b!1462060 (= e!821866 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640160 lt!640161 mask!2687) (seekEntryOrOpen!0 lt!640160 lt!640161 mask!2687)))))

(declare-fun lt!640159 () SeekEntryResult!11897)

(declare-fun b!1462061 () Bool)

(declare-fun lt!640157 () (_ BitVec 32))

(declare-fun e!821865 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98662 (_ BitVec 32)) SeekEntryResult!11897)

(assert (=> b!1462061 (= e!821865 (not (= lt!640159 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640157 lt!640160 lt!640161 mask!2687))))))

(declare-fun b!1462062 () Bool)

(declare-fun res!991650 () Bool)

(assert (=> b!1462062 (=> (not res!991650) (not e!821870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462062 (= res!991650 (validKeyInArray!0 (select (arr!47620 a!2862) j!93)))))

(declare-fun b!1462063 () Bool)

(declare-fun e!821874 () Bool)

(assert (=> b!1462063 (= e!821871 e!821874)))

(declare-fun res!991641 () Bool)

(assert (=> b!1462063 (=> res!991641 e!821874)))

(assert (=> b!1462063 (= res!991641 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640157 #b00000000000000000000000000000000) (bvsge lt!640157 (size!48172 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462063 (= lt!640157 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!991652 () Bool)

(assert (=> start!125236 (=> (not res!991652) (not e!821870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125236 (= res!991652 (validMask!0 mask!2687))))

(assert (=> start!125236 e!821870))

(assert (=> start!125236 true))

(declare-fun array_inv!36853 (array!98662) Bool)

(assert (=> start!125236 (array_inv!36853 a!2862)))

(declare-fun b!1462064 () Bool)

(assert (=> b!1462064 (= e!821865 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640157 intermediateAfterIndex!19 lt!640160 lt!640161 mask!2687) (seekEntryOrOpen!0 lt!640160 lt!640161 mask!2687))))))

(declare-fun b!1462065 () Bool)

(assert (=> b!1462065 (= e!821873 (or (= (select (arr!47620 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47620 a!2862) intermediateBeforeIndex!19) (select (arr!47620 a!2862) j!93))))))

(declare-fun b!1462066 () Bool)

(declare-fun res!991653 () Bool)

(assert (=> b!1462066 (=> (not res!991653) (not e!821873))))

(assert (=> b!1462066 (= res!991653 (= (seekEntryOrOpen!0 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) (Found!11897 j!93)))))

(declare-fun b!1462067 () Bool)

(declare-fun e!821867 () Bool)

(assert (=> b!1462067 (= e!821867 e!821869)))

(declare-fun res!991656 () Bool)

(assert (=> b!1462067 (=> (not res!991656) (not e!821869))))

(assert (=> b!1462067 (= res!991656 (= lt!640159 (Intermediate!11897 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462067 (= lt!640159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640160 mask!2687) lt!640160 lt!640161 mask!2687))))

(assert (=> b!1462067 (= lt!640160 (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462068 () Bool)

(declare-fun res!991651 () Bool)

(assert (=> b!1462068 (=> res!991651 e!821874)))

(declare-fun lt!640155 () SeekEntryResult!11897)

(assert (=> b!1462068 (= res!991651 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640157 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!640155)))))

(declare-fun b!1462069 () Bool)

(declare-fun res!991643 () Bool)

(assert (=> b!1462069 (=> (not res!991643) (not e!821870))))

(assert (=> b!1462069 (= res!991643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462070 () Bool)

(declare-fun res!991644 () Bool)

(assert (=> b!1462070 (=> (not res!991644) (not e!821870))))

(assert (=> b!1462070 (= res!991644 (and (= (size!48172 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48172 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48172 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462071 () Bool)

(assert (=> b!1462071 (= e!821874 true)))

(declare-fun lt!640156 () Bool)

(assert (=> b!1462071 (= lt!640156 e!821865)))

(declare-fun c!134721 () Bool)

(assert (=> b!1462071 (= c!134721 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462072 () Bool)

(declare-fun res!991647 () Bool)

(assert (=> b!1462072 (=> (not res!991647) (not e!821869))))

(assert (=> b!1462072 (= res!991647 e!821866)))

(declare-fun c!134722 () Bool)

(assert (=> b!1462072 (= c!134722 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462073 () Bool)

(declare-fun e!821868 () Bool)

(assert (=> b!1462073 (= e!821870 e!821868)))

(declare-fun res!991657 () Bool)

(assert (=> b!1462073 (=> (not res!991657) (not e!821868))))

(assert (=> b!1462073 (= res!991657 (= (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462073 (= lt!640161 (array!98663 (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48172 a!2862)))))

(declare-fun b!1462074 () Bool)

(declare-fun res!991648 () Bool)

(assert (=> b!1462074 (=> (not res!991648) (not e!821867))))

(assert (=> b!1462074 (= res!991648 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!640155))))

(declare-fun b!1462075 () Bool)

(declare-fun res!991645 () Bool)

(assert (=> b!1462075 (=> (not res!991645) (not e!821870))))

(assert (=> b!1462075 (= res!991645 (validKeyInArray!0 (select (arr!47620 a!2862) i!1006)))))

(declare-fun b!1462076 () Bool)

(assert (=> b!1462076 (= e!821868 e!821867)))

(declare-fun res!991649 () Bool)

(assert (=> b!1462076 (=> (not res!991649) (not e!821867))))

(assert (=> b!1462076 (= res!991649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47620 a!2862) j!93) mask!2687) (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!640155))))

(assert (=> b!1462076 (= lt!640155 (Intermediate!11897 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462077 () Bool)

(assert (=> b!1462077 (= e!821866 (= lt!640159 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640160 lt!640161 mask!2687)))))

(assert (= (and start!125236 res!991652) b!1462070))

(assert (= (and b!1462070 res!991644) b!1462075))

(assert (= (and b!1462075 res!991645) b!1462062))

(assert (= (and b!1462062 res!991650) b!1462069))

(assert (= (and b!1462069 res!991643) b!1462059))

(assert (= (and b!1462059 res!991642) b!1462057))

(assert (= (and b!1462057 res!991654) b!1462073))

(assert (= (and b!1462073 res!991657) b!1462076))

(assert (= (and b!1462076 res!991649) b!1462074))

(assert (= (and b!1462074 res!991648) b!1462067))

(assert (= (and b!1462067 res!991656) b!1462072))

(assert (= (and b!1462072 c!134722) b!1462077))

(assert (= (and b!1462072 (not c!134722)) b!1462060))

(assert (= (and b!1462072 res!991647) b!1462056))

(assert (= (and b!1462056 res!991646) b!1462058))

(assert (= (and b!1462058 res!991655) b!1462066))

(assert (= (and b!1462066 res!991653) b!1462065))

(assert (= (and b!1462058 (not res!991640)) b!1462063))

(assert (= (and b!1462063 (not res!991641)) b!1462068))

(assert (= (and b!1462068 (not res!991651)) b!1462071))

(assert (= (and b!1462071 c!134721) b!1462061))

(assert (= (and b!1462071 (not c!134721)) b!1462064))

(declare-fun m!1349055 () Bool)

(assert (=> b!1462075 m!1349055))

(assert (=> b!1462075 m!1349055))

(declare-fun m!1349057 () Bool)

(assert (=> b!1462075 m!1349057))

(declare-fun m!1349059 () Bool)

(assert (=> b!1462073 m!1349059))

(declare-fun m!1349061 () Bool)

(assert (=> b!1462073 m!1349061))

(declare-fun m!1349063 () Bool)

(assert (=> b!1462077 m!1349063))

(declare-fun m!1349065 () Bool)

(assert (=> b!1462069 m!1349065))

(declare-fun m!1349067 () Bool)

(assert (=> b!1462058 m!1349067))

(assert (=> b!1462058 m!1349059))

(declare-fun m!1349069 () Bool)

(assert (=> b!1462058 m!1349069))

(declare-fun m!1349071 () Bool)

(assert (=> b!1462058 m!1349071))

(declare-fun m!1349073 () Bool)

(assert (=> b!1462058 m!1349073))

(declare-fun m!1349075 () Bool)

(assert (=> b!1462058 m!1349075))

(declare-fun m!1349077 () Bool)

(assert (=> b!1462067 m!1349077))

(assert (=> b!1462067 m!1349077))

(declare-fun m!1349079 () Bool)

(assert (=> b!1462067 m!1349079))

(assert (=> b!1462067 m!1349059))

(declare-fun m!1349081 () Bool)

(assert (=> b!1462067 m!1349081))

(declare-fun m!1349083 () Bool)

(assert (=> b!1462059 m!1349083))

(declare-fun m!1349085 () Bool)

(assert (=> b!1462061 m!1349085))

(assert (=> b!1462066 m!1349075))

(assert (=> b!1462066 m!1349075))

(declare-fun m!1349087 () Bool)

(assert (=> b!1462066 m!1349087))

(declare-fun m!1349089 () Bool)

(assert (=> start!125236 m!1349089))

(declare-fun m!1349091 () Bool)

(assert (=> start!125236 m!1349091))

(declare-fun m!1349093 () Bool)

(assert (=> b!1462060 m!1349093))

(declare-fun m!1349095 () Bool)

(assert (=> b!1462060 m!1349095))

(assert (=> b!1462068 m!1349075))

(assert (=> b!1462068 m!1349075))

(declare-fun m!1349097 () Bool)

(assert (=> b!1462068 m!1349097))

(assert (=> b!1462074 m!1349075))

(assert (=> b!1462074 m!1349075))

(declare-fun m!1349099 () Bool)

(assert (=> b!1462074 m!1349099))

(declare-fun m!1349101 () Bool)

(assert (=> b!1462065 m!1349101))

(assert (=> b!1462065 m!1349075))

(declare-fun m!1349103 () Bool)

(assert (=> b!1462063 m!1349103))

(assert (=> b!1462076 m!1349075))

(assert (=> b!1462076 m!1349075))

(declare-fun m!1349105 () Bool)

(assert (=> b!1462076 m!1349105))

(assert (=> b!1462076 m!1349105))

(assert (=> b!1462076 m!1349075))

(declare-fun m!1349107 () Bool)

(assert (=> b!1462076 m!1349107))

(declare-fun m!1349109 () Bool)

(assert (=> b!1462064 m!1349109))

(assert (=> b!1462064 m!1349095))

(assert (=> b!1462062 m!1349075))

(assert (=> b!1462062 m!1349075))

(declare-fun m!1349111 () Bool)

(assert (=> b!1462062 m!1349111))

(check-sat (not b!1462067) (not b!1462062) (not b!1462058) (not b!1462064) (not b!1462060) (not b!1462059) (not b!1462076) (not b!1462061) (not start!125236) (not b!1462066) (not b!1462074) (not b!1462069) (not b!1462063) (not b!1462077) (not b!1462068) (not b!1462075))
(check-sat)
