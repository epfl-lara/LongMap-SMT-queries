; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126744 () Bool)

(assert start!126744)

(declare-fun b!1487871 () Bool)

(declare-fun e!834014 () Bool)

(declare-fun e!834009 () Bool)

(assert (=> b!1487871 (= e!834014 e!834009)))

(declare-fun res!1011841 () Bool)

(assert (=> b!1487871 (=> res!1011841 e!834009)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99580 0))(
  ( (array!99581 (arr!48063 (Array (_ BitVec 32) (_ BitVec 64))) (size!48613 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99580)

(declare-fun lt!648988 () (_ BitVec 32))

(assert (=> b!1487871 (= res!1011841 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648988 #b00000000000000000000000000000000) (bvsge lt!648988 (size!48613 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487871 (= lt!648988 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487872 () Bool)

(declare-fun e!834008 () Bool)

(declare-fun e!834015 () Bool)

(assert (=> b!1487872 (= e!834008 e!834015)))

(declare-fun res!1011834 () Bool)

(assert (=> b!1487872 (=> (not res!1011834) (not e!834015))))

(declare-datatypes ((SeekEntryResult!12303 0))(
  ( (MissingZero!12303 (index!51604 (_ BitVec 32))) (Found!12303 (index!51605 (_ BitVec 32))) (Intermediate!12303 (undefined!13115 Bool) (index!51606 (_ BitVec 32)) (x!133195 (_ BitVec 32))) (Undefined!12303) (MissingVacant!12303 (index!51607 (_ BitVec 32))) )
))
(declare-fun lt!648986 () SeekEntryResult!12303)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99580 (_ BitVec 32)) SeekEntryResult!12303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487872 (= res!1011834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48063 a!2862) j!93) mask!2687) (select (arr!48063 a!2862) j!93) a!2862 mask!2687) lt!648986))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487872 (= lt!648986 (Intermediate!12303 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487873 () Bool)

(declare-fun lt!648985 () array!99580)

(declare-fun e!834010 () Bool)

(declare-fun lt!648987 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99580 (_ BitVec 32)) SeekEntryResult!12303)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99580 (_ BitVec 32)) SeekEntryResult!12303)

(assert (=> b!1487873 (= e!834010 (= (seekEntryOrOpen!0 lt!648987 lt!648985 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648987 lt!648985 mask!2687)))))

(declare-fun b!1487874 () Bool)

(declare-fun res!1011838 () Bool)

(declare-fun e!834011 () Bool)

(assert (=> b!1487874 (=> (not res!1011838) (not e!834011))))

(declare-datatypes ((List!34564 0))(
  ( (Nil!34561) (Cons!34560 (h!35940 (_ BitVec 64)) (t!49258 List!34564)) )
))
(declare-fun arrayNoDuplicates!0 (array!99580 (_ BitVec 32) List!34564) Bool)

(assert (=> b!1487874 (= res!1011838 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34561))))

(declare-fun lt!648984 () SeekEntryResult!12303)

(declare-fun e!834013 () Bool)

(declare-fun b!1487875 () Bool)

(assert (=> b!1487875 (= e!834013 (= lt!648984 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648987 lt!648985 mask!2687)))))

(declare-fun b!1487876 () Bool)

(declare-fun e!834016 () Bool)

(assert (=> b!1487876 (= e!834016 (not e!834014))))

(declare-fun res!1011847 () Bool)

