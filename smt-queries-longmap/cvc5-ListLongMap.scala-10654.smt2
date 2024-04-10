; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125062 () Bool)

(assert start!125062)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98510 0))(
  ( (array!98511 (arr!47543 (Array (_ BitVec 32) (_ BitVec 64))) (size!48093 (_ BitVec 32))) )
))
(declare-fun lt!638048 () array!98510)

(declare-fun b!1455690 () Bool)

(declare-fun lt!638044 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11795 0))(
  ( (MissingZero!11795 (index!49572 (_ BitVec 32))) (Found!11795 (index!49573 (_ BitVec 32))) (Intermediate!11795 (undefined!12607 Bool) (index!49574 (_ BitVec 32)) (x!131204 (_ BitVec 32))) (Undefined!11795) (MissingVacant!11795 (index!49575 (_ BitVec 32))) )
))
(declare-fun lt!638046 () SeekEntryResult!11795)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!819094 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98510 (_ BitVec 32)) SeekEntryResult!11795)

(assert (=> b!1455690 (= e!819094 (= lt!638046 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638044 lt!638048 mask!2687)))))

(declare-fun b!1455691 () Bool)

(declare-fun res!986323 () Bool)

(declare-fun e!819093 () Bool)

(assert (=> b!1455691 (=> (not res!986323) (not e!819093))))

(declare-fun a!2862 () array!98510)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98510 (_ BitVec 32)) Bool)

