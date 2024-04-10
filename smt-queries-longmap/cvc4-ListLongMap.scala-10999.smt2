; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128830 () Bool)

(assert start!128830)

(declare-fun b!1509676 () Bool)

(declare-fun res!1029587 () Bool)

(declare-fun e!843175 () Bool)

(assert (=> b!1509676 (=> (not res!1029587) (not e!843175))))

(declare-datatypes ((array!100686 0))(
  ( (array!100687 (arr!48580 (Array (_ BitVec 32) (_ BitVec 64))) (size!49130 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100686)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100686 (_ BitVec 32)) Bool)

(assert (=> b!1509676 (= res!1029587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!843178 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1509677 () Bool)

(declare-datatypes ((SeekEntryResult!12751 0))(
  ( (MissingZero!12751 (index!53399 (_ BitVec 32))) (Found!12751 (index!53400 (_ BitVec 32))) (Intermediate!12751 (undefined!13563 Bool) (index!53401 (_ BitVec 32)) (x!135149 (_ BitVec 32))) (Undefined!12751) (MissingVacant!12751 (index!53402 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100686 (_ BitVec 32)) SeekEntryResult!12751)

(assert (=> b!1509677 (= e!843178 (= (seekEntry!0 (select (arr!48580 a!2804) j!70) a!2804 mask!2512) (Found!12751 j!70)))))

(declare-fun res!1029582 () Bool)

(assert (=> start!128830 (=> (not res!1029582) (not e!843175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128830 (= res!1029582 (validMask!0 mask!2512))))

(assert (=> start!128830 e!843175))

(assert (=> start!128830 true))

(declare-fun array_inv!37608 (array!100686) Bool)

(assert (=> start!128830 (array_inv!37608 a!2804)))

(declare-fun b!1509678 () Bool)

(declare-fun res!1029583 () Bool)

(declare-fun e!843177 () Bool)

(assert (=> b!1509678 (=> (not res!1029583) (not e!843177))))

(declare-fun lt!654962 () SeekEntryResult!12751)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100686 (_ BitVec 32)) SeekEntryResult!12751)

(assert (=> b!1509678 (= res!1029583 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48580 a!2804) j!70) a!2804 mask!2512) lt!654962))))

(declare-fun b!1509679 () Bool)

(declare-fun res!1029585 () Bool)

(assert (=> b!1509679 (=> (not res!1029585) (not e!843177))))

(declare-fun lt!654964 () SeekEntryResult!12751)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509679 (= res!1029585 (= lt!654964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100687 (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49130 a!2804)) mask!2512)))))

(declare-fun b!1509680 () Bool)

(declare-fun res!1029588 () Bool)

(assert (=> b!1509680 (=> (not res!1029588) (not e!843175))))

