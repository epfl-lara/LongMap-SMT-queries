; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129152 () Bool)

(assert start!129152)

(declare-fun e!844432 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100822 0))(
  ( (array!100823 (arr!48643 (Array (_ BitVec 32) (_ BitVec 64))) (size!49194 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100822)

(declare-fun b!1511838 () Bool)

(declare-datatypes ((SeekEntryResult!12707 0))(
  ( (MissingZero!12707 (index!53223 (_ BitVec 32))) (Found!12707 (index!53224 (_ BitVec 32))) (Intermediate!12707 (undefined!13519 Bool) (index!53225 (_ BitVec 32)) (x!135174 (_ BitVec 32))) (Undefined!12707) (MissingVacant!12707 (index!53226 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12707)

(assert (=> b!1511838 (= e!844432 (= (seekEntry!0 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) (Found!12707 j!70)))))

(declare-fun b!1511839 () Bool)

(declare-fun res!1030565 () Bool)

(declare-fun e!844433 () Bool)

(assert (=> b!1511839 (=> (not res!1030565) (not e!844433))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511839 (= res!1030565 (validKeyInArray!0 (select (arr!48643 a!2804) i!961)))))

(declare-fun b!1511840 () Bool)

(declare-fun res!1030573 () Bool)

(declare-fun e!844431 () Bool)

(assert (=> b!1511840 (=> (not res!1030573) (not e!844431))))

(declare-fun lt!655716 () SeekEntryResult!12707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511840 (= res!1030573 (= lt!655716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100823 (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49194 a!2804)) mask!2512)))))

(declare-fun b!1511841 () Bool)

(declare-fun res!1030568 () Bool)

(assert (=> b!1511841 (=> (not res!1030568) (not e!844433))))

(assert (=> b!1511841 (= res!1030568 (validKeyInArray!0 (select (arr!48643 a!2804) j!70)))))

(declare-fun b!1511842 () Bool)

(declare-fun res!1030572 () Bool)

(assert (=> b!1511842 (=> (not res!1030572) (not e!844433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100822 (_ BitVec 32)) Bool)

(assert (=> b!1511842 (= res!1030572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511843 () Bool)

(assert (=> b!1511843 (= e!844433 e!844431)))

(declare-fun res!1030564 () Bool)

(assert (=> b!1511843 (=> (not res!1030564) (not e!844431))))

(declare-fun lt!655715 () SeekEntryResult!12707)

(assert (=> b!1511843 (= res!1030564 (= lt!655716 lt!655715))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511843 (= lt!655715 (Intermediate!12707 false resIndex!21 resX!21))))

(assert (=> b!1511843 (= lt!655716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48643 a!2804) j!70) mask!2512) (select (arr!48643 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511844 () Bool)

(declare-fun res!1030569 () Bool)

(assert (=> b!1511844 (=> (not res!1030569) (not e!844431))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511844 (= res!1030569 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) lt!655715))))

(declare-fun b!1511845 () Bool)

(declare-fun res!1030570 () Bool)

(assert (=> b!1511845 (=> (not res!1030570) (not e!844433))))

(declare-datatypes ((List!35113 0))(
  ( (Nil!35110) (Cons!35109 (h!36536 (_ BitVec 64)) (t!49799 List!35113)) )
))
(declare-fun arrayNoDuplicates!0 (array!100822 (_ BitVec 32) List!35113) Bool)

(assert (=> b!1511845 (= res!1030570 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35110))))

(declare-fun b!1511846 () Bool)

(assert (=> b!1511846 (= e!844431 (not true))))

(assert (=> b!1511846 e!844432))

(declare-fun res!1030574 () Bool)

(assert (=> b!1511846 (=> (not res!1030574) (not e!844432))))

(assert (=> b!1511846 (= res!1030574 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50317 0))(
  ( (Unit!50318) )
))
(declare-fun lt!655717 () Unit!50317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50317)

(assert (=> b!1511846 (= lt!655717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1030571 () Bool)

(assert (=> start!129152 (=> (not res!1030571) (not e!844433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129152 (= res!1030571 (validMask!0 mask!2512))))

(assert (=> start!129152 e!844433))

(assert (=> start!129152 true))

(declare-fun array_inv!37924 (array!100822) Bool)

(assert (=> start!129152 (array_inv!37924 a!2804)))

(declare-fun b!1511847 () Bool)

(declare-fun res!1030566 () Bool)

(assert (=> b!1511847 (=> (not res!1030566) (not e!844433))))

(assert (=> b!1511847 (= res!1030566 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49194 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49194 a!2804))))))

(declare-fun b!1511848 () Bool)

(declare-fun res!1030567 () Bool)

(assert (=> b!1511848 (=> (not res!1030567) (not e!844433))))

(assert (=> b!1511848 (= res!1030567 (and (= (size!49194 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49194 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49194 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129152 res!1030571) b!1511848))

(assert (= (and b!1511848 res!1030567) b!1511839))

(assert (= (and b!1511839 res!1030565) b!1511841))

(assert (= (and b!1511841 res!1030568) b!1511842))

(assert (= (and b!1511842 res!1030572) b!1511845))

(assert (= (and b!1511845 res!1030570) b!1511847))

(assert (= (and b!1511847 res!1030566) b!1511843))

(assert (= (and b!1511843 res!1030564) b!1511844))

(assert (= (and b!1511844 res!1030569) b!1511840))

(assert (= (and b!1511840 res!1030573) b!1511846))

(assert (= (and b!1511846 res!1030574) b!1511838))

(declare-fun m!1394343 () Bool)

(assert (=> b!1511842 m!1394343))

(declare-fun m!1394345 () Bool)

(assert (=> b!1511838 m!1394345))

(assert (=> b!1511838 m!1394345))

(declare-fun m!1394347 () Bool)

(assert (=> b!1511838 m!1394347))

(declare-fun m!1394349 () Bool)

(assert (=> b!1511845 m!1394349))

(assert (=> b!1511843 m!1394345))

(assert (=> b!1511843 m!1394345))

(declare-fun m!1394351 () Bool)

(assert (=> b!1511843 m!1394351))

(assert (=> b!1511843 m!1394351))

(assert (=> b!1511843 m!1394345))

(declare-fun m!1394353 () Bool)

(assert (=> b!1511843 m!1394353))

(assert (=> b!1511841 m!1394345))

(assert (=> b!1511841 m!1394345))

(declare-fun m!1394355 () Bool)

(assert (=> b!1511841 m!1394355))

(declare-fun m!1394357 () Bool)

(assert (=> start!129152 m!1394357))

(declare-fun m!1394359 () Bool)

(assert (=> start!129152 m!1394359))

(declare-fun m!1394361 () Bool)

(assert (=> b!1511846 m!1394361))

(declare-fun m!1394363 () Bool)

(assert (=> b!1511846 m!1394363))

(assert (=> b!1511844 m!1394345))

(assert (=> b!1511844 m!1394345))

(declare-fun m!1394365 () Bool)

(assert (=> b!1511844 m!1394365))

(declare-fun m!1394367 () Bool)

(assert (=> b!1511839 m!1394367))

(assert (=> b!1511839 m!1394367))

(declare-fun m!1394369 () Bool)

(assert (=> b!1511839 m!1394369))

(declare-fun m!1394371 () Bool)

(assert (=> b!1511840 m!1394371))

(declare-fun m!1394373 () Bool)

(assert (=> b!1511840 m!1394373))

(assert (=> b!1511840 m!1394373))

(declare-fun m!1394375 () Bool)

(assert (=> b!1511840 m!1394375))

(assert (=> b!1511840 m!1394375))

(assert (=> b!1511840 m!1394373))

(declare-fun m!1394377 () Bool)

(assert (=> b!1511840 m!1394377))

(check-sat (not b!1511843) (not b!1511844) (not b!1511838) (not b!1511845) (not start!129152) (not b!1511840) (not b!1511841) (not b!1511842) (not b!1511839) (not b!1511846))
(check-sat)
