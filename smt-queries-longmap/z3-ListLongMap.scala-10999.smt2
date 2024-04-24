; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129128 () Bool)

(assert start!129128)

(declare-fun b!1511442 () Bool)

(declare-fun res!1030172 () Bool)

(declare-fun e!844289 () Bool)

(assert (=> b!1511442 (=> (not res!1030172) (not e!844289))))

(declare-datatypes ((array!100798 0))(
  ( (array!100799 (arr!48631 (Array (_ BitVec 32) (_ BitVec 64))) (size!49182 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100798)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511442 (= res!1030172 (validKeyInArray!0 (select (arr!48631 a!2804) j!70)))))

(declare-fun b!1511443 () Bool)

(declare-fun res!1030178 () Bool)

(declare-fun e!844288 () Bool)

(assert (=> b!1511443 (=> (not res!1030178) (not e!844288))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12695 0))(
  ( (MissingZero!12695 (index!53175 (_ BitVec 32))) (Found!12695 (index!53176 (_ BitVec 32))) (Intermediate!12695 (undefined!13507 Bool) (index!53177 (_ BitVec 32)) (x!135130 (_ BitVec 32))) (Undefined!12695) (MissingVacant!12695 (index!53178 (_ BitVec 32))) )
))
(declare-fun lt!655608 () SeekEntryResult!12695)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511443 (= res!1030178 (= lt!655608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100799 (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49182 a!2804)) mask!2512)))))

(declare-fun b!1511444 () Bool)

(declare-fun res!1030175 () Bool)

(assert (=> b!1511444 (=> (not res!1030175) (not e!844289))))

