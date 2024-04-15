; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121170 () Bool)

(assert start!121170)

(declare-fun b!1408853 () Bool)

(declare-fun res!946627 () Bool)

(declare-fun e!797304 () Bool)

(assert (=> b!1408853 (=> (not res!946627) (not e!797304))))

(declare-datatypes ((array!96277 0))(
  ( (array!96278 (arr!46482 (Array (_ BitVec 32) (_ BitVec 64))) (size!47034 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96277)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408853 (= res!946627 (validKeyInArray!0 (select (arr!46482 a!2901) i!1037)))))

(declare-fun b!1408854 () Bool)

(declare-fun res!946626 () Bool)

(assert (=> b!1408854 (=> (not res!946626) (not e!797304))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408854 (= res!946626 (validKeyInArray!0 (select (arr!46482 a!2901) j!112)))))

(declare-fun b!1408855 () Bool)

(declare-fun res!946629 () Bool)

(assert (=> b!1408855 (=> (not res!946629) (not e!797304))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1408855 (= res!946629 (and (= (size!47034 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47034 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47034 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946630 () Bool)

(assert (=> start!121170 (=> (not res!946630) (not e!797304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121170 (= res!946630 (validMask!0 mask!2840))))

(assert (=> start!121170 e!797304))

(assert (=> start!121170 true))

(declare-fun array_inv!35715 (array!96277) Bool)

(assert (=> start!121170 (array_inv!35715 a!2901)))

(declare-fun b!1408856 () Bool)

(declare-fun e!797306 () Bool)

(assert (=> b!1408856 (= e!797306 true)))

(declare-datatypes ((SeekEntryResult!10819 0))(
  ( (MissingZero!10819 (index!45653 (_ BitVec 32))) (Found!10819 (index!45654 (_ BitVec 32))) (Intermediate!10819 (undefined!11631 Bool) (index!45655 (_ BitVec 32)) (x!127241 (_ BitVec 32))) (Undefined!10819) (MissingVacant!10819 (index!45656 (_ BitVec 32))) )
))
(declare-fun lt!620344 () SeekEntryResult!10819)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96277 (_ BitVec 32)) SeekEntryResult!10819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408856 (= lt!620344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96278 (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47034 a!2901)) mask!2840))))

(declare-fun e!797303 () Bool)

(declare-fun b!1408857 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96277 (_ BitVec 32)) SeekEntryResult!10819)

(assert (=> b!1408857 (= e!797303 (= (seekEntryOrOpen!0 (select (arr!46482 a!2901) j!112) a!2901 mask!2840) (Found!10819 j!112)))))

(declare-fun b!1408858 () Bool)

(assert (=> b!1408858 (= e!797304 (not e!797306))))

(declare-fun res!946628 () Bool)

(assert (=> b!1408858 (=> res!946628 e!797306)))

(declare-fun lt!620345 () SeekEntryResult!10819)

(assert (=> b!1408858 (= res!946628 (or (not (is-Intermediate!10819 lt!620345)) (undefined!11631 lt!620345)))))

(assert (=> b!1408858 e!797303))

(declare-fun res!946631 () Bool)

(assert (=> b!1408858 (=> (not res!946631) (not e!797303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96277 (_ BitVec 32)) Bool)

(assert (=> b!1408858 (= res!946631 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47455 0))(
  ( (Unit!47456) )
))
(declare-fun lt!620343 () Unit!47455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47455)

(assert (=> b!1408858 (= lt!620343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408858 (= lt!620345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46482 a!2901) j!112) mask!2840) (select (arr!46482 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408859 () Bool)

(declare-fun res!946633 () Bool)

(assert (=> b!1408859 (=> (not res!946633) (not e!797304))))

(assert (=> b!1408859 (= res!946633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408860 () Bool)

(declare-fun res!946632 () Bool)

(assert (=> b!1408860 (=> (not res!946632) (not e!797304))))

(declare-datatypes ((List!33079 0))(
  ( (Nil!33076) (Cons!33075 (h!34338 (_ BitVec 64)) (t!47765 List!33079)) )
))
(declare-fun arrayNoDuplicates!0 (array!96277 (_ BitVec 32) List!33079) Bool)

(assert (=> b!1408860 (= res!946632 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33076))))

(assert (= (and start!121170 res!946630) b!1408855))

(assert (= (and b!1408855 res!946629) b!1408853))

(assert (= (and b!1408853 res!946627) b!1408854))

(assert (= (and b!1408854 res!946626) b!1408859))

(assert (= (and b!1408859 res!946633) b!1408860))

(assert (= (and b!1408860 res!946632) b!1408858))

(assert (= (and b!1408858 res!946631) b!1408857))

(assert (= (and b!1408858 (not res!946628)) b!1408856))

(declare-fun m!1297905 () Bool)

(assert (=> b!1408854 m!1297905))

(assert (=> b!1408854 m!1297905))

(declare-fun m!1297907 () Bool)

(assert (=> b!1408854 m!1297907))

(assert (=> b!1408858 m!1297905))

(declare-fun m!1297909 () Bool)

(assert (=> b!1408858 m!1297909))

(assert (=> b!1408858 m!1297905))

(declare-fun m!1297911 () Bool)

(assert (=> b!1408858 m!1297911))

(assert (=> b!1408858 m!1297909))

(assert (=> b!1408858 m!1297905))

(declare-fun m!1297913 () Bool)

(assert (=> b!1408858 m!1297913))

(declare-fun m!1297915 () Bool)

(assert (=> b!1408858 m!1297915))

(declare-fun m!1297917 () Bool)

(assert (=> b!1408859 m!1297917))

(declare-fun m!1297919 () Bool)

(assert (=> b!1408860 m!1297919))

(declare-fun m!1297921 () Bool)

(assert (=> b!1408856 m!1297921))

(declare-fun m!1297923 () Bool)

(assert (=> b!1408856 m!1297923))

(assert (=> b!1408856 m!1297923))

(declare-fun m!1297925 () Bool)

(assert (=> b!1408856 m!1297925))

(assert (=> b!1408856 m!1297925))

(assert (=> b!1408856 m!1297923))

(declare-fun m!1297927 () Bool)

(assert (=> b!1408856 m!1297927))

(declare-fun m!1297929 () Bool)

(assert (=> start!121170 m!1297929))

(declare-fun m!1297931 () Bool)

(assert (=> start!121170 m!1297931))

(assert (=> b!1408857 m!1297905))

(assert (=> b!1408857 m!1297905))

(declare-fun m!1297933 () Bool)

(assert (=> b!1408857 m!1297933))

(declare-fun m!1297935 () Bool)

(assert (=> b!1408853 m!1297935))

(assert (=> b!1408853 m!1297935))

(declare-fun m!1297937 () Bool)

(assert (=> b!1408853 m!1297937))

(push 1)

(assert (not b!1408857))

(assert (not b!1408853))

(assert (not b!1408854))

(assert (not b!1408859))

(assert (not b!1408856))

(assert (not start!121170))

(assert (not b!1408858))

(assert (not b!1408860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

