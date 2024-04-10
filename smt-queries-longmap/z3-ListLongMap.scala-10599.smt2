; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124734 () Bool)

(assert start!124734)

(declare-fun b!1446173 () Bool)

(declare-fun res!977962 () Bool)

(declare-fun e!814547 () Bool)

(assert (=> b!1446173 (=> (not res!977962) (not e!814547))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98182 0))(
  ( (array!98183 (arr!47379 (Array (_ BitVec 32) (_ BitVec 64))) (size!47929 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98182)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446173 (= res!977962 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47929 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47929 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47929 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446174 () Bool)

(declare-fun e!814550 () Bool)

(declare-fun e!814544 () Bool)

(assert (=> b!1446174 (= e!814550 e!814544)))

(declare-fun res!977971 () Bool)

(assert (=> b!1446174 (=> (not res!977971) (not e!814544))))

(declare-datatypes ((SeekEntryResult!11631 0))(
  ( (MissingZero!11631 (index!48916 (_ BitVec 32))) (Found!11631 (index!48917 (_ BitVec 32))) (Intermediate!11631 (undefined!12443 Bool) (index!48918 (_ BitVec 32)) (x!130600 (_ BitVec 32))) (Undefined!11631) (MissingVacant!11631 (index!48919 (_ BitVec 32))) )
))
(declare-fun lt!634714 () SeekEntryResult!11631)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98182 (_ BitVec 32)) SeekEntryResult!11631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446174 (= res!977971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47379 a!2862) j!93) mask!2687) (select (arr!47379 a!2862) j!93) a!2862 mask!2687) lt!634714))))

(assert (=> b!1446174 (= lt!634714 (Intermediate!11631 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446175 () Bool)

(declare-fun res!977972 () Bool)

(assert (=> b!1446175 (=> (not res!977972) (not e!814544))))

(assert (=> b!1446175 (= res!977972 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47379 a!2862) j!93) a!2862 mask!2687) lt!634714))))

(declare-fun b!1446176 () Bool)

(declare-fun res!977964 () Bool)

(assert (=> b!1446176 (=> (not res!977964) (not e!814547))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446176 (= res!977964 (validKeyInArray!0 (select (arr!47379 a!2862) i!1006)))))

(declare-fun b!1446177 () Bool)

(declare-fun res!977969 () Bool)

(assert (=> b!1446177 (=> (not res!977969) (not e!814547))))

(declare-datatypes ((List!33880 0))(
  ( (Nil!33877) (Cons!33876 (h!35226 (_ BitVec 64)) (t!48574 List!33880)) )
))
(declare-fun arrayNoDuplicates!0 (array!98182 (_ BitVec 32) List!33880) Bool)

(assert (=> b!1446177 (= res!977969 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33877))))

(declare-fun b!1446178 () Bool)

(declare-fun res!977967 () Bool)

(assert (=> b!1446178 (=> (not res!977967) (not e!814547))))

(assert (=> b!1446178 (= res!977967 (validKeyInArray!0 (select (arr!47379 a!2862) j!93)))))

(declare-fun lt!634712 () SeekEntryResult!11631)

(declare-fun lt!634716 () array!98182)

(declare-fun b!1446179 () Bool)

(declare-fun e!814545 () Bool)

(declare-fun lt!634715 () (_ BitVec 64))

(assert (=> b!1446179 (= e!814545 (= lt!634712 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634715 lt!634716 mask!2687)))))

(declare-fun b!1446180 () Bool)

(declare-fun res!977974 () Bool)

(declare-fun e!814546 () Bool)

(assert (=> b!1446180 (=> (not res!977974) (not e!814546))))

(assert (=> b!1446180 (= res!977974 e!814545)))

(declare-fun c!133617 () Bool)

(assert (=> b!1446180 (= c!133617 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446181 () Bool)

(declare-fun res!977960 () Bool)

(assert (=> b!1446181 (=> (not res!977960) (not e!814546))))

(assert (=> b!1446181 (= res!977960 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446182 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98182 (_ BitVec 32)) SeekEntryResult!11631)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98182 (_ BitVec 32)) SeekEntryResult!11631)

(assert (=> b!1446182 (= e!814545 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634715 lt!634716 mask!2687) (seekEntryOrOpen!0 lt!634715 lt!634716 mask!2687)))))

(declare-fun b!1446183 () Bool)

(assert (=> b!1446183 (= e!814544 e!814546)))

(declare-fun res!977963 () Bool)

(assert (=> b!1446183 (=> (not res!977963) (not e!814546))))