(assert (=> b!1511444 (= res!1030175 (and (= (size!49182 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49182 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49182 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511445 () Bool)

(declare-fun res!1030174 () Bool)

(assert (=> b!1511445 (=> (not res!1030174) (not e!844289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100798 (_ BitVec 32)) Bool)

(assert (=> b!1511445 (= res!1030174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511446 () Bool)

(declare-fun e!844287 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12695)

(assert (=> b!1511446 (= e!844287 (= (seekEntry!0 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) (Found!12695 j!70)))))

(declare-fun b!1511447 () Bool)

(assert (=> b!1511447 (= e!844288 (not true))))

(assert (=> b!1511447 e!844287))

(declare-fun res!1030169 () Bool)

(assert (=> b!1511447 (=> (not res!1030169) (not e!844287))))

(assert (=> b!1511447 (= res!1030169 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50293 0))(
  ( (Unit!50294) )
))
(declare-fun lt!655607 () Unit!50293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50293)

(assert (=> b!1511447 (= lt!655607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511449 () Bool)

(declare-fun res!1030171 () Bool)

(assert (=> b!1511449 (=> (not res!1030171) (not e!844289))))

(declare-datatypes ((List!35101 0))(
  ( (Nil!35098) (Cons!35097 (h!36524 (_ BitVec 64)) (t!49787 List!35101)) )
))
(declare-fun arrayNoDuplicates!0 (array!100798 (_ BitVec 32) List!35101) Bool)

(assert (=> b!1511449 (= res!1030171 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35098))))

(declare-fun b!1511450 () Bool)

(declare-fun res!1030170 () Bool)

(assert (=> b!1511450 (=> (not res!1030170) (not e!844289))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511450 (= res!1030170 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49182 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49182 a!2804))))))

(declare-fun b!1511451 () Bool)

(declare-fun res!1030173 () Bool)

(assert (=> b!1511451 (=> (not res!1030173) (not e!844288))))

(declare-fun lt!655609 () SeekEntryResult!12695)

(assert (=> b!1511451 (= res!1030173 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) lt!655609))))

(declare-fun b!1511452 () Bool)

(declare-fun res!1030168 () Bool)

(assert (=> b!1511452 (=> (not res!1030168) (not e!844289))))

(assert (=> b!1511452 (= res!1030168 (validKeyInArray!0 (select (arr!48631 a!2804) i!961)))))

(declare-fun b!1511448 () Bool)

(assert (=> b!1511448 (= e!844289 e!844288)))

(declare-fun res!1030177 () Bool)

(assert (=> b!1511448 (=> (not res!1030177) (not e!844288))))

(assert (=> b!1511448 (= res!1030177 (= lt!655608 lt!655609))))

(assert (=> b!1511448 (= lt!655609 (Intermediate!12695 false resIndex!21 resX!21))))

(assert (=> b!1511448 (= lt!655608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48631 a!2804) j!70) mask!2512) (select (arr!48631 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1030176 () Bool)

(assert (=> start!129128 (=> (not res!1030176) (not e!844289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129128 (= res!1030176 (validMask!0 mask!2512))))

(assert (=> start!129128 e!844289))

(assert (=> start!129128 true))

(declare-fun array_inv!37912 (array!100798) Bool)

(assert (=> start!129128 (array_inv!37912 a!2804)))

(assert (= (and start!129128 res!1030176) b!1511444))

(assert (= (and b!1511444 res!1030175) b!1511452))

(assert (= (and b!1511452 res!1030168) b!1511442))

(assert (= (and b!1511442 res!1030172) b!1511445))

(assert (= (and b!1511445 res!1030174) b!1511449))

(assert (= (and b!1511449 res!1030171) b!1511450))

(assert (= (and b!1511450 res!1030170) b!1511448))

(assert (= (and b!1511448 res!1030177) b!1511451))

(assert (= (and b!1511451 res!1030173) b!1511443))

(assert (= (and b!1511443 res!1030178) b!1511447))

(assert (= (and b!1511447 res!1030169) b!1511446))

(declare-fun m!1393905 () Bool)

(assert (=> b!1511445 m!1393905))

(declare-fun m!1393907 () Bool)

(assert (=> b!1511452 m!1393907))

(assert (=> b!1511452 m!1393907))

(declare-fun m!1393909 () Bool)

(assert (=> b!1511452 m!1393909))

(declare-fun m!1393911 () Bool)

(assert (=> b!1511447 m!1393911))

(declare-fun m!1393913 () Bool)

(assert (=> b!1511447 m!1393913))

(declare-fun m!1393915 () Bool)

(assert (=> b!1511442 m!1393915))

(assert (=> b!1511442 m!1393915))

(declare-fun m!1393917 () Bool)

(assert (=> b!1511442 m!1393917))

(assert (=> b!1511446 m!1393915))

(assert (=> b!1511446 m!1393915))

(declare-fun m!1393919 () Bool)

(assert (=> b!1511446 m!1393919))

(assert (=> b!1511448 m!1393915))

(assert (=> b!1511448 m!1393915))

(declare-fun m!1393921 () Bool)

(assert (=> b!1511448 m!1393921))

(assert (=> b!1511448 m!1393921))

(assert (=> b!1511448 m!1393915))

(declare-fun m!1393923 () Bool)

(assert (=> b!1511448 m!1393923))

(declare-fun m!1393925 () Bool)

(assert (=> start!129128 m!1393925))

(declare-fun m!1393927 () Bool)

(assert (=> start!129128 m!1393927))

(declare-fun m!1393929 () Bool)

(assert (=> b!1511449 m!1393929))

(declare-fun m!1393931 () Bool)

(assert (=> b!1511443 m!1393931))

(declare-fun m!1393933 () Bool)

(assert (=> b!1511443 m!1393933))

(assert (=> b!1511443 m!1393933))

(declare-fun m!1393935 () Bool)

(assert (=> b!1511443 m!1393935))

(assert (=> b!1511443 m!1393935))

(assert (=> b!1511443 m!1393933))

(declare-fun m!1393937 () Bool)

(assert (=> b!1511443 m!1393937))

(assert (=> b!1511451 m!1393915))

(assert (=> b!1511451 m!1393915))

(declare-fun m!1393939 () Bool)

(assert (=> b!1511451 m!1393939))

(check-sat (not start!129128) (not b!1511445) (not b!1511448) (not b!1511442) (not b!1511452) (not b!1511451) (not b!1511443) (not b!1511447) (not b!1511446) (not b!1511449))
(check-sat)
