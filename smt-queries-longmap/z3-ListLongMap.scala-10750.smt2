; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125728 () Bool)

(assert start!125728)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12071 0))(
  ( (MissingZero!12071 (index!50676 (_ BitVec 32))) (Found!12071 (index!50677 (_ BitVec 32))) (Intermediate!12071 (undefined!12883 Bool) (index!50678 (_ BitVec 32)) (x!132261 (_ BitVec 32))) (Undefined!12071) (MissingVacant!12071 (index!50679 (_ BitVec 32))) )
))
(declare-fun lt!643062 () SeekEntryResult!12071)

(declare-datatypes ((array!99040 0))(
  ( (array!99041 (arr!47806 (Array (_ BitVec 32) (_ BitVec 64))) (size!48358 (_ BitVec 32))) )
))
(declare-fun lt!643064 () array!99040)

(declare-fun e!825851 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!643063 () (_ BitVec 64))

(declare-fun b!1471304 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!12071)

(assert (=> b!1471304 (= e!825851 (= lt!643062 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643063 lt!643064 mask!2687)))))

(declare-fun b!1471305 () Bool)

(declare-fun res!999198 () Bool)

(declare-fun e!825849 () Bool)

(assert (=> b!1471305 (=> (not res!999198) (not e!825849))))

(declare-fun a!2862 () array!99040)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99040 (_ BitVec 32)) Bool)

