; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124566 () Bool)

(assert start!124566)

(declare-fun b!1441852 () Bool)

(declare-fun res!974153 () Bool)

(declare-fun e!812741 () Bool)

(assert (=> b!1441852 (=> (not res!974153) (not e!812741))))

(declare-datatypes ((array!98014 0))(
  ( (array!98015 (arr!47295 (Array (_ BitVec 32) (_ BitVec 64))) (size!47845 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98014)

(declare-datatypes ((List!33796 0))(
  ( (Nil!33793) (Cons!33792 (h!35142 (_ BitVec 64)) (t!48490 List!33796)) )
))
(declare-fun arrayNoDuplicates!0 (array!98014 (_ BitVec 32) List!33796) Bool)

(assert (=> b!1441852 (= res!974153 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33793))))

(declare-fun b!1441853 () Bool)

(declare-fun e!812739 () Bool)

(declare-fun e!812740 () Bool)

(assert (=> b!1441853 (= e!812739 e!812740)))

(declare-fun res!974155 () Bool)

(assert (=> b!1441853 (=> (not res!974155) (not e!812740))))

(declare-datatypes ((SeekEntryResult!11547 0))(
  ( (MissingZero!11547 (index!48580 (_ BitVec 32))) (Found!11547 (index!48581 (_ BitVec 32))) (Intermediate!11547 (undefined!12359 Bool) (index!48582 (_ BitVec 32)) (x!130292 (_ BitVec 32))) (Undefined!11547) (MissingVacant!11547 (index!48583 (_ BitVec 32))) )
))
(declare-fun lt!633383 () SeekEntryResult!11547)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98014 (_ BitVec 32)) SeekEntryResult!11547)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441853 (= res!974155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47295 a!2862) j!93) mask!2687) (select (arr!47295 a!2862) j!93) a!2862 mask!2687) lt!633383))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441853 (= lt!633383 (Intermediate!11547 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!974151 () Bool)

(assert (=> start!124566 (=> (not res!974151) (not e!812741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124566 (= res!974151 (validMask!0 mask!2687))))

(assert (=> start!124566 e!812741))

(assert (=> start!124566 true))

(declare-fun array_inv!36323 (array!98014) Bool)

(assert (=> start!124566 (array_inv!36323 a!2862)))

(declare-fun b!1441854 () Bool)

(declare-fun res!974152 () Bool)

(declare-fun e!812742 () Bool)

(assert (=> b!1441854 (=> (not res!974152) (not e!812742))))

(declare-fun e!812744 () Bool)

(assert (=> b!1441854 (= res!974152 e!812744)))

(declare-fun c!133365 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441854 (= c!133365 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441855 () Bool)

(declare-fun res!974149 () Bool)

(assert (=> b!1441855 (=> (not res!974149) (not e!812742))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441855 (= res!974149 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441856 () Bool)

(assert (=> b!1441856 (= e!812740 e!812742)))

(declare-fun res!974148 () Bool)

(assert (=> b!1441856 (=> (not res!974148) (not e!812742))))

(declare-fun lt!633381 () SeekEntryResult!11547)

(assert (=> b!1441856 (= res!974148 (= lt!633381 (Intermediate!11547 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633382 () (_ BitVec 64))

(declare-fun lt!633380 () array!98014)

(assert (=> b!1441856 (= lt!633381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633382 mask!2687) lt!633382 lt!633380 mask!2687))))

(assert (=> b!1441856 (= lt!633382 (select (store (arr!47295 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441857 () Bool)

(assert (=> b!1441857 (= e!812742 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98014 (_ BitVec 32)) Bool)

(assert (=> b!1441857 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48590 0))(
  ( (Unit!48591) )
))
(declare-fun lt!633384 () Unit!48590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48590)

(assert (=> b!1441857 (= lt!633384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441858 () Bool)

(declare-fun res!974144 () Bool)

(assert (=> b!1441858 (=> (not res!974144) (not e!812740))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441858 (= res!974144 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47295 a!2862) j!93) a!2862 mask!2687) lt!633383))))

(declare-fun b!1441859 () Bool)

(declare-fun res!974154 () Bool)

(assert (=> b!1441859 (=> (not res!974154) (not e!812741))))

(assert (=> b!1441859 (= res!974154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441860 () Bool)

(declare-fun res!974143 () Bool)

(assert (=> b!1441860 (=> (not res!974143) (not e!812741))))

(assert (=> b!1441860 (= res!974143 (and (= (size!47845 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47845 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47845 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441861 () Bool)

(assert (=> b!1441861 (= e!812744 (= lt!633381 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633382 lt!633380 mask!2687)))))

(declare-fun b!1441862 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98014 (_ BitVec 32)) SeekEntryResult!11547)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98014 (_ BitVec 32)) SeekEntryResult!11547)

(assert (=> b!1441862 (= e!812744 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633382 lt!633380 mask!2687) (seekEntryOrOpen!0 lt!633382 lt!633380 mask!2687)))))

(declare-fun b!1441863 () Bool)

(declare-fun res!974145 () Bool)

(assert (=> b!1441863 (=> (not res!974145) (not e!812741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441863 (= res!974145 (validKeyInArray!0 (select (arr!47295 a!2862) j!93)))))

(declare-fun b!1441864 () Bool)

(assert (=> b!1441864 (= e!812741 e!812739)))

(declare-fun res!974150 () Bool)

(assert (=> b!1441864 (=> (not res!974150) (not e!812739))))

(assert (=> b!1441864 (= res!974150 (= (select (store (arr!47295 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441864 (= lt!633380 (array!98015 (store (arr!47295 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47845 a!2862)))))

(declare-fun b!1441865 () Bool)

(declare-fun res!974146 () Bool)

(assert (=> b!1441865 (=> (not res!974146) (not e!812741))))

(assert (=> b!1441865 (= res!974146 (validKeyInArray!0 (select (arr!47295 a!2862) i!1006)))))

(declare-fun b!1441866 () Bool)

(declare-fun res!974147 () Bool)

(assert (=> b!1441866 (=> (not res!974147) (not e!812741))))

(assert (=> b!1441866 (= res!974147 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47845 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47845 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47845 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124566 res!974151) b!1441860))

(assert (= (and b!1441860 res!974143) b!1441865))

(assert (= (and b!1441865 res!974146) b!1441863))

(assert (= (and b!1441863 res!974145) b!1441859))

(assert (= (and b!1441859 res!974154) b!1441852))

(assert (= (and b!1441852 res!974153) b!1441866))

(assert (= (and b!1441866 res!974147) b!1441864))

(assert (= (and b!1441864 res!974150) b!1441853))

(assert (= (and b!1441853 res!974155) b!1441858))

(assert (= (and b!1441858 res!974144) b!1441856))

(assert (= (and b!1441856 res!974148) b!1441854))

(assert (= (and b!1441854 c!133365) b!1441861))

(assert (= (and b!1441854 (not c!133365)) b!1441862))

(assert (= (and b!1441854 res!974152) b!1441855))

(assert (= (and b!1441855 res!974149) b!1441857))

(declare-fun m!1331047 () Bool)

(assert (=> b!1441861 m!1331047))

(declare-fun m!1331049 () Bool)

(assert (=> b!1441857 m!1331049))

(declare-fun m!1331051 () Bool)

(assert (=> b!1441857 m!1331051))

(declare-fun m!1331053 () Bool)

(assert (=> b!1441853 m!1331053))

(assert (=> b!1441853 m!1331053))

(declare-fun m!1331055 () Bool)

(assert (=> b!1441853 m!1331055))

(assert (=> b!1441853 m!1331055))

(assert (=> b!1441853 m!1331053))

(declare-fun m!1331057 () Bool)

(assert (=> b!1441853 m!1331057))

(declare-fun m!1331059 () Bool)

(assert (=> b!1441856 m!1331059))

(assert (=> b!1441856 m!1331059))

(declare-fun m!1331061 () Bool)

(assert (=> b!1441856 m!1331061))

(declare-fun m!1331063 () Bool)

(assert (=> b!1441856 m!1331063))

(declare-fun m!1331065 () Bool)

(assert (=> b!1441856 m!1331065))

(assert (=> b!1441864 m!1331063))

(declare-fun m!1331067 () Bool)

(assert (=> b!1441864 m!1331067))

(declare-fun m!1331069 () Bool)

(assert (=> b!1441862 m!1331069))

(declare-fun m!1331071 () Bool)

(assert (=> b!1441862 m!1331071))

(assert (=> b!1441863 m!1331053))

(assert (=> b!1441863 m!1331053))

(declare-fun m!1331073 () Bool)

(assert (=> b!1441863 m!1331073))

(declare-fun m!1331075 () Bool)

(assert (=> b!1441865 m!1331075))

(assert (=> b!1441865 m!1331075))

(declare-fun m!1331077 () Bool)

(assert (=> b!1441865 m!1331077))

(declare-fun m!1331079 () Bool)

(assert (=> b!1441852 m!1331079))

(assert (=> b!1441858 m!1331053))

(assert (=> b!1441858 m!1331053))

(declare-fun m!1331081 () Bool)

(assert (=> b!1441858 m!1331081))

(declare-fun m!1331083 () Bool)

(assert (=> start!124566 m!1331083))

(declare-fun m!1331085 () Bool)

(assert (=> start!124566 m!1331085))

(declare-fun m!1331087 () Bool)

(assert (=> b!1441859 m!1331087))

(check-sat (not b!1441857) (not b!1441863) (not b!1441852) (not start!124566) (not b!1441853) (not b!1441862) (not b!1441861) (not b!1441856) (not b!1441858) (not b!1441865) (not b!1441859))
(check-sat)
