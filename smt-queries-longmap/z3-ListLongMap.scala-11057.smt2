; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129122 () Bool)

(assert start!129122)

(declare-fun b!1515840 () Bool)

(declare-fun res!1035952 () Bool)

(declare-fun e!845835 () Bool)

(assert (=> b!1515840 (=> (not res!1035952) (not e!845835))))

(declare-datatypes ((array!100978 0))(
  ( (array!100979 (arr!48727 (Array (_ BitVec 32) (_ BitVec 64))) (size!49279 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100978)

(declare-datatypes ((List!35288 0))(
  ( (Nil!35285) (Cons!35284 (h!36697 (_ BitVec 64)) (t!49974 List!35288)) )
))
(declare-fun arrayNoDuplicates!0 (array!100978 (_ BitVec 32) List!35288) Bool)

(assert (=> b!1515840 (= res!1035952 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35285))))

(declare-fun b!1515841 () Bool)

(declare-fun res!1035956 () Bool)

(declare-fun e!845836 () Bool)

(assert (=> b!1515841 (=> (not res!1035956) (not e!845836))))

(declare-datatypes ((SeekEntryResult!12921 0))(
  ( (MissingZero!12921 (index!54079 (_ BitVec 32))) (Found!12921 (index!54080 (_ BitVec 32))) (Intermediate!12921 (undefined!13733 Bool) (index!54081 (_ BitVec 32)) (x!135777 (_ BitVec 32))) (Undefined!12921) (MissingVacant!12921 (index!54082 (_ BitVec 32))) )
))
(declare-fun lt!657027 () SeekEntryResult!12921)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12921)

(assert (=> b!1515841 (= res!1035956 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) lt!657027))))

(declare-fun b!1515842 () Bool)

(declare-fun res!1035951 () Bool)

(assert (=> b!1515842 (=> (not res!1035951) (not e!845835))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515842 (= res!1035951 (validKeyInArray!0 (select (arr!48727 a!2804) i!961)))))

(declare-fun b!1515843 () Bool)

(declare-fun res!1035949 () Bool)

(assert (=> b!1515843 (=> (not res!1035949) (not e!845835))))

