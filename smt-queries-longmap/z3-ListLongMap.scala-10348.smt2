; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121634 () Bool)

(assert start!121634)

(declare-fun b!1413105 () Bool)

(declare-fun e!799712 () Bool)

(declare-fun e!799714 () Bool)

(assert (=> b!1413105 (= e!799712 e!799714)))

(declare-fun res!950148 () Bool)

(assert (=> b!1413105 (=> res!950148 e!799714)))

(declare-datatypes ((SeekEntryResult!10937 0))(
  ( (MissingZero!10937 (index!46128 (_ BitVec 32))) (Found!10937 (index!46129 (_ BitVec 32))) (Intermediate!10937 (undefined!11749 Bool) (index!46130 (_ BitVec 32)) (x!127709 (_ BitVec 32))) (Undefined!10937) (MissingVacant!10937 (index!46131 (_ BitVec 32))) )
))
(declare-fun lt!622673 () SeekEntryResult!10937)

(declare-fun lt!622671 () SeekEntryResult!10937)

(get-info :version)

(assert (=> b!1413105 (= res!950148 (or (= lt!622673 lt!622671) (not ((_ is Intermediate!10937) lt!622671))))))

(declare-datatypes ((array!96525 0))(
  ( (array!96526 (arr!46600 (Array (_ BitVec 32) (_ BitVec 64))) (size!47152 (_ BitVec 32))) )
))
(declare-fun lt!622672 () array!96525)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622667 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96525 (_ BitVec 32)) SeekEntryResult!10937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413105 (= lt!622671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622667 mask!2840) lt!622667 lt!622672 mask!2840))))

