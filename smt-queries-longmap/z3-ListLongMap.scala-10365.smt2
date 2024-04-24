; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122192 () Bool)

(assert start!122192)

(declare-fun b!1417191 () Bool)

(declare-fun res!952552 () Bool)

(declare-fun e!802204 () Bool)

(assert (=> b!1417191 (=> res!952552 e!802204)))

(declare-fun lt!625008 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10943 0))(
  ( (MissingZero!10943 (index!46164 (_ BitVec 32))) (Found!10943 (index!46165 (_ BitVec 32))) (Intermediate!10943 (undefined!11755 Bool) (index!46166 (_ BitVec 32)) (x!127921 (_ BitVec 32))) (Undefined!10943) (MissingVacant!10943 (index!46167 (_ BitVec 32))) )
))
(declare-fun lt!625009 () SeekEntryResult!10943)

(declare-datatypes ((array!96800 0))(
  ( (array!96801 (arr!46729 (Array (_ BitVec 32) (_ BitVec 64))) (size!47280 (_ BitVec 32))) )
))
(declare-fun lt!625010 () array!96800)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!625002 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96800 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1417191 (= res!952552 (not (= lt!625009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625008 lt!625002 lt!625010 mask!2840))))))

(declare-fun res!952550 () Bool)

(declare-fun e!802205 () Bool)

