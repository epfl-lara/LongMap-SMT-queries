; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129260 () Bool)

(assert start!129260)

(declare-fun b!1513669 () Bool)

(declare-fun res!1032398 () Bool)

(declare-fun e!845109 () Bool)

(assert (=> b!1513669 (=> (not res!1032398) (not e!845109))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100930 0))(
  ( (array!100931 (arr!48697 (Array (_ BitVec 32) (_ BitVec 64))) (size!49248 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100930)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1513669 (= res!1032398 (and (= (size!49248 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49248 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49248 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513670 () Bool)

(declare-fun res!1032406 () Bool)

(assert (=> b!1513670 (=> (not res!1032406) (not e!845109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513670 (= res!1032406 (validKeyInArray!0 (select (arr!48697 a!2804) j!70)))))

(declare-fun res!1032402 () Bool)

(assert (=> start!129260 (=> (not res!1032402) (not e!845109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129260 (= res!1032402 (validMask!0 mask!2512))))

(assert (=> start!129260 e!845109))

(assert (=> start!129260 true))

(declare-fun array_inv!37978 (array!100930) Bool)

(assert (=> start!129260 (array_inv!37978 a!2804)))

(declare-fun b!1513671 () Bool)

(declare-fun res!1032404 () Bool)

(declare-fun e!845111 () Bool)

(assert (=> b!1513671 (=> (not res!1032404) (not e!845111))))

(declare-datatypes ((SeekEntryResult!12761 0))(
  ( (MissingZero!12761 (index!53439 (_ BitVec 32))) (Found!12761 (index!53440 (_ BitVec 32))) (Intermediate!12761 (undefined!13573 Bool) (index!53441 (_ BitVec 32)) (x!135372 (_ BitVec 32))) (Undefined!12761) (MissingVacant!12761 (index!53442 (_ BitVec 32))) )
))
(declare-fun lt!656201 () SeekEntryResult!12761)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12761)

(assert (=> b!1513671 (= res!1032404 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) lt!656201))))

(declare-fun b!1513672 () Bool)

(declare-fun res!1032395 () Bool)

(assert (=> b!1513672 (=> (not res!1032395) (not e!845109))))

(declare-datatypes ((List!35167 0))(
  ( (Nil!35164) (Cons!35163 (h!36590 (_ BitVec 64)) (t!49853 List!35167)) )
))
(declare-fun arrayNoDuplicates!0 (array!100930 (_ BitVec 32) List!35167) Bool)

(assert (=> b!1513672 (= res!1032395 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35164))))

(declare-fun b!1513673 () Bool)

(assert (=> b!1513673 (= e!845111 (not true))))

(declare-fun e!845108 () Bool)

(assert (=> b!1513673 e!845108))

(declare-fun res!1032407 () Bool)

(assert (=> b!1513673 (=> (not res!1032407) (not e!845108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100930 (_ BitVec 32)) Bool)

(assert (=> b!1513673 (= res!1032407 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50425 0))(
  ( (Unit!50426) )
))
(declare-fun lt!656202 () Unit!50425)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50425)

(assert (=> b!1513673 (= lt!656202 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513674 () Bool)

(declare-fun res!1032405 () Bool)

(assert (=> b!1513674 (=> (not res!1032405) (not e!845109))))

(assert (=> b!1513674 (= res!1032405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513675 () Bool)

(declare-fun res!1032401 () Bool)

(assert (=> b!1513675 (=> (not res!1032401) (not e!845109))))

(assert (=> b!1513675 (= res!1032401 (validKeyInArray!0 (select (arr!48697 a!2804) i!961)))))

(declare-fun b!1513676 () Bool)

(declare-fun res!1032396 () Bool)

(assert (=> b!1513676 (=> (not res!1032396) (not e!845109))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513676 (= res!1032396 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49248 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49248 a!2804))))))

(declare-fun b!1513677 () Bool)

(declare-fun res!1032399 () Bool)

(assert (=> b!1513677 (=> (not res!1032399) (not e!845108))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12761)

(assert (=> b!1513677 (= res!1032399 (= (seekEntry!0 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) (Found!12761 j!70)))))

(declare-fun b!1513678 () Bool)

(assert (=> b!1513678 (= e!845109 e!845111)))

(declare-fun res!1032403 () Bool)

(assert (=> b!1513678 (=> (not res!1032403) (not e!845111))))

(declare-fun lt!656203 () SeekEntryResult!12761)

(assert (=> b!1513678 (= res!1032403 (= lt!656203 lt!656201))))

(assert (=> b!1513678 (= lt!656201 (Intermediate!12761 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513678 (= lt!656203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48697 a!2804) j!70) mask!2512) (select (arr!48697 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513679 () Bool)

(declare-fun res!1032400 () Bool)

(assert (=> b!1513679 (=> (not res!1032400) (not e!845111))))

(assert (=> b!1513679 (= res!1032400 (= lt!656203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100931 (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49248 a!2804)) mask!2512)))))

(declare-fun b!1513680 () Bool)

(declare-fun e!845110 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12761)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12761)

(assert (=> b!1513680 (= e!845110 (= (seekEntryOrOpen!0 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48697 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513681 () Bool)

(assert (=> b!1513681 (= e!845108 e!845110)))

(declare-fun res!1032397 () Bool)

(assert (=> b!1513681 (=> res!1032397 e!845110)))

(assert (=> b!1513681 (= res!1032397 (or (not (= (select (arr!48697 a!2804) j!70) (select (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48697 a!2804) index!487) (select (arr!48697 a!2804) j!70)) (not (= (select (arr!48697 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129260 res!1032402) b!1513669))

(assert (= (and b!1513669 res!1032398) b!1513675))

(assert (= (and b!1513675 res!1032401) b!1513670))

(assert (= (and b!1513670 res!1032406) b!1513674))

(assert (= (and b!1513674 res!1032405) b!1513672))

(assert (= (and b!1513672 res!1032395) b!1513676))

(assert (= (and b!1513676 res!1032396) b!1513678))

(assert (= (and b!1513678 res!1032403) b!1513671))

(assert (= (and b!1513671 res!1032404) b!1513679))

(assert (= (and b!1513679 res!1032400) b!1513673))

(assert (= (and b!1513673 res!1032407) b!1513677))

(assert (= (and b!1513677 res!1032399) b!1513681))

(assert (= (and b!1513681 (not res!1032397)) b!1513680))

(declare-fun m!1396359 () Bool)

(assert (=> b!1513681 m!1396359))

(declare-fun m!1396361 () Bool)

(assert (=> b!1513681 m!1396361))

(declare-fun m!1396363 () Bool)

(assert (=> b!1513681 m!1396363))

(declare-fun m!1396365 () Bool)

(assert (=> b!1513681 m!1396365))

(declare-fun m!1396367 () Bool)

(assert (=> b!1513673 m!1396367))

(declare-fun m!1396369 () Bool)

(assert (=> b!1513673 m!1396369))

(assert (=> b!1513680 m!1396359))

(assert (=> b!1513680 m!1396359))

(declare-fun m!1396371 () Bool)

(assert (=> b!1513680 m!1396371))

(assert (=> b!1513680 m!1396359))

(declare-fun m!1396373 () Bool)

(assert (=> b!1513680 m!1396373))

(assert (=> b!1513671 m!1396359))

(assert (=> b!1513671 m!1396359))

(declare-fun m!1396375 () Bool)

(assert (=> b!1513671 m!1396375))

(assert (=> b!1513677 m!1396359))

(assert (=> b!1513677 m!1396359))

(declare-fun m!1396377 () Bool)

(assert (=> b!1513677 m!1396377))

(declare-fun m!1396379 () Bool)

(assert (=> b!1513674 m!1396379))

(assert (=> b!1513670 m!1396359))

(assert (=> b!1513670 m!1396359))

(declare-fun m!1396381 () Bool)

(assert (=> b!1513670 m!1396381))

(declare-fun m!1396383 () Bool)

(assert (=> b!1513672 m!1396383))

(assert (=> b!1513678 m!1396359))

(assert (=> b!1513678 m!1396359))

(declare-fun m!1396385 () Bool)

(assert (=> b!1513678 m!1396385))

(assert (=> b!1513678 m!1396385))

(assert (=> b!1513678 m!1396359))

(declare-fun m!1396387 () Bool)

(assert (=> b!1513678 m!1396387))

(declare-fun m!1396389 () Bool)

(assert (=> b!1513675 m!1396389))

(assert (=> b!1513675 m!1396389))

(declare-fun m!1396391 () Bool)

(assert (=> b!1513675 m!1396391))

(assert (=> b!1513679 m!1396361))

(assert (=> b!1513679 m!1396363))

(assert (=> b!1513679 m!1396363))

(declare-fun m!1396393 () Bool)

(assert (=> b!1513679 m!1396393))

(assert (=> b!1513679 m!1396393))

(assert (=> b!1513679 m!1396363))

(declare-fun m!1396395 () Bool)

(assert (=> b!1513679 m!1396395))

(declare-fun m!1396397 () Bool)

(assert (=> start!129260 m!1396397))

(declare-fun m!1396399 () Bool)

(assert (=> start!129260 m!1396399))

(check-sat (not b!1513679) (not b!1513673) (not b!1513674) (not b!1513680) (not b!1513675) (not b!1513672) (not start!129260) (not b!1513677) (not b!1513671) (not b!1513670) (not b!1513678))
(check-sat)
