; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130464 () Bool)

(assert start!130464)

(declare-fun b!1528900 () Bool)

(declare-fun res!1045452 () Bool)

(declare-fun e!852336 () Bool)

(assert (=> b!1528900 (=> (not res!1045452) (not e!852336))))

(declare-datatypes ((array!101614 0))(
  ( (array!101615 (arr!49027 (Array (_ BitVec 32) (_ BitVec 64))) (size!49578 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101614)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528900 (= res!1045452 (validKeyInArray!0 (select (arr!49027 a!2804) i!961)))))

(declare-fun b!1528901 () Bool)

(declare-fun e!852337 () Bool)

(assert (=> b!1528901 (= e!852336 e!852337)))

(declare-fun res!1045453 () Bool)

(assert (=> b!1528901 (=> (not res!1045453) (not e!852337))))

(declare-datatypes ((SeekEntryResult!13085 0))(
  ( (MissingZero!13085 (index!54735 (_ BitVec 32))) (Found!13085 (index!54736 (_ BitVec 32))) (Intermediate!13085 (undefined!13897 Bool) (index!54737 (_ BitVec 32)) (x!136642 (_ BitVec 32))) (Undefined!13085) (MissingVacant!13085 (index!54738 (_ BitVec 32))) )
))
(declare-fun lt!662009 () SeekEntryResult!13085)

(declare-fun lt!662011 () SeekEntryResult!13085)

(assert (=> b!1528901 (= res!1045453 (= lt!662009 lt!662011))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528901 (= lt!662011 (Intermediate!13085 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101614 (_ BitVec 32)) SeekEntryResult!13085)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528901 (= lt!662009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49027 a!2804) j!70) mask!2512) (select (arr!49027 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528902 () Bool)

(declare-fun res!1045457 () Bool)

(assert (=> b!1528902 (=> (not res!1045457) (not e!852336))))

(assert (=> b!1528902 (= res!1045457 (validKeyInArray!0 (select (arr!49027 a!2804) j!70)))))

(declare-fun lt!662010 () (_ BitVec 64))

(declare-fun b!1528903 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!662012 () array!101614)

(declare-fun e!852334 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101614 (_ BitVec 32)) SeekEntryResult!13085)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101614 (_ BitVec 32)) SeekEntryResult!13085)

(assert (=> b!1528903 (= e!852334 (= (seekEntryOrOpen!0 lt!662010 lt!662012 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662010 lt!662012 mask!2512)))))

(declare-fun b!1528904 () Bool)

(declare-fun res!1045454 () Bool)

(declare-fun e!852335 () Bool)

(assert (=> b!1528904 (=> (not res!1045454) (not e!852335))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101614 (_ BitVec 32)) SeekEntryResult!13085)

(assert (=> b!1528904 (= res!1045454 (= (seekEntry!0 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) (Found!13085 j!70)))))

(declare-fun res!1045448 () Bool)