(declare-fun a!2901 () array!96525)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413105 (= lt!622667 (select (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413105 (= lt!622672 (array!96526 (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47152 a!2901)))))

(declare-fun b!1413106 () Bool)

(declare-fun res!950154 () Bool)

(declare-fun e!799710 () Bool)

(assert (=> b!1413106 (=> (not res!950154) (not e!799710))))

(assert (=> b!1413106 (= res!950154 (and (= (size!47152 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47152 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47152 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413108 () Bool)

(assert (=> b!1413108 (= e!799710 (not e!799712))))

(declare-fun res!950149 () Bool)

(assert (=> b!1413108 (=> res!950149 e!799712)))

(assert (=> b!1413108 (= res!950149 (or (not ((_ is Intermediate!10937) lt!622673)) (undefined!11749 lt!622673)))))

(declare-fun e!799711 () Bool)

(assert (=> b!1413108 e!799711))

(declare-fun res!950155 () Bool)

(assert (=> b!1413108 (=> (not res!950155) (not e!799711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96525 (_ BitVec 32)) Bool)

(assert (=> b!1413108 (= res!950155 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47691 0))(
  ( (Unit!47692) )
))
(declare-fun lt!622668 () Unit!47691)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47691)

(assert (=> b!1413108 (= lt!622668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622670 () (_ BitVec 32))

(assert (=> b!1413108 (= lt!622673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622670 (select (arr!46600 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413108 (= lt!622670 (toIndex!0 (select (arr!46600 a!2901) j!112) mask!2840))))

(declare-fun b!1413109 () Bool)

(declare-fun res!950146 () Bool)

(assert (=> b!1413109 (=> (not res!950146) (not e!799710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413109 (= res!950146 (validKeyInArray!0 (select (arr!46600 a!2901) j!112)))))

(declare-fun b!1413110 () Bool)

(declare-fun res!950150 () Bool)

(assert (=> b!1413110 (=> (not res!950150) (not e!799710))))

(assert (=> b!1413110 (= res!950150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413111 () Bool)

(declare-fun res!950153 () Bool)

(assert (=> b!1413111 (=> (not res!950153) (not e!799710))))

(declare-datatypes ((List!33197 0))(
  ( (Nil!33194) (Cons!33193 (h!34468 (_ BitVec 64)) (t!47883 List!33197)) )
))
(declare-fun arrayNoDuplicates!0 (array!96525 (_ BitVec 32) List!33197) Bool)

(assert (=> b!1413111 (= res!950153 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33194))))

(declare-fun b!1413112 () Bool)

(assert (=> b!1413112 (= e!799714 true)))

(declare-fun e!799713 () Bool)

(assert (=> b!1413112 e!799713))

(declare-fun res!950152 () Bool)

(assert (=> b!1413112 (=> (not res!950152) (not e!799713))))

(assert (=> b!1413112 (= res!950152 (and (not (undefined!11749 lt!622671)) (= (index!46130 lt!622671) i!1037) (bvslt (x!127709 lt!622671) (x!127709 lt!622673)) (= (select (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46130 lt!622671)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622669 () Unit!47691)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47691)

(assert (=> b!1413112 (= lt!622669 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622670 (x!127709 lt!622673) (index!46130 lt!622673) (x!127709 lt!622671) (index!46130 lt!622671) (undefined!11749 lt!622671) mask!2840))))

(declare-fun b!1413107 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96525 (_ BitVec 32)) SeekEntryResult!10937)

(assert (=> b!1413107 (= e!799711 (= (seekEntryOrOpen!0 (select (arr!46600 a!2901) j!112) a!2901 mask!2840) (Found!10937 j!112)))))

(declare-fun res!950151 () Bool)

(assert (=> start!121634 (=> (not res!950151) (not e!799710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121634 (= res!950151 (validMask!0 mask!2840))))

(assert (=> start!121634 e!799710))

(assert (=> start!121634 true))

(declare-fun array_inv!35833 (array!96525) Bool)

(assert (=> start!121634 (array_inv!35833 a!2901)))

(declare-fun b!1413113 () Bool)

(declare-fun res!950147 () Bool)

(assert (=> b!1413113 (=> (not res!950147) (not e!799710))))

(assert (=> b!1413113 (= res!950147 (validKeyInArray!0 (select (arr!46600 a!2901) i!1037)))))

(declare-fun b!1413114 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96525 (_ BitVec 32)) SeekEntryResult!10937)

(assert (=> b!1413114 (= e!799713 (= (seekEntryOrOpen!0 lt!622667 lt!622672 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127709 lt!622671) (index!46130 lt!622671) (index!46130 lt!622671) (select (arr!46600 a!2901) j!112) lt!622672 mask!2840)))))

(assert (= (and start!121634 res!950151) b!1413106))

(assert (= (and b!1413106 res!950154) b!1413113))

(assert (= (and b!1413113 res!950147) b!1413109))

(assert (= (and b!1413109 res!950146) b!1413110))

(assert (= (and b!1413110 res!950150) b!1413111))

(assert (= (and b!1413111 res!950153) b!1413108))

(assert (= (and b!1413108 res!950155) b!1413107))

(assert (= (and b!1413108 (not res!950149)) b!1413105))

(assert (= (and b!1413105 (not res!950148)) b!1413112))

(assert (= (and b!1413112 res!950152) b!1413114))

(declare-fun m!1302973 () Bool)

(assert (=> b!1413105 m!1302973))

(assert (=> b!1413105 m!1302973))

(declare-fun m!1302975 () Bool)

(assert (=> b!1413105 m!1302975))

(declare-fun m!1302977 () Bool)

(assert (=> b!1413105 m!1302977))

(declare-fun m!1302979 () Bool)

(assert (=> b!1413105 m!1302979))

(declare-fun m!1302981 () Bool)

(assert (=> b!1413113 m!1302981))

(assert (=> b!1413113 m!1302981))

(declare-fun m!1302983 () Bool)

(assert (=> b!1413113 m!1302983))

(assert (=> b!1413112 m!1302977))

(declare-fun m!1302985 () Bool)

(assert (=> b!1413112 m!1302985))

(declare-fun m!1302987 () Bool)

(assert (=> b!1413112 m!1302987))

(declare-fun m!1302989 () Bool)

(assert (=> start!121634 m!1302989))

(declare-fun m!1302991 () Bool)

(assert (=> start!121634 m!1302991))

(declare-fun m!1302993 () Bool)

(assert (=> b!1413108 m!1302993))

(declare-fun m!1302995 () Bool)

(assert (=> b!1413108 m!1302995))

(assert (=> b!1413108 m!1302993))

(declare-fun m!1302997 () Bool)

(assert (=> b!1413108 m!1302997))

(assert (=> b!1413108 m!1302993))

(declare-fun m!1302999 () Bool)

(assert (=> b!1413108 m!1302999))

(declare-fun m!1303001 () Bool)

(assert (=> b!1413108 m!1303001))

(declare-fun m!1303003 () Bool)

(assert (=> b!1413111 m!1303003))

(declare-fun m!1303005 () Bool)

(assert (=> b!1413114 m!1303005))

(assert (=> b!1413114 m!1302993))

(assert (=> b!1413114 m!1302993))

(declare-fun m!1303007 () Bool)

(assert (=> b!1413114 m!1303007))

(declare-fun m!1303009 () Bool)

(assert (=> b!1413110 m!1303009))

(assert (=> b!1413107 m!1302993))

(assert (=> b!1413107 m!1302993))

(declare-fun m!1303011 () Bool)

(assert (=> b!1413107 m!1303011))

(assert (=> b!1413109 m!1302993))

(assert (=> b!1413109 m!1302993))

(declare-fun m!1303013 () Bool)

(assert (=> b!1413109 m!1303013))

(check-sat (not b!1413109) (not start!121634) (not b!1413108) (not b!1413113) (not b!1413110) (not b!1413107) (not b!1413105) (not b!1413112) (not b!1413111) (not b!1413114))
(check-sat)
