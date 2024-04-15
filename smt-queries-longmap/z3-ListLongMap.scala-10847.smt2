; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126878 () Bool)

(assert start!126878)

(declare-fun b!1491499 () Bool)

(declare-fun e!835590 () Bool)

(assert (=> b!1491499 (= e!835590 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650116 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491499 (= lt!650116 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491500 () Bool)

(declare-fun res!1014853 () Bool)

(declare-fun e!835595 () Bool)

(assert (=> b!1491500 (=> (not res!1014853) (not e!835595))))

(declare-datatypes ((array!99649 0))(
  ( (array!99650 (arr!48097 (Array (_ BitVec 32) (_ BitVec 64))) (size!48649 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99649)

(declare-datatypes ((List!34676 0))(
  ( (Nil!34673) (Cons!34672 (h!36055 (_ BitVec 64)) (t!49362 List!34676)) )
))
(declare-fun arrayNoDuplicates!0 (array!99649 (_ BitVec 32) List!34676) Bool)

(assert (=> b!1491500 (= res!1014853 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34673))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1491501 () Bool)

(declare-fun e!835588 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1491501 (= e!835588 (or (= (select (arr!48097 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48097 a!2862) intermediateBeforeIndex!19) (select (arr!48097 a!2862) j!93))))))

(declare-fun b!1491502 () Bool)

(declare-fun res!1014845 () Bool)

(declare-fun e!835594 () Bool)

(assert (=> b!1491502 (=> (not res!1014845) (not e!835594))))

(declare-fun e!835593 () Bool)

(assert (=> b!1491502 (= res!1014845 e!835593)))

(declare-fun c!137857 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491502 (= c!137857 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491503 () Bool)

(declare-fun res!1014844 () Bool)

(assert (=> b!1491503 (=> (not res!1014844) (not e!835595))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491503 (= res!1014844 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48649 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48649 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48649 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491504 () Bool)

(declare-fun e!835592 () Bool)

(assert (=> b!1491504 (= e!835592 e!835594)))

(declare-fun res!1014849 () Bool)

(assert (=> b!1491504 (=> (not res!1014849) (not e!835594))))

(declare-datatypes ((SeekEntryResult!12362 0))(
  ( (MissingZero!12362 (index!51840 (_ BitVec 32))) (Found!12362 (index!51841 (_ BitVec 32))) (Intermediate!12362 (undefined!13174 Bool) (index!51842 (_ BitVec 32)) (x!133419 (_ BitVec 32))) (Undefined!12362) (MissingVacant!12362 (index!51843 (_ BitVec 32))) )
))
(declare-fun lt!650115 () SeekEntryResult!12362)

(assert (=> b!1491504 (= res!1014849 (= lt!650115 (Intermediate!12362 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650119 () (_ BitVec 64))

(declare-fun lt!650120 () array!99649)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99649 (_ BitVec 32)) SeekEntryResult!12362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491504 (= lt!650115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650119 mask!2687) lt!650119 lt!650120 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491504 (= lt!650119 (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491505 () Bool)

(assert (=> b!1491505 (= e!835594 (not e!835590))))

(declare-fun res!1014848 () Bool)

(assert (=> b!1491505 (=> res!1014848 e!835590)))

(assert (=> b!1491505 (= res!1014848 (or (and (= (select (arr!48097 a!2862) index!646) (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48097 a!2862) index!646) (select (arr!48097 a!2862) j!93))) (= (select (arr!48097 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491505 e!835588))

(declare-fun res!1014859 () Bool)

(assert (=> b!1491505 (=> (not res!1014859) (not e!835588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99649 (_ BitVec 32)) Bool)

(assert (=> b!1491505 (= res!1014859 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49905 0))(
  ( (Unit!49906) )
))
(declare-fun lt!650118 () Unit!49905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49905)

(assert (=> b!1491505 (= lt!650118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491507 () Bool)

(declare-fun e!835589 () Bool)

(assert (=> b!1491507 (= e!835589 e!835592)))

(declare-fun res!1014855 () Bool)

(assert (=> b!1491507 (=> (not res!1014855) (not e!835592))))

(declare-fun lt!650117 () SeekEntryResult!12362)

(assert (=> b!1491507 (= res!1014855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48097 a!2862) j!93) mask!2687) (select (arr!48097 a!2862) j!93) a!2862 mask!2687) lt!650117))))

(assert (=> b!1491507 (= lt!650117 (Intermediate!12362 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491508 () Bool)

(declare-fun res!1014851 () Bool)

(assert (=> b!1491508 (=> (not res!1014851) (not e!835592))))

(assert (=> b!1491508 (= res!1014851 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48097 a!2862) j!93) a!2862 mask!2687) lt!650117))))

(declare-fun b!1491509 () Bool)

(assert (=> b!1491509 (= e!835593 (= lt!650115 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650119 lt!650120 mask!2687)))))

(declare-fun b!1491510 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99649 (_ BitVec 32)) SeekEntryResult!12362)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99649 (_ BitVec 32)) SeekEntryResult!12362)

(assert (=> b!1491510 (= e!835593 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650119 lt!650120 mask!2687) (seekEntryOrOpen!0 lt!650119 lt!650120 mask!2687)))))

(declare-fun b!1491511 () Bool)

(declare-fun res!1014856 () Bool)

(assert (=> b!1491511 (=> (not res!1014856) (not e!835595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491511 (= res!1014856 (validKeyInArray!0 (select (arr!48097 a!2862) j!93)))))

(declare-fun b!1491512 () Bool)

(declare-fun res!1014847 () Bool)

(assert (=> b!1491512 (=> (not res!1014847) (not e!835595))))

(assert (=> b!1491512 (= res!1014847 (validKeyInArray!0 (select (arr!48097 a!2862) i!1006)))))

(declare-fun b!1491513 () Bool)

(declare-fun res!1014846 () Bool)

(assert (=> b!1491513 (=> (not res!1014846) (not e!835588))))

(assert (=> b!1491513 (= res!1014846 (= (seekEntryOrOpen!0 (select (arr!48097 a!2862) j!93) a!2862 mask!2687) (Found!12362 j!93)))))

(declare-fun b!1491514 () Bool)

(declare-fun res!1014850 () Bool)

(assert (=> b!1491514 (=> (not res!1014850) (not e!835595))))

(assert (=> b!1491514 (= res!1014850 (and (= (size!48649 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48649 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48649 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491515 () Bool)

(declare-fun res!1014852 () Bool)

(assert (=> b!1491515 (=> (not res!1014852) (not e!835594))))

(assert (=> b!1491515 (= res!1014852 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491516 () Bool)

(assert (=> b!1491516 (= e!835595 e!835589)))

(declare-fun res!1014858 () Bool)

(assert (=> b!1491516 (=> (not res!1014858) (not e!835589))))

(assert (=> b!1491516 (= res!1014858 (= (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491516 (= lt!650120 (array!99650 (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48649 a!2862)))))

(declare-fun res!1014857 () Bool)

(assert (=> start!126878 (=> (not res!1014857) (not e!835595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126878 (= res!1014857 (validMask!0 mask!2687))))

(assert (=> start!126878 e!835595))

(assert (=> start!126878 true))

(declare-fun array_inv!37330 (array!99649) Bool)

(assert (=> start!126878 (array_inv!37330 a!2862)))

(declare-fun b!1491506 () Bool)

(declare-fun res!1014854 () Bool)

(assert (=> b!1491506 (=> (not res!1014854) (not e!835595))))

(assert (=> b!1491506 (= res!1014854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126878 res!1014857) b!1491514))

(assert (= (and b!1491514 res!1014850) b!1491512))

(assert (= (and b!1491512 res!1014847) b!1491511))

(assert (= (and b!1491511 res!1014856) b!1491506))

(assert (= (and b!1491506 res!1014854) b!1491500))

(assert (= (and b!1491500 res!1014853) b!1491503))

(assert (= (and b!1491503 res!1014844) b!1491516))

(assert (= (and b!1491516 res!1014858) b!1491507))

(assert (= (and b!1491507 res!1014855) b!1491508))

(assert (= (and b!1491508 res!1014851) b!1491504))

(assert (= (and b!1491504 res!1014849) b!1491502))

(assert (= (and b!1491502 c!137857) b!1491509))

(assert (= (and b!1491502 (not c!137857)) b!1491510))

(assert (= (and b!1491502 res!1014845) b!1491515))

(assert (= (and b!1491515 res!1014852) b!1491505))

(assert (= (and b!1491505 res!1014859) b!1491513))

(assert (= (and b!1491513 res!1014846) b!1491501))

(assert (= (and b!1491505 (not res!1014848)) b!1491499))

(declare-fun m!1375071 () Bool)

(assert (=> start!126878 m!1375071))

(declare-fun m!1375073 () Bool)

(assert (=> start!126878 m!1375073))

(declare-fun m!1375075 () Bool)

(assert (=> b!1491507 m!1375075))

(assert (=> b!1491507 m!1375075))

(declare-fun m!1375077 () Bool)

(assert (=> b!1491507 m!1375077))

(assert (=> b!1491507 m!1375077))

(assert (=> b!1491507 m!1375075))

(declare-fun m!1375079 () Bool)

(assert (=> b!1491507 m!1375079))

(declare-fun m!1375081 () Bool)

(assert (=> b!1491504 m!1375081))

(assert (=> b!1491504 m!1375081))

(declare-fun m!1375083 () Bool)

(assert (=> b!1491504 m!1375083))

(declare-fun m!1375085 () Bool)

(assert (=> b!1491504 m!1375085))

(declare-fun m!1375087 () Bool)

(assert (=> b!1491504 m!1375087))

(declare-fun m!1375089 () Bool)

(assert (=> b!1491509 m!1375089))

(declare-fun m!1375091 () Bool)

(assert (=> b!1491505 m!1375091))

(assert (=> b!1491505 m!1375085))

(declare-fun m!1375093 () Bool)

(assert (=> b!1491505 m!1375093))

(declare-fun m!1375095 () Bool)

(assert (=> b!1491505 m!1375095))

(declare-fun m!1375097 () Bool)

(assert (=> b!1491505 m!1375097))

(assert (=> b!1491505 m!1375075))

(assert (=> b!1491508 m!1375075))

(assert (=> b!1491508 m!1375075))

(declare-fun m!1375099 () Bool)

(assert (=> b!1491508 m!1375099))

(declare-fun m!1375101 () Bool)

(assert (=> b!1491512 m!1375101))

(assert (=> b!1491512 m!1375101))

(declare-fun m!1375103 () Bool)

(assert (=> b!1491512 m!1375103))

(declare-fun m!1375105 () Bool)

(assert (=> b!1491510 m!1375105))

(declare-fun m!1375107 () Bool)

(assert (=> b!1491510 m!1375107))

(declare-fun m!1375109 () Bool)

(assert (=> b!1491500 m!1375109))

(declare-fun m!1375111 () Bool)

(assert (=> b!1491501 m!1375111))

(assert (=> b!1491501 m!1375075))

(assert (=> b!1491513 m!1375075))

(assert (=> b!1491513 m!1375075))

(declare-fun m!1375113 () Bool)

(assert (=> b!1491513 m!1375113))

(declare-fun m!1375115 () Bool)

(assert (=> b!1491499 m!1375115))

(assert (=> b!1491516 m!1375085))

(declare-fun m!1375117 () Bool)

(assert (=> b!1491516 m!1375117))

(assert (=> b!1491511 m!1375075))

(assert (=> b!1491511 m!1375075))

(declare-fun m!1375119 () Bool)

(assert (=> b!1491511 m!1375119))

(declare-fun m!1375121 () Bool)

(assert (=> b!1491506 m!1375121))

(check-sat (not b!1491513) (not b!1491506) (not b!1491511) (not start!126878) (not b!1491512) (not b!1491509) (not b!1491504) (not b!1491507) (not b!1491510) (not b!1491508) (not b!1491499) (not b!1491500) (not b!1491505))
(check-sat)
