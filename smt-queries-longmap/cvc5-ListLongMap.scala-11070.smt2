; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129252 () Bool)

(assert start!129252)

(declare-fun b!1517669 () Bool)

(declare-fun res!1037572 () Bool)

(declare-fun e!846719 () Bool)

(assert (=> b!1517669 (=> (not res!1037572) (not e!846719))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101108 0))(
  ( (array!101109 (arr!48791 (Array (_ BitVec 32) (_ BitVec 64))) (size!49341 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101108)

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12962 0))(
  ( (MissingZero!12962 (index!54243 (_ BitVec 32))) (Found!12962 (index!54244 (_ BitVec 32))) (Intermediate!12962 (undefined!13774 Bool) (index!54245 (_ BitVec 32)) (x!135928 (_ BitVec 32))) (Undefined!12962) (MissingVacant!12962 (index!54246 (_ BitVec 32))) )
))
(declare-fun lt!657877 () SeekEntryResult!12962)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101108 (_ BitVec 32)) SeekEntryResult!12962)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517669 (= res!1037572 (= lt!657877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48791 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48791 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101109 (store (arr!48791 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49341 a!2804)) mask!2512)))))

(declare-fun b!1517670 () Bool)

(declare-fun e!846723 () Bool)

(assert (=> b!1517670 (= e!846723 true)))

(declare-fun lt!657874 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657873 () SeekEntryResult!12962)