(assert (=> b!1455691 (= res!986323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455692 () Bool)

(declare-fun res!986315 () Bool)

(declare-fun e!819098 () Bool)

(assert (=> b!1455692 (=> (not res!986315) (not e!819098))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98510 (_ BitVec 32)) SeekEntryResult!11795)

(assert (=> b!1455692 (= res!986315 (= (seekEntryOrOpen!0 (select (arr!47543 a!2862) j!93) a!2862 mask!2687) (Found!11795 j!93)))))

(declare-fun res!986311 () Bool)

(assert (=> start!125062 (=> (not res!986311) (not e!819093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125062 (= res!986311 (validMask!0 mask!2687))))

(assert (=> start!125062 e!819093))

(assert (=> start!125062 true))

(declare-fun array_inv!36571 (array!98510) Bool)

(assert (=> start!125062 (array_inv!36571 a!2862)))

(declare-fun b!1455693 () Bool)

(declare-fun e!819099 () Bool)

(declare-fun e!819101 () Bool)

(assert (=> b!1455693 (= e!819099 e!819101)))

(declare-fun res!986314 () Bool)

(assert (=> b!1455693 (=> res!986314 e!819101)))

(declare-fun lt!638047 () (_ BitVec 32))

(assert (=> b!1455693 (= res!986314 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638047 #b00000000000000000000000000000000) (bvsge lt!638047 (size!48093 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455693 (= lt!638047 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638042 () SeekEntryResult!11795)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98510 (_ BitVec 32)) SeekEntryResult!11795)

(assert (=> b!1455693 (= lt!638042 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638044 lt!638048 mask!2687))))

(assert (=> b!1455693 (= lt!638042 (seekEntryOrOpen!0 lt!638044 lt!638048 mask!2687))))

(declare-fun b!1455694 () Bool)

(declare-fun res!986313 () Bool)

(declare-fun e!819095 () Bool)

(assert (=> b!1455694 (=> (not res!986313) (not e!819095))))

(declare-fun lt!638049 () SeekEntryResult!11795)

(assert (=> b!1455694 (= res!986313 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47543 a!2862) j!93) a!2862 mask!2687) lt!638049))))

(declare-fun b!1455695 () Bool)

(declare-fun e!819097 () Bool)

(assert (=> b!1455695 (= e!819095 e!819097)))

(declare-fun res!986324 () Bool)

(assert (=> b!1455695 (=> (not res!986324) (not e!819097))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455695 (= res!986324 (= lt!638046 (Intermediate!11795 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455695 (= lt!638046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638044 mask!2687) lt!638044 lt!638048 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455695 (= lt!638044 (select (store (arr!47543 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455696 () Bool)

(assert (=> b!1455696 (= e!819101 true)))

(declare-fun lt!638045 () Bool)

(declare-fun e!819096 () Bool)

(assert (=> b!1455696 (= lt!638045 e!819096)))

(declare-fun c!134202 () Bool)

(assert (=> b!1455696 (= c!134202 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455697 () Bool)

(declare-fun res!986312 () Bool)

(assert (=> b!1455697 (=> res!986312 e!819101)))

(assert (=> b!1455697 (= res!986312 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638047 (select (arr!47543 a!2862) j!93) a!2862 mask!2687) lt!638049)))))

(declare-fun b!1455698 () Bool)

(declare-fun res!986322 () Bool)

(assert (=> b!1455698 (=> (not res!986322) (not e!819097))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455698 (= res!986322 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455699 () Bool)

(declare-fun res!986309 () Bool)

(assert (=> b!1455699 (=> (not res!986309) (not e!819093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455699 (= res!986309 (validKeyInArray!0 (select (arr!47543 a!2862) i!1006)))))

(declare-fun b!1455700 () Bool)

(declare-fun e!819100 () Bool)

(assert (=> b!1455700 (= e!819100 e!819095)))

(declare-fun res!986317 () Bool)

(assert (=> b!1455700 (=> (not res!986317) (not e!819095))))

(assert (=> b!1455700 (= res!986317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47543 a!2862) j!93) mask!2687) (select (arr!47543 a!2862) j!93) a!2862 mask!2687) lt!638049))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1455700 (= lt!638049 (Intermediate!11795 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455701 () Bool)

(declare-fun res!986310 () Bool)

(assert (=> b!1455701 (=> (not res!986310) (not e!819093))))

(declare-datatypes ((List!34044 0))(
  ( (Nil!34041) (Cons!34040 (h!35390 (_ BitVec 64)) (t!48738 List!34044)) )
))
(declare-fun arrayNoDuplicates!0 (array!98510 (_ BitVec 32) List!34044) Bool)

(assert (=> b!1455701 (= res!986310 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34041))))

(declare-fun b!1455702 () Bool)

(assert (=> b!1455702 (= e!819096 (not (= lt!638046 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638047 lt!638044 lt!638048 mask!2687))))))

(declare-fun b!1455703 () Bool)

(assert (=> b!1455703 (= e!819097 (not e!819099))))

(declare-fun res!986320 () Bool)

(assert (=> b!1455703 (=> res!986320 e!819099)))

(assert (=> b!1455703 (= res!986320 (or (and (= (select (arr!47543 a!2862) index!646) (select (store (arr!47543 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47543 a!2862) index!646) (select (arr!47543 a!2862) j!93))) (= (select (arr!47543 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455703 e!819098))

(declare-fun res!986326 () Bool)

(assert (=> b!1455703 (=> (not res!986326) (not e!819098))))

(assert (=> b!1455703 (= res!986326 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49086 0))(
  ( (Unit!49087) )
))
(declare-fun lt!638043 () Unit!49086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49086)

(assert (=> b!1455703 (= lt!638043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455704 () Bool)

(declare-fun res!986316 () Bool)

(assert (=> b!1455704 (=> (not res!986316) (not e!819093))))

(assert (=> b!1455704 (= res!986316 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48093 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48093 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48093 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455705 () Bool)

(assert (=> b!1455705 (= e!819098 (and (or (= (select (arr!47543 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47543 a!2862) intermediateBeforeIndex!19) (select (arr!47543 a!2862) j!93))) (let ((bdg!53179 (select (store (arr!47543 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47543 a!2862) index!646) bdg!53179) (= (select (arr!47543 a!2862) index!646) (select (arr!47543 a!2862) j!93))) (= (select (arr!47543 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53179 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455706 () Bool)

(assert (=> b!1455706 (= e!819093 e!819100)))

(declare-fun res!986325 () Bool)

(assert (=> b!1455706 (=> (not res!986325) (not e!819100))))

(assert (=> b!1455706 (= res!986325 (= (select (store (arr!47543 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455706 (= lt!638048 (array!98511 (store (arr!47543 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48093 a!2862)))))

(declare-fun b!1455707 () Bool)

(declare-fun res!986319 () Bool)

(assert (=> b!1455707 (=> (not res!986319) (not e!819093))))

(assert (=> b!1455707 (= res!986319 (and (= (size!48093 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48093 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48093 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455708 () Bool)

(assert (=> b!1455708 (= e!819094 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638044 lt!638048 mask!2687) (seekEntryOrOpen!0 lt!638044 lt!638048 mask!2687)))))

(declare-fun b!1455709 () Bool)

(assert (=> b!1455709 (= e!819096 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638047 intermediateAfterIndex!19 lt!638044 lt!638048 mask!2687) lt!638042)))))

(declare-fun b!1455710 () Bool)

(declare-fun res!986318 () Bool)

(assert (=> b!1455710 (=> (not res!986318) (not e!819093))))

(assert (=> b!1455710 (= res!986318 (validKeyInArray!0 (select (arr!47543 a!2862) j!93)))))

(declare-fun b!1455711 () Bool)

(declare-fun res!986321 () Bool)

(assert (=> b!1455711 (=> (not res!986321) (not e!819097))))

(assert (=> b!1455711 (= res!986321 e!819094)))

(declare-fun c!134201 () Bool)

(assert (=> b!1455711 (= c!134201 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125062 res!986311) b!1455707))

(assert (= (and b!1455707 res!986319) b!1455699))

(assert (= (and b!1455699 res!986309) b!1455710))

(assert (= (and b!1455710 res!986318) b!1455691))

(assert (= (and b!1455691 res!986323) b!1455701))

(assert (= (and b!1455701 res!986310) b!1455704))

(assert (= (and b!1455704 res!986316) b!1455706))

(assert (= (and b!1455706 res!986325) b!1455700))

(assert (= (and b!1455700 res!986317) b!1455694))

(assert (= (and b!1455694 res!986313) b!1455695))

(assert (= (and b!1455695 res!986324) b!1455711))

(assert (= (and b!1455711 c!134201) b!1455690))

(assert (= (and b!1455711 (not c!134201)) b!1455708))

(assert (= (and b!1455711 res!986321) b!1455698))

(assert (= (and b!1455698 res!986322) b!1455703))

(assert (= (and b!1455703 res!986326) b!1455692))

(assert (= (and b!1455692 res!986315) b!1455705))

(assert (= (and b!1455703 (not res!986320)) b!1455693))

(assert (= (and b!1455693 (not res!986314)) b!1455697))

(assert (= (and b!1455697 (not res!986312)) b!1455696))

(assert (= (and b!1455696 c!134202) b!1455702))

(assert (= (and b!1455696 (not c!134202)) b!1455709))

(declare-fun m!1343881 () Bool)

(assert (=> b!1455691 m!1343881))

(declare-fun m!1343883 () Bool)

(assert (=> b!1455692 m!1343883))

(assert (=> b!1455692 m!1343883))

(declare-fun m!1343885 () Bool)

(assert (=> b!1455692 m!1343885))

(assert (=> b!1455700 m!1343883))

(assert (=> b!1455700 m!1343883))

(declare-fun m!1343887 () Bool)

(assert (=> b!1455700 m!1343887))

(assert (=> b!1455700 m!1343887))

(assert (=> b!1455700 m!1343883))

(declare-fun m!1343889 () Bool)

(assert (=> b!1455700 m!1343889))

(assert (=> b!1455697 m!1343883))

(assert (=> b!1455697 m!1343883))

(declare-fun m!1343891 () Bool)

(assert (=> b!1455697 m!1343891))

(declare-fun m!1343893 () Bool)

(assert (=> b!1455705 m!1343893))

(declare-fun m!1343895 () Bool)

(assert (=> b!1455705 m!1343895))

(declare-fun m!1343897 () Bool)

(assert (=> b!1455705 m!1343897))

(declare-fun m!1343899 () Bool)

(assert (=> b!1455705 m!1343899))

(assert (=> b!1455705 m!1343883))

(assert (=> b!1455694 m!1343883))

(assert (=> b!1455694 m!1343883))

(declare-fun m!1343901 () Bool)

(assert (=> b!1455694 m!1343901))

(declare-fun m!1343903 () Bool)

(assert (=> b!1455695 m!1343903))

(assert (=> b!1455695 m!1343903))

(declare-fun m!1343905 () Bool)

(assert (=> b!1455695 m!1343905))

(assert (=> b!1455695 m!1343893))

(declare-fun m!1343907 () Bool)

(assert (=> b!1455695 m!1343907))

(declare-fun m!1343909 () Bool)

(assert (=> b!1455690 m!1343909))

(assert (=> b!1455710 m!1343883))

(assert (=> b!1455710 m!1343883))

(declare-fun m!1343911 () Bool)

(assert (=> b!1455710 m!1343911))

(declare-fun m!1343913 () Bool)

(assert (=> b!1455693 m!1343913))

(declare-fun m!1343915 () Bool)

(assert (=> b!1455693 m!1343915))

(declare-fun m!1343917 () Bool)

(assert (=> b!1455693 m!1343917))

(declare-fun m!1343919 () Bool)

(assert (=> b!1455699 m!1343919))

(assert (=> b!1455699 m!1343919))

(declare-fun m!1343921 () Bool)

(assert (=> b!1455699 m!1343921))

(declare-fun m!1343923 () Bool)

(assert (=> b!1455709 m!1343923))

(declare-fun m!1343925 () Bool)

(assert (=> b!1455702 m!1343925))

(declare-fun m!1343927 () Bool)

(assert (=> b!1455703 m!1343927))

(assert (=> b!1455703 m!1343893))

(assert (=> b!1455703 m!1343897))

(assert (=> b!1455703 m!1343899))

(declare-fun m!1343929 () Bool)

(assert (=> b!1455703 m!1343929))

(assert (=> b!1455703 m!1343883))

(declare-fun m!1343931 () Bool)

(assert (=> start!125062 m!1343931))

(declare-fun m!1343933 () Bool)

(assert (=> start!125062 m!1343933))

(assert (=> b!1455708 m!1343915))

(assert (=> b!1455708 m!1343917))

(declare-fun m!1343935 () Bool)

(assert (=> b!1455701 m!1343935))

(assert (=> b!1455706 m!1343893))

(declare-fun m!1343937 () Bool)

(assert (=> b!1455706 m!1343937))

(push 1)

