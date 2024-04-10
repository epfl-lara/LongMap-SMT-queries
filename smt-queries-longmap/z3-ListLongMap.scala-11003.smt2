; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128852 () Bool)

(assert start!128852)

(declare-fun b!1510039 () Bool)

(declare-fun res!1029948 () Bool)

(declare-fun e!843307 () Bool)

(assert (=> b!1510039 (=> (not res!1029948) (not e!843307))))

(declare-datatypes ((array!100708 0))(
  ( (array!100709 (arr!48591 (Array (_ BitVec 32) (_ BitVec 64))) (size!49141 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100708)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100708 (_ BitVec 32)) Bool)

(assert (=> b!1510039 (= res!1029948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510040 () Bool)

(declare-fun res!1029951 () Bool)

(declare-fun e!843308 () Bool)

(assert (=> b!1510040 (=> (not res!1029951) (not e!843308))))

(declare-datatypes ((SeekEntryResult!12762 0))(
  ( (MissingZero!12762 (index!53443 (_ BitVec 32))) (Found!12762 (index!53444 (_ BitVec 32))) (Intermediate!12762 (undefined!13574 Bool) (index!53445 (_ BitVec 32)) (x!135192 (_ BitVec 32))) (Undefined!12762) (MissingVacant!12762 (index!53446 (_ BitVec 32))) )
))
(declare-fun lt!655063 () SeekEntryResult!12762)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100708 (_ BitVec 32)) SeekEntryResult!12762)

(assert (=> b!1510040 (= res!1029951 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48591 a!2804) j!70) a!2804 mask!2512) lt!655063))))

(declare-fun b!1510041 () Bool)

(assert (=> b!1510041 (= e!843307 e!843308)))

(declare-fun res!1029949 () Bool)

(assert (=> b!1510041 (=> (not res!1029949) (not e!843308))))

(declare-fun lt!655062 () SeekEntryResult!12762)

