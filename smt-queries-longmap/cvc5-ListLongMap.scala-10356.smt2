; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121950 () Bool)

(assert start!121950)

(declare-fun res!951265 () Bool)

(declare-fun e!800961 () Bool)

(assert (=> start!121950 (=> (not res!951265) (not e!800961))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121950 (= res!951265 (validMask!0 mask!2840))))

(assert (=> start!121950 e!800961))

(assert (=> start!121950 true))

(declare-datatypes ((array!96636 0))(
  ( (array!96637 (arr!46649 (Array (_ BitVec 32) (_ BitVec 64))) (size!47199 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96636)

(declare-fun array_inv!35677 (array!96636) Bool)

(assert (=> start!121950 (array_inv!35677 a!2901)))

(declare-fun b!1415214 () Bool)

(declare-fun res!951258 () Bool)

(assert (=> b!1415214 (=> (not res!951258) (not e!800961))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415214 (= res!951258 (and (= (size!47199 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47199 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47199 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!800966 () Bool)

(declare-fun b!1415215 () Bool)

(declare-datatypes ((SeekEntryResult!10960 0))(
  ( (MissingZero!10960 (index!46232 (_ BitVec 32))) (Found!10960 (index!46233 (_ BitVec 32))) (Intermediate!10960 (undefined!11772 Bool) (index!46234 (_ BitVec 32)) (x!127847 (_ BitVec 32))) (Undefined!10960) (MissingVacant!10960 (index!46235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96636 (_ BitVec 32)) SeekEntryResult!10960)

(assert (=> b!1415215 (= e!800966 (= (seekEntryOrOpen!0 (select (arr!46649 a!2901) j!112) a!2901 mask!2840) (Found!10960 j!112)))))

(declare-fun b!1415216 () Bool)

(declare-fun res!951263 () Bool)

(assert (=> b!1415216 (=> (not res!951263) (not e!800961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96636 (_ BitVec 32)) Bool)

(assert (=> b!1415216 (= res!951263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415217 () Bool)

(declare-fun e!800964 () Bool)

(declare-fun e!800962 () Bool)

(assert (=> b!1415217 (= e!800964 e!800962)))

(declare-fun res!951260 () Bool)

(assert (=> b!1415217 (=> res!951260 e!800962)))

(declare-fun lt!623991 () SeekEntryResult!10960)

(declare-fun lt!623990 () SeekEntryResult!10960)

(assert (=> b!1415217 (= res!951260 (or (= lt!623991 lt!623990) (not (is-Intermediate!10960 lt!623990))))))

(declare-fun lt!623985 () array!96636)

(declare-fun lt!623986 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96636 (_ BitVec 32)) SeekEntryResult!10960)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415217 (= lt!623990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623986 mask!2840) lt!623986 lt!623985 mask!2840))))

(assert (=> b!1415217 (= lt!623986 (select (store (arr!46649 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415217 (= lt!623985 (array!96637 (store (arr!46649 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47199 a!2901)))))

(declare-fun b!1415218 () Bool)

(declare-fun res!951257 () Bool)

(assert (=> b!1415218 (=> (not res!951257) (not e!800961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415218 (= res!951257 (validKeyInArray!0 (select (arr!46649 a!2901) i!1037)))))

(declare-fun b!1415219 () Bool)

(assert (=> b!1415219 (= e!800962 true)))

(declare-fun e!800963 () Bool)

(assert (=> b!1415219 e!800963))

(declare-fun res!951264 () Bool)

(assert (=> b!1415219 (=> (not res!951264) (not e!800963))))

(assert (=> b!1415219 (= res!951264 (and (not (undefined!11772 lt!623990)) (= (index!46234 lt!623990) i!1037) (bvslt (x!127847 lt!623990) (x!127847 lt!623991)) (= (select (store (arr!46649 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46234 lt!623990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623987 () (_ BitVec 32))

(declare-datatypes ((Unit!47894 0))(
  ( (Unit!47895) )
))
(declare-fun lt!623989 () Unit!47894)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47894)

(assert (=> b!1415219 (= lt!623989 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623987 (x!127847 lt!623991) (index!46234 lt!623991) (x!127847 lt!623990) (index!46234 lt!623990) (undefined!11772 lt!623990) mask!2840))))

(declare-fun b!1415220 () Bool)

(declare-fun res!951262 () Bool)

(assert (=> b!1415220 (=> (not res!951262) (not e!800961))))

(assert (=> b!1415220 (= res!951262 (validKeyInArray!0 (select (arr!46649 a!2901) j!112)))))

(declare-fun b!1415221 () Bool)

(declare-fun res!951261 () Bool)

(assert (=> b!1415221 (=> (not res!951261) (not e!800961))))

(declare-datatypes ((List!33168 0))(
  ( (Nil!33165) (Cons!33164 (h!34451 (_ BitVec 64)) (t!47862 List!33168)) )
))
(declare-fun arrayNoDuplicates!0 (array!96636 (_ BitVec 32) List!33168) Bool)

(assert (=> b!1415221 (= res!951261 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33165))))

(declare-fun b!1415222 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96636 (_ BitVec 32)) SeekEntryResult!10960)

(assert (=> b!1415222 (= e!800963 (= (seekEntryOrOpen!0 lt!623986 lt!623985 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127847 lt!623990) (index!46234 lt!623990) (index!46234 lt!623990) (select (arr!46649 a!2901) j!112) lt!623985 mask!2840)))))

(declare-fun b!1415223 () Bool)

(assert (=> b!1415223 (= e!800961 (not e!800964))))

(declare-fun res!951256 () Bool)

(assert (=> b!1415223 (=> res!951256 e!800964)))

(assert (=> b!1415223 (= res!951256 (or (not (is-Intermediate!10960 lt!623991)) (undefined!11772 lt!623991)))))

(assert (=> b!1415223 e!800966))

(declare-fun res!951259 () Bool)

(assert (=> b!1415223 (=> (not res!951259) (not e!800966))))

(assert (=> b!1415223 (= res!951259 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623988 () Unit!47894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47894)

(assert (=> b!1415223 (= lt!623988 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415223 (= lt!623991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623987 (select (arr!46649 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415223 (= lt!623987 (toIndex!0 (select (arr!46649 a!2901) j!112) mask!2840))))

(assert (= (and start!121950 res!951265) b!1415214))

(assert (= (and b!1415214 res!951258) b!1415218))

(assert (= (and b!1415218 res!951257) b!1415220))

(assert (= (and b!1415220 res!951262) b!1415216))

(assert (= (and b!1415216 res!951263) b!1415221))

(assert (= (and b!1415221 res!951261) b!1415223))

(assert (= (and b!1415223 res!951259) b!1415215))

(assert (= (and b!1415223 (not res!951256)) b!1415217))

(assert (= (and b!1415217 (not res!951260)) b!1415219))

(assert (= (and b!1415219 res!951264) b!1415222))

(declare-fun m!1305405 () Bool)

(assert (=> b!1415215 m!1305405))

(assert (=> b!1415215 m!1305405))

(declare-fun m!1305407 () Bool)

(assert (=> b!1415215 m!1305407))

(assert (=> b!1415220 m!1305405))

(assert (=> b!1415220 m!1305405))

(declare-fun m!1305409 () Bool)

(assert (=> b!1415220 m!1305409))

(declare-fun m!1305411 () Bool)

(assert (=> b!1415219 m!1305411))

(declare-fun m!1305413 () Bool)

(assert (=> b!1415219 m!1305413))

(declare-fun m!1305415 () Bool)

(assert (=> b!1415219 m!1305415))

(declare-fun m!1305417 () Bool)

(assert (=> b!1415216 m!1305417))

(declare-fun m!1305419 () Bool)

(assert (=> b!1415217 m!1305419))

(assert (=> b!1415217 m!1305419))

(declare-fun m!1305421 () Bool)

(assert (=> b!1415217 m!1305421))

(assert (=> b!1415217 m!1305411))

(declare-fun m!1305423 () Bool)

(assert (=> b!1415217 m!1305423))

(declare-fun m!1305425 () Bool)

(assert (=> b!1415222 m!1305425))

(assert (=> b!1415222 m!1305405))

(assert (=> b!1415222 m!1305405))

(declare-fun m!1305427 () Bool)

(assert (=> b!1415222 m!1305427))

(declare-fun m!1305429 () Bool)

(assert (=> b!1415221 m!1305429))

(declare-fun m!1305431 () Bool)

(assert (=> b!1415218 m!1305431))

(assert (=> b!1415218 m!1305431))

(declare-fun m!1305433 () Bool)

(assert (=> b!1415218 m!1305433))

(assert (=> b!1415223 m!1305405))

(declare-fun m!1305435 () Bool)

(assert (=> b!1415223 m!1305435))

(assert (=> b!1415223 m!1305405))

(declare-fun m!1305437 () Bool)

(assert (=> b!1415223 m!1305437))

(declare-fun m!1305439 () Bool)

(assert (=> b!1415223 m!1305439))

(assert (=> b!1415223 m!1305405))

(declare-fun m!1305441 () Bool)

(assert (=> b!1415223 m!1305441))

(declare-fun m!1305443 () Bool)

(assert (=> start!121950 m!1305443))

(declare-fun m!1305445 () Bool)

(assert (=> start!121950 m!1305445))

(push 1)

