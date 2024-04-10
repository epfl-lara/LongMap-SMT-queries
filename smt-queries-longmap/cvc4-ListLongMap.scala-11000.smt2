; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128836 () Bool)

(assert start!128836)

(declare-fun res!1029685 () Bool)

(declare-fun e!843211 () Bool)

(assert (=> start!128836 (=> (not res!1029685) (not e!843211))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128836 (= res!1029685 (validMask!0 mask!2512))))

(assert (=> start!128836 e!843211))

(assert (=> start!128836 true))

(declare-datatypes ((array!100692 0))(
  ( (array!100693 (arr!48583 (Array (_ BitVec 32) (_ BitVec 64))) (size!49133 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100692)

(declare-fun array_inv!37611 (array!100692) Bool)

(assert (=> start!128836 (array_inv!37611 a!2804)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun b!1509775 () Bool)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!843212 () Bool)

(assert (=> b!1509775 (= e!843212 (not (or (not (= (select (arr!48583 a!2804) j!70) (select (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48583 a!2804) index!487) (select (arr!48583 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843214 () Bool)

(assert (=> b!1509775 e!843214))

(declare-fun res!1029680 () Bool)

(assert (=> b!1509775 (=> (not res!1029680) (not e!843214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100692 (_ BitVec 32)) Bool)

(assert (=> b!1509775 (= res!1029680 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50376 0))(
  ( (Unit!50377) )
))
(declare-fun lt!654991 () Unit!50376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50376)

(assert (=> b!1509775 (= lt!654991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509776 () Bool)

(declare-fun res!1029684 () Bool)

(assert (=> b!1509776 (=> (not res!1029684) (not e!843212))))

(declare-datatypes ((SeekEntryResult!12754 0))(
  ( (MissingZero!12754 (index!53411 (_ BitVec 32))) (Found!12754 (index!53412 (_ BitVec 32))) (Intermediate!12754 (undefined!13566 Bool) (index!53413 (_ BitVec 32)) (x!135160 (_ BitVec 32))) (Undefined!12754) (MissingVacant!12754 (index!53414 (_ BitVec 32))) )
))
(declare-fun lt!654989 () SeekEntryResult!12754)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100692 (_ BitVec 32)) SeekEntryResult!12754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509776 (= res!1029684 (= lt!654989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100693 (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49133 a!2804)) mask!2512)))))

(declare-fun b!1509777 () Bool)

(declare-fun res!1029682 () Bool)

(assert (=> b!1509777 (=> (not res!1029682) (not e!843212))))

(declare-fun lt!654990 () SeekEntryResult!12754)

(assert (=> b!1509777 (= res!1029682 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48583 a!2804) j!70) a!2804 mask!2512) lt!654990))))

(declare-fun b!1509778 () Bool)

(declare-fun res!1029681 () Bool)

(assert (=> b!1509778 (=> (not res!1029681) (not e!843211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509778 (= res!1029681 (validKeyInArray!0 (select (arr!48583 a!2804) j!70)))))

(declare-fun b!1509779 () Bool)

(declare-fun res!1029679 () Bool)

(assert (=> b!1509779 (=> (not res!1029679) (not e!843211))))

(assert (=> b!1509779 (= res!1029679 (and (= (size!49133 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49133 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49133 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509780 () Bool)

(declare-fun res!1029683 () Bool)

(assert (=> b!1509780 (=> (not res!1029683) (not e!843211))))

(declare-datatypes ((List!35066 0))(
  ( (Nil!35063) (Cons!35062 (h!36474 (_ BitVec 64)) (t!49760 List!35066)) )
))
(declare-fun arrayNoDuplicates!0 (array!100692 (_ BitVec 32) List!35066) Bool)

(assert (=> b!1509780 (= res!1029683 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35063))))

(declare-fun b!1509781 () Bool)

(assert (=> b!1509781 (= e!843211 e!843212)))

(declare-fun res!1029687 () Bool)

(assert (=> b!1509781 (=> (not res!1029687) (not e!843212))))

(assert (=> b!1509781 (= res!1029687 (= lt!654989 lt!654990))))

(assert (=> b!1509781 (= lt!654990 (Intermediate!12754 false resIndex!21 resX!21))))

(assert (=> b!1509781 (= lt!654989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48583 a!2804) j!70) mask!2512) (select (arr!48583 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509782 () Bool)

(declare-fun res!1029688 () Bool)

(assert (=> b!1509782 (=> (not res!1029688) (not e!843211))))

(assert (=> b!1509782 (= res!1029688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509783 () Bool)

(declare-fun res!1029686 () Bool)

(assert (=> b!1509783 (=> (not res!1029686) (not e!843211))))

(assert (=> b!1509783 (= res!1029686 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49133 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49133 a!2804))))))

(declare-fun b!1509784 () Bool)

(declare-fun res!1029678 () Bool)

(assert (=> b!1509784 (=> (not res!1029678) (not e!843211))))

(assert (=> b!1509784 (= res!1029678 (validKeyInArray!0 (select (arr!48583 a!2804) i!961)))))

(declare-fun b!1509785 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100692 (_ BitVec 32)) SeekEntryResult!12754)

(assert (=> b!1509785 (= e!843214 (= (seekEntry!0 (select (arr!48583 a!2804) j!70) a!2804 mask!2512) (Found!12754 j!70)))))

(assert (= (and start!128836 res!1029685) b!1509779))

(assert (= (and b!1509779 res!1029679) b!1509784))

(assert (= (and b!1509784 res!1029678) b!1509778))

(assert (= (and b!1509778 res!1029681) b!1509782))

(assert (= (and b!1509782 res!1029688) b!1509780))

(assert (= (and b!1509780 res!1029683) b!1509783))

(assert (= (and b!1509783 res!1029686) b!1509781))

(assert (= (and b!1509781 res!1029687) b!1509777))

(assert (= (and b!1509777 res!1029682) b!1509776))

(assert (= (and b!1509776 res!1029684) b!1509775))

(assert (= (and b!1509775 res!1029680) b!1509785))

(declare-fun m!1392293 () Bool)

(assert (=> b!1509775 m!1392293))

(declare-fun m!1392295 () Bool)

(assert (=> b!1509775 m!1392295))

(declare-fun m!1392297 () Bool)

(assert (=> b!1509775 m!1392297))

(declare-fun m!1392299 () Bool)

(assert (=> b!1509775 m!1392299))

(declare-fun m!1392301 () Bool)

(assert (=> b!1509775 m!1392301))

(declare-fun m!1392303 () Bool)

(assert (=> b!1509775 m!1392303))

(assert (=> b!1509776 m!1392297))

(assert (=> b!1509776 m!1392301))

(assert (=> b!1509776 m!1392301))

(declare-fun m!1392305 () Bool)

(assert (=> b!1509776 m!1392305))

(assert (=> b!1509776 m!1392305))

(assert (=> b!1509776 m!1392301))

(declare-fun m!1392307 () Bool)

(assert (=> b!1509776 m!1392307))

(declare-fun m!1392309 () Bool)

(assert (=> b!1509780 m!1392309))

(assert (=> b!1509785 m!1392293))

(assert (=> b!1509785 m!1392293))

(declare-fun m!1392311 () Bool)

(assert (=> b!1509785 m!1392311))

(assert (=> b!1509777 m!1392293))

(assert (=> b!1509777 m!1392293))

(declare-fun m!1392313 () Bool)

(assert (=> b!1509777 m!1392313))

(assert (=> b!1509781 m!1392293))

(assert (=> b!1509781 m!1392293))

(declare-fun m!1392315 () Bool)

(assert (=> b!1509781 m!1392315))

(assert (=> b!1509781 m!1392315))

(assert (=> b!1509781 m!1392293))

(declare-fun m!1392317 () Bool)

(assert (=> b!1509781 m!1392317))

(declare-fun m!1392319 () Bool)

(assert (=> b!1509782 m!1392319))

(declare-fun m!1392321 () Bool)

(assert (=> start!128836 m!1392321))

(declare-fun m!1392323 () Bool)

(assert (=> start!128836 m!1392323))

(declare-fun m!1392325 () Bool)

(assert (=> b!1509784 m!1392325))

(assert (=> b!1509784 m!1392325))

(declare-fun m!1392327 () Bool)

(assert (=> b!1509784 m!1392327))

(assert (=> b!1509778 m!1392293))

(assert (=> b!1509778 m!1392293))

(declare-fun m!1392329 () Bool)

(assert (=> b!1509778 m!1392329))

(push 1)

(assert (not b!1509778))

(assert (not b!1509775))

(assert (not b!1509784))

(assert (not b!1509781))

(assert (not start!128836))

(assert (not b!1509785))

(assert (not b!1509777))

(assert (not b!1509776))

(assert (not b!1509780))

(assert (not b!1509782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

