; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121118 () Bool)

(assert start!121118)

(declare-fun b!1408222 () Bool)

(declare-fun e!796991 () Bool)

(declare-fun e!796994 () Bool)

(assert (=> b!1408222 (= e!796991 (not e!796994))))

(declare-fun res!946000 () Bool)

(assert (=> b!1408222 (=> res!946000 e!796994)))

(declare-datatypes ((SeekEntryResult!10793 0))(
  ( (MissingZero!10793 (index!45549 (_ BitVec 32))) (Found!10793 (index!45550 (_ BitVec 32))) (Intermediate!10793 (undefined!11605 Bool) (index!45551 (_ BitVec 32)) (x!127151 (_ BitVec 32))) (Undefined!10793) (MissingVacant!10793 (index!45552 (_ BitVec 32))) )
))
(declare-fun lt!620082 () SeekEntryResult!10793)

(get-info :version)

(assert (=> b!1408222 (= res!946000 (or (not ((_ is Intermediate!10793) lt!620082)) (undefined!11605 lt!620082)))))

(declare-fun lt!620086 () SeekEntryResult!10793)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408222 (= lt!620086 (Found!10793 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96225 0))(
  ( (array!96226 (arr!46456 (Array (_ BitVec 32) (_ BitVec 64))) (size!47008 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96225)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10793)

(assert (=> b!1408222 (= lt!620086 (seekEntryOrOpen!0 (select (arr!46456 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96225 (_ BitVec 32)) Bool)

(assert (=> b!1408222 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47403 0))(
  ( (Unit!47404) )
))
(declare-fun lt!620081 () Unit!47403)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47403)

(assert (=> b!1408222 (= lt!620081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620085 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10793)

(assert (=> b!1408222 (= lt!620082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620085 (select (arr!46456 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408222 (= lt!620085 (toIndex!0 (select (arr!46456 a!2901) j!112) mask!2840))))

(declare-fun b!1408223 () Bool)

(declare-fun res!945999 () Bool)

(assert (=> b!1408223 (=> (not res!945999) (not e!796991))))

(declare-datatypes ((List!33053 0))(
  ( (Nil!33050) (Cons!33049 (h!34312 (_ BitVec 64)) (t!47739 List!33053)) )
))
(declare-fun arrayNoDuplicates!0 (array!96225 (_ BitVec 32) List!33053) Bool)

(assert (=> b!1408223 (= res!945999 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33050))))

(declare-fun b!1408224 () Bool)

(declare-fun res!946001 () Bool)

(declare-fun e!796993 () Bool)

(assert (=> b!1408224 (=> res!946001 e!796993)))

(assert (=> b!1408224 (= res!946001 (or (bvslt (x!127151 lt!620082) #b00000000000000000000000000000000) (bvsgt (x!127151 lt!620082) #b01111111111111111111111111111110) (bvslt lt!620085 #b00000000000000000000000000000000) (bvsge lt!620085 (size!47008 a!2901)) (bvslt (index!45551 lt!620082) #b00000000000000000000000000000000) (bvsge (index!45551 lt!620082) (size!47008 a!2901)) (not (= lt!620082 (Intermediate!10793 false (index!45551 lt!620082) (x!127151 lt!620082))))))))

(declare-fun res!945996 () Bool)

(assert (=> start!121118 (=> (not res!945996) (not e!796991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121118 (= res!945996 (validMask!0 mask!2840))))

(assert (=> start!121118 e!796991))

(assert (=> start!121118 true))

(declare-fun array_inv!35689 (array!96225) Bool)

(assert (=> start!121118 (array_inv!35689 a!2901)))

(declare-fun b!1408225 () Bool)

(declare-fun res!946002 () Bool)

(assert (=> b!1408225 (=> (not res!946002) (not e!796991))))

(assert (=> b!1408225 (= res!946002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408226 () Bool)

(assert (=> b!1408226 (= e!796994 e!796993)))

(declare-fun res!945997 () Bool)

(assert (=> b!1408226 (=> res!945997 e!796993)))

(declare-fun lt!620087 () (_ BitVec 64))

(declare-fun lt!620083 () array!96225)

(assert (=> b!1408226 (= res!945997 (not (= lt!620082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620087 mask!2840) lt!620087 lt!620083 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408226 (= lt!620087 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408226 (= lt!620083 (array!96226 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)))))

(declare-fun b!1408227 () Bool)

(declare-fun res!946003 () Bool)

(assert (=> b!1408227 (=> (not res!946003) (not e!796991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408227 (= res!946003 (validKeyInArray!0 (select (arr!46456 a!2901) j!112)))))

(declare-fun b!1408228 () Bool)

(declare-fun res!945995 () Bool)

(assert (=> b!1408228 (=> (not res!945995) (not e!796991))))

(assert (=> b!1408228 (= res!945995 (validKeyInArray!0 (select (arr!46456 a!2901) i!1037)))))

(declare-fun b!1408229 () Bool)

(declare-fun res!945998 () Bool)

(assert (=> b!1408229 (=> (not res!945998) (not e!796991))))

(assert (=> b!1408229 (= res!945998 (and (= (size!47008 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47008 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47008 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408230 () Bool)

(assert (=> b!1408230 (= e!796993 true)))

(assert (=> b!1408230 (= lt!620086 (seekEntryOrOpen!0 lt!620087 lt!620083 mask!2840))))

(declare-fun lt!620084 () Unit!47403)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47403)

(assert (=> b!1408230 (= lt!620084 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620085 (x!127151 lt!620082) (index!45551 lt!620082) mask!2840))))

(assert (= (and start!121118 res!945996) b!1408229))

(assert (= (and b!1408229 res!945998) b!1408228))

(assert (= (and b!1408228 res!945995) b!1408227))

(assert (= (and b!1408227 res!946003) b!1408225))

(assert (= (and b!1408225 res!946002) b!1408223))

(assert (= (and b!1408223 res!945999) b!1408222))

(assert (= (and b!1408222 (not res!946000)) b!1408226))

(assert (= (and b!1408226 (not res!945997)) b!1408224))

(assert (= (and b!1408224 (not res!946001)) b!1408230))

(declare-fun m!1297009 () Bool)

(assert (=> start!121118 m!1297009))

(declare-fun m!1297011 () Bool)

(assert (=> start!121118 m!1297011))

(declare-fun m!1297013 () Bool)

(assert (=> b!1408222 m!1297013))

(declare-fun m!1297015 () Bool)

(assert (=> b!1408222 m!1297015))

(assert (=> b!1408222 m!1297013))

(declare-fun m!1297017 () Bool)

(assert (=> b!1408222 m!1297017))

(assert (=> b!1408222 m!1297013))

(declare-fun m!1297019 () Bool)

(assert (=> b!1408222 m!1297019))

(declare-fun m!1297021 () Bool)

(assert (=> b!1408222 m!1297021))

(assert (=> b!1408222 m!1297013))

(declare-fun m!1297023 () Bool)

(assert (=> b!1408222 m!1297023))

(declare-fun m!1297025 () Bool)

(assert (=> b!1408225 m!1297025))

(declare-fun m!1297027 () Bool)

(assert (=> b!1408228 m!1297027))

(assert (=> b!1408228 m!1297027))

(declare-fun m!1297029 () Bool)

(assert (=> b!1408228 m!1297029))

(declare-fun m!1297031 () Bool)

(assert (=> b!1408223 m!1297031))

(declare-fun m!1297033 () Bool)

(assert (=> b!1408230 m!1297033))

(declare-fun m!1297035 () Bool)

(assert (=> b!1408230 m!1297035))

(assert (=> b!1408227 m!1297013))

(assert (=> b!1408227 m!1297013))

(declare-fun m!1297037 () Bool)

(assert (=> b!1408227 m!1297037))

(declare-fun m!1297039 () Bool)

(assert (=> b!1408226 m!1297039))

(assert (=> b!1408226 m!1297039))

(declare-fun m!1297041 () Bool)

(assert (=> b!1408226 m!1297041))

(declare-fun m!1297043 () Bool)

(assert (=> b!1408226 m!1297043))

(declare-fun m!1297045 () Bool)

(assert (=> b!1408226 m!1297045))

(check-sat (not b!1408223) (not b!1408228) (not b!1408227) (not b!1408222) (not b!1408225) (not b!1408226) (not start!121118) (not b!1408230))
(check-sat)
