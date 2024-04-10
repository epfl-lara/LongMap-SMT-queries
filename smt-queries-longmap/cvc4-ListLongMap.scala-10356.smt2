; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121954 () Bool)

(assert start!121954)

(declare-fun b!1415274 () Bool)

(declare-fun e!800999 () Bool)

(declare-fun e!800997 () Bool)

(assert (=> b!1415274 (= e!800999 e!800997)))

(declare-fun res!951321 () Bool)

(assert (=> b!1415274 (=> res!951321 e!800997)))

(declare-datatypes ((SeekEntryResult!10962 0))(
  ( (MissingZero!10962 (index!46240 (_ BitVec 32))) (Found!10962 (index!46241 (_ BitVec 32))) (Intermediate!10962 (undefined!11774 Bool) (index!46242 (_ BitVec 32)) (x!127849 (_ BitVec 32))) (Undefined!10962) (MissingVacant!10962 (index!46243 (_ BitVec 32))) )
))
(declare-fun lt!624031 () SeekEntryResult!10962)

(declare-fun lt!624033 () SeekEntryResult!10962)

(assert (=> b!1415274 (= res!951321 (or (= lt!624031 lt!624033) (not (is-Intermediate!10962 lt!624033))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96640 0))(
  ( (array!96641 (arr!46651 (Array (_ BitVec 32) (_ BitVec 64))) (size!47201 (_ BitVec 32))) )
))
(declare-fun lt!624030 () array!96640)

(declare-fun lt!624028 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96640 (_ BitVec 32)) SeekEntryResult!10962)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415274 (= lt!624033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624028 mask!2840) lt!624028 lt!624030 mask!2840))))

(declare-fun a!2901 () array!96640)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415274 (= lt!624028 (select (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415274 (= lt!624030 (array!96641 (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47201 a!2901)))))

(declare-fun b!1415275 () Bool)

(declare-fun res!951320 () Bool)

(declare-fun e!800998 () Bool)

(assert (=> b!1415275 (=> (not res!951320) (not e!800998))))

(declare-datatypes ((List!33170 0))(
  ( (Nil!33167) (Cons!33166 (h!34453 (_ BitVec 64)) (t!47864 List!33170)) )
))
(declare-fun arrayNoDuplicates!0 (array!96640 (_ BitVec 32) List!33170) Bool)

(assert (=> b!1415275 (= res!951320 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33167))))

(declare-fun res!951325 () Bool)