(assert (=> b!1487876 (=> res!1011847 e!834014)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487876 (= res!1011847 (or (and (= (select (arr!48063 a!2862) index!646) (select (store (arr!48063 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48063 a!2862) index!646) (select (arr!48063 a!2862) j!93))) (= (select (arr!48063 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!834017 () Bool)

(assert (=> b!1487876 e!834017))

(declare-fun res!1011850 () Bool)

(assert (=> b!1487876 (=> (not res!1011850) (not e!834017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99580 (_ BitVec 32)) Bool)

(assert (=> b!1487876 (= res!1011850 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49946 0))(
  ( (Unit!49947) )
))
(declare-fun lt!648989 () Unit!49946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49946)

(assert (=> b!1487876 (= lt!648989 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487877 () Bool)

(declare-fun e!834012 () Bool)

(assert (=> b!1487877 (= e!834012 e!834010)))

(declare-fun res!1011849 () Bool)

(assert (=> b!1487877 (=> (not res!1011849) (not e!834010))))

(declare-fun lt!648990 () (_ BitVec 64))

(assert (=> b!1487877 (= res!1011849 (and (= index!646 intermediateAfterIndex!19) (= lt!648990 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487879 () Bool)

(declare-fun res!1011852 () Bool)

(assert (=> b!1487879 (=> (not res!1011852) (not e!834016))))

(assert (=> b!1487879 (= res!1011852 e!834013)))

(declare-fun c!137544 () Bool)

(assert (=> b!1487879 (= c!137544 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487880 () Bool)

(declare-fun res!1011846 () Bool)

(assert (=> b!1487880 (=> (not res!1011846) (not e!834011))))

(assert (=> b!1487880 (= res!1011846 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48613 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48613 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48613 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487881 () Bool)

(declare-fun res!1011844 () Bool)

(assert (=> b!1487881 (=> (not res!1011844) (not e!834015))))

(assert (=> b!1487881 (= res!1011844 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48063 a!2862) j!93) a!2862 mask!2687) lt!648986))))

(declare-fun b!1487882 () Bool)

(declare-fun res!1011839 () Bool)

(assert (=> b!1487882 (=> (not res!1011839) (not e!834011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487882 (= res!1011839 (validKeyInArray!0 (select (arr!48063 a!2862) j!93)))))

(declare-fun b!1487878 () Bool)

(declare-fun res!1011843 () Bool)

(assert (=> b!1487878 (=> (not res!1011843) (not e!834011))))

(assert (=> b!1487878 (= res!1011843 (and (= (size!48613 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48613 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48613 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1011842 () Bool)

(assert (=> start!126744 (=> (not res!1011842) (not e!834011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126744 (= res!1011842 (validMask!0 mask!2687))))

(assert (=> start!126744 e!834011))

(assert (=> start!126744 true))

(declare-fun array_inv!37091 (array!99580) Bool)

(assert (=> start!126744 (array_inv!37091 a!2862)))

(declare-fun b!1487883 () Bool)

(declare-fun res!1011840 () Bool)

(assert (=> b!1487883 (=> (not res!1011840) (not e!834017))))

(assert (=> b!1487883 (= res!1011840 (or (= (select (arr!48063 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48063 a!2862) intermediateBeforeIndex!19) (select (arr!48063 a!2862) j!93))))))

(declare-fun b!1487884 () Bool)

(declare-fun res!1011845 () Bool)

(assert (=> b!1487884 (=> (not res!1011845) (not e!834011))))

(assert (=> b!1487884 (= res!1011845 (validKeyInArray!0 (select (arr!48063 a!2862) i!1006)))))

(declare-fun b!1487885 () Bool)

(assert (=> b!1487885 (= e!834015 e!834016)))

(declare-fun res!1011853 () Bool)

(assert (=> b!1487885 (=> (not res!1011853) (not e!834016))))

(assert (=> b!1487885 (= res!1011853 (= lt!648984 (Intermediate!12303 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1487885 (= lt!648984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648987 mask!2687) lt!648987 lt!648985 mask!2687))))

(assert (=> b!1487885 (= lt!648987 (select (store (arr!48063 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487886 () Bool)

(assert (=> b!1487886 (= e!834013 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648987 lt!648985 mask!2687) (seekEntryOrOpen!0 lt!648987 lt!648985 mask!2687)))))

(declare-fun b!1487887 () Bool)

(declare-fun res!1011836 () Bool)

(assert (=> b!1487887 (=> (not res!1011836) (not e!834011))))

(assert (=> b!1487887 (= res!1011836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487888 () Bool)

(assert (=> b!1487888 (= e!834011 e!834008)))

(declare-fun res!1011835 () Bool)

(assert (=> b!1487888 (=> (not res!1011835) (not e!834008))))

(assert (=> b!1487888 (= res!1011835 (= (select (store (arr!48063 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487888 (= lt!648985 (array!99581 (store (arr!48063 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48613 a!2862)))))

(declare-fun b!1487889 () Bool)

(assert (=> b!1487889 (= e!834017 e!834012)))

(declare-fun res!1011837 () Bool)

(assert (=> b!1487889 (=> res!1011837 e!834012)))

(assert (=> b!1487889 (= res!1011837 (or (and (= (select (arr!48063 a!2862) index!646) lt!648990) (= (select (arr!48063 a!2862) index!646) (select (arr!48063 a!2862) j!93))) (= (select (arr!48063 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487889 (= lt!648990 (select (store (arr!48063 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487890 () Bool)

(declare-fun res!1011851 () Bool)

(assert (=> b!1487890 (=> (not res!1011851) (not e!834016))))

(assert (=> b!1487890 (= res!1011851 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487891 () Bool)

(declare-fun res!1011848 () Bool)

(assert (=> b!1487891 (=> (not res!1011848) (not e!834017))))

(assert (=> b!1487891 (= res!1011848 (= (seekEntryOrOpen!0 (select (arr!48063 a!2862) j!93) a!2862 mask!2687) (Found!12303 j!93)))))

(declare-fun b!1487892 () Bool)

(assert (=> b!1487892 (= e!834009 true)))

(declare-fun lt!648983 () SeekEntryResult!12303)

(assert (=> b!1487892 (= lt!648983 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648988 (select (arr!48063 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!126744 res!1011842) b!1487878))

(assert (= (and b!1487878 res!1011843) b!1487884))

(assert (= (and b!1487884 res!1011845) b!1487882))

(assert (= (and b!1487882 res!1011839) b!1487887))

(assert (= (and b!1487887 res!1011836) b!1487874))

(assert (= (and b!1487874 res!1011838) b!1487880))

(assert (= (and b!1487880 res!1011846) b!1487888))

(assert (= (and b!1487888 res!1011835) b!1487872))

(assert (= (and b!1487872 res!1011834) b!1487881))

(assert (= (and b!1487881 res!1011844) b!1487885))

(assert (= (and b!1487885 res!1011853) b!1487879))

(assert (= (and b!1487879 c!137544) b!1487875))

(assert (= (and b!1487879 (not c!137544)) b!1487886))

(assert (= (and b!1487879 res!1011852) b!1487890))

(assert (= (and b!1487890 res!1011851) b!1487876))

(assert (= (and b!1487876 res!1011850) b!1487891))

(assert (= (and b!1487891 res!1011848) b!1487883))

(assert (= (and b!1487883 res!1011840) b!1487889))

(assert (= (and b!1487889 (not res!1011837)) b!1487877))

(assert (= (and b!1487877 res!1011849) b!1487873))

(assert (= (and b!1487876 (not res!1011847)) b!1487871))

(assert (= (and b!1487871 (not res!1011841)) b!1487892))

(declare-fun m!1372417 () Bool)

(assert (=> b!1487881 m!1372417))

(assert (=> b!1487881 m!1372417))

(declare-fun m!1372419 () Bool)

(assert (=> b!1487881 m!1372419))

(assert (=> b!1487882 m!1372417))

(assert (=> b!1487882 m!1372417))

(declare-fun m!1372421 () Bool)

(assert (=> b!1487882 m!1372421))

(declare-fun m!1372423 () Bool)

(assert (=> b!1487873 m!1372423))

(declare-fun m!1372425 () Bool)

(assert (=> b!1487873 m!1372425))

(declare-fun m!1372427 () Bool)

(assert (=> b!1487885 m!1372427))

(assert (=> b!1487885 m!1372427))

(declare-fun m!1372429 () Bool)

(assert (=> b!1487885 m!1372429))

(declare-fun m!1372431 () Bool)

(assert (=> b!1487885 m!1372431))

(declare-fun m!1372433 () Bool)

(assert (=> b!1487885 m!1372433))

(declare-fun m!1372435 () Bool)

(assert (=> b!1487874 m!1372435))

(assert (=> b!1487891 m!1372417))

(assert (=> b!1487891 m!1372417))

(declare-fun m!1372437 () Bool)

(assert (=> b!1487891 m!1372437))

(assert (=> b!1487872 m!1372417))

(assert (=> b!1487872 m!1372417))

(declare-fun m!1372439 () Bool)

(assert (=> b!1487872 m!1372439))

(assert (=> b!1487872 m!1372439))

(assert (=> b!1487872 m!1372417))

(declare-fun m!1372441 () Bool)

(assert (=> b!1487872 m!1372441))

(assert (=> b!1487888 m!1372431))

(declare-fun m!1372443 () Bool)

(assert (=> b!1487888 m!1372443))

(declare-fun m!1372445 () Bool)

(assert (=> start!126744 m!1372445))

(declare-fun m!1372447 () Bool)

(assert (=> start!126744 m!1372447))

(declare-fun m!1372449 () Bool)

(assert (=> b!1487887 m!1372449))

(declare-fun m!1372451 () Bool)

(assert (=> b!1487875 m!1372451))

(declare-fun m!1372453 () Bool)

(assert (=> b!1487883 m!1372453))

(assert (=> b!1487883 m!1372417))

(assert (=> b!1487892 m!1372417))

(assert (=> b!1487892 m!1372417))

(declare-fun m!1372455 () Bool)

(assert (=> b!1487892 m!1372455))

(declare-fun m!1372457 () Bool)

(assert (=> b!1487876 m!1372457))

(assert (=> b!1487876 m!1372431))

(declare-fun m!1372459 () Bool)

(assert (=> b!1487876 m!1372459))

(declare-fun m!1372461 () Bool)

(assert (=> b!1487876 m!1372461))

(declare-fun m!1372463 () Bool)

(assert (=> b!1487876 m!1372463))

(assert (=> b!1487876 m!1372417))

(declare-fun m!1372465 () Bool)

(assert (=> b!1487884 m!1372465))

(assert (=> b!1487884 m!1372465))

(declare-fun m!1372467 () Bool)

(assert (=> b!1487884 m!1372467))

(assert (=> b!1487889 m!1372461))

(assert (=> b!1487889 m!1372417))

(assert (=> b!1487889 m!1372431))

(assert (=> b!1487889 m!1372459))

(assert (=> b!1487886 m!1372425))

(assert (=> b!1487886 m!1372423))

(declare-fun m!1372469 () Bool)

(assert (=> b!1487871 m!1372469))

(check-sat (not b!1487884) (not start!126744) (not b!1487891) (not b!1487872) (not b!1487887) (not b!1487882) (not b!1487886) (not b!1487892) (not b!1487871) (not b!1487875) (not b!1487874) (not b!1487873) (not b!1487885) (not b!1487881) (not b!1487876))
(check-sat)