(assert (=> b!1446183 (= res!977963 (= lt!634712 (Intermediate!11631 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446183 (= lt!634712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634715 mask!2687) lt!634715 lt!634716 mask!2687))))

(assert (=> b!1446183 (= lt!634715 (select (store (arr!47379 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446184 () Bool)

(assert (=> b!1446184 (= e!814547 e!814550)))

(declare-fun res!977970 () Bool)

(assert (=> b!1446184 (=> (not res!977970) (not e!814550))))

(assert (=> b!1446184 (= res!977970 (= (select (store (arr!47379 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446184 (= lt!634716 (array!98183 (store (arr!47379 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47929 a!2862)))))

(declare-fun b!1446185 () Bool)

(declare-fun e!814549 () Bool)

(assert (=> b!1446185 (= e!814549 (or (= (select (arr!47379 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47379 a!2862) intermediateBeforeIndex!19) (select (arr!47379 a!2862) j!93))))))

(declare-fun res!977968 () Bool)

(assert (=> start!124734 (=> (not res!977968) (not e!814547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124734 (= res!977968 (validMask!0 mask!2687))))

(assert (=> start!124734 e!814547))

(assert (=> start!124734 true))

(declare-fun array_inv!36407 (array!98182) Bool)

(assert (=> start!124734 (array_inv!36407 a!2862)))

(declare-fun b!1446186 () Bool)

(declare-fun res!977973 () Bool)

(assert (=> b!1446186 (=> (not res!977973) (not e!814547))))

(assert (=> b!1446186 (= res!977973 (and (= (size!47929 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47929 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47929 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446187 () Bool)

(declare-fun res!977961 () Bool)

(assert (=> b!1446187 (=> (not res!977961) (not e!814549))))

(assert (=> b!1446187 (= res!977961 (= (seekEntryOrOpen!0 (select (arr!47379 a!2862) j!93) a!2862 mask!2687) (Found!11631 j!93)))))

(declare-fun b!1446188 () Bool)

(declare-fun res!977965 () Bool)

(assert (=> b!1446188 (=> (not res!977965) (not e!814547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98182 (_ BitVec 32)) Bool)

(assert (=> b!1446188 (= res!977965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446189 () Bool)

(assert (=> b!1446189 (= e!814546 (not true))))

(assert (=> b!1446189 e!814549))

(declare-fun res!977966 () Bool)

(assert (=> b!1446189 (=> (not res!977966) (not e!814549))))

(assert (=> b!1446189 (= res!977966 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48758 0))(
  ( (Unit!48759) )
))
(declare-fun lt!634713 () Unit!48758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48758)

(assert (=> b!1446189 (= lt!634713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124734 res!977968) b!1446186))

(assert (= (and b!1446186 res!977973) b!1446176))

(assert (= (and b!1446176 res!977964) b!1446178))

(assert (= (and b!1446178 res!977967) b!1446188))

(assert (= (and b!1446188 res!977965) b!1446177))

(assert (= (and b!1446177 res!977969) b!1446173))

(assert (= (and b!1446173 res!977962) b!1446184))

(assert (= (and b!1446184 res!977970) b!1446174))

(assert (= (and b!1446174 res!977971) b!1446175))

(assert (= (and b!1446175 res!977972) b!1446183))

(assert (= (and b!1446183 res!977963) b!1446180))

(assert (= (and b!1446180 c!133617) b!1446179))

(assert (= (and b!1446180 (not c!133617)) b!1446182))

(assert (= (and b!1446180 res!977974) b!1446181))

(assert (= (and b!1446181 res!977960) b!1446189))

(assert (= (and b!1446189 res!977966) b!1446187))

(assert (= (and b!1446187 res!977961) b!1446185))

(declare-fun m!1335071 () Bool)

(assert (=> b!1446177 m!1335071))

(declare-fun m!1335073 () Bool)

(assert (=> b!1446184 m!1335073))

(declare-fun m!1335075 () Bool)

(assert (=> b!1446184 m!1335075))

(declare-fun m!1335077 () Bool)

(assert (=> b!1446178 m!1335077))

(assert (=> b!1446178 m!1335077))

(declare-fun m!1335079 () Bool)

(assert (=> b!1446178 m!1335079))

(declare-fun m!1335081 () Bool)

(assert (=> b!1446179 m!1335081))

(declare-fun m!1335083 () Bool)

(assert (=> b!1446185 m!1335083))

(assert (=> b!1446185 m!1335077))

(declare-fun m!1335085 () Bool)

(assert (=> start!124734 m!1335085))

(declare-fun m!1335087 () Bool)

(assert (=> start!124734 m!1335087))

(declare-fun m!1335089 () Bool)

(assert (=> b!1446182 m!1335089))

(declare-fun m!1335091 () Bool)

(assert (=> b!1446182 m!1335091))

(declare-fun m!1335093 () Bool)

(assert (=> b!1446189 m!1335093))

(declare-fun m!1335095 () Bool)

(assert (=> b!1446189 m!1335095))

(declare-fun m!1335097 () Bool)

(assert (=> b!1446183 m!1335097))

(assert (=> b!1446183 m!1335097))

(declare-fun m!1335099 () Bool)

(assert (=> b!1446183 m!1335099))

(assert (=> b!1446183 m!1335073))

(declare-fun m!1335101 () Bool)

(assert (=> b!1446183 m!1335101))

(declare-fun m!1335103 () Bool)

(assert (=> b!1446188 m!1335103))

(declare-fun m!1335105 () Bool)

(assert (=> b!1446176 m!1335105))

(assert (=> b!1446176 m!1335105))

(declare-fun m!1335107 () Bool)

(assert (=> b!1446176 m!1335107))

(assert (=> b!1446174 m!1335077))

(assert (=> b!1446174 m!1335077))

(declare-fun m!1335109 () Bool)

(assert (=> b!1446174 m!1335109))

(assert (=> b!1446174 m!1335109))

(assert (=> b!1446174 m!1335077))

(declare-fun m!1335111 () Bool)

(assert (=> b!1446174 m!1335111))

(assert (=> b!1446175 m!1335077))

(assert (=> b!1446175 m!1335077))

(declare-fun m!1335113 () Bool)

(assert (=> b!1446175 m!1335113))

(assert (=> b!1446187 m!1335077))

(assert (=> b!1446187 m!1335077))

(declare-fun m!1335115 () Bool)

(assert (=> b!1446187 m!1335115))

(check-sat (not b!1446189) (not b!1446187) (not b!1446182) (not b!1446179) (not b!1446178) (not b!1446177) (not b!1446176) (not b!1446183) (not b!1446175) (not start!124734) (not b!1446188) (not b!1446174))
(check-sat)