(assert (=> b!1471305 (= res!999198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!999200 () Bool)

(assert (=> start!125728 (=> (not res!999200) (not e!825849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125728 (= res!999200 (validMask!0 mask!2687))))

(assert (=> start!125728 e!825849))

(assert (=> start!125728 true))

(declare-fun array_inv!37039 (array!99040) Bool)

(assert (=> start!125728 (array_inv!37039 a!2862)))

(declare-fun e!825850 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1471306 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1471306 (= e!825850 (or (= (select (arr!47806 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47806 a!2862) intermediateBeforeIndex!19) (select (arr!47806 a!2862) j!93))))))

(declare-fun b!1471307 () Bool)

(declare-fun e!825848 () Bool)

(declare-fun e!825852 () Bool)

(assert (=> b!1471307 (= e!825848 e!825852)))

(declare-fun res!999197 () Bool)

(assert (=> b!1471307 (=> (not res!999197) (not e!825852))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471307 (= res!999197 (= lt!643062 (Intermediate!12071 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471307 (= lt!643062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643063 mask!2687) lt!643063 lt!643064 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471307 (= lt!643063 (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471308 () Bool)

(declare-fun res!999204 () Bool)

(assert (=> b!1471308 (=> (not res!999204) (not e!825849))))

(assert (=> b!1471308 (= res!999204 (and (= (size!48358 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48358 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48358 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471309 () Bool)

(declare-fun res!999205 () Bool)

(assert (=> b!1471309 (=> (not res!999205) (not e!825852))))

(assert (=> b!1471309 (= res!999205 e!825851)))

(declare-fun c!135571 () Bool)

(assert (=> b!1471309 (= c!135571 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471310 () Bool)

(assert (=> b!1471310 (= e!825852 (not true))))

(assert (=> b!1471310 e!825850))

(declare-fun res!999202 () Bool)

(assert (=> b!1471310 (=> (not res!999202) (not e!825850))))

(assert (=> b!1471310 (= res!999202 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49323 0))(
  ( (Unit!49324) )
))
(declare-fun lt!643065 () Unit!49323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49323)

(assert (=> b!1471310 (= lt!643065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471311 () Bool)

(declare-fun e!825846 () Bool)

(assert (=> b!1471311 (= e!825846 e!825848)))

(declare-fun res!999196 () Bool)

(assert (=> b!1471311 (=> (not res!999196) (not e!825848))))

(declare-fun lt!643061 () SeekEntryResult!12071)

(assert (=> b!1471311 (= res!999196 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47806 a!2862) j!93) mask!2687) (select (arr!47806 a!2862) j!93) a!2862 mask!2687) lt!643061))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471311 (= lt!643061 (Intermediate!12071 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471312 () Bool)

(declare-fun res!999206 () Bool)

(assert (=> b!1471312 (=> (not res!999206) (not e!825849))))

(declare-datatypes ((List!34385 0))(
  ( (Nil!34382) (Cons!34381 (h!35737 (_ BitVec 64)) (t!49071 List!34385)) )
))
(declare-fun arrayNoDuplicates!0 (array!99040 (_ BitVec 32) List!34385) Bool)

(assert (=> b!1471312 (= res!999206 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34382))))

(declare-fun b!1471313 () Bool)

(assert (=> b!1471313 (= e!825849 e!825846)))

(declare-fun res!999195 () Bool)

(assert (=> b!1471313 (=> (not res!999195) (not e!825846))))

(assert (=> b!1471313 (= res!999195 (= (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471313 (= lt!643064 (array!99041 (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48358 a!2862)))))

(declare-fun b!1471314 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!12071)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!12071)

(assert (=> b!1471314 (= e!825851 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643063 lt!643064 mask!2687) (seekEntryOrOpen!0 lt!643063 lt!643064 mask!2687)))))

(declare-fun b!1471315 () Bool)

(declare-fun res!999203 () Bool)

(assert (=> b!1471315 (=> (not res!999203) (not e!825849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471315 (= res!999203 (validKeyInArray!0 (select (arr!47806 a!2862) i!1006)))))

(declare-fun b!1471316 () Bool)

(declare-fun res!999199 () Bool)

(assert (=> b!1471316 (=> (not res!999199) (not e!825849))))

(assert (=> b!1471316 (= res!999199 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48358 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48358 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48358 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471317 () Bool)

(declare-fun res!999194 () Bool)

(assert (=> b!1471317 (=> (not res!999194) (not e!825849))))

(assert (=> b!1471317 (= res!999194 (validKeyInArray!0 (select (arr!47806 a!2862) j!93)))))

(declare-fun b!1471318 () Bool)

(declare-fun res!999208 () Bool)

(assert (=> b!1471318 (=> (not res!999208) (not e!825852))))

(assert (=> b!1471318 (= res!999208 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471319 () Bool)

(declare-fun res!999207 () Bool)

(assert (=> b!1471319 (=> (not res!999207) (not e!825850))))

(assert (=> b!1471319 (= res!999207 (= (seekEntryOrOpen!0 (select (arr!47806 a!2862) j!93) a!2862 mask!2687) (Found!12071 j!93)))))

(declare-fun b!1471320 () Bool)

(declare-fun res!999201 () Bool)

(assert (=> b!1471320 (=> (not res!999201) (not e!825848))))

(assert (=> b!1471320 (= res!999201 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47806 a!2862) j!93) a!2862 mask!2687) lt!643061))))

(assert (= (and start!125728 res!999200) b!1471308))

(assert (= (and b!1471308 res!999204) b!1471315))

(assert (= (and b!1471315 res!999203) b!1471317))

(assert (= (and b!1471317 res!999194) b!1471305))

(assert (= (and b!1471305 res!999198) b!1471312))

(assert (= (and b!1471312 res!999206) b!1471316))

(assert (= (and b!1471316 res!999199) b!1471313))

(assert (= (and b!1471313 res!999195) b!1471311))

(assert (= (and b!1471311 res!999196) b!1471320))

(assert (= (and b!1471320 res!999201) b!1471307))

(assert (= (and b!1471307 res!999197) b!1471309))

(assert (= (and b!1471309 c!135571) b!1471304))

(assert (= (and b!1471309 (not c!135571)) b!1471314))

(assert (= (and b!1471309 res!999205) b!1471318))

(assert (= (and b!1471318 res!999208) b!1471310))

(assert (= (and b!1471310 res!999202) b!1471319))

(assert (= (and b!1471319 res!999207) b!1471306))

(declare-fun m!1357629 () Bool)

(assert (=> b!1471306 m!1357629))

(declare-fun m!1357631 () Bool)

(assert (=> b!1471306 m!1357631))

(declare-fun m!1357633 () Bool)

(assert (=> start!125728 m!1357633))

(declare-fun m!1357635 () Bool)

(assert (=> start!125728 m!1357635))

(declare-fun m!1357637 () Bool)

(assert (=> b!1471315 m!1357637))

(assert (=> b!1471315 m!1357637))

(declare-fun m!1357639 () Bool)

(assert (=> b!1471315 m!1357639))

(assert (=> b!1471317 m!1357631))

(assert (=> b!1471317 m!1357631))

(declare-fun m!1357641 () Bool)

(assert (=> b!1471317 m!1357641))

(assert (=> b!1471319 m!1357631))

(assert (=> b!1471319 m!1357631))

(declare-fun m!1357643 () Bool)

(assert (=> b!1471319 m!1357643))

(assert (=> b!1471320 m!1357631))

(assert (=> b!1471320 m!1357631))

(declare-fun m!1357645 () Bool)

(assert (=> b!1471320 m!1357645))

(declare-fun m!1357647 () Bool)

(assert (=> b!1471307 m!1357647))

(assert (=> b!1471307 m!1357647))

(declare-fun m!1357649 () Bool)

(assert (=> b!1471307 m!1357649))

(declare-fun m!1357651 () Bool)

(assert (=> b!1471307 m!1357651))

(declare-fun m!1357653 () Bool)

(assert (=> b!1471307 m!1357653))

(declare-fun m!1357655 () Bool)

(assert (=> b!1471304 m!1357655))

(declare-fun m!1357657 () Bool)

(assert (=> b!1471314 m!1357657))

(declare-fun m!1357659 () Bool)

(assert (=> b!1471314 m!1357659))

(declare-fun m!1357661 () Bool)

(assert (=> b!1471312 m!1357661))

(declare-fun m!1357663 () Bool)

(assert (=> b!1471305 m!1357663))

(declare-fun m!1357665 () Bool)

(assert (=> b!1471310 m!1357665))

(declare-fun m!1357667 () Bool)

(assert (=> b!1471310 m!1357667))

(assert (=> b!1471313 m!1357651))

(declare-fun m!1357669 () Bool)

(assert (=> b!1471313 m!1357669))

(assert (=> b!1471311 m!1357631))

(assert (=> b!1471311 m!1357631))

(declare-fun m!1357671 () Bool)

(assert (=> b!1471311 m!1357671))

(assert (=> b!1471311 m!1357671))

(assert (=> b!1471311 m!1357631))

(declare-fun m!1357673 () Bool)

(assert (=> b!1471311 m!1357673))

(check-sat (not b!1471304) (not b!1471314) (not b!1471315) (not b!1471305) (not b!1471310) (not b!1471312) (not b!1471317) (not b!1471319) (not b!1471311) (not b!1471320) (not b!1471307) (not start!125728))
(check-sat)