(assert (=> start!122192 (=> (not res!952550) (not e!802205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122192 (= res!952550 (validMask!0 mask!2840))))

(assert (=> start!122192 e!802205))

(assert (=> start!122192 true))

(declare-fun a!2901 () array!96800)

(declare-fun array_inv!36010 (array!96800) Bool)

(assert (=> start!122192 (array_inv!36010 a!2901)))

(declare-fun b!1417192 () Bool)

(declare-fun res!952553 () Bool)

(assert (=> b!1417192 (=> (not res!952553) (not e!802205))))

(declare-datatypes ((List!33235 0))(
  ( (Nil!33232) (Cons!33231 (h!34526 (_ BitVec 64)) (t!47921 List!33235)) )
))
(declare-fun arrayNoDuplicates!0 (array!96800 (_ BitVec 32) List!33235) Bool)

(assert (=> b!1417192 (= res!952553 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33232))))

(declare-fun b!1417193 () Bool)

(declare-fun res!952551 () Bool)

(assert (=> b!1417193 (=> (not res!952551) (not e!802205))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417193 (= res!952551 (validKeyInArray!0 (select (arr!46729 a!2901) i!1037)))))

(declare-fun b!1417194 () Bool)

(declare-fun e!802201 () Bool)

(declare-fun e!802203 () Bool)

(assert (=> b!1417194 (= e!802201 e!802203)))

(declare-fun res!952556 () Bool)

(assert (=> b!1417194 (=> res!952556 e!802203)))

(declare-fun lt!625003 () SeekEntryResult!10943)

(get-info :version)

(assert (=> b!1417194 (= res!952556 (or (= lt!625003 lt!625009) (not ((_ is Intermediate!10943) lt!625009))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417194 (= lt!625009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625002 mask!2840) lt!625002 lt!625010 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417194 (= lt!625002 (select (store (arr!46729 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1417194 (= lt!625010 (array!96801 (store (arr!46729 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47280 a!2901)))))

(declare-fun b!1417195 () Bool)

(assert (=> b!1417195 (= e!802203 e!802204)))

(declare-fun res!952554 () Bool)

(assert (=> b!1417195 (=> res!952554 e!802204)))

(assert (=> b!1417195 (= res!952554 (or (bvslt (x!127921 lt!625003) #b00000000000000000000000000000000) (bvsgt (x!127921 lt!625003) #b01111111111111111111111111111110) (bvslt (x!127921 lt!625009) #b00000000000000000000000000000000) (bvsgt (x!127921 lt!625009) #b01111111111111111111111111111110) (bvslt lt!625008 #b00000000000000000000000000000000) (bvsge lt!625008 (size!47280 a!2901)) (bvslt (index!46166 lt!625003) #b00000000000000000000000000000000) (bvsge (index!46166 lt!625003) (size!47280 a!2901)) (bvslt (index!46166 lt!625009) #b00000000000000000000000000000000) (bvsge (index!46166 lt!625009) (size!47280 a!2901)) (not (= lt!625003 (Intermediate!10943 false (index!46166 lt!625003) (x!127921 lt!625003)))) (not (= lt!625009 (Intermediate!10943 false (index!46166 lt!625009) (x!127921 lt!625009))))))))

(declare-fun lt!625001 () SeekEntryResult!10943)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96800 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1417195 (= lt!625001 (seekKeyOrZeroReturnVacant!0 (x!127921 lt!625009) (index!46166 lt!625009) (index!46166 lt!625009) (select (arr!46729 a!2901) j!112) lt!625010 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96800 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1417195 (= lt!625001 (seekEntryOrOpen!0 lt!625002 lt!625010 mask!2840))))

(assert (=> b!1417195 (and (not (undefined!11755 lt!625009)) (= (index!46166 lt!625009) i!1037) (bvslt (x!127921 lt!625009) (x!127921 lt!625003)) (= (select (store (arr!46729 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46166 lt!625009)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47887 0))(
  ( (Unit!47888) )
))
(declare-fun lt!625007 () Unit!47887)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47887)

(assert (=> b!1417195 (= lt!625007 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625008 (x!127921 lt!625003) (index!46166 lt!625003) (x!127921 lt!625009) (index!46166 lt!625009) (undefined!11755 lt!625009) mask!2840))))

(declare-fun b!1417196 () Bool)

(declare-fun res!952555 () Bool)

(assert (=> b!1417196 (=> (not res!952555) (not e!802205))))

(assert (=> b!1417196 (= res!952555 (validKeyInArray!0 (select (arr!46729 a!2901) j!112)))))

(declare-fun b!1417197 () Bool)

(declare-fun res!952549 () Bool)

(assert (=> b!1417197 (=> (not res!952549) (not e!802205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96800 (_ BitVec 32)) Bool)

(assert (=> b!1417197 (= res!952549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417198 () Bool)

(declare-fun res!952557 () Bool)

(assert (=> b!1417198 (=> (not res!952557) (not e!802205))))

(assert (=> b!1417198 (= res!952557 (and (= (size!47280 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47280 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47280 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417199 () Bool)

(assert (=> b!1417199 (= e!802205 (not e!802201))))

(declare-fun res!952558 () Bool)

(assert (=> b!1417199 (=> res!952558 e!802201)))

(assert (=> b!1417199 (= res!952558 (or (not ((_ is Intermediate!10943) lt!625003)) (undefined!11755 lt!625003)))))

(declare-fun lt!625006 () SeekEntryResult!10943)

(assert (=> b!1417199 (= lt!625006 (Found!10943 j!112))))

(assert (=> b!1417199 (= lt!625006 (seekEntryOrOpen!0 (select (arr!46729 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417199 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625004 () Unit!47887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47887)

(assert (=> b!1417199 (= lt!625004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417199 (= lt!625003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625008 (select (arr!46729 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417199 (= lt!625008 (toIndex!0 (select (arr!46729 a!2901) j!112) mask!2840))))

(declare-fun b!1417200 () Bool)

(assert (=> b!1417200 (= e!802204 true)))

(assert (=> b!1417200 (= lt!625006 lt!625001)))

(declare-fun lt!625005 () Unit!47887)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47887)

(assert (=> b!1417200 (= lt!625005 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625008 (x!127921 lt!625003) (index!46166 lt!625003) (x!127921 lt!625009) (index!46166 lt!625009) mask!2840))))

(assert (= (and start!122192 res!952550) b!1417198))

(assert (= (and b!1417198 res!952557) b!1417193))

(assert (= (and b!1417193 res!952551) b!1417196))

(assert (= (and b!1417196 res!952555) b!1417197))

(assert (= (and b!1417197 res!952549) b!1417192))

(assert (= (and b!1417192 res!952553) b!1417199))

(assert (= (and b!1417199 (not res!952558)) b!1417194))

(assert (= (and b!1417194 (not res!952556)) b!1417195))

(assert (= (and b!1417195 (not res!952554)) b!1417191))

(assert (= (and b!1417191 (not res!952552)) b!1417200))

(declare-fun m!1307941 () Bool)

(assert (=> b!1417194 m!1307941))

(assert (=> b!1417194 m!1307941))

(declare-fun m!1307943 () Bool)

(assert (=> b!1417194 m!1307943))

(declare-fun m!1307945 () Bool)

(assert (=> b!1417194 m!1307945))

(declare-fun m!1307947 () Bool)

(assert (=> b!1417194 m!1307947))

(declare-fun m!1307949 () Bool)

(assert (=> b!1417191 m!1307949))

(declare-fun m!1307951 () Bool)

(assert (=> b!1417199 m!1307951))

(declare-fun m!1307953 () Bool)

(assert (=> b!1417199 m!1307953))

(assert (=> b!1417199 m!1307951))

(assert (=> b!1417199 m!1307951))

(declare-fun m!1307955 () Bool)

(assert (=> b!1417199 m!1307955))

(declare-fun m!1307957 () Bool)

(assert (=> b!1417199 m!1307957))

(assert (=> b!1417199 m!1307951))

(declare-fun m!1307959 () Bool)

(assert (=> b!1417199 m!1307959))

(declare-fun m!1307961 () Bool)

(assert (=> b!1417199 m!1307961))

(declare-fun m!1307963 () Bool)

(assert (=> b!1417197 m!1307963))

(declare-fun m!1307965 () Bool)

(assert (=> b!1417192 m!1307965))

(assert (=> b!1417196 m!1307951))

(assert (=> b!1417196 m!1307951))

(declare-fun m!1307967 () Bool)

(assert (=> b!1417196 m!1307967))

(declare-fun m!1307969 () Bool)

(assert (=> b!1417200 m!1307969))

(declare-fun m!1307971 () Bool)

(assert (=> b!1417193 m!1307971))

(assert (=> b!1417193 m!1307971))

(declare-fun m!1307973 () Bool)

(assert (=> b!1417193 m!1307973))

(assert (=> b!1417195 m!1307951))

(declare-fun m!1307975 () Bool)

(assert (=> b!1417195 m!1307975))

(declare-fun m!1307977 () Bool)

(assert (=> b!1417195 m!1307977))

(assert (=> b!1417195 m!1307945))

(declare-fun m!1307979 () Bool)

(assert (=> b!1417195 m!1307979))

(assert (=> b!1417195 m!1307951))

(declare-fun m!1307981 () Bool)

(assert (=> b!1417195 m!1307981))

(declare-fun m!1307983 () Bool)

(assert (=> start!122192 m!1307983))

(declare-fun m!1307985 () Bool)

(assert (=> start!122192 m!1307985))

(check-sat (not b!1417191) (not b!1417193) (not b!1417192) (not b!1417194) (not start!122192) (not b!1417197) (not b!1417199) (not b!1417195) (not b!1417196) (not b!1417200))
(check-sat)