(assert (=> start!130464 (=> (not res!1045448) (not e!852336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130464 (= res!1045448 (validMask!0 mask!2512))))

(assert (=> start!130464 e!852336))

(assert (=> start!130464 true))

(declare-fun array_inv!38308 (array!101614) Bool)

(assert (=> start!130464 (array_inv!38308 a!2804)))

(declare-fun b!1528905 () Bool)

(declare-fun e!852338 () Bool)

(assert (=> b!1528905 (= e!852335 e!852338)))

(declare-fun res!1045456 () Bool)

(assert (=> b!1528905 (=> res!1045456 e!852338)))

(assert (=> b!1528905 (= res!1045456 (or (not (= (select (arr!49027 a!2804) j!70) lt!662010)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49027 a!2804) index!487) (select (arr!49027 a!2804) j!70)) (not (= (select (arr!49027 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528906 () Bool)

(declare-fun e!852339 () Bool)

(assert (=> b!1528906 (= e!852337 e!852339)))

(declare-fun res!1045461 () Bool)

(assert (=> b!1528906 (=> (not res!1045461) (not e!852339))))

(assert (=> b!1528906 (= res!1045461 (= lt!662009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662010 mask!2512) lt!662010 lt!662012 mask!2512)))))

(assert (=> b!1528906 (= lt!662010 (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528906 (= lt!662012 (array!101615 (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49578 a!2804)))))

(declare-fun b!1528907 () Bool)

(declare-fun res!1045459 () Bool)

(assert (=> b!1528907 (=> (not res!1045459) (not e!852336))))

(declare-datatypes ((List!35497 0))(
  ( (Nil!35494) (Cons!35493 (h!36944 (_ BitVec 64)) (t!50183 List!35497)) )
))
(declare-fun arrayNoDuplicates!0 (array!101614 (_ BitVec 32) List!35497) Bool)

(assert (=> b!1528907 (= res!1045459 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35494))))

(declare-fun b!1528908 () Bool)

(declare-fun res!1045450 () Bool)

(assert (=> b!1528908 (=> (not res!1045450) (not e!852336))))

(assert (=> b!1528908 (= res!1045450 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49578 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49578 a!2804))))))

(declare-fun b!1528909 () Bool)

(declare-fun res!1045460 () Bool)

(assert (=> b!1528909 (=> (not res!1045460) (not e!852336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101614 (_ BitVec 32)) Bool)

(assert (=> b!1528909 (= res!1045460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528910 () Bool)

(declare-fun res!1045449 () Bool)

(assert (=> b!1528910 (=> (not res!1045449) (not e!852337))))

(assert (=> b!1528910 (= res!1045449 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) lt!662011))))

(declare-fun b!1528911 () Bool)

(declare-fun res!1045451 () Bool)

(assert (=> b!1528911 (=> (not res!1045451) (not e!852336))))

(assert (=> b!1528911 (= res!1045451 (and (= (size!49578 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49578 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49578 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528912 () Bool)

(assert (=> b!1528912 (= e!852338 e!852334)))

(declare-fun res!1045458 () Bool)

(assert (=> b!1528912 (=> (not res!1045458) (not e!852334))))

(assert (=> b!1528912 (= res!1045458 (= (seekEntryOrOpen!0 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49027 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1528913 () Bool)

(assert (=> b!1528913 (= e!852339 (not true))))

(assert (=> b!1528913 e!852335))

(declare-fun res!1045455 () Bool)

(assert (=> b!1528913 (=> (not res!1045455) (not e!852335))))

(assert (=> b!1528913 (= res!1045455 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50989 0))(
  ( (Unit!50990) )
))
(declare-fun lt!662013 () Unit!50989)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50989)

(assert (=> b!1528913 (= lt!662013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130464 res!1045448) b!1528911))

(assert (= (and b!1528911 res!1045451) b!1528900))

(assert (= (and b!1528900 res!1045452) b!1528902))

(assert (= (and b!1528902 res!1045457) b!1528909))

(assert (= (and b!1528909 res!1045460) b!1528907))

(assert (= (and b!1528907 res!1045459) b!1528908))

(assert (= (and b!1528908 res!1045450) b!1528901))

(assert (= (and b!1528901 res!1045453) b!1528910))

(assert (= (and b!1528910 res!1045449) b!1528906))

(assert (= (and b!1528906 res!1045461) b!1528913))

(assert (= (and b!1528913 res!1045455) b!1528904))

(assert (= (and b!1528904 res!1045454) b!1528905))

(assert (= (and b!1528905 (not res!1045456)) b!1528912))

(assert (= (and b!1528912 res!1045458) b!1528903))

(declare-fun m!1411567 () Bool)

(assert (=> b!1528904 m!1411567))

(assert (=> b!1528904 m!1411567))

(declare-fun m!1411569 () Bool)

(assert (=> b!1528904 m!1411569))

(declare-fun m!1411571 () Bool)

(assert (=> start!130464 m!1411571))

(declare-fun m!1411573 () Bool)

(assert (=> start!130464 m!1411573))

(declare-fun m!1411575 () Bool)

(assert (=> b!1528909 m!1411575))

(assert (=> b!1528901 m!1411567))

(assert (=> b!1528901 m!1411567))

(declare-fun m!1411577 () Bool)

(assert (=> b!1528901 m!1411577))

(assert (=> b!1528901 m!1411577))

(assert (=> b!1528901 m!1411567))

(declare-fun m!1411579 () Bool)

(assert (=> b!1528901 m!1411579))

(declare-fun m!1411581 () Bool)

(assert (=> b!1528906 m!1411581))

(assert (=> b!1528906 m!1411581))

(declare-fun m!1411583 () Bool)

(assert (=> b!1528906 m!1411583))

(declare-fun m!1411585 () Bool)

(assert (=> b!1528906 m!1411585))

(declare-fun m!1411587 () Bool)

(assert (=> b!1528906 m!1411587))

(declare-fun m!1411589 () Bool)

(assert (=> b!1528900 m!1411589))

(assert (=> b!1528900 m!1411589))

(declare-fun m!1411591 () Bool)

(assert (=> b!1528900 m!1411591))

(assert (=> b!1528902 m!1411567))

(assert (=> b!1528902 m!1411567))

(declare-fun m!1411593 () Bool)

(assert (=> b!1528902 m!1411593))

(declare-fun m!1411595 () Bool)

(assert (=> b!1528913 m!1411595))

(declare-fun m!1411597 () Bool)

(assert (=> b!1528913 m!1411597))

(assert (=> b!1528910 m!1411567))

(assert (=> b!1528910 m!1411567))

(declare-fun m!1411599 () Bool)

(assert (=> b!1528910 m!1411599))

(assert (=> b!1528912 m!1411567))

(assert (=> b!1528912 m!1411567))

(declare-fun m!1411601 () Bool)

(assert (=> b!1528912 m!1411601))

(assert (=> b!1528912 m!1411567))

(declare-fun m!1411603 () Bool)

(assert (=> b!1528912 m!1411603))

(assert (=> b!1528905 m!1411567))

(declare-fun m!1411605 () Bool)

(assert (=> b!1528905 m!1411605))

(declare-fun m!1411607 () Bool)

(assert (=> b!1528907 m!1411607))

(declare-fun m!1411609 () Bool)

(assert (=> b!1528903 m!1411609))

(declare-fun m!1411611 () Bool)

(assert (=> b!1528903 m!1411611))

(check-sat (not b!1528909) (not b!1528902) (not b!1528903) (not b!1528913) (not b!1528900) (not b!1528901) (not b!1528912) (not b!1528907) (not b!1528910) (not start!130464) (not b!1528904) (not b!1528906))
(check-sat)
