; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125092 () Bool)

(assert start!125092)

(declare-fun res!987852 () Bool)

(declare-fun e!819878 () Bool)

(assert (=> start!125092 (=> (not res!987852) (not e!819878))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125092 (= res!987852 (validMask!0 mask!2687))))

(assert (=> start!125092 e!819878))

(assert (=> start!125092 true))

(declare-datatypes ((array!98518 0))(
  ( (array!98519 (arr!47548 (Array (_ BitVec 32) (_ BitVec 64))) (size!48100 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98518)

(declare-fun array_inv!36781 (array!98518) Bool)

(assert (=> start!125092 (array_inv!36781 a!2862)))

(declare-fun b!1457475 () Bool)

(declare-fun res!987864 () Bool)

(assert (=> b!1457475 (=> (not res!987864) (not e!819878))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457475 (= res!987864 (and (= (size!48100 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48100 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48100 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457476 () Bool)

(declare-fun res!987851 () Bool)

(assert (=> b!1457476 (=> (not res!987851) (not e!819878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457476 (= res!987851 (validKeyInArray!0 (select (arr!47548 a!2862) j!93)))))

(declare-fun b!1457477 () Bool)

(declare-fun e!819882 () Bool)

(declare-fun e!819880 () Bool)

(assert (=> b!1457477 (= e!819882 e!819880)))

(declare-fun res!987860 () Bool)

(assert (=> b!1457477 (=> (not res!987860) (not e!819880))))

(declare-datatypes ((SeekEntryResult!11825 0))(
  ( (MissingZero!11825 (index!49692 (_ BitVec 32))) (Found!11825 (index!49693 (_ BitVec 32))) (Intermediate!11825 (undefined!12637 Bool) (index!49694 (_ BitVec 32)) (x!131309 (_ BitVec 32))) (Undefined!11825) (MissingVacant!11825 (index!49695 (_ BitVec 32))) )
))
(declare-fun lt!638531 () SeekEntryResult!11825)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98518 (_ BitVec 32)) SeekEntryResult!11825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457477 (= res!987860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47548 a!2862) j!93) mask!2687) (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!638531))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457477 (= lt!638531 (Intermediate!11825 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457478 () Bool)

(declare-fun res!987859 () Bool)

(assert (=> b!1457478 (=> (not res!987859) (not e!819880))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457478 (= res!987859 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!638531))))

(declare-fun b!1457479 () Bool)

(declare-fun e!819883 () Bool)

(assert (=> b!1457479 (= e!819883 true)))

(declare-fun lt!638529 () Bool)

(declare-fun e!819876 () Bool)

(assert (=> b!1457479 (= lt!638529 e!819876)))

(declare-fun c!134326 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457479 (= c!134326 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457480 () Bool)

(assert (=> b!1457480 (= e!819878 e!819882)))

(declare-fun res!987865 () Bool)

(assert (=> b!1457480 (=> (not res!987865) (not e!819882))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457480 (= res!987865 (= (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638532 () array!98518)

(assert (=> b!1457480 (= lt!638532 (array!98519 (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48100 a!2862)))))

(declare-fun b!1457481 () Bool)

(declare-fun e!819879 () Bool)

(assert (=> b!1457481 (= e!819879 e!819883)))

(declare-fun res!987863 () Bool)

(assert (=> b!1457481 (=> res!987863 e!819883)))

(declare-fun lt!638533 () (_ BitVec 32))

(assert (=> b!1457481 (= res!987863 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638533 #b00000000000000000000000000000000) (bvsge lt!638533 (size!48100 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457481 (= lt!638533 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638528 () SeekEntryResult!11825)

(declare-fun lt!638534 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98518 (_ BitVec 32)) SeekEntryResult!11825)

(assert (=> b!1457481 (= lt!638528 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638534 lt!638532 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98518 (_ BitVec 32)) SeekEntryResult!11825)

(assert (=> b!1457481 (= lt!638528 (seekEntryOrOpen!0 lt!638534 lt!638532 mask!2687))))

(declare-fun b!1457482 () Bool)

(declare-fun res!987855 () Bool)

(declare-fun e!819881 () Bool)

(assert (=> b!1457482 (=> (not res!987855) (not e!819881))))

(assert (=> b!1457482 (= res!987855 (= (seekEntryOrOpen!0 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) (Found!11825 j!93)))))

(declare-fun b!1457483 () Bool)

(declare-fun lt!638530 () SeekEntryResult!11825)

(assert (=> b!1457483 (= e!819876 (not (= lt!638530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638533 lt!638534 lt!638532 mask!2687))))))

(declare-fun b!1457484 () Bool)

(declare-fun e!819884 () Bool)

(assert (=> b!1457484 (= e!819884 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638534 lt!638532 mask!2687) (seekEntryOrOpen!0 lt!638534 lt!638532 mask!2687)))))

(declare-fun b!1457485 () Bool)

(declare-fun e!819885 () Bool)

(assert (=> b!1457485 (= e!819885 (not e!819879))))

(declare-fun res!987853 () Bool)

(assert (=> b!1457485 (=> res!987853 e!819879)))

(assert (=> b!1457485 (= res!987853 (or (and (= (select (arr!47548 a!2862) index!646) (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47548 a!2862) index!646) (select (arr!47548 a!2862) j!93))) (= (select (arr!47548 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457485 e!819881))

(declare-fun res!987858 () Bool)

(assert (=> b!1457485 (=> (not res!987858) (not e!819881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98518 (_ BitVec 32)) Bool)

(assert (=> b!1457485 (= res!987858 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48987 0))(
  ( (Unit!48988) )
))
(declare-fun lt!638535 () Unit!48987)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48987)

(assert (=> b!1457485 (= lt!638535 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457486 () Bool)

(declare-fun res!987856 () Bool)

(assert (=> b!1457486 (=> (not res!987856) (not e!819878))))

(declare-datatypes ((List!34127 0))(
  ( (Nil!34124) (Cons!34123 (h!35473 (_ BitVec 64)) (t!48813 List!34127)) )
))
(declare-fun arrayNoDuplicates!0 (array!98518 (_ BitVec 32) List!34127) Bool)

(assert (=> b!1457486 (= res!987856 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34124))))

(declare-fun b!1457487 () Bool)

(declare-fun res!987862 () Bool)

(assert (=> b!1457487 (=> (not res!987862) (not e!819885))))

(assert (=> b!1457487 (= res!987862 e!819884)))

(declare-fun c!134325 () Bool)

(assert (=> b!1457487 (= c!134325 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457488 () Bool)

(assert (=> b!1457488 (= e!819876 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638533 intermediateAfterIndex!19 lt!638534 lt!638532 mask!2687) lt!638528)))))

(declare-fun b!1457489 () Bool)

(assert (=> b!1457489 (= e!819881 (and (or (= (select (arr!47548 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47548 a!2862) intermediateBeforeIndex!19) (select (arr!47548 a!2862) j!93))) (let ((bdg!53359 (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47548 a!2862) index!646) bdg!53359) (= (select (arr!47548 a!2862) index!646) (select (arr!47548 a!2862) j!93))) (= (select (arr!47548 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53359 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457490 () Bool)

(declare-fun res!987867 () Bool)

(assert (=> b!1457490 (=> (not res!987867) (not e!819885))))

(assert (=> b!1457490 (= res!987867 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457491 () Bool)

(declare-fun res!987861 () Bool)

(assert (=> b!1457491 (=> (not res!987861) (not e!819878))))

(assert (=> b!1457491 (= res!987861 (validKeyInArray!0 (select (arr!47548 a!2862) i!1006)))))

(declare-fun b!1457492 () Bool)

(assert (=> b!1457492 (= e!819884 (= lt!638530 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638534 lt!638532 mask!2687)))))

(declare-fun b!1457493 () Bool)

(declare-fun res!987868 () Bool)

(assert (=> b!1457493 (=> (not res!987868) (not e!819878))))

(assert (=> b!1457493 (= res!987868 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48100 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48100 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48100 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457494 () Bool)

(declare-fun res!987854 () Bool)

(assert (=> b!1457494 (=> (not res!987854) (not e!819878))))

(assert (=> b!1457494 (= res!987854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457495 () Bool)

(assert (=> b!1457495 (= e!819880 e!819885)))

(declare-fun res!987857 () Bool)

(assert (=> b!1457495 (=> (not res!987857) (not e!819885))))

(assert (=> b!1457495 (= res!987857 (= lt!638530 (Intermediate!11825 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457495 (= lt!638530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638534 mask!2687) lt!638534 lt!638532 mask!2687))))

(assert (=> b!1457495 (= lt!638534 (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457496 () Bool)

(declare-fun res!987866 () Bool)

(assert (=> b!1457496 (=> res!987866 e!819883)))

(assert (=> b!1457496 (= res!987866 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638533 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!638531)))))

(assert (= (and start!125092 res!987852) b!1457475))

(assert (= (and b!1457475 res!987864) b!1457491))

(assert (= (and b!1457491 res!987861) b!1457476))

(assert (= (and b!1457476 res!987851) b!1457494))

(assert (= (and b!1457494 res!987854) b!1457486))

(assert (= (and b!1457486 res!987856) b!1457493))

(assert (= (and b!1457493 res!987868) b!1457480))

(assert (= (and b!1457480 res!987865) b!1457477))

(assert (= (and b!1457477 res!987860) b!1457478))

(assert (= (and b!1457478 res!987859) b!1457495))

(assert (= (and b!1457495 res!987857) b!1457487))

(assert (= (and b!1457487 c!134325) b!1457492))

(assert (= (and b!1457487 (not c!134325)) b!1457484))

(assert (= (and b!1457487 res!987862) b!1457490))

(assert (= (and b!1457490 res!987867) b!1457485))

(assert (= (and b!1457485 res!987858) b!1457482))

(assert (= (and b!1457482 res!987855) b!1457489))

(assert (= (and b!1457485 (not res!987853)) b!1457481))

(assert (= (and b!1457481 (not res!987863)) b!1457496))

(assert (= (and b!1457496 (not res!987866)) b!1457479))

(assert (= (and b!1457479 c!134326) b!1457483))

(assert (= (and b!1457479 (not c!134326)) b!1457488))

(declare-fun m!1344945 () Bool)

(assert (=> b!1457477 m!1344945))

(assert (=> b!1457477 m!1344945))

(declare-fun m!1344947 () Bool)

(assert (=> b!1457477 m!1344947))

(assert (=> b!1457477 m!1344947))

(assert (=> b!1457477 m!1344945))

(declare-fun m!1344949 () Bool)

(assert (=> b!1457477 m!1344949))

(assert (=> b!1457476 m!1344945))

(assert (=> b!1457476 m!1344945))

(declare-fun m!1344951 () Bool)

(assert (=> b!1457476 m!1344951))

(assert (=> b!1457478 m!1344945))

(assert (=> b!1457478 m!1344945))

(declare-fun m!1344953 () Bool)

(assert (=> b!1457478 m!1344953))

(declare-fun m!1344955 () Bool)

(assert (=> start!125092 m!1344955))

(declare-fun m!1344957 () Bool)

(assert (=> start!125092 m!1344957))

(declare-fun m!1344959 () Bool)

(assert (=> b!1457494 m!1344959))

(declare-fun m!1344961 () Bool)

(assert (=> b!1457485 m!1344961))

(declare-fun m!1344963 () Bool)

(assert (=> b!1457485 m!1344963))

(declare-fun m!1344965 () Bool)

(assert (=> b!1457485 m!1344965))

(declare-fun m!1344967 () Bool)

(assert (=> b!1457485 m!1344967))

(declare-fun m!1344969 () Bool)

(assert (=> b!1457485 m!1344969))

(assert (=> b!1457485 m!1344945))

(assert (=> b!1457496 m!1344945))

(assert (=> b!1457496 m!1344945))

(declare-fun m!1344971 () Bool)

(assert (=> b!1457496 m!1344971))

(declare-fun m!1344973 () Bool)

(assert (=> b!1457495 m!1344973))

(assert (=> b!1457495 m!1344973))

(declare-fun m!1344975 () Bool)

(assert (=> b!1457495 m!1344975))

(assert (=> b!1457495 m!1344963))

(declare-fun m!1344977 () Bool)

(assert (=> b!1457495 m!1344977))

(declare-fun m!1344979 () Bool)

(assert (=> b!1457481 m!1344979))

(declare-fun m!1344981 () Bool)

(assert (=> b!1457481 m!1344981))

(declare-fun m!1344983 () Bool)

(assert (=> b!1457481 m!1344983))

(declare-fun m!1344985 () Bool)

(assert (=> b!1457486 m!1344985))

(declare-fun m!1344987 () Bool)

(assert (=> b!1457492 m!1344987))

(assert (=> b!1457482 m!1344945))

(assert (=> b!1457482 m!1344945))

(declare-fun m!1344989 () Bool)

(assert (=> b!1457482 m!1344989))

(declare-fun m!1344991 () Bool)

(assert (=> b!1457483 m!1344991))

(declare-fun m!1344993 () Bool)

(assert (=> b!1457488 m!1344993))

(assert (=> b!1457484 m!1344981))

(assert (=> b!1457484 m!1344983))

(declare-fun m!1344995 () Bool)

(assert (=> b!1457491 m!1344995))

(assert (=> b!1457491 m!1344995))

(declare-fun m!1344997 () Bool)

(assert (=> b!1457491 m!1344997))

(assert (=> b!1457489 m!1344963))

(declare-fun m!1344999 () Bool)

(assert (=> b!1457489 m!1344999))

(assert (=> b!1457489 m!1344965))

(assert (=> b!1457489 m!1344967))

(assert (=> b!1457489 m!1344945))

(assert (=> b!1457480 m!1344963))

(declare-fun m!1345001 () Bool)

(assert (=> b!1457480 m!1345001))

(check-sat (not b!1457477) (not b!1457492) (not b!1457485) (not b!1457483) (not b!1457481) (not b!1457486) (not b!1457495) (not b!1457482) (not b!1457478) (not start!125092) (not b!1457476) (not b!1457496) (not b!1457491) (not b!1457494) (not b!1457484) (not b!1457488))
(check-sat)