(assert (=> b!1515843 (= res!1035949 (and (= (size!49279 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49279 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49279 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!845838 () Bool)

(declare-fun b!1515844 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12921)

(assert (=> b!1515844 (= e!845838 (= (seekEntry!0 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) (Found!12921 j!70)))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1515845 () Bool)

(assert (=> b!1515845 (= e!845836 (not (or (not (= (select (arr!48727 a!2804) j!70) (select (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1515845 e!845838))

(declare-fun res!1035957 () Bool)

(assert (=> b!1515845 (=> (not res!1035957) (not e!845838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100978 (_ BitVec 32)) Bool)

(assert (=> b!1515845 (= res!1035957 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50549 0))(
  ( (Unit!50550) )
))
(declare-fun lt!657026 () Unit!50549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50549)

(assert (=> b!1515845 (= lt!657026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515846 () Bool)

(declare-fun res!1035954 () Bool)

(assert (=> b!1515846 (=> (not res!1035954) (not e!845835))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515846 (= res!1035954 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49279 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49279 a!2804))))))

(declare-fun b!1515847 () Bool)

(declare-fun res!1035958 () Bool)

(assert (=> b!1515847 (=> (not res!1035958) (not e!845835))))

(assert (=> b!1515847 (= res!1035958 (validKeyInArray!0 (select (arr!48727 a!2804) j!70)))))

(declare-fun b!1515848 () Bool)

(declare-fun res!1035955 () Bool)

(assert (=> b!1515848 (=> (not res!1035955) (not e!845836))))

(declare-fun lt!657025 () SeekEntryResult!12921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515848 (= res!1035955 (= lt!657025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100979 (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49279 a!2804)) mask!2512)))))

(declare-fun b!1515849 () Bool)

(assert (=> b!1515849 (= e!845835 e!845836)))

(declare-fun res!1035950 () Bool)

(assert (=> b!1515849 (=> (not res!1035950) (not e!845836))))

(assert (=> b!1515849 (= res!1035950 (= lt!657025 lt!657027))))

(assert (=> b!1515849 (= lt!657027 (Intermediate!12921 false resIndex!21 resX!21))))

(assert (=> b!1515849 (= lt!657025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48727 a!2804) j!70) mask!2512) (select (arr!48727 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035953 () Bool)

(assert (=> start!129122 (=> (not res!1035953) (not e!845835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129122 (= res!1035953 (validMask!0 mask!2512))))

(assert (=> start!129122 e!845835))

(assert (=> start!129122 true))

(declare-fun array_inv!37960 (array!100978) Bool)

(assert (=> start!129122 (array_inv!37960 a!2804)))

(declare-fun b!1515850 () Bool)

(declare-fun res!1035959 () Bool)

(assert (=> b!1515850 (=> (not res!1035959) (not e!845835))))

(assert (=> b!1515850 (= res!1035959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129122 res!1035953) b!1515843))

(assert (= (and b!1515843 res!1035949) b!1515842))

(assert (= (and b!1515842 res!1035951) b!1515847))

(assert (= (and b!1515847 res!1035958) b!1515850))

(assert (= (and b!1515850 res!1035959) b!1515840))

(assert (= (and b!1515840 res!1035952) b!1515846))

(assert (= (and b!1515846 res!1035954) b!1515849))

(assert (= (and b!1515849 res!1035950) b!1515841))

(assert (= (and b!1515841 res!1035956) b!1515848))

(assert (= (and b!1515848 res!1035955) b!1515845))

(assert (= (and b!1515845 res!1035957) b!1515844))

(declare-fun m!1398521 () Bool)

(assert (=> b!1515845 m!1398521))

(declare-fun m!1398523 () Bool)

(assert (=> b!1515845 m!1398523))

(declare-fun m!1398525 () Bool)

(assert (=> b!1515845 m!1398525))

(declare-fun m!1398527 () Bool)

(assert (=> b!1515845 m!1398527))

(declare-fun m!1398529 () Bool)

(assert (=> b!1515845 m!1398529))

(assert (=> b!1515847 m!1398521))

(assert (=> b!1515847 m!1398521))

(declare-fun m!1398531 () Bool)

(assert (=> b!1515847 m!1398531))

(assert (=> b!1515844 m!1398521))

(assert (=> b!1515844 m!1398521))

(declare-fun m!1398533 () Bool)

(assert (=> b!1515844 m!1398533))

(assert (=> b!1515841 m!1398521))

(assert (=> b!1515841 m!1398521))

(declare-fun m!1398535 () Bool)

(assert (=> b!1515841 m!1398535))

(assert (=> b!1515849 m!1398521))

(assert (=> b!1515849 m!1398521))

(declare-fun m!1398537 () Bool)

(assert (=> b!1515849 m!1398537))

(assert (=> b!1515849 m!1398537))

(assert (=> b!1515849 m!1398521))

(declare-fun m!1398539 () Bool)

(assert (=> b!1515849 m!1398539))

(declare-fun m!1398541 () Bool)

(assert (=> b!1515840 m!1398541))

(declare-fun m!1398543 () Bool)

(assert (=> b!1515850 m!1398543))

(declare-fun m!1398545 () Bool)

(assert (=> start!129122 m!1398545))

(declare-fun m!1398547 () Bool)

(assert (=> start!129122 m!1398547))

(declare-fun m!1398549 () Bool)

(assert (=> b!1515842 m!1398549))

(assert (=> b!1515842 m!1398549))

(declare-fun m!1398551 () Bool)

(assert (=> b!1515842 m!1398551))

(assert (=> b!1515848 m!1398525))

(assert (=> b!1515848 m!1398527))

(assert (=> b!1515848 m!1398527))

(declare-fun m!1398553 () Bool)

(assert (=> b!1515848 m!1398553))

(assert (=> b!1515848 m!1398553))

(assert (=> b!1515848 m!1398527))

(declare-fun m!1398555 () Bool)

(assert (=> b!1515848 m!1398555))

(check-sat (not b!1515850) (not b!1515848) (not b!1515845) (not b!1515841) (not start!129122) (not b!1515847) (not b!1515842) (not b!1515840) (not b!1515844) (not b!1515849))
(check-sat)
