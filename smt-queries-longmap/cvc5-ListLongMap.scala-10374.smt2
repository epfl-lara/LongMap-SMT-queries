; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122112 () Bool)

(assert start!122112)

(declare-fun b!1416989 () Bool)

(declare-fun res!952917 () Bool)

(declare-fun e!801966 () Bool)

(assert (=> b!1416989 (=> (not res!952917) (not e!801966))))

(declare-datatypes ((array!96700 0))(
  ( (array!96701 (arr!46680 (Array (_ BitVec 32) (_ BitVec 64))) (size!47232 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96700)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416989 (= res!952917 (validKeyInArray!0 (select (arr!46680 a!2901) j!112)))))

(declare-fun res!952918 () Bool)

(assert (=> start!122112 (=> (not res!952918) (not e!801966))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122112 (= res!952918 (validMask!0 mask!2840))))

(assert (=> start!122112 e!801966))

(assert (=> start!122112 true))

(declare-fun array_inv!35913 (array!96700) Bool)

(assert (=> start!122112 (array_inv!35913 a!2901)))

(declare-fun b!1416990 () Bool)

(declare-fun res!952920 () Bool)

(assert (=> b!1416990 (=> (not res!952920) (not e!801966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96700 (_ BitVec 32)) Bool)

(assert (=> b!1416990 (= res!952920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416991 () Bool)

(declare-fun e!801968 () Bool)

(declare-datatypes ((SeekEntryResult!11017 0))(
  ( (MissingZero!11017 (index!46460 (_ BitVec 32))) (Found!11017 (index!46461 (_ BitVec 32))) (Intermediate!11017 (undefined!11829 Bool) (index!46462 (_ BitVec 32)) (x!128051 (_ BitVec 32))) (Undefined!11017) (MissingVacant!11017 (index!46463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96700 (_ BitVec 32)) SeekEntryResult!11017)

(assert (=> b!1416991 (= e!801968 (= (seekEntryOrOpen!0 (select (arr!46680 a!2901) j!112) a!2901 mask!2840) (Found!11017 j!112)))))

(declare-fun b!1416992 () Bool)

(declare-fun res!952923 () Bool)

(assert (=> b!1416992 (=> (not res!952923) (not e!801966))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416992 (= res!952923 (validKeyInArray!0 (select (arr!46680 a!2901) i!1037)))))

(declare-fun b!1416993 () Bool)

(declare-fun res!952924 () Bool)

(assert (=> b!1416993 (=> (not res!952924) (not e!801966))))

(declare-datatypes ((List!33277 0))(
  ( (Nil!33274) (Cons!33273 (h!34563 (_ BitVec 64)) (t!47963 List!33277)) )
))
(declare-fun arrayNoDuplicates!0 (array!96700 (_ BitVec 32) List!33277) Bool)

(assert (=> b!1416993 (= res!952924 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33274))))

(declare-fun b!1416994 () Bool)

(declare-fun res!952921 () Bool)

(assert (=> b!1416994 (=> (not res!952921) (not e!801966))))

(assert (=> b!1416994 (= res!952921 (and (= (size!47232 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47232 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47232 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416995 () Bool)

(declare-fun e!801965 () Bool)

(assert (=> b!1416995 (= e!801966 (not e!801965))))

(declare-fun res!952922 () Bool)

(assert (=> b!1416995 (=> res!952922 e!801965)))

(declare-fun lt!625033 () SeekEntryResult!11017)

(assert (=> b!1416995 (= res!952922 (or (not (is-Intermediate!11017 lt!625033)) (undefined!11829 lt!625033)))))

(assert (=> b!1416995 e!801968))

(declare-fun res!952919 () Bool)

(assert (=> b!1416995 (=> (not res!952919) (not e!801968))))

(assert (=> b!1416995 (= res!952919 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47851 0))(
  ( (Unit!47852) )
))
(declare-fun lt!625032 () Unit!47851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47851)

(assert (=> b!1416995 (= lt!625032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96700 (_ BitVec 32)) SeekEntryResult!11017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416995 (= lt!625033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46680 a!2901) j!112) mask!2840) (select (arr!46680 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416996 () Bool)

(assert (=> b!1416996 (= e!801965 true)))

(declare-fun lt!625034 () SeekEntryResult!11017)

(assert (=> b!1416996 (= lt!625034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46680 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46680 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96701 (store (arr!46680 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47232 a!2901)) mask!2840))))

(assert (= (and start!122112 res!952918) b!1416994))

(assert (= (and b!1416994 res!952921) b!1416992))

(assert (= (and b!1416992 res!952923) b!1416989))

(assert (= (and b!1416989 res!952917) b!1416990))

(assert (= (and b!1416990 res!952920) b!1416993))

(assert (= (and b!1416993 res!952924) b!1416995))

(assert (= (and b!1416995 res!952919) b!1416991))

(assert (= (and b!1416995 (not res!952922)) b!1416996))

(declare-fun m!1307313 () Bool)

(assert (=> b!1416992 m!1307313))

(assert (=> b!1416992 m!1307313))

(declare-fun m!1307315 () Bool)

(assert (=> b!1416992 m!1307315))

(declare-fun m!1307317 () Bool)

(assert (=> start!122112 m!1307317))

(declare-fun m!1307319 () Bool)

(assert (=> start!122112 m!1307319))

(declare-fun m!1307321 () Bool)

(assert (=> b!1416990 m!1307321))

(declare-fun m!1307323 () Bool)

(assert (=> b!1416996 m!1307323))

(declare-fun m!1307325 () Bool)

(assert (=> b!1416996 m!1307325))

(assert (=> b!1416996 m!1307325))

(declare-fun m!1307327 () Bool)

(assert (=> b!1416996 m!1307327))

(assert (=> b!1416996 m!1307327))

(assert (=> b!1416996 m!1307325))

(declare-fun m!1307329 () Bool)

(assert (=> b!1416996 m!1307329))

(declare-fun m!1307331 () Bool)

(assert (=> b!1416989 m!1307331))

(assert (=> b!1416989 m!1307331))

(declare-fun m!1307333 () Bool)

(assert (=> b!1416989 m!1307333))

(declare-fun m!1307335 () Bool)

(assert (=> b!1416993 m!1307335))

(assert (=> b!1416995 m!1307331))

(declare-fun m!1307337 () Bool)

(assert (=> b!1416995 m!1307337))

(assert (=> b!1416995 m!1307331))

(declare-fun m!1307339 () Bool)

(assert (=> b!1416995 m!1307339))

(assert (=> b!1416995 m!1307337))

(assert (=> b!1416995 m!1307331))

(declare-fun m!1307341 () Bool)

(assert (=> b!1416995 m!1307341))

(declare-fun m!1307343 () Bool)

(assert (=> b!1416995 m!1307343))

(assert (=> b!1416991 m!1307331))

(assert (=> b!1416991 m!1307331))

(declare-fun m!1307345 () Bool)

(assert (=> b!1416991 m!1307345))

(push 1)

(assert (not b!1416989))

(assert (not b!1416996))

(assert (not start!122112))

(assert (not b!1416991))

(assert (not b!1416993))

(assert (not b!1416995))

(assert (not b!1416992))

(assert (not b!1416990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

