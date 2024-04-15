; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129116 () Bool)

(assert start!129116)

(declare-fun b!1515741 () Bool)

(declare-fun res!1035857 () Bool)

(declare-fun e!845801 () Bool)

(assert (=> b!1515741 (=> (not res!1035857) (not e!845801))))

(declare-datatypes ((SeekEntryResult!12918 0))(
  ( (MissingZero!12918 (index!54067 (_ BitVec 32))) (Found!12918 (index!54068 (_ BitVec 32))) (Intermediate!12918 (undefined!13730 Bool) (index!54069 (_ BitVec 32)) (x!135766 (_ BitVec 32))) (Undefined!12918) (MissingVacant!12918 (index!54070 (_ BitVec 32))) )
))
(declare-fun lt!657000 () SeekEntryResult!12918)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100972 0))(
  ( (array!100973 (arr!48724 (Array (_ BitVec 32) (_ BitVec 64))) (size!49276 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100972)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12918)

(assert (=> b!1515741 (= res!1035857 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) lt!657000))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1515742 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515742 (= e!845801 (not (or (not (= (select (arr!48724 a!2804) j!70) (select (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!845802 () Bool)

(assert (=> b!1515742 e!845802))

(declare-fun res!1035856 () Bool)

(assert (=> b!1515742 (=> (not res!1035856) (not e!845802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100972 (_ BitVec 32)) Bool)

(assert (=> b!1515742 (= res!1035856 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50543 0))(
  ( (Unit!50544) )
))
(declare-fun lt!656998 () Unit!50543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50543)

(assert (=> b!1515742 (= lt!656998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515744 () Bool)

(declare-fun res!1035855 () Bool)

(declare-fun e!845800 () Bool)

(assert (=> b!1515744 (=> (not res!1035855) (not e!845800))))

(assert (=> b!1515744 (= res!1035855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515745 () Bool)

(declare-fun res!1035852 () Bool)

(assert (=> b!1515745 (=> (not res!1035852) (not e!845801))))

(declare-fun lt!656999 () SeekEntryResult!12918)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515745 (= res!1035852 (= lt!656999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100973 (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49276 a!2804)) mask!2512)))))

(declare-fun b!1515746 () Bool)

(declare-fun res!1035850 () Bool)

(assert (=> b!1515746 (=> (not res!1035850) (not e!845800))))

(assert (=> b!1515746 (= res!1035850 (and (= (size!49276 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49276 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49276 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515747 () Bool)

(declare-fun res!1035853 () Bool)

(assert (=> b!1515747 (=> (not res!1035853) (not e!845800))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515747 (= res!1035853 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49276 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49276 a!2804))))))

(declare-fun b!1515748 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12918)

(assert (=> b!1515748 (= e!845802 (= (seekEntry!0 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) (Found!12918 j!70)))))

(declare-fun b!1515749 () Bool)

(declare-fun res!1035860 () Bool)

(assert (=> b!1515749 (=> (not res!1035860) (not e!845800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515749 (= res!1035860 (validKeyInArray!0 (select (arr!48724 a!2804) i!961)))))

(declare-fun b!1515750 () Bool)

(declare-fun res!1035851 () Bool)

(assert (=> b!1515750 (=> (not res!1035851) (not e!845800))))

(assert (=> b!1515750 (= res!1035851 (validKeyInArray!0 (select (arr!48724 a!2804) j!70)))))

(declare-fun b!1515751 () Bool)

(declare-fun res!1035859 () Bool)

(assert (=> b!1515751 (=> (not res!1035859) (not e!845800))))

(declare-datatypes ((List!35285 0))(
  ( (Nil!35282) (Cons!35281 (h!36694 (_ BitVec 64)) (t!49971 List!35285)) )
))
(declare-fun arrayNoDuplicates!0 (array!100972 (_ BitVec 32) List!35285) Bool)

(assert (=> b!1515751 (= res!1035859 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35282))))

(declare-fun b!1515743 () Bool)

(assert (=> b!1515743 (= e!845800 e!845801)))

(declare-fun res!1035854 () Bool)

(assert (=> b!1515743 (=> (not res!1035854) (not e!845801))))

(assert (=> b!1515743 (= res!1035854 (= lt!656999 lt!657000))))

(assert (=> b!1515743 (= lt!657000 (Intermediate!12918 false resIndex!21 resX!21))))

(assert (=> b!1515743 (= lt!656999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48724 a!2804) j!70) mask!2512) (select (arr!48724 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035858 () Bool)

(assert (=> start!129116 (=> (not res!1035858) (not e!845800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129116 (= res!1035858 (validMask!0 mask!2512))))

(assert (=> start!129116 e!845800))

(assert (=> start!129116 true))

(declare-fun array_inv!37957 (array!100972) Bool)

(assert (=> start!129116 (array_inv!37957 a!2804)))

(assert (= (and start!129116 res!1035858) b!1515746))

(assert (= (and b!1515746 res!1035850) b!1515749))

(assert (= (and b!1515749 res!1035860) b!1515750))

(assert (= (and b!1515750 res!1035851) b!1515744))

(assert (= (and b!1515744 res!1035855) b!1515751))

(assert (= (and b!1515751 res!1035859) b!1515747))

(assert (= (and b!1515747 res!1035853) b!1515743))

(assert (= (and b!1515743 res!1035854) b!1515741))

(assert (= (and b!1515741 res!1035857) b!1515745))

(assert (= (and b!1515745 res!1035852) b!1515742))

(assert (= (and b!1515742 res!1035856) b!1515748))

(declare-fun m!1398413 () Bool)

(assert (=> b!1515742 m!1398413))

(declare-fun m!1398415 () Bool)

(assert (=> b!1515742 m!1398415))

(declare-fun m!1398417 () Bool)

(assert (=> b!1515742 m!1398417))

(declare-fun m!1398419 () Bool)

(assert (=> b!1515742 m!1398419))

(declare-fun m!1398421 () Bool)

(assert (=> b!1515742 m!1398421))

(assert (=> b!1515750 m!1398413))

(assert (=> b!1515750 m!1398413))

(declare-fun m!1398423 () Bool)

(assert (=> b!1515750 m!1398423))

(assert (=> b!1515741 m!1398413))

(assert (=> b!1515741 m!1398413))

(declare-fun m!1398425 () Bool)

(assert (=> b!1515741 m!1398425))

(declare-fun m!1398427 () Bool)

(assert (=> start!129116 m!1398427))

(declare-fun m!1398429 () Bool)

(assert (=> start!129116 m!1398429))

(declare-fun m!1398431 () Bool)

(assert (=> b!1515744 m!1398431))

(assert (=> b!1515748 m!1398413))

(assert (=> b!1515748 m!1398413))

(declare-fun m!1398433 () Bool)

(assert (=> b!1515748 m!1398433))

(declare-fun m!1398435 () Bool)

(assert (=> b!1515749 m!1398435))

(assert (=> b!1515749 m!1398435))

(declare-fun m!1398437 () Bool)

(assert (=> b!1515749 m!1398437))

(assert (=> b!1515743 m!1398413))

(assert (=> b!1515743 m!1398413))

(declare-fun m!1398439 () Bool)

(assert (=> b!1515743 m!1398439))

(assert (=> b!1515743 m!1398439))

(assert (=> b!1515743 m!1398413))

(declare-fun m!1398441 () Bool)

(assert (=> b!1515743 m!1398441))

(declare-fun m!1398443 () Bool)

(assert (=> b!1515751 m!1398443))

(assert (=> b!1515745 m!1398417))

(assert (=> b!1515745 m!1398419))

(assert (=> b!1515745 m!1398419))

(declare-fun m!1398445 () Bool)

(assert (=> b!1515745 m!1398445))

(assert (=> b!1515745 m!1398445))

(assert (=> b!1515745 m!1398419))

(declare-fun m!1398447 () Bool)

(assert (=> b!1515745 m!1398447))

(check-sat (not b!1515751) (not b!1515743) (not b!1515741) (not start!129116) (not b!1515750) (not b!1515748) (not b!1515742) (not b!1515745) (not b!1515749) (not b!1515744))
(check-sat)
