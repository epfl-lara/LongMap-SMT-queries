; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122104 () Bool)

(assert start!122104)

(declare-fun b!1416926 () Bool)

(declare-fun res!952803 () Bool)

(declare-fun e!801932 () Bool)

(assert (=> b!1416926 (=> (not res!952803) (not e!801932))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96739 0))(
  ( (array!96740 (arr!46699 (Array (_ BitVec 32) (_ BitVec 64))) (size!47249 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96739)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416926 (= res!952803 (and (= (size!47249 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47249 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47249 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416927 () Bool)

(declare-fun res!952807 () Bool)

(assert (=> b!1416927 (=> (not res!952807) (not e!801932))))

(declare-datatypes ((List!33218 0))(
  ( (Nil!33215) (Cons!33214 (h!34504 (_ BitVec 64)) (t!47912 List!33218)) )
))
(declare-fun arrayNoDuplicates!0 (array!96739 (_ BitVec 32) List!33218) Bool)

(assert (=> b!1416927 (= res!952807 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33215))))

(declare-fun res!952809 () Bool)

(assert (=> start!122104 (=> (not res!952809) (not e!801932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122104 (= res!952809 (validMask!0 mask!2840))))

(assert (=> start!122104 e!801932))

(assert (=> start!122104 true))

(declare-fun array_inv!35727 (array!96739) Bool)

(assert (=> start!122104 (array_inv!35727 a!2901)))

(declare-fun b!1416928 () Bool)

(declare-fun res!952806 () Bool)

(assert (=> b!1416928 (=> (not res!952806) (not e!801932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96739 (_ BitVec 32)) Bool)

(assert (=> b!1416928 (= res!952806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!801935 () Bool)

(declare-fun b!1416929 () Bool)

(declare-datatypes ((SeekEntryResult!11010 0))(
  ( (MissingZero!11010 (index!46432 (_ BitVec 32))) (Found!11010 (index!46433 (_ BitVec 32))) (Intermediate!11010 (undefined!11822 Bool) (index!46434 (_ BitVec 32)) (x!128031 (_ BitVec 32))) (Undefined!11010) (MissingVacant!11010 (index!46435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96739 (_ BitVec 32)) SeekEntryResult!11010)

(assert (=> b!1416929 (= e!801935 (= (seekEntryOrOpen!0 (select (arr!46699 a!2901) j!112) a!2901 mask!2840) (Found!11010 j!112)))))

(declare-fun b!1416930 () Bool)

(declare-fun res!952805 () Bool)

(assert (=> b!1416930 (=> (not res!952805) (not e!801932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416930 (= res!952805 (validKeyInArray!0 (select (arr!46699 a!2901) i!1037)))))

(declare-fun b!1416931 () Bool)

(declare-fun e!801934 () Bool)

(assert (=> b!1416931 (= e!801934 true)))

(declare-fun lt!625169 () SeekEntryResult!11010)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96739 (_ BitVec 32)) SeekEntryResult!11010)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416931 (= lt!625169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46699 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46699 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96740 (store (arr!46699 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47249 a!2901)) mask!2840))))

(declare-fun b!1416932 () Bool)

(assert (=> b!1416932 (= e!801932 (not e!801934))))

(declare-fun res!952810 () Bool)

(assert (=> b!1416932 (=> res!952810 e!801934)))

(declare-fun lt!625168 () SeekEntryResult!11010)

(assert (=> b!1416932 (= res!952810 (or (not (is-Intermediate!11010 lt!625168)) (undefined!11822 lt!625168)))))

(assert (=> b!1416932 e!801935))

(declare-fun res!952804 () Bool)

(assert (=> b!1416932 (=> (not res!952804) (not e!801935))))

(assert (=> b!1416932 (= res!952804 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47994 0))(
  ( (Unit!47995) )
))
(declare-fun lt!625170 () Unit!47994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47994)

(assert (=> b!1416932 (= lt!625170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416932 (= lt!625168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46699 a!2901) j!112) mask!2840) (select (arr!46699 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416933 () Bool)

(declare-fun res!952808 () Bool)

(assert (=> b!1416933 (=> (not res!952808) (not e!801932))))

(assert (=> b!1416933 (= res!952808 (validKeyInArray!0 (select (arr!46699 a!2901) j!112)))))

(assert (= (and start!122104 res!952809) b!1416926))

(assert (= (and b!1416926 res!952803) b!1416930))

(assert (= (and b!1416930 res!952805) b!1416933))

(assert (= (and b!1416933 res!952808) b!1416928))

(assert (= (and b!1416928 res!952806) b!1416927))

(assert (= (and b!1416927 res!952807) b!1416932))

(assert (= (and b!1416932 res!952804) b!1416929))

(assert (= (and b!1416932 (not res!952810)) b!1416931))

(declare-fun m!1307645 () Bool)

(assert (=> start!122104 m!1307645))

(declare-fun m!1307647 () Bool)

(assert (=> start!122104 m!1307647))

(declare-fun m!1307649 () Bool)

(assert (=> b!1416929 m!1307649))

(assert (=> b!1416929 m!1307649))

(declare-fun m!1307651 () Bool)

(assert (=> b!1416929 m!1307651))

(declare-fun m!1307653 () Bool)

(assert (=> b!1416931 m!1307653))

(declare-fun m!1307655 () Bool)

(assert (=> b!1416931 m!1307655))

(assert (=> b!1416931 m!1307655))

(declare-fun m!1307657 () Bool)

(assert (=> b!1416931 m!1307657))

(assert (=> b!1416931 m!1307657))

(assert (=> b!1416931 m!1307655))

(declare-fun m!1307659 () Bool)

(assert (=> b!1416931 m!1307659))

(declare-fun m!1307661 () Bool)

(assert (=> b!1416930 m!1307661))

(assert (=> b!1416930 m!1307661))

(declare-fun m!1307663 () Bool)

(assert (=> b!1416930 m!1307663))

(assert (=> b!1416932 m!1307649))

(declare-fun m!1307665 () Bool)

(assert (=> b!1416932 m!1307665))

(assert (=> b!1416932 m!1307649))

(declare-fun m!1307667 () Bool)

(assert (=> b!1416932 m!1307667))

(assert (=> b!1416932 m!1307665))

(assert (=> b!1416932 m!1307649))

(declare-fun m!1307669 () Bool)

(assert (=> b!1416932 m!1307669))

(declare-fun m!1307671 () Bool)

(assert (=> b!1416932 m!1307671))

(declare-fun m!1307673 () Bool)

(assert (=> b!1416927 m!1307673))

(assert (=> b!1416933 m!1307649))

(assert (=> b!1416933 m!1307649))

(declare-fun m!1307675 () Bool)

(assert (=> b!1416933 m!1307675))

(declare-fun m!1307677 () Bool)

(assert (=> b!1416928 m!1307677))

(push 1)

(assert (not b!1416929))

(assert (not b!1416932))

(assert (not b!1416927))

(assert (not b!1416930))

(assert (not start!122104))

(assert (not b!1416928))

(assert (not b!1416933))

(assert (not b!1416931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

