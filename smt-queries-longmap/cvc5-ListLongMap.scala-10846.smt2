; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126922 () Bool)

(assert start!126922)

(declare-fun b!1491706 () Bool)

(declare-fun res!1014851 () Bool)

(declare-fun e!835748 () Bool)

(assert (=> b!1491706 (=> (not res!1014851) (not e!835748))))

(declare-datatypes ((array!99695 0))(
  ( (array!99696 (arr!48119 (Array (_ BitVec 32) (_ BitVec 64))) (size!48669 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99695)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12359 0))(
  ( (MissingZero!12359 (index!51828 (_ BitVec 32))) (Found!12359 (index!51829 (_ BitVec 32))) (Intermediate!12359 (undefined!13171 Bool) (index!51830 (_ BitVec 32)) (x!133415 (_ BitVec 32))) (Undefined!12359) (MissingVacant!12359 (index!51831 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99695 (_ BitVec 32)) SeekEntryResult!12359)

(assert (=> b!1491706 (= res!1014851 (= (seekEntryOrOpen!0 (select (arr!48119 a!2862) j!93) a!2862 mask!2687) (Found!12359 j!93)))))

(declare-fun b!1491707 () Bool)

(declare-fun e!835749 () Bool)

(assert (=> b!1491707 (= e!835749 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650368 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491707 (= lt!650368 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491708 () Bool)

(declare-fun res!1014849 () Bool)

(declare-fun e!835744 () Bool)

(assert (=> b!1491708 (=> (not res!1014849) (not e!835744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491708 (= res!1014849 (validKeyInArray!0 (select (arr!48119 a!2862) j!93)))))

(declare-fun b!1491709 () Bool)

(declare-fun e!835750 () Bool)

(assert (=> b!1491709 (= e!835750 (not e!835749))))

(declare-fun res!1014853 () Bool)

(assert (=> b!1491709 (=> res!1014853 e!835749)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491709 (= res!1014853 (or (and (= (select (arr!48119 a!2862) index!646) (select (store (arr!48119 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48119 a!2862) index!646) (select (arr!48119 a!2862) j!93))) (= (select (arr!48119 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491709 e!835748))

(declare-fun res!1014858 () Bool)

(assert (=> b!1491709 (=> (not res!1014858) (not e!835748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99695 (_ BitVec 32)) Bool)

(assert (=> b!1491709 (= res!1014858 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50058 0))(
  ( (Unit!50059) )
))
(declare-fun lt!650367 () Unit!50058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50058)

(assert (=> b!1491709 (= lt!650367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491710 () Bool)

(declare-fun res!1014846 () Bool)

(assert (=> b!1491710 (=> (not res!1014846) (not e!835744))))

(declare-datatypes ((List!34620 0))(
  ( (Nil!34617) (Cons!34616 (h!35999 (_ BitVec 64)) (t!49314 List!34620)) )
))
(declare-fun arrayNoDuplicates!0 (array!99695 (_ BitVec 32) List!34620) Bool)

(assert (=> b!1491710 (= res!1014846 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34617))))

(declare-fun b!1491711 () Bool)

(declare-fun res!1014857 () Bool)

(assert (=> b!1491711 (=> (not res!1014857) (not e!835744))))

(assert (=> b!1491711 (= res!1014857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491712 () Bool)

(declare-fun res!1014847 () Bool)

(assert (=> b!1491712 (=> (not res!1014847) (not e!835744))))

(assert (=> b!1491712 (= res!1014847 (and (= (size!48669 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48669 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48669 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491713 () Bool)

(declare-fun e!835746 () Bool)

(assert (=> b!1491713 (= e!835744 e!835746)))

(declare-fun res!1014845 () Bool)

(assert (=> b!1491713 (=> (not res!1014845) (not e!835746))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491713 (= res!1014845 (= (select (store (arr!48119 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650366 () array!99695)

(assert (=> b!1491713 (= lt!650366 (array!99696 (store (arr!48119 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48669 a!2862)))))

(declare-fun e!835745 () Bool)

(declare-fun b!1491714 () Bool)

(declare-fun lt!650370 () (_ BitVec 64))

(declare-fun lt!650365 () SeekEntryResult!12359)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99695 (_ BitVec 32)) SeekEntryResult!12359)

(assert (=> b!1491714 (= e!835745 (= lt!650365 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650370 lt!650366 mask!2687)))))

(declare-fun b!1491715 () Bool)

(declare-fun res!1014850 () Bool)

(declare-fun e!835751 () Bool)

(assert (=> b!1491715 (=> (not res!1014850) (not e!835751))))

(declare-fun lt!650369 () SeekEntryResult!12359)

(assert (=> b!1491715 (= res!1014850 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48119 a!2862) j!93) a!2862 mask!2687) lt!650369))))

(declare-fun b!1491716 () Bool)

(declare-fun res!1014848 () Bool)

(assert (=> b!1491716 (=> (not res!1014848) (not e!835750))))

(assert (=> b!1491716 (= res!1014848 e!835745)))

(declare-fun c!137958 () Bool)

(assert (=> b!1491716 (= c!137958 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491717 () Bool)

(declare-fun res!1014854 () Bool)

(assert (=> b!1491717 (=> (not res!1014854) (not e!835744))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491717 (= res!1014854 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48669 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48669 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48669 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491718 () Bool)

(assert (=> b!1491718 (= e!835751 e!835750)))

(declare-fun res!1014852 () Bool)

(assert (=> b!1491718 (=> (not res!1014852) (not e!835750))))

(assert (=> b!1491718 (= res!1014852 (= lt!650365 (Intermediate!12359 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491718 (= lt!650365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650370 mask!2687) lt!650370 lt!650366 mask!2687))))

(assert (=> b!1491718 (= lt!650370 (select (store (arr!48119 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491719 () Bool)

(assert (=> b!1491719 (= e!835746 e!835751)))

(declare-fun res!1014856 () Bool)

(assert (=> b!1491719 (=> (not res!1014856) (not e!835751))))

(assert (=> b!1491719 (= res!1014856 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48119 a!2862) j!93) mask!2687) (select (arr!48119 a!2862) j!93) a!2862 mask!2687) lt!650369))))

(assert (=> b!1491719 (= lt!650369 (Intermediate!12359 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1014855 () Bool)

(assert (=> start!126922 (=> (not res!1014855) (not e!835744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126922 (= res!1014855 (validMask!0 mask!2687))))

(assert (=> start!126922 e!835744))

(assert (=> start!126922 true))

(declare-fun array_inv!37147 (array!99695) Bool)

(assert (=> start!126922 (array_inv!37147 a!2862)))

(declare-fun b!1491720 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99695 (_ BitVec 32)) SeekEntryResult!12359)

(assert (=> b!1491720 (= e!835745 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650370 lt!650366 mask!2687) (seekEntryOrOpen!0 lt!650370 lt!650366 mask!2687)))))

(declare-fun b!1491721 () Bool)

(assert (=> b!1491721 (= e!835748 (or (= (select (arr!48119 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48119 a!2862) intermediateBeforeIndex!19) (select (arr!48119 a!2862) j!93))))))

(declare-fun b!1491722 () Bool)

(declare-fun res!1014844 () Bool)

(assert (=> b!1491722 (=> (not res!1014844) (not e!835744))))

(assert (=> b!1491722 (= res!1014844 (validKeyInArray!0 (select (arr!48119 a!2862) i!1006)))))

(declare-fun b!1491723 () Bool)

(declare-fun res!1014859 () Bool)

(assert (=> b!1491723 (=> (not res!1014859) (not e!835750))))

(assert (=> b!1491723 (= res!1014859 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126922 res!1014855) b!1491712))

(assert (= (and b!1491712 res!1014847) b!1491722))

(assert (= (and b!1491722 res!1014844) b!1491708))

(assert (= (and b!1491708 res!1014849) b!1491711))

(assert (= (and b!1491711 res!1014857) b!1491710))

(assert (= (and b!1491710 res!1014846) b!1491717))

(assert (= (and b!1491717 res!1014854) b!1491713))

(assert (= (and b!1491713 res!1014845) b!1491719))

(assert (= (and b!1491719 res!1014856) b!1491715))

(assert (= (and b!1491715 res!1014850) b!1491718))

(assert (= (and b!1491718 res!1014852) b!1491716))

(assert (= (and b!1491716 c!137958) b!1491714))

(assert (= (and b!1491716 (not c!137958)) b!1491720))

(assert (= (and b!1491716 res!1014848) b!1491723))

(assert (= (and b!1491723 res!1014859) b!1491709))

(assert (= (and b!1491709 res!1014858) b!1491706))

(assert (= (and b!1491706 res!1014851) b!1491721))

(assert (= (and b!1491709 (not res!1014853)) b!1491707))

(declare-fun m!1375819 () Bool)

(assert (=> b!1491710 m!1375819))

(declare-fun m!1375821 () Bool)

(assert (=> b!1491706 m!1375821))

(assert (=> b!1491706 m!1375821))

(declare-fun m!1375823 () Bool)

(assert (=> b!1491706 m!1375823))

(declare-fun m!1375825 () Bool)

(assert (=> b!1491722 m!1375825))

(assert (=> b!1491722 m!1375825))

(declare-fun m!1375827 () Bool)

(assert (=> b!1491722 m!1375827))

(declare-fun m!1375829 () Bool)

(assert (=> b!1491707 m!1375829))

(declare-fun m!1375831 () Bool)

(assert (=> start!126922 m!1375831))

(declare-fun m!1375833 () Bool)

(assert (=> start!126922 m!1375833))

(assert (=> b!1491719 m!1375821))

(assert (=> b!1491719 m!1375821))

(declare-fun m!1375835 () Bool)

(assert (=> b!1491719 m!1375835))

(assert (=> b!1491719 m!1375835))

(assert (=> b!1491719 m!1375821))

(declare-fun m!1375837 () Bool)

(assert (=> b!1491719 m!1375837))

(declare-fun m!1375839 () Bool)

(assert (=> b!1491713 m!1375839))

(declare-fun m!1375841 () Bool)

(assert (=> b!1491713 m!1375841))

(declare-fun m!1375843 () Bool)

(assert (=> b!1491709 m!1375843))

(assert (=> b!1491709 m!1375839))

(declare-fun m!1375845 () Bool)

(assert (=> b!1491709 m!1375845))

(declare-fun m!1375847 () Bool)

(assert (=> b!1491709 m!1375847))

(declare-fun m!1375849 () Bool)

(assert (=> b!1491709 m!1375849))

(assert (=> b!1491709 m!1375821))

(assert (=> b!1491708 m!1375821))

(assert (=> b!1491708 m!1375821))

(declare-fun m!1375851 () Bool)

(assert (=> b!1491708 m!1375851))

(assert (=> b!1491715 m!1375821))

(assert (=> b!1491715 m!1375821))

(declare-fun m!1375853 () Bool)

(assert (=> b!1491715 m!1375853))

(declare-fun m!1375855 () Bool)

(assert (=> b!1491720 m!1375855))

(declare-fun m!1375857 () Bool)

(assert (=> b!1491720 m!1375857))

(declare-fun m!1375859 () Bool)

(assert (=> b!1491718 m!1375859))

(assert (=> b!1491718 m!1375859))

(declare-fun m!1375861 () Bool)

(assert (=> b!1491718 m!1375861))

(assert (=> b!1491718 m!1375839))

(declare-fun m!1375863 () Bool)

(assert (=> b!1491718 m!1375863))

(declare-fun m!1375865 () Bool)

(assert (=> b!1491711 m!1375865))

(declare-fun m!1375867 () Bool)

(assert (=> b!1491721 m!1375867))

(assert (=> b!1491721 m!1375821))

(declare-fun m!1375869 () Bool)

(assert (=> b!1491714 m!1375869))

(push 1)

