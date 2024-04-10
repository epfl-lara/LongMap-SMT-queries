; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121138 () Bool)

(assert start!121138)

(declare-fun b!1408502 () Bool)

(declare-fun res!946225 () Bool)

(declare-fun e!797126 () Bool)

(assert (=> b!1408502 (=> (not res!946225) (not e!797126))))

(declare-datatypes ((array!96292 0))(
  ( (array!96293 (arr!46489 (Array (_ BitVec 32) (_ BitVec 64))) (size!47039 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96292)

(declare-datatypes ((List!33008 0))(
  ( (Nil!33005) (Cons!33004 (h!34267 (_ BitVec 64)) (t!47702 List!33008)) )
))
(declare-fun arrayNoDuplicates!0 (array!96292 (_ BitVec 32) List!33008) Bool)

(assert (=> b!1408502 (= res!946225 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33005))))

(declare-fun b!1408503 () Bool)

(declare-fun e!797127 () Bool)

(assert (=> b!1408503 (= e!797127 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10800 0))(
  ( (MissingZero!10800 (index!45577 (_ BitVec 32))) (Found!10800 (index!45578 (_ BitVec 32))) (Intermediate!10800 (undefined!11612 Bool) (index!45579 (_ BitVec 32)) (x!127177 (_ BitVec 32))) (Undefined!10800) (MissingVacant!10800 (index!45580 (_ BitVec 32))) )
))
(declare-fun lt!620371 () SeekEntryResult!10800)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96292 (_ BitVec 32)) SeekEntryResult!10800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408503 (= lt!620371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46489 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46489 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96293 (store (arr!46489 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47039 a!2901)) mask!2840))))

(declare-fun b!1408504 () Bool)

(assert (=> b!1408504 (= e!797126 (not e!797127))))

(declare-fun res!946226 () Bool)

(assert (=> b!1408504 (=> res!946226 e!797127)))

(declare-fun lt!620373 () SeekEntryResult!10800)

(assert (=> b!1408504 (= res!946226 (or (not (is-Intermediate!10800 lt!620373)) (undefined!11612 lt!620373)))))

(declare-fun e!797128 () Bool)

(assert (=> b!1408504 e!797128))

(declare-fun res!946231 () Bool)

(assert (=> b!1408504 (=> (not res!946231) (not e!797128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96292 (_ BitVec 32)) Bool)

(assert (=> b!1408504 (= res!946231 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47574 0))(
  ( (Unit!47575) )
))
(declare-fun lt!620372 () Unit!47574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47574)

(assert (=> b!1408504 (= lt!620372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408504 (= lt!620373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46489 a!2901) j!112) mask!2840) (select (arr!46489 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408505 () Bool)

(declare-fun res!946228 () Bool)

(assert (=> b!1408505 (=> (not res!946228) (not e!797126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408505 (= res!946228 (validKeyInArray!0 (select (arr!46489 a!2901) j!112)))))

(declare-fun b!1408506 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96292 (_ BitVec 32)) SeekEntryResult!10800)

(assert (=> b!1408506 (= e!797128 (= (seekEntryOrOpen!0 (select (arr!46489 a!2901) j!112) a!2901 mask!2840) (Found!10800 j!112)))))

(declare-fun b!1408507 () Bool)

(declare-fun res!946230 () Bool)

(assert (=> b!1408507 (=> (not res!946230) (not e!797126))))

(assert (=> b!1408507 (= res!946230 (validKeyInArray!0 (select (arr!46489 a!2901) i!1037)))))

(declare-fun b!1408508 () Bool)

(declare-fun res!946224 () Bool)

(assert (=> b!1408508 (=> (not res!946224) (not e!797126))))

(assert (=> b!1408508 (= res!946224 (and (= (size!47039 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47039 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47039 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946227 () Bool)

(assert (=> start!121138 (=> (not res!946227) (not e!797126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121138 (= res!946227 (validMask!0 mask!2840))))

(assert (=> start!121138 e!797126))

(assert (=> start!121138 true))

(declare-fun array_inv!35517 (array!96292) Bool)

(assert (=> start!121138 (array_inv!35517 a!2901)))

(declare-fun b!1408509 () Bool)

(declare-fun res!946229 () Bool)

(assert (=> b!1408509 (=> (not res!946229) (not e!797126))))

(assert (=> b!1408509 (= res!946229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121138 res!946227) b!1408508))

(assert (= (and b!1408508 res!946224) b!1408507))

(assert (= (and b!1408507 res!946230) b!1408505))

(assert (= (and b!1408505 res!946228) b!1408509))

(assert (= (and b!1408509 res!946229) b!1408502))

(assert (= (and b!1408502 res!946225) b!1408504))

(assert (= (and b!1408504 res!946231) b!1408506))

(assert (= (and b!1408504 (not res!946226)) b!1408503))

(declare-fun m!1297829 () Bool)

(assert (=> b!1408509 m!1297829))

(declare-fun m!1297831 () Bool)

(assert (=> b!1408506 m!1297831))

(assert (=> b!1408506 m!1297831))

(declare-fun m!1297833 () Bool)

(assert (=> b!1408506 m!1297833))

(declare-fun m!1297835 () Bool)

(assert (=> b!1408507 m!1297835))

(assert (=> b!1408507 m!1297835))

(declare-fun m!1297837 () Bool)

(assert (=> b!1408507 m!1297837))

(declare-fun m!1297839 () Bool)

(assert (=> b!1408502 m!1297839))

(assert (=> b!1408505 m!1297831))

(assert (=> b!1408505 m!1297831))

(declare-fun m!1297841 () Bool)

(assert (=> b!1408505 m!1297841))

(declare-fun m!1297843 () Bool)

(assert (=> b!1408503 m!1297843))

(declare-fun m!1297845 () Bool)

(assert (=> b!1408503 m!1297845))

(assert (=> b!1408503 m!1297845))

(declare-fun m!1297847 () Bool)

(assert (=> b!1408503 m!1297847))

(assert (=> b!1408503 m!1297847))

(assert (=> b!1408503 m!1297845))

(declare-fun m!1297849 () Bool)

(assert (=> b!1408503 m!1297849))

(declare-fun m!1297851 () Bool)

(assert (=> start!121138 m!1297851))

(declare-fun m!1297853 () Bool)

(assert (=> start!121138 m!1297853))

(assert (=> b!1408504 m!1297831))

(declare-fun m!1297855 () Bool)

(assert (=> b!1408504 m!1297855))

(assert (=> b!1408504 m!1297831))

(declare-fun m!1297857 () Bool)

(assert (=> b!1408504 m!1297857))

(assert (=> b!1408504 m!1297855))

(assert (=> b!1408504 m!1297831))

(declare-fun m!1297859 () Bool)

(assert (=> b!1408504 m!1297859))

(declare-fun m!1297861 () Bool)

(assert (=> b!1408504 m!1297861))

(push 1)

(assert (not b!1408509))

(assert (not b!1408507))

(assert (not b!1408505))

(assert (not b!1408502))

(assert (not b!1408504))

(assert (not b!1408506))

(assert (not start!121138))

(assert (not b!1408503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