(assert (=> b!1510041 (= res!1029949 (= lt!655062 lt!655063))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510041 (= lt!655063 (Intermediate!12762 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510041 (= lt!655062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48591 a!2804) j!70) mask!2512) (select (arr!48591 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510042 () Bool)

(assert (=> b!1510042 (= e!843308 (not true))))

(declare-fun e!843310 () Bool)

(assert (=> b!1510042 e!843310))

(declare-fun res!1029943 () Bool)

(assert (=> b!1510042 (=> (not res!1029943) (not e!843310))))

(assert (=> b!1510042 (= res!1029943 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50392 0))(
  ( (Unit!50393) )
))
(declare-fun lt!655061 () Unit!50392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50392)

(assert (=> b!1510042 (= lt!655061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1029946 () Bool)

(assert (=> start!128852 (=> (not res!1029946) (not e!843307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128852 (= res!1029946 (validMask!0 mask!2512))))

(assert (=> start!128852 e!843307))

(assert (=> start!128852 true))

(declare-fun array_inv!37619 (array!100708) Bool)

(assert (=> start!128852 (array_inv!37619 a!2804)))

(declare-fun b!1510043 () Bool)

(declare-fun res!1029950 () Bool)

(assert (=> b!1510043 (=> (not res!1029950) (not e!843307))))

(assert (=> b!1510043 (= res!1029950 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49141 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49141 a!2804))))))

(declare-fun b!1510044 () Bool)

(declare-fun res!1029952 () Bool)

(assert (=> b!1510044 (=> (not res!1029952) (not e!843307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510044 (= res!1029952 (validKeyInArray!0 (select (arr!48591 a!2804) j!70)))))

(declare-fun b!1510045 () Bool)

(declare-fun res!1029944 () Bool)

(assert (=> b!1510045 (=> (not res!1029944) (not e!843307))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510045 (= res!1029944 (validKeyInArray!0 (select (arr!48591 a!2804) i!961)))))

(declare-fun b!1510046 () Bool)

(declare-fun res!1029945 () Bool)

(assert (=> b!1510046 (=> (not res!1029945) (not e!843307))))

(declare-datatypes ((List!35074 0))(
  ( (Nil!35071) (Cons!35070 (h!36482 (_ BitVec 64)) (t!49768 List!35074)) )
))
(declare-fun arrayNoDuplicates!0 (array!100708 (_ BitVec 32) List!35074) Bool)

(assert (=> b!1510046 (= res!1029945 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35071))))

(declare-fun b!1510047 () Bool)

(declare-fun res!1029942 () Bool)

(assert (=> b!1510047 (=> (not res!1029942) (not e!843307))))

(assert (=> b!1510047 (= res!1029942 (and (= (size!49141 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49141 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49141 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510048 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100708 (_ BitVec 32)) SeekEntryResult!12762)

(assert (=> b!1510048 (= e!843310 (= (seekEntry!0 (select (arr!48591 a!2804) j!70) a!2804 mask!2512) (Found!12762 j!70)))))

(declare-fun b!1510049 () Bool)

(declare-fun res!1029947 () Bool)

(assert (=> b!1510049 (=> (not res!1029947) (not e!843308))))

(assert (=> b!1510049 (= res!1029947 (= lt!655062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48591 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48591 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100709 (store (arr!48591 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49141 a!2804)) mask!2512)))))

(assert (= (and start!128852 res!1029946) b!1510047))

(assert (= (and b!1510047 res!1029942) b!1510045))

(assert (= (and b!1510045 res!1029944) b!1510044))

(assert (= (and b!1510044 res!1029952) b!1510039))

(assert (= (and b!1510039 res!1029948) b!1510046))

(assert (= (and b!1510046 res!1029945) b!1510043))

(assert (= (and b!1510043 res!1029950) b!1510041))

(assert (= (and b!1510041 res!1029949) b!1510040))

(assert (= (and b!1510040 res!1029951) b!1510049))

(assert (= (and b!1510049 res!1029947) b!1510042))

(assert (= (and b!1510042 res!1029943) b!1510048))

(declare-fun m!1392583 () Bool)

(assert (=> b!1510042 m!1392583))

(declare-fun m!1392585 () Bool)

(assert (=> b!1510042 m!1392585))

(declare-fun m!1392587 () Bool)

(assert (=> b!1510041 m!1392587))

(assert (=> b!1510041 m!1392587))

(declare-fun m!1392589 () Bool)

(assert (=> b!1510041 m!1392589))

(assert (=> b!1510041 m!1392589))

(assert (=> b!1510041 m!1392587))

(declare-fun m!1392591 () Bool)

(assert (=> b!1510041 m!1392591))

(declare-fun m!1392593 () Bool)

(assert (=> b!1510045 m!1392593))

(assert (=> b!1510045 m!1392593))

(declare-fun m!1392595 () Bool)

(assert (=> b!1510045 m!1392595))

(assert (=> b!1510040 m!1392587))

(assert (=> b!1510040 m!1392587))

(declare-fun m!1392597 () Bool)

(assert (=> b!1510040 m!1392597))

(assert (=> b!1510044 m!1392587))

(assert (=> b!1510044 m!1392587))

(declare-fun m!1392599 () Bool)

(assert (=> b!1510044 m!1392599))

(declare-fun m!1392601 () Bool)

(assert (=> start!128852 m!1392601))

(declare-fun m!1392603 () Bool)

(assert (=> start!128852 m!1392603))

(assert (=> b!1510048 m!1392587))

(assert (=> b!1510048 m!1392587))

(declare-fun m!1392605 () Bool)

(assert (=> b!1510048 m!1392605))

(declare-fun m!1392607 () Bool)

(assert (=> b!1510046 m!1392607))

(declare-fun m!1392609 () Bool)

(assert (=> b!1510039 m!1392609))

(declare-fun m!1392611 () Bool)

(assert (=> b!1510049 m!1392611))

(declare-fun m!1392613 () Bool)

(assert (=> b!1510049 m!1392613))

(assert (=> b!1510049 m!1392613))

(declare-fun m!1392615 () Bool)

(assert (=> b!1510049 m!1392615))

(assert (=> b!1510049 m!1392615))

(assert (=> b!1510049 m!1392613))

(declare-fun m!1392617 () Bool)

(assert (=> b!1510049 m!1392617))

(check-sat (not b!1510040) (not b!1510042) (not b!1510044) (not b!1510039) (not b!1510041) (not b!1510045) (not start!128852) (not b!1510048) (not b!1510049) (not b!1510046))
(check-sat)
