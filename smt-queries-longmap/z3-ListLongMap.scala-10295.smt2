; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121094 () Bool)

(assert start!121094)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96248 0))(
  ( (array!96249 (arr!46467 (Array (_ BitVec 32) (_ BitVec 64))) (size!47017 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96248)

(declare-fun e!796865 () Bool)

(declare-fun b!1407929 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10778 0))(
  ( (MissingZero!10778 (index!45489 (_ BitVec 32))) (Found!10778 (index!45490 (_ BitVec 32))) (Intermediate!10778 (undefined!11590 Bool) (index!45491 (_ BitVec 32)) (x!127099 (_ BitVec 32))) (Undefined!10778) (MissingVacant!10778 (index!45492 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96248 (_ BitVec 32)) SeekEntryResult!10778)

(assert (=> b!1407929 (= e!796865 (= (seekEntryOrOpen!0 (select (arr!46467 a!2901) j!112) a!2901 mask!2840) (Found!10778 j!112)))))

(declare-fun res!945656 () Bool)

(declare-fun e!796864 () Bool)

(assert (=> start!121094 (=> (not res!945656) (not e!796864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121094 (= res!945656 (validMask!0 mask!2840))))

(assert (=> start!121094 e!796864))

(assert (=> start!121094 true))

(declare-fun array_inv!35495 (array!96248) Bool)

(assert (=> start!121094 (array_inv!35495 a!2901)))

(declare-fun b!1407930 () Bool)

(declare-fun res!945658 () Bool)

(assert (=> b!1407930 (=> (not res!945658) (not e!796864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407930 (= res!945658 (validKeyInArray!0 (select (arr!46467 a!2901) j!112)))))

(declare-fun b!1407931 () Bool)

(declare-fun res!945651 () Bool)

(assert (=> b!1407931 (=> (not res!945651) (not e!796864))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407931 (= res!945651 (and (= (size!47017 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47017 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47017 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407932 () Bool)

(declare-fun res!945654 () Bool)

(assert (=> b!1407932 (=> (not res!945654) (not e!796864))))

(declare-datatypes ((List!32986 0))(
  ( (Nil!32983) (Cons!32982 (h!34245 (_ BitVec 64)) (t!47680 List!32986)) )
))
(declare-fun arrayNoDuplicates!0 (array!96248 (_ BitVec 32) List!32986) Bool)

(assert (=> b!1407932 (= res!945654 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32983))))

(declare-fun b!1407933 () Bool)

(declare-fun res!945657 () Bool)

(assert (=> b!1407933 (=> (not res!945657) (not e!796864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96248 (_ BitVec 32)) Bool)

(assert (=> b!1407933 (= res!945657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407934 () Bool)

(declare-fun e!796863 () Bool)

(assert (=> b!1407934 (= e!796864 (not e!796863))))

(declare-fun res!945653 () Bool)

(assert (=> b!1407934 (=> res!945653 e!796863)))

(declare-fun lt!619994 () SeekEntryResult!10778)

(get-info :version)

(assert (=> b!1407934 (= res!945653 (or (not ((_ is Intermediate!10778) lt!619994)) (undefined!11590 lt!619994)))))

(assert (=> b!1407934 e!796865))

(declare-fun res!945655 () Bool)

(assert (=> b!1407934 (=> (not res!945655) (not e!796865))))

(assert (=> b!1407934 (= res!945655 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47530 0))(
  ( (Unit!47531) )
))
(declare-fun lt!619995 () Unit!47530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47530)

(assert (=> b!1407934 (= lt!619995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96248 (_ BitVec 32)) SeekEntryResult!10778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407934 (= lt!619994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46467 a!2901) j!112) mask!2840) (select (arr!46467 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407935 () Bool)

(assert (=> b!1407935 (= e!796863 true)))

(declare-fun lt!619993 () SeekEntryResult!10778)

(assert (=> b!1407935 (= lt!619993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96249 (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47017 a!2901)) mask!2840))))

(declare-fun b!1407936 () Bool)

(declare-fun res!945652 () Bool)

(assert (=> b!1407936 (=> (not res!945652) (not e!796864))))

(assert (=> b!1407936 (= res!945652 (validKeyInArray!0 (select (arr!46467 a!2901) i!1037)))))

(assert (= (and start!121094 res!945656) b!1407931))

(assert (= (and b!1407931 res!945651) b!1407936))

(assert (= (and b!1407936 res!945652) b!1407930))

(assert (= (and b!1407930 res!945658) b!1407933))

(assert (= (and b!1407933 res!945657) b!1407932))

(assert (= (and b!1407932 res!945654) b!1407934))

(assert (= (and b!1407934 res!945655) b!1407929))

(assert (= (and b!1407934 (not res!945653)) b!1407935))

(declare-fun m!1297021 () Bool)

(assert (=> b!1407929 m!1297021))

(assert (=> b!1407929 m!1297021))

(declare-fun m!1297023 () Bool)

(assert (=> b!1407929 m!1297023))

(declare-fun m!1297025 () Bool)

(assert (=> b!1407936 m!1297025))

(assert (=> b!1407936 m!1297025))

(declare-fun m!1297027 () Bool)

(assert (=> b!1407936 m!1297027))

(declare-fun m!1297029 () Bool)

(assert (=> start!121094 m!1297029))

(declare-fun m!1297031 () Bool)

(assert (=> start!121094 m!1297031))

(declare-fun m!1297033 () Bool)

(assert (=> b!1407932 m!1297033))

(declare-fun m!1297035 () Bool)

(assert (=> b!1407933 m!1297035))

(assert (=> b!1407930 m!1297021))

(assert (=> b!1407930 m!1297021))

(declare-fun m!1297037 () Bool)

(assert (=> b!1407930 m!1297037))

(declare-fun m!1297039 () Bool)

(assert (=> b!1407935 m!1297039))

(declare-fun m!1297041 () Bool)

(assert (=> b!1407935 m!1297041))

(assert (=> b!1407935 m!1297041))

(declare-fun m!1297043 () Bool)

(assert (=> b!1407935 m!1297043))

(assert (=> b!1407935 m!1297043))

(assert (=> b!1407935 m!1297041))

(declare-fun m!1297045 () Bool)

(assert (=> b!1407935 m!1297045))

(assert (=> b!1407934 m!1297021))

(declare-fun m!1297047 () Bool)

(assert (=> b!1407934 m!1297047))

(assert (=> b!1407934 m!1297021))

(declare-fun m!1297049 () Bool)

(assert (=> b!1407934 m!1297049))

(assert (=> b!1407934 m!1297047))

(assert (=> b!1407934 m!1297021))

(declare-fun m!1297051 () Bool)

(assert (=> b!1407934 m!1297051))

(declare-fun m!1297053 () Bool)

(assert (=> b!1407934 m!1297053))

(check-sat (not b!1407933) (not b!1407934) (not b!1407929) (not b!1407932) (not start!121094) (not b!1407930) (not b!1407936) (not b!1407935))