(assert (=> start!121954 (=> (not res!951325) (not e!800998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121954 (= res!951325 (validMask!0 mask!2840))))

(assert (=> start!121954 e!800998))

(assert (=> start!121954 true))

(declare-fun array_inv!35679 (array!96640) Bool)

(assert (=> start!121954 (array_inv!35679 a!2901)))

(declare-fun e!801000 () Bool)

(declare-fun b!1415276 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96640 (_ BitVec 32)) SeekEntryResult!10962)

(assert (=> b!1415276 (= e!801000 (= (seekEntryOrOpen!0 (select (arr!46651 a!2901) j!112) a!2901 mask!2840) (Found!10962 j!112)))))

(declare-fun b!1415277 () Bool)

(declare-fun res!951317 () Bool)

(assert (=> b!1415277 (=> (not res!951317) (not e!800998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415277 (= res!951317 (validKeyInArray!0 (select (arr!46651 a!2901) j!112)))))

(declare-fun b!1415278 () Bool)

(declare-fun res!951322 () Bool)

(assert (=> b!1415278 (=> (not res!951322) (not e!800998))))

(assert (=> b!1415278 (= res!951322 (validKeyInArray!0 (select (arr!46651 a!2901) i!1037)))))

(declare-fun b!1415279 () Bool)

(declare-fun res!951316 () Bool)

(assert (=> b!1415279 (=> (not res!951316) (not e!800998))))

(assert (=> b!1415279 (= res!951316 (and (= (size!47201 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47201 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47201 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415280 () Bool)

(assert (=> b!1415280 (= e!800997 true)))

(declare-fun e!801001 () Bool)

(assert (=> b!1415280 e!801001))

(declare-fun res!951323 () Bool)

(assert (=> b!1415280 (=> (not res!951323) (not e!801001))))

(assert (=> b!1415280 (= res!951323 (and (not (undefined!11774 lt!624033)) (= (index!46242 lt!624033) i!1037) (bvslt (x!127849 lt!624033) (x!127849 lt!624031)) (= (select (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46242 lt!624033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624032 () (_ BitVec 32))

(declare-datatypes ((Unit!47898 0))(
  ( (Unit!47899) )
))
(declare-fun lt!624029 () Unit!47898)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47898)

(assert (=> b!1415280 (= lt!624029 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624032 (x!127849 lt!624031) (index!46242 lt!624031) (x!127849 lt!624033) (index!46242 lt!624033) (undefined!11774 lt!624033) mask!2840))))

(declare-fun b!1415281 () Bool)

(assert (=> b!1415281 (= e!800998 (not e!800999))))

(declare-fun res!951324 () Bool)

(assert (=> b!1415281 (=> res!951324 e!800999)))

(assert (=> b!1415281 (= res!951324 (or (not (is-Intermediate!10962 lt!624031)) (undefined!11774 lt!624031)))))

(assert (=> b!1415281 e!801000))

(declare-fun res!951318 () Bool)

(assert (=> b!1415281 (=> (not res!951318) (not e!801000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96640 (_ BitVec 32)) Bool)

(assert (=> b!1415281 (= res!951318 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624027 () Unit!47898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47898)

(assert (=> b!1415281 (= lt!624027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415281 (= lt!624031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624032 (select (arr!46651 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415281 (= lt!624032 (toIndex!0 (select (arr!46651 a!2901) j!112) mask!2840))))

(declare-fun b!1415282 () Bool)

(declare-fun res!951319 () Bool)

(assert (=> b!1415282 (=> (not res!951319) (not e!800998))))

(assert (=> b!1415282 (= res!951319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415283 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96640 (_ BitVec 32)) SeekEntryResult!10962)

(assert (=> b!1415283 (= e!801001 (= (seekEntryOrOpen!0 lt!624028 lt!624030 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127849 lt!624033) (index!46242 lt!624033) (index!46242 lt!624033) (select (arr!46651 a!2901) j!112) lt!624030 mask!2840)))))

(assert (= (and start!121954 res!951325) b!1415279))

(assert (= (and b!1415279 res!951316) b!1415278))

(assert (= (and b!1415278 res!951322) b!1415277))

(assert (= (and b!1415277 res!951317) b!1415282))

(assert (= (and b!1415282 res!951319) b!1415275))

(assert (= (and b!1415275 res!951320) b!1415281))

(assert (= (and b!1415281 res!951318) b!1415276))

(assert (= (and b!1415281 (not res!951324)) b!1415274))

(assert (= (and b!1415274 (not res!951321)) b!1415280))

(assert (= (and b!1415280 res!951323) b!1415283))

(declare-fun m!1305489 () Bool)

(assert (=> b!1415282 m!1305489))

(declare-fun m!1305491 () Bool)

(assert (=> start!121954 m!1305491))

(declare-fun m!1305493 () Bool)

(assert (=> start!121954 m!1305493))

(declare-fun m!1305495 () Bool)

(assert (=> b!1415283 m!1305495))

(declare-fun m!1305497 () Bool)

(assert (=> b!1415283 m!1305497))

(assert (=> b!1415283 m!1305497))

(declare-fun m!1305499 () Bool)

(assert (=> b!1415283 m!1305499))

(assert (=> b!1415276 m!1305497))

(assert (=> b!1415276 m!1305497))

(declare-fun m!1305501 () Bool)

(assert (=> b!1415276 m!1305501))

(assert (=> b!1415281 m!1305497))

(declare-fun m!1305503 () Bool)

(assert (=> b!1415281 m!1305503))

(assert (=> b!1415281 m!1305497))

(declare-fun m!1305505 () Bool)

(assert (=> b!1415281 m!1305505))

(assert (=> b!1415281 m!1305497))

(declare-fun m!1305507 () Bool)

(assert (=> b!1415281 m!1305507))

(declare-fun m!1305509 () Bool)

(assert (=> b!1415281 m!1305509))

(declare-fun m!1305511 () Bool)

(assert (=> b!1415274 m!1305511))

(assert (=> b!1415274 m!1305511))

(declare-fun m!1305513 () Bool)

(assert (=> b!1415274 m!1305513))

(declare-fun m!1305515 () Bool)

(assert (=> b!1415274 m!1305515))

(declare-fun m!1305517 () Bool)

(assert (=> b!1415274 m!1305517))

(declare-fun m!1305519 () Bool)

(assert (=> b!1415275 m!1305519))

(assert (=> b!1415280 m!1305515))

(declare-fun m!1305521 () Bool)

(assert (=> b!1415280 m!1305521))

(declare-fun m!1305523 () Bool)

(assert (=> b!1415280 m!1305523))

(declare-fun m!1305525 () Bool)

(assert (=> b!1415278 m!1305525))

(assert (=> b!1415278 m!1305525))

(declare-fun m!1305527 () Bool)

(assert (=> b!1415278 m!1305527))

(assert (=> b!1415277 m!1305497))

(assert (=> b!1415277 m!1305497))

(declare-fun m!1305529 () Bool)

(assert (=> b!1415277 m!1305529))

(push 1)

