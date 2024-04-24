; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125532 () Bool)

(assert start!125532)

(declare-fun b!1463564 () Bool)

(declare-fun res!992017 () Bool)

(declare-fun e!822865 () Bool)

(assert (=> b!1463564 (=> (not res!992017) (not e!822865))))

(declare-fun e!822870 () Bool)

(assert (=> b!1463564 (= res!992017 e!822870)))

(declare-fun c!135301 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463564 (= c!135301 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463565 () Bool)

(declare-fun res!992004 () Bool)

(declare-fun e!822869 () Bool)

(assert (=> b!1463565 (=> res!992004 e!822869)))

(declare-datatypes ((SeekEntryResult!11841 0))(
  ( (MissingZero!11841 (index!49756 (_ BitVec 32))) (Found!11841 (index!49757 (_ BitVec 32))) (Intermediate!11841 (undefined!12653 Bool) (index!49758 (_ BitVec 32)) (x!131539 (_ BitVec 32))) (Undefined!11841) (MissingVacant!11841 (index!49759 (_ BitVec 32))) )
))
(declare-fun lt!640903 () SeekEntryResult!11841)

(declare-datatypes ((array!98818 0))(
  ( (array!98819 (arr!47692 (Array (_ BitVec 32) (_ BitVec 64))) (size!48243 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98818)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640902 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98818 (_ BitVec 32)) SeekEntryResult!11841)

(assert (=> b!1463565 (= res!992004 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640902 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!640903)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1463566 () Bool)

(declare-fun e!822867 () Bool)

(assert (=> b!1463566 (= e!822867 (or (= (select (arr!47692 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47692 a!2862) intermediateBeforeIndex!19) (select (arr!47692 a!2862) j!93))))))

(declare-fun b!1463567 () Bool)

(declare-fun e!822868 () Bool)

(assert (=> b!1463567 (= e!822868 e!822865)))

(declare-fun res!992010 () Bool)

(assert (=> b!1463567 (=> (not res!992010) (not e!822865))))

(declare-fun lt!640905 () SeekEntryResult!11841)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463567 (= res!992010 (= lt!640905 (Intermediate!11841 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640906 () array!98818)

(declare-fun lt!640900 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463567 (= lt!640905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640900 mask!2687) lt!640900 lt!640906 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463567 (= lt!640900 (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463568 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98818 (_ BitVec 32)) SeekEntryResult!11841)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98818 (_ BitVec 32)) SeekEntryResult!11841)

(assert (=> b!1463568 (= e!822870 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640900 lt!640906 mask!2687) (seekEntryOrOpen!0 lt!640900 lt!640906 mask!2687)))))

(declare-fun b!1463569 () Bool)

(declare-fun res!992006 () Bool)

(declare-fun e!822872 () Bool)

(assert (=> b!1463569 (=> (not res!992006) (not e!822872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98818 (_ BitVec 32)) Bool)

(assert (=> b!1463569 (= res!992006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463570 () Bool)

(declare-fun res!992019 () Bool)

(assert (=> b!1463570 (=> (not res!992019) (not e!822868))))

(assert (=> b!1463570 (= res!992019 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!640903))))

(declare-fun b!1463571 () Bool)

(declare-fun res!992011 () Bool)

(assert (=> b!1463571 (=> (not res!992011) (not e!822867))))

(assert (=> b!1463571 (= res!992011 (= (seekEntryOrOpen!0 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) (Found!11841 j!93)))))

(declare-fun b!1463572 () Bool)

(declare-fun e!822873 () Bool)

(assert (=> b!1463572 (= e!822872 e!822873)))

(declare-fun res!992013 () Bool)

(assert (=> b!1463572 (=> (not res!992013) (not e!822873))))

(assert (=> b!1463572 (= res!992013 (= (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463572 (= lt!640906 (array!98819 (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48243 a!2862)))))

(declare-fun b!1463573 () Bool)

(declare-fun e!822871 () Bool)

(assert (=> b!1463573 (= e!822865 (not e!822871))))

(declare-fun res!992016 () Bool)

(assert (=> b!1463573 (=> res!992016 e!822871)))

(assert (=> b!1463573 (= res!992016 (or (and (= (select (arr!47692 a!2862) index!646) (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47692 a!2862) index!646) (select (arr!47692 a!2862) j!93))) (= (select (arr!47692 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463573 e!822867))

(declare-fun res!992012 () Bool)

(assert (=> b!1463573 (=> (not res!992012) (not e!822867))))

(assert (=> b!1463573 (= res!992012 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49211 0))(
  ( (Unit!49212) )
))
(declare-fun lt!640904 () Unit!49211)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49211)

(assert (=> b!1463573 (= lt!640904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463574 () Bool)

(declare-fun res!992005 () Bool)

(assert (=> b!1463574 (=> (not res!992005) (not e!822865))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463574 (= res!992005 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463575 () Bool)

(assert (=> b!1463575 (= e!822873 e!822868)))

(declare-fun res!992009 () Bool)

(assert (=> b!1463575 (=> (not res!992009) (not e!822868))))

(assert (=> b!1463575 (= res!992009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47692 a!2862) j!93) mask!2687) (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!640903))))

(assert (=> b!1463575 (= lt!640903 (Intermediate!11841 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463576 () Bool)

(assert (=> b!1463576 (= e!822869 true)))

(declare-fun lt!640901 () Bool)

(declare-fun e!822866 () Bool)

(assert (=> b!1463576 (= lt!640901 e!822866)))

(declare-fun c!135300 () Bool)

(assert (=> b!1463576 (= c!135300 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463577 () Bool)

(assert (=> b!1463577 (= e!822866 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640902 intermediateAfterIndex!19 lt!640900 lt!640906 mask!2687) (seekEntryOrOpen!0 lt!640900 lt!640906 mask!2687))))))

(declare-fun res!992021 () Bool)

(assert (=> start!125532 (=> (not res!992021) (not e!822872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125532 (= res!992021 (validMask!0 mask!2687))))

(assert (=> start!125532 e!822872))

(assert (=> start!125532 true))

(declare-fun array_inv!36973 (array!98818) Bool)

(assert (=> start!125532 (array_inv!36973 a!2862)))

(declare-fun b!1463563 () Bool)

(declare-fun res!992015 () Bool)

(assert (=> b!1463563 (=> (not res!992015) (not e!822872))))

(assert (=> b!1463563 (= res!992015 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48243 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48243 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48243 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463578 () Bool)

(assert (=> b!1463578 (= e!822871 e!822869)))

(declare-fun res!992008 () Bool)

(assert (=> b!1463578 (=> res!992008 e!822869)))

(assert (=> b!1463578 (= res!992008 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640902 #b00000000000000000000000000000000) (bvsge lt!640902 (size!48243 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463578 (= lt!640902 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1463579 () Bool)

(declare-fun res!992018 () Bool)

(assert (=> b!1463579 (=> (not res!992018) (not e!822872))))

(declare-datatypes ((List!34180 0))(
  ( (Nil!34177) (Cons!34176 (h!35540 (_ BitVec 64)) (t!48866 List!34180)) )
))
(declare-fun arrayNoDuplicates!0 (array!98818 (_ BitVec 32) List!34180) Bool)

(assert (=> b!1463579 (= res!992018 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34177))))

(declare-fun b!1463580 () Bool)

(declare-fun res!992014 () Bool)

(assert (=> b!1463580 (=> (not res!992014) (not e!822872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463580 (= res!992014 (validKeyInArray!0 (select (arr!47692 a!2862) i!1006)))))

(declare-fun b!1463581 () Bool)

(declare-fun res!992020 () Bool)

(assert (=> b!1463581 (=> (not res!992020) (not e!822872))))

(assert (=> b!1463581 (= res!992020 (validKeyInArray!0 (select (arr!47692 a!2862) j!93)))))

(declare-fun b!1463582 () Bool)

(assert (=> b!1463582 (= e!822870 (= lt!640905 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640900 lt!640906 mask!2687)))))

(declare-fun b!1463583 () Bool)

(assert (=> b!1463583 (= e!822866 (not (= lt!640905 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640902 lt!640900 lt!640906 mask!2687))))))

(declare-fun b!1463584 () Bool)

(declare-fun res!992007 () Bool)

(assert (=> b!1463584 (=> (not res!992007) (not e!822872))))

(assert (=> b!1463584 (= res!992007 (and (= (size!48243 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48243 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48243 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125532 res!992021) b!1463584))

(assert (= (and b!1463584 res!992007) b!1463580))

(assert (= (and b!1463580 res!992014) b!1463581))

(assert (= (and b!1463581 res!992020) b!1463569))

(assert (= (and b!1463569 res!992006) b!1463579))

(assert (= (and b!1463579 res!992018) b!1463563))

(assert (= (and b!1463563 res!992015) b!1463572))

(assert (= (and b!1463572 res!992013) b!1463575))

(assert (= (and b!1463575 res!992009) b!1463570))

(assert (= (and b!1463570 res!992019) b!1463567))

(assert (= (and b!1463567 res!992010) b!1463564))

(assert (= (and b!1463564 c!135301) b!1463582))

(assert (= (and b!1463564 (not c!135301)) b!1463568))

(assert (= (and b!1463564 res!992017) b!1463574))

(assert (= (and b!1463574 res!992005) b!1463573))

(assert (= (and b!1463573 res!992012) b!1463571))

(assert (= (and b!1463571 res!992011) b!1463566))

(assert (= (and b!1463573 (not res!992016)) b!1463578))

(assert (= (and b!1463578 (not res!992008)) b!1463565))

(assert (= (and b!1463565 (not res!992004)) b!1463576))

(assert (= (and b!1463576 c!135300) b!1463583))

(assert (= (and b!1463576 (not c!135300)) b!1463577))

(declare-fun m!1351069 () Bool)

(assert (=> b!1463569 m!1351069))

(declare-fun m!1351071 () Bool)

(assert (=> b!1463580 m!1351071))

(assert (=> b!1463580 m!1351071))

(declare-fun m!1351073 () Bool)

(assert (=> b!1463580 m!1351073))

(declare-fun m!1351075 () Bool)

(assert (=> b!1463567 m!1351075))

(assert (=> b!1463567 m!1351075))

(declare-fun m!1351077 () Bool)

(assert (=> b!1463567 m!1351077))

(declare-fun m!1351079 () Bool)

(assert (=> b!1463567 m!1351079))

(declare-fun m!1351081 () Bool)

(assert (=> b!1463567 m!1351081))

(declare-fun m!1351083 () Bool)

(assert (=> b!1463582 m!1351083))

(declare-fun m!1351085 () Bool)

(assert (=> b!1463578 m!1351085))

(declare-fun m!1351087 () Bool)

(assert (=> b!1463583 m!1351087))

(declare-fun m!1351089 () Bool)

(assert (=> b!1463568 m!1351089))

(declare-fun m!1351091 () Bool)

(assert (=> b!1463568 m!1351091))

(declare-fun m!1351093 () Bool)

(assert (=> start!125532 m!1351093))

(declare-fun m!1351095 () Bool)

(assert (=> start!125532 m!1351095))

(declare-fun m!1351097 () Bool)

(assert (=> b!1463577 m!1351097))

(assert (=> b!1463577 m!1351091))

(declare-fun m!1351099 () Bool)

(assert (=> b!1463565 m!1351099))

(assert (=> b!1463565 m!1351099))

(declare-fun m!1351101 () Bool)

(assert (=> b!1463565 m!1351101))

(assert (=> b!1463575 m!1351099))

(assert (=> b!1463575 m!1351099))

(declare-fun m!1351103 () Bool)

(assert (=> b!1463575 m!1351103))

(assert (=> b!1463575 m!1351103))

(assert (=> b!1463575 m!1351099))

(declare-fun m!1351105 () Bool)

(assert (=> b!1463575 m!1351105))

(assert (=> b!1463570 m!1351099))

(assert (=> b!1463570 m!1351099))

(declare-fun m!1351107 () Bool)

(assert (=> b!1463570 m!1351107))

(assert (=> b!1463571 m!1351099))

(assert (=> b!1463571 m!1351099))

(declare-fun m!1351109 () Bool)

(assert (=> b!1463571 m!1351109))

(declare-fun m!1351111 () Bool)

(assert (=> b!1463566 m!1351111))

(assert (=> b!1463566 m!1351099))

(assert (=> b!1463581 m!1351099))

(assert (=> b!1463581 m!1351099))

(declare-fun m!1351113 () Bool)

(assert (=> b!1463581 m!1351113))

(declare-fun m!1351115 () Bool)

(assert (=> b!1463573 m!1351115))

(assert (=> b!1463573 m!1351079))

(declare-fun m!1351117 () Bool)

(assert (=> b!1463573 m!1351117))

(declare-fun m!1351119 () Bool)

(assert (=> b!1463573 m!1351119))

(declare-fun m!1351121 () Bool)

(assert (=> b!1463573 m!1351121))

(assert (=> b!1463573 m!1351099))

(declare-fun m!1351123 () Bool)

(assert (=> b!1463579 m!1351123))

(assert (=> b!1463572 m!1351079))

(declare-fun m!1351125 () Bool)

(assert (=> b!1463572 m!1351125))

(check-sat (not b!1463579) (not b!1463568) (not b!1463570) (not b!1463578) (not b!1463567) (not b!1463571) (not b!1463575) (not b!1463569) (not b!1463580) (not start!125532) (not b!1463573) (not b!1463583) (not b!1463577) (not b!1463565) (not b!1463581) (not b!1463582))
(check-sat)