(assert (=> b!1517670 (= lt!657873 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657874 (select (arr!48791 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!846721 () Bool)

(declare-fun b!1517671 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101108 (_ BitVec 32)) SeekEntryResult!12962)

(assert (=> b!1517671 (= e!846721 (= (seekEntry!0 (select (arr!48791 a!2804) j!70) a!2804 mask!2512) (Found!12962 j!70)))))

(declare-fun b!1517672 () Bool)

(declare-fun res!1037576 () Bool)

(declare-fun e!846720 () Bool)

(assert (=> b!1517672 (=> (not res!1037576) (not e!846720))))

(assert (=> b!1517672 (= res!1037576 (and (= (size!49341 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49341 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49341 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517673 () Bool)

(declare-fun res!1037579 () Bool)

(assert (=> b!1517673 (=> (not res!1037579) (not e!846720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101108 (_ BitVec 32)) Bool)

(assert (=> b!1517673 (= res!1037579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1037580 () Bool)

(assert (=> start!129252 (=> (not res!1037580) (not e!846720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129252 (= res!1037580 (validMask!0 mask!2512))))

(assert (=> start!129252 e!846720))

(assert (=> start!129252 true))

(declare-fun array_inv!37819 (array!101108) Bool)

(assert (=> start!129252 (array_inv!37819 a!2804)))

(declare-fun b!1517674 () Bool)

(declare-fun res!1037582 () Bool)

(assert (=> b!1517674 (=> (not res!1037582) (not e!846720))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517674 (= res!1037582 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49341 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49341 a!2804))))))

(declare-fun b!1517675 () Bool)

(declare-fun res!1037575 () Bool)

(assert (=> b!1517675 (=> (not res!1037575) (not e!846719))))

(declare-fun lt!657876 () SeekEntryResult!12962)

(assert (=> b!1517675 (= res!1037575 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48791 a!2804) j!70) a!2804 mask!2512) lt!657876))))

(declare-fun b!1517676 () Bool)

(declare-fun res!1037573 () Bool)

(assert (=> b!1517676 (=> (not res!1037573) (not e!846720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517676 (= res!1037573 (validKeyInArray!0 (select (arr!48791 a!2804) i!961)))))

(declare-fun b!1517677 () Bool)

(declare-fun e!846722 () Bool)

(assert (=> b!1517677 (= e!846722 e!846723)))

(declare-fun res!1037574 () Bool)

(assert (=> b!1517677 (=> res!1037574 e!846723)))

(assert (=> b!1517677 (= res!1037574 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657874 #b00000000000000000000000000000000) (bvsge lt!657874 (size!49341 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517677 (= lt!657874 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517678 () Bool)

(assert (=> b!1517678 (= e!846719 (not e!846722))))

(declare-fun res!1037577 () Bool)

(assert (=> b!1517678 (=> res!1037577 e!846722)))

(assert (=> b!1517678 (= res!1037577 (or (not (= (select (arr!48791 a!2804) j!70) (select (store (arr!48791 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517678 e!846721))

(declare-fun res!1037584 () Bool)

(assert (=> b!1517678 (=> (not res!1037584) (not e!846721))))

(assert (=> b!1517678 (= res!1037584 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50792 0))(
  ( (Unit!50793) )
))
(declare-fun lt!657875 () Unit!50792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50792)

(assert (=> b!1517678 (= lt!657875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517679 () Bool)

(assert (=> b!1517679 (= e!846720 e!846719)))

(declare-fun res!1037583 () Bool)

(assert (=> b!1517679 (=> (not res!1037583) (not e!846719))))

(assert (=> b!1517679 (= res!1037583 (= lt!657877 lt!657876))))

(assert (=> b!1517679 (= lt!657876 (Intermediate!12962 false resIndex!21 resX!21))))

(assert (=> b!1517679 (= lt!657877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48791 a!2804) j!70) mask!2512) (select (arr!48791 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517680 () Bool)

(declare-fun res!1037578 () Bool)

(assert (=> b!1517680 (=> (not res!1037578) (not e!846720))))

(assert (=> b!1517680 (= res!1037578 (validKeyInArray!0 (select (arr!48791 a!2804) j!70)))))

(declare-fun b!1517681 () Bool)

(declare-fun res!1037581 () Bool)

(assert (=> b!1517681 (=> (not res!1037581) (not e!846720))))

(declare-datatypes ((List!35274 0))(
  ( (Nil!35271) (Cons!35270 (h!36682 (_ BitVec 64)) (t!49968 List!35274)) )
))
(declare-fun arrayNoDuplicates!0 (array!101108 (_ BitVec 32) List!35274) Bool)

(assert (=> b!1517681 (= res!1037581 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35271))))

(assert (= (and start!129252 res!1037580) b!1517672))

(assert (= (and b!1517672 res!1037576) b!1517676))

(assert (= (and b!1517676 res!1037573) b!1517680))

(assert (= (and b!1517680 res!1037578) b!1517673))

(assert (= (and b!1517673 res!1037579) b!1517681))

(assert (= (and b!1517681 res!1037581) b!1517674))

(assert (= (and b!1517674 res!1037582) b!1517679))

(assert (= (and b!1517679 res!1037583) b!1517675))

(assert (= (and b!1517675 res!1037575) b!1517669))

(assert (= (and b!1517669 res!1037572) b!1517678))

(assert (= (and b!1517678 res!1037584) b!1517671))

(assert (= (and b!1517678 (not res!1037577)) b!1517677))

(assert (= (and b!1517677 (not res!1037574)) b!1517670))

(declare-fun m!1400965 () Bool)

(assert (=> b!1517675 m!1400965))

(assert (=> b!1517675 m!1400965))

(declare-fun m!1400967 () Bool)

(assert (=> b!1517675 m!1400967))

(declare-fun m!1400969 () Bool)

(assert (=> start!129252 m!1400969))

(declare-fun m!1400971 () Bool)

(assert (=> start!129252 m!1400971))

(assert (=> b!1517671 m!1400965))

(assert (=> b!1517671 m!1400965))

(declare-fun m!1400973 () Bool)

(assert (=> b!1517671 m!1400973))

(declare-fun m!1400975 () Bool)

(assert (=> b!1517673 m!1400975))

(declare-fun m!1400977 () Bool)

(assert (=> b!1517681 m!1400977))

(declare-fun m!1400979 () Bool)

(assert (=> b!1517677 m!1400979))

(declare-fun m!1400981 () Bool)

(assert (=> b!1517676 m!1400981))

(assert (=> b!1517676 m!1400981))

(declare-fun m!1400983 () Bool)

(assert (=> b!1517676 m!1400983))

(assert (=> b!1517670 m!1400965))

(assert (=> b!1517670 m!1400965))

(declare-fun m!1400985 () Bool)

(assert (=> b!1517670 m!1400985))

(assert (=> b!1517679 m!1400965))

(assert (=> b!1517679 m!1400965))

(declare-fun m!1400987 () Bool)

(assert (=> b!1517679 m!1400987))

(assert (=> b!1517679 m!1400987))

(assert (=> b!1517679 m!1400965))

(declare-fun m!1400989 () Bool)

(assert (=> b!1517679 m!1400989))

(declare-fun m!1400991 () Bool)

(assert (=> b!1517669 m!1400991))

(declare-fun m!1400993 () Bool)

(assert (=> b!1517669 m!1400993))

(assert (=> b!1517669 m!1400993))

(declare-fun m!1400995 () Bool)

(assert (=> b!1517669 m!1400995))

(assert (=> b!1517669 m!1400995))

(assert (=> b!1517669 m!1400993))

(declare-fun m!1400997 () Bool)

(assert (=> b!1517669 m!1400997))

(assert (=> b!1517678 m!1400965))

(declare-fun m!1400999 () Bool)

(assert (=> b!1517678 m!1400999))

(assert (=> b!1517678 m!1400991))

(assert (=> b!1517678 m!1400993))

(declare-fun m!1401001 () Bool)

(assert (=> b!1517678 m!1401001))

(assert (=> b!1517680 m!1400965))

(assert (=> b!1517680 m!1400965))

(declare-fun m!1401003 () Bool)

(assert (=> b!1517680 m!1401003))

(push 1)

