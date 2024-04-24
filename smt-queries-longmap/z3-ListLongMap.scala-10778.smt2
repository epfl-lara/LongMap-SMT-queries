; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126444 () Bool)

(assert start!126444)

(declare-fun b!1479170 () Bool)

(declare-fun res!1004209 () Bool)

(declare-fun e!829919 () Bool)

(assert (=> b!1479170 (=> (not res!1004209) (not e!829919))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479170 (= res!1004209 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479171 () Bool)

(declare-fun e!829918 () Bool)

(declare-fun e!829923 () Bool)

(assert (=> b!1479171 (= e!829918 e!829923)))

(declare-fun res!1004197 () Bool)

(assert (=> b!1479171 (=> (not res!1004197) (not e!829923))))

(declare-datatypes ((array!99388 0))(
  ( (array!99389 (arr!47968 (Array (_ BitVec 32) (_ BitVec 64))) (size!48519 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99388)

(assert (=> b!1479171 (= res!1004197 (= (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645993 () array!99388)

(assert (=> b!1479171 (= lt!645993 (array!99389 (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48519 a!2862)))))

(declare-fun b!1479172 () Bool)

(declare-fun res!1004196 () Bool)

(assert (=> b!1479172 (=> (not res!1004196) (not e!829919))))

(declare-fun e!829922 () Bool)

(assert (=> b!1479172 (= res!1004196 e!829922)))

(declare-fun c!137017 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479172 (= c!137017 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479173 () Bool)

(declare-fun res!1004204 () Bool)

(assert (=> b!1479173 (=> (not res!1004204) (not e!829918))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479173 (= res!1004204 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48519 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48519 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48519 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479174 () Bool)

(declare-fun e!829924 () Bool)

(declare-fun e!829921 () Bool)

(assert (=> b!1479174 (= e!829924 e!829921)))

(declare-fun res!1004202 () Bool)

(assert (=> b!1479174 (=> (not res!1004202) (not e!829921))))

(declare-datatypes ((SeekEntryResult!12105 0))(
  ( (MissingZero!12105 (index!50812 (_ BitVec 32))) (Found!12105 (index!50813 (_ BitVec 32))) (Intermediate!12105 (undefined!12917 Bool) (index!50814 (_ BitVec 32)) (x!132593 (_ BitVec 32))) (Undefined!12105) (MissingVacant!12105 (index!50815 (_ BitVec 32))) )
))
(declare-fun lt!645997 () SeekEntryResult!12105)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99388 (_ BitVec 32)) SeekEntryResult!12105)

(assert (=> b!1479174 (= res!1004202 (= lt!645997 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47968 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479175 () Bool)

(assert (=> b!1479175 (= e!829919 (not true))))

(declare-fun e!829925 () Bool)

(assert (=> b!1479175 e!829925))

(declare-fun res!1004203 () Bool)

(assert (=> b!1479175 (=> (not res!1004203) (not e!829925))))

(assert (=> b!1479175 (= res!1004203 (and (= lt!645997 (Found!12105 j!93)) (or (= (select (arr!47968 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47968 a!2862) intermediateBeforeIndex!19) (select (arr!47968 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99388 (_ BitVec 32)) SeekEntryResult!12105)

(assert (=> b!1479175 (= lt!645997 (seekEntryOrOpen!0 (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99388 (_ BitVec 32)) Bool)

(assert (=> b!1479175 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49583 0))(
  ( (Unit!49584) )
))
(declare-fun lt!645996 () Unit!49583)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49583)

(assert (=> b!1479175 (= lt!645996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1004198 () Bool)

(assert (=> start!126444 (=> (not res!1004198) (not e!829918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126444 (= res!1004198 (validMask!0 mask!2687))))

(assert (=> start!126444 e!829918))

(assert (=> start!126444 true))

(declare-fun array_inv!37249 (array!99388) Bool)

(assert (=> start!126444 (array_inv!37249 a!2862)))

(declare-fun b!1479176 () Bool)

(declare-fun e!829926 () Bool)

(assert (=> b!1479176 (= e!829923 e!829926)))

(declare-fun res!1004205 () Bool)

(assert (=> b!1479176 (=> (not res!1004205) (not e!829926))))

(declare-fun lt!645994 () SeekEntryResult!12105)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99388 (_ BitVec 32)) SeekEntryResult!12105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479176 (= res!1004205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!645994))))

(assert (=> b!1479176 (= lt!645994 (Intermediate!12105 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479177 () Bool)

(declare-fun res!1004201 () Bool)

(assert (=> b!1479177 (=> (not res!1004201) (not e!829926))))

(assert (=> b!1479177 (= res!1004201 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!645994))))

(declare-fun b!1479178 () Bool)

(declare-fun res!1004207 () Bool)

(assert (=> b!1479178 (=> (not res!1004207) (not e!829918))))

(declare-datatypes ((List!34456 0))(
  ( (Nil!34453) (Cons!34452 (h!35834 (_ BitVec 64)) (t!49142 List!34456)) )
))
(declare-fun arrayNoDuplicates!0 (array!99388 (_ BitVec 32) List!34456) Bool)

(assert (=> b!1479178 (= res!1004207 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34453))))

(declare-fun b!1479179 () Bool)

(declare-fun res!1004200 () Bool)

(assert (=> b!1479179 (=> (not res!1004200) (not e!829918))))

(assert (=> b!1479179 (= res!1004200 (and (= (size!48519 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48519 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48519 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479180 () Bool)

(declare-fun res!1004199 () Bool)

(assert (=> b!1479180 (=> (not res!1004199) (not e!829918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479180 (= res!1004199 (validKeyInArray!0 (select (arr!47968 a!2862) i!1006)))))

(declare-fun b!1479181 () Bool)

(declare-fun res!1004210 () Bool)

(assert (=> b!1479181 (=> (not res!1004210) (not e!829918))))

(assert (=> b!1479181 (= res!1004210 (validKeyInArray!0 (select (arr!47968 a!2862) j!93)))))

(declare-fun b!1479182 () Bool)

(declare-fun res!1004206 () Bool)

(assert (=> b!1479182 (=> (not res!1004206) (not e!829918))))

(assert (=> b!1479182 (= res!1004206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!645995 () SeekEntryResult!12105)

(declare-fun lt!645992 () (_ BitVec 64))

(declare-fun b!1479183 () Bool)

(assert (=> b!1479183 (= e!829922 (= lt!645995 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645992 lt!645993 mask!2687)))))

(declare-fun b!1479184 () Bool)

(assert (=> b!1479184 (= e!829925 e!829924)))

(declare-fun res!1004208 () Bool)

(assert (=> b!1479184 (=> res!1004208 e!829924)))

(assert (=> b!1479184 (= res!1004208 (or (and (= (select (arr!47968 a!2862) index!646) (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47968 a!2862) index!646) (select (arr!47968 a!2862) j!93))) (not (= (select (arr!47968 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479185 () Bool)

(assert (=> b!1479185 (= e!829926 e!829919)))

(declare-fun res!1004195 () Bool)

(assert (=> b!1479185 (=> (not res!1004195) (not e!829919))))

(assert (=> b!1479185 (= res!1004195 (= lt!645995 (Intermediate!12105 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479185 (= lt!645995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645992 mask!2687) lt!645992 lt!645993 mask!2687))))

(assert (=> b!1479185 (= lt!645992 (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479186 () Bool)

(assert (=> b!1479186 (= e!829921 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479187 () Bool)

(assert (=> b!1479187 (= e!829922 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645992 lt!645993 mask!2687) (seekEntryOrOpen!0 lt!645992 lt!645993 mask!2687)))))

(assert (= (and start!126444 res!1004198) b!1479179))

(assert (= (and b!1479179 res!1004200) b!1479180))

(assert (= (and b!1479180 res!1004199) b!1479181))

(assert (= (and b!1479181 res!1004210) b!1479182))

(assert (= (and b!1479182 res!1004206) b!1479178))

(assert (= (and b!1479178 res!1004207) b!1479173))

(assert (= (and b!1479173 res!1004204) b!1479171))

(assert (= (and b!1479171 res!1004197) b!1479176))

(assert (= (and b!1479176 res!1004205) b!1479177))

(assert (= (and b!1479177 res!1004201) b!1479185))

(assert (= (and b!1479185 res!1004195) b!1479172))

(assert (= (and b!1479172 c!137017) b!1479183))

(assert (= (and b!1479172 (not c!137017)) b!1479187))

(assert (= (and b!1479172 res!1004196) b!1479170))

(assert (= (and b!1479170 res!1004209) b!1479175))

(assert (= (and b!1479175 res!1004203) b!1479184))

(assert (= (and b!1479184 (not res!1004208)) b!1479174))

(assert (= (and b!1479174 res!1004202) b!1479186))

(declare-fun m!1365097 () Bool)

(assert (=> b!1479187 m!1365097))

(declare-fun m!1365099 () Bool)

(assert (=> b!1479187 m!1365099))

(declare-fun m!1365101 () Bool)

(assert (=> start!126444 m!1365101))

(declare-fun m!1365103 () Bool)

(assert (=> start!126444 m!1365103))

(declare-fun m!1365105 () Bool)

(assert (=> b!1479181 m!1365105))

(assert (=> b!1479181 m!1365105))

(declare-fun m!1365107 () Bool)

(assert (=> b!1479181 m!1365107))

(assert (=> b!1479176 m!1365105))

(assert (=> b!1479176 m!1365105))

(declare-fun m!1365109 () Bool)

(assert (=> b!1479176 m!1365109))

(assert (=> b!1479176 m!1365109))

(assert (=> b!1479176 m!1365105))

(declare-fun m!1365111 () Bool)

(assert (=> b!1479176 m!1365111))

(declare-fun m!1365113 () Bool)

(assert (=> b!1479185 m!1365113))

(assert (=> b!1479185 m!1365113))

(declare-fun m!1365115 () Bool)

(assert (=> b!1479185 m!1365115))

(declare-fun m!1365117 () Bool)

(assert (=> b!1479185 m!1365117))

(declare-fun m!1365119 () Bool)

(assert (=> b!1479185 m!1365119))

(assert (=> b!1479174 m!1365105))

(assert (=> b!1479174 m!1365105))

(declare-fun m!1365121 () Bool)

(assert (=> b!1479174 m!1365121))

(declare-fun m!1365123 () Bool)

(assert (=> b!1479180 m!1365123))

(assert (=> b!1479180 m!1365123))

(declare-fun m!1365125 () Bool)

(assert (=> b!1479180 m!1365125))

(declare-fun m!1365127 () Bool)

(assert (=> b!1479182 m!1365127))

(assert (=> b!1479171 m!1365117))

(declare-fun m!1365129 () Bool)

(assert (=> b!1479171 m!1365129))

(assert (=> b!1479177 m!1365105))

(assert (=> b!1479177 m!1365105))

(declare-fun m!1365131 () Bool)

(assert (=> b!1479177 m!1365131))

(declare-fun m!1365133 () Bool)

(assert (=> b!1479175 m!1365133))

(declare-fun m!1365135 () Bool)

(assert (=> b!1479175 m!1365135))

(assert (=> b!1479175 m!1365105))

(declare-fun m!1365137 () Bool)

(assert (=> b!1479175 m!1365137))

(declare-fun m!1365139 () Bool)

(assert (=> b!1479175 m!1365139))

(assert (=> b!1479175 m!1365105))

(declare-fun m!1365141 () Bool)

(assert (=> b!1479184 m!1365141))

(assert (=> b!1479184 m!1365117))

(declare-fun m!1365143 () Bool)

(assert (=> b!1479184 m!1365143))

(assert (=> b!1479184 m!1365105))

(declare-fun m!1365145 () Bool)

(assert (=> b!1479183 m!1365145))

(declare-fun m!1365147 () Bool)

(assert (=> b!1479178 m!1365147))

(check-sat (not b!1479182) (not b!1479178) (not start!126444) (not b!1479177) (not b!1479187) (not b!1479181) (not b!1479185) (not b!1479180) (not b!1479183) (not b!1479176) (not b!1479174) (not b!1479175))
(check-sat)