(assert (=> b!1509680 (= res!1029588 (and (= (size!49130 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49130 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49130 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509681 () Bool)

(declare-fun res!1029586 () Bool)

(assert (=> b!1509681 (=> (not res!1029586) (not e!843175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509681 (= res!1029586 (validKeyInArray!0 (select (arr!48580 a!2804) j!70)))))

(declare-fun b!1509682 () Bool)

(declare-fun res!1029584 () Bool)

(assert (=> b!1509682 (=> (not res!1029584) (not e!843175))))

(declare-datatypes ((List!35063 0))(
  ( (Nil!35060) (Cons!35059 (h!36471 (_ BitVec 64)) (t!49757 List!35063)) )
))
(declare-fun arrayNoDuplicates!0 (array!100686 (_ BitVec 32) List!35063) Bool)

(assert (=> b!1509682 (= res!1029584 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35060))))

(declare-fun b!1509683 () Bool)

(declare-fun res!1029581 () Bool)

(assert (=> b!1509683 (=> (not res!1029581) (not e!843175))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509683 (= res!1029581 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49130 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49130 a!2804))))))

(declare-fun b!1509684 () Bool)

(assert (=> b!1509684 (= e!843175 e!843177)))

(declare-fun res!1029579 () Bool)

(assert (=> b!1509684 (=> (not res!1029579) (not e!843177))))

(assert (=> b!1509684 (= res!1029579 (= lt!654964 lt!654962))))

(assert (=> b!1509684 (= lt!654962 (Intermediate!12751 false resIndex!21 resX!21))))

(assert (=> b!1509684 (= lt!654964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48580 a!2804) j!70) mask!2512) (select (arr!48580 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509685 () Bool)

(assert (=> b!1509685 (= e!843177 (not true))))

(assert (=> b!1509685 e!843178))

(declare-fun res!1029589 () Bool)

(assert (=> b!1509685 (=> (not res!1029589) (not e!843178))))

(assert (=> b!1509685 (= res!1029589 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50370 0))(
  ( (Unit!50371) )
))
(declare-fun lt!654963 () Unit!50370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50370)

(assert (=> b!1509685 (= lt!654963 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509686 () Bool)

(declare-fun res!1029580 () Bool)

(assert (=> b!1509686 (=> (not res!1029580) (not e!843175))))

(assert (=> b!1509686 (= res!1029580 (validKeyInArray!0 (select (arr!48580 a!2804) i!961)))))

(assert (= (and start!128830 res!1029582) b!1509680))

(assert (= (and b!1509680 res!1029588) b!1509686))

(assert (= (and b!1509686 res!1029580) b!1509681))

(assert (= (and b!1509681 res!1029586) b!1509676))

(assert (= (and b!1509676 res!1029587) b!1509682))

(assert (= (and b!1509682 res!1029584) b!1509683))

(assert (= (and b!1509683 res!1029581) b!1509684))

(assert (= (and b!1509684 res!1029579) b!1509678))

(assert (= (and b!1509678 res!1029583) b!1509679))

(assert (= (and b!1509679 res!1029585) b!1509685))

(assert (= (and b!1509685 res!1029589) b!1509677))

(declare-fun m!1392181 () Bool)

(assert (=> b!1509686 m!1392181))

(assert (=> b!1509686 m!1392181))

(declare-fun m!1392183 () Bool)

(assert (=> b!1509686 m!1392183))

(declare-fun m!1392185 () Bool)

(assert (=> b!1509677 m!1392185))

(assert (=> b!1509677 m!1392185))

(declare-fun m!1392187 () Bool)

(assert (=> b!1509677 m!1392187))

(declare-fun m!1392189 () Bool)

(assert (=> b!1509679 m!1392189))

(declare-fun m!1392191 () Bool)

(assert (=> b!1509679 m!1392191))

(assert (=> b!1509679 m!1392191))

(declare-fun m!1392193 () Bool)

(assert (=> b!1509679 m!1392193))

(assert (=> b!1509679 m!1392193))

(assert (=> b!1509679 m!1392191))

(declare-fun m!1392195 () Bool)

(assert (=> b!1509679 m!1392195))

(declare-fun m!1392197 () Bool)

(assert (=> b!1509685 m!1392197))

(declare-fun m!1392199 () Bool)

(assert (=> b!1509685 m!1392199))

(declare-fun m!1392201 () Bool)

(assert (=> start!128830 m!1392201))

(declare-fun m!1392203 () Bool)

(assert (=> start!128830 m!1392203))

(declare-fun m!1392205 () Bool)

(assert (=> b!1509676 m!1392205))

(assert (=> b!1509678 m!1392185))

(assert (=> b!1509678 m!1392185))

(declare-fun m!1392207 () Bool)

(assert (=> b!1509678 m!1392207))

(declare-fun m!1392209 () Bool)

(assert (=> b!1509682 m!1392209))

(assert (=> b!1509684 m!1392185))

(assert (=> b!1509684 m!1392185))

(declare-fun m!1392211 () Bool)

(assert (=> b!1509684 m!1392211))

(assert (=> b!1509684 m!1392211))

(assert (=> b!1509684 m!1392185))

(declare-fun m!1392213 () Bool)

(assert (=> b!1509684 m!1392213))

(assert (=> b!1509681 m!1392185))

(assert (=> b!1509681 m!1392185))

(declare-fun m!1392215 () Bool)

(assert (=> b!1509681 m!1392215))

(push 1)

(assert (not b!1509685))

(assert (not b!1509681))

(assert (not b!1509677))

(assert (not b!1509686))

(assert (not b!1509682))

(assert (not b!1509679))

(assert (not b!1509676))

(assert (not b!1509678))

(assert (not start!128830))

(assert (not b!1509684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

