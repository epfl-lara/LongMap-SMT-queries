; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125886 () Bool)

(assert start!125886)

(declare-fun b!1473619 () Bool)

(declare-fun e!826922 () Bool)

(declare-fun e!826916 () Bool)

(assert (=> b!1473619 (= e!826922 (not e!826916))))

(declare-fun res!1000926 () Bool)

(assert (=> b!1473619 (=> res!1000926 e!826916)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99163 0))(
  ( (array!99164 (arr!47865 (Array (_ BitVec 32) (_ BitVec 64))) (size!48415 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99163)

(assert (=> b!1473619 (= res!1000926 (or (not (= (select (arr!47865 a!2862) index!646) (select (store (arr!47865 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47865 a!2862) index!646) (select (arr!47865 a!2862) j!93)))))))

(declare-fun e!826920 () Bool)

(assert (=> b!1473619 e!826920))

(declare-fun res!1000920 () Bool)

(assert (=> b!1473619 (=> (not res!1000920) (not e!826920))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99163 (_ BitVec 32)) Bool)

(assert (=> b!1473619 (= res!1000920 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49550 0))(
  ( (Unit!49551) )
))
(declare-fun lt!643992 () Unit!49550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49550)

(assert (=> b!1473619 (= lt!643992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473620 () Bool)

(declare-fun res!1000929 () Bool)

(assert (=> b!1473620 (=> (not res!1000929) (not e!826920))))

(declare-datatypes ((SeekEntryResult!12105 0))(
  ( (MissingZero!12105 (index!50812 (_ BitVec 32))) (Found!12105 (index!50813 (_ BitVec 32))) (Intermediate!12105 (undefined!12917 Bool) (index!50814 (_ BitVec 32)) (x!132397 (_ BitVec 32))) (Undefined!12105) (MissingVacant!12105 (index!50815 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99163 (_ BitVec 32)) SeekEntryResult!12105)

(assert (=> b!1473620 (= res!1000929 (= (seekEntryOrOpen!0 (select (arr!47865 a!2862) j!93) a!2862 mask!2687) (Found!12105 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643988 () array!99163)

(declare-fun lt!643990 () (_ BitVec 64))

(declare-fun e!826918 () Bool)

(declare-fun b!1473621 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99163 (_ BitVec 32)) SeekEntryResult!12105)

(assert (=> b!1473621 (= e!826918 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643990 lt!643988 mask!2687) (seekEntryOrOpen!0 lt!643990 lt!643988 mask!2687)))))

(declare-fun b!1473622 () Bool)

(declare-fun res!1000927 () Bool)

(declare-fun e!826921 () Bool)

(assert (=> b!1473622 (=> (not res!1000927) (not e!826921))))

(assert (=> b!1473622 (= res!1000927 (and (= (size!48415 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48415 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48415 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473623 () Bool)

(declare-fun e!826917 () Bool)

(assert (=> b!1473623 (= e!826921 e!826917)))

(declare-fun res!1000923 () Bool)

(assert (=> b!1473623 (=> (not res!1000923) (not e!826917))))

(assert (=> b!1473623 (= res!1000923 (= (select (store (arr!47865 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473623 (= lt!643988 (array!99164 (store (arr!47865 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48415 a!2862)))))

(declare-fun b!1473624 () Bool)

(declare-fun res!1000915 () Bool)

(assert (=> b!1473624 (=> (not res!1000915) (not e!826921))))

(assert (=> b!1473624 (= res!1000915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473625 () Bool)

(declare-fun res!1000924 () Bool)

(assert (=> b!1473625 (=> (not res!1000924) (not e!826922))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473625 (= res!1000924 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473626 () Bool)

(declare-fun e!826915 () Bool)

(assert (=> b!1473626 (= e!826915 e!826922)))

(declare-fun res!1000919 () Bool)

(assert (=> b!1473626 (=> (not res!1000919) (not e!826922))))

(declare-fun lt!643989 () SeekEntryResult!12105)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473626 (= res!1000919 (= lt!643989 (Intermediate!12105 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99163 (_ BitVec 32)) SeekEntryResult!12105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473626 (= lt!643989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643990 mask!2687) lt!643990 lt!643988 mask!2687))))

(assert (=> b!1473626 (= lt!643990 (select (store (arr!47865 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473627 () Bool)

(declare-fun res!1000925 () Bool)

(assert (=> b!1473627 (=> (not res!1000925) (not e!826915))))

(declare-fun lt!643991 () SeekEntryResult!12105)

(assert (=> b!1473627 (= res!1000925 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47865 a!2862) j!93) a!2862 mask!2687) lt!643991))))

(declare-fun b!1473628 () Bool)

(assert (=> b!1473628 (= e!826917 e!826915)))

(declare-fun res!1000930 () Bool)

(assert (=> b!1473628 (=> (not res!1000930) (not e!826915))))

(assert (=> b!1473628 (= res!1000930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47865 a!2862) j!93) mask!2687) (select (arr!47865 a!2862) j!93) a!2862 mask!2687) lt!643991))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1473628 (= lt!643991 (Intermediate!12105 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473629 () Bool)

(assert (=> b!1473629 (= e!826916 true)))

(declare-fun lt!643987 () SeekEntryResult!12105)

(assert (=> b!1473629 (= lt!643987 (seekEntryOrOpen!0 lt!643990 lt!643988 mask!2687))))

(declare-fun b!1473630 () Bool)

(assert (=> b!1473630 (= e!826918 (= lt!643989 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643990 lt!643988 mask!2687)))))

(declare-fun res!1000928 () Bool)

(assert (=> start!125886 (=> (not res!1000928) (not e!826921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125886 (= res!1000928 (validMask!0 mask!2687))))

(assert (=> start!125886 e!826921))

(assert (=> start!125886 true))

(declare-fun array_inv!36893 (array!99163) Bool)

(assert (=> start!125886 (array_inv!36893 a!2862)))

(declare-fun b!1473631 () Bool)

(declare-fun res!1000917 () Bool)

(assert (=> b!1473631 (=> (not res!1000917) (not e!826921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473631 (= res!1000917 (validKeyInArray!0 (select (arr!47865 a!2862) j!93)))))

(declare-fun b!1473632 () Bool)

(declare-fun res!1000921 () Bool)

(assert (=> b!1473632 (=> (not res!1000921) (not e!826921))))

(assert (=> b!1473632 (= res!1000921 (validKeyInArray!0 (select (arr!47865 a!2862) i!1006)))))

(declare-fun b!1473633 () Bool)

(declare-fun res!1000916 () Bool)

(assert (=> b!1473633 (=> (not res!1000916) (not e!826921))))

(assert (=> b!1473633 (= res!1000916 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48415 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48415 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48415 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473634 () Bool)

(declare-fun res!1000918 () Bool)

(assert (=> b!1473634 (=> (not res!1000918) (not e!826921))))

(declare-datatypes ((List!34366 0))(
  ( (Nil!34363) (Cons!34362 (h!35721 (_ BitVec 64)) (t!49060 List!34366)) )
))
(declare-fun arrayNoDuplicates!0 (array!99163 (_ BitVec 32) List!34366) Bool)

(assert (=> b!1473634 (= res!1000918 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34363))))

(declare-fun b!1473635 () Bool)

(assert (=> b!1473635 (= e!826920 (or (= (select (arr!47865 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47865 a!2862) intermediateBeforeIndex!19) (select (arr!47865 a!2862) j!93))))))

(declare-fun b!1473636 () Bool)

(declare-fun res!1000922 () Bool)

(assert (=> b!1473636 (=> (not res!1000922) (not e!826922))))

(assert (=> b!1473636 (= res!1000922 e!826918)))

(declare-fun c!135867 () Bool)

(assert (=> b!1473636 (= c!135867 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125886 res!1000928) b!1473622))

(assert (= (and b!1473622 res!1000927) b!1473632))

(assert (= (and b!1473632 res!1000921) b!1473631))

(assert (= (and b!1473631 res!1000917) b!1473624))

(assert (= (and b!1473624 res!1000915) b!1473634))

(assert (= (and b!1473634 res!1000918) b!1473633))

(assert (= (and b!1473633 res!1000916) b!1473623))

(assert (= (and b!1473623 res!1000923) b!1473628))

(assert (= (and b!1473628 res!1000930) b!1473627))

(assert (= (and b!1473627 res!1000925) b!1473626))

(assert (= (and b!1473626 res!1000919) b!1473636))

(assert (= (and b!1473636 c!135867) b!1473630))

(assert (= (and b!1473636 (not c!135867)) b!1473621))

(assert (= (and b!1473636 res!1000922) b!1473625))

(assert (= (and b!1473625 res!1000924) b!1473619))

(assert (= (and b!1473619 res!1000920) b!1473620))

(assert (= (and b!1473620 res!1000929) b!1473635))

(assert (= (and b!1473619 (not res!1000926)) b!1473629))

(declare-fun m!1360131 () Bool)

(assert (=> b!1473629 m!1360131))

(declare-fun m!1360133 () Bool)

(assert (=> b!1473628 m!1360133))

(assert (=> b!1473628 m!1360133))

(declare-fun m!1360135 () Bool)

(assert (=> b!1473628 m!1360135))

(assert (=> b!1473628 m!1360135))

(assert (=> b!1473628 m!1360133))

(declare-fun m!1360137 () Bool)

(assert (=> b!1473628 m!1360137))

(declare-fun m!1360139 () Bool)

(assert (=> b!1473619 m!1360139))

(declare-fun m!1360141 () Bool)

(assert (=> b!1473619 m!1360141))

(declare-fun m!1360143 () Bool)

(assert (=> b!1473619 m!1360143))

(declare-fun m!1360145 () Bool)

(assert (=> b!1473619 m!1360145))

(declare-fun m!1360147 () Bool)

(assert (=> b!1473619 m!1360147))

(assert (=> b!1473619 m!1360133))

(assert (=> b!1473623 m!1360141))

(declare-fun m!1360149 () Bool)

(assert (=> b!1473623 m!1360149))

(declare-fun m!1360151 () Bool)

(assert (=> b!1473634 m!1360151))

(assert (=> b!1473631 m!1360133))

(assert (=> b!1473631 m!1360133))

(declare-fun m!1360153 () Bool)

(assert (=> b!1473631 m!1360153))

(declare-fun m!1360155 () Bool)

(assert (=> b!1473635 m!1360155))

(assert (=> b!1473635 m!1360133))

(declare-fun m!1360157 () Bool)

(assert (=> b!1473630 m!1360157))

(assert (=> b!1473627 m!1360133))

(assert (=> b!1473627 m!1360133))

(declare-fun m!1360159 () Bool)

(assert (=> b!1473627 m!1360159))

(declare-fun m!1360161 () Bool)

(assert (=> start!125886 m!1360161))

(declare-fun m!1360163 () Bool)

(assert (=> start!125886 m!1360163))

(declare-fun m!1360165 () Bool)

(assert (=> b!1473624 m!1360165))

(declare-fun m!1360167 () Bool)

(assert (=> b!1473621 m!1360167))

(assert (=> b!1473621 m!1360131))

(assert (=> b!1473620 m!1360133))

(assert (=> b!1473620 m!1360133))

(declare-fun m!1360169 () Bool)

(assert (=> b!1473620 m!1360169))

(declare-fun m!1360171 () Bool)

(assert (=> b!1473626 m!1360171))

(assert (=> b!1473626 m!1360171))

(declare-fun m!1360173 () Bool)

(assert (=> b!1473626 m!1360173))

(assert (=> b!1473626 m!1360141))

(declare-fun m!1360175 () Bool)

(assert (=> b!1473626 m!1360175))

(declare-fun m!1360177 () Bool)

(assert (=> b!1473632 m!1360177))

(assert (=> b!1473632 m!1360177))

(declare-fun m!1360179 () Bool)

(assert (=> b!1473632 m!1360179))

(check-sat (not b!1473627) (not b!1473626) (not b!1473628) (not b!1473629) (not b!1473624) (not b!1473631) (not b!1473634) (not b!1473620) (not start!125886) (not b!1473619) (not b!1473632) (not b!1473621) (not b!1473630))
(check-sat)
